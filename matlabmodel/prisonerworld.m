function prisonerworld
    % Prisoner's Dilemma Payoffs: T > R > P > S
    T = 11;  % Temptation. may and nowak vary this parameter to get their results
    R = 10;  % Reward.
    P = 0;   % Punishment. technically this is some arbitrarily small number > 0
    S = 0;   % Sucker's Payoff.

    size = 3;
    generations = 5;
    % 0 denotes a Defector, 1 denotes a Cooperator
    World = randi([0 1], size, size); 
    % this matrix holds the total score a cell obtains after playing with all its neighbours
    score = updateWorldScores();
    % spit out the initial world and score
    World
    score
    
    for step = 1:generations
        % let the new world begin
        World = updateWorld(World, score);
        score = updateWorldScores();

        % spit out the new world and the results in the console
        step
        World
        score
    end

    % for each cell, calculate the score it gains from interacting with its neighbours
    function newScores = updateWorldScores()
        newScores = zeros(size, size);
        for m = 1:size
            for n = 1:size
                newScores(m, n) = getScoreFromInteractions(m, n);
            end
        end
    end

    % update the world for the next generation
    function newWorld = updateWorld(oldWorld, oldScores)
        newWorld = zeros(size, size);
        for m = 1:size
            for n = 1:size
                newWorld(m, n) = findRoleModel(m, n, oldWorld, oldScores);
            end
        end
    end

    % find which neighbour the cell at (m, n) picks as a role model.
    % a cell looks at its neighbours and picks the neighbour with the
    % highest score as its role model.
    function roleModel = findRoleModel(m, n, oldWorld, oldScores)
        maxScore = 0;
        roleModel = oldWorld(m, n);
        for i = -1:1
            for j = -1:1
                if m+i <= size && m+i >= 1 && n+j <= size && n+j >= 1
                    s = oldScores(m+i, n+j);
                    r = oldWorld(m+i, n+j);
                    if maxScore < s
                        maxScore = s;
                        roleModel = r;
                    end
                end
            end
        end
    end

    % take the cell at (m,n) and make it interact with all its neighbours
    % Return the score the cell accumulates after interacting with its neighbours
    % A cell has (if its not on the border) 8 neighbours and can
    % interact with itself. So there are 9 interactions.
    % m is the row #. n is the column #
    function totalScore = getScoreFromInteractions(m, n)
        s = 0;
        for i = -1:1
            for j = -1:1
                % make sure our indices are within the dimensions of the
                % board. Otherwise just ignore that interaction. This means
                % that cells on the border will have fewer neighbours to
                % play with. If we want, we can 'wraparound' our indices to
                % represent a circular pacman-like world.
                if m+i <= size && m+i >= 1 && n+j <= size && n+j >= 1
                    s = s + game(m, n, m+i, n+j);
                end
            end
        end
       totalScore = s;
    end

    % Given two cells, return what the (m,n) cell scores after playing
    % Prisoner's Dilemma with cell (i,j).
    % 0 denotes a Defector
    % 1 denotes a Cooperator
    function result = game(m, n, i, j)
        result = -1;
        if World(m, n) == 1
            if World(i, j) == 0
                result = S;
            else % World(i, j) == 1
                result = R;
            end
        end
        if World(m, n) == 0
            if World(i, j) == 0
                result = P;
            else % World(i, j) == 1
                result = T;
            end
        end
    end
end
