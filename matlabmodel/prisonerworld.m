function prisonerworld
    size = 10;
    % 0 denotes a Defector, 1 denotes a Cooperator
    World = randi([0 1], size, size); 
    
    % this matrix holds the total score a cell obtains after playing with all its neighbours
    score = zeros(size, size); 
    
    % Prisoner's Dilemma Payoffs: T > R > P > S
    T = 2; % Temptation. may and nowak vary this parameter to get their results
    R = 1; % Reward.
    P = 0;   % Punishment. technically this is some arbitrarily small number > 0
    S = 0;   % Sucker's Payoff.

    % for each cell, calculate the score it gains from interacting with its neighbours
    for m = 1:size
        for n = 1:size
            score(m,n) = getScoreFromInteractions(m,n);
        end
    end
    
    % spit out the world and the results in the console
    World
    score

    % take the cell at (m,n) and make it interact with all its neighbours
    % Return the score the cell accumulates after interacting with its neighbours
    % A cell has (if its not on the border) 8 neighbours and can
    % interact with itself. So there are 9 interactions.
    % m is the row #. n is the column #
    function totalScore = getScoreFromInteractions(m,n)
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
        % self interaction
        if m == i && n == j
            if World(m, n) == 0
                result = P;
            else % World(i, j) == 1
                result = R;
            end
        end

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
