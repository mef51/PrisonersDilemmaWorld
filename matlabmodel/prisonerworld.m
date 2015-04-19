% Simulates a PrisonersDilemmaWorld and saves a population graph, a video of the world, and
% the last frame of the video as an image.
% Pass in:
% simName - a string that identifies the experiment you're running
% World - a square matrix filled with DEFECTORs and COOPERATORS. You pick how you want the world.
% generations - a number, the number of generations to simulate
% b - the Temptation. This is the parameter from Nowak & May's paper.
function prisonerworld(simName, World, generations, b)
    % Prisoner's Dilemma Payoffs: T > R > P > S
    T = b;  % Temptation. may and nowak vary this parameter to get their results
    R = 1;  % Reward.
    P = 0;   % Punishment. technically this is some arbitrarily small number > 0
    S = 0;   % Sucker's Payoff.
    DEFECTOR = 0; % a constant, don't change this lel
    COOPERATOR = 1; % don't change this either lel

    worldSize = size(World, 1); % we're assuming World is a square matrix here

    if ~exist('results', 'dir')
        mkdir('results'); % dis is where we dump the results
    end

    % this matrix holds the total score a cell obtains after playing with all its neighbours
    score = updateWorldScores();
    populationCount = zeros(generations, 2); % Keeps track of the cooperator/defectors for each iteration
    
    hmo = HeatMap(World);
    fig = plot(hmo);
    
    simVideo(1) = getframe(fig);
    close all hidden; % HeatMaps have hidden handles
    for step = 1:generations
        updatePopCount(step);
        % let the new world begin
        World = updateWorld(World, score);
        score = updateWorldScores();
        hmo = HeatMap(World);
        fig = plot(hmo);
        if step == generations
            print(strcat('results/', simName,'_FinalState'),'-dpng');
        end
        simVideo(step+1) = getframe(fig);
        close all hidden;
    end   
    
    %figure
    movie(simVideo, 1);
    movie2avi(simVideo, strcat('results/', simName,'_World'), 'compression', 'None');
    plot(1:generations, populationCount(:,1), 1:generations, populationCount(:,2));
    xlabel('Generations');
    ylabel('Population');
    title(strcat(simName, ': Population over time'));
    legend('Cooperators', 'Defectors');
    print(strcat('results/', simName,'_Population'),'-dpng');

    close all; % finished

    %grabs data for the number of each population at every step
    function updatePopCount(step)
        numCooperators = sum(World(:) == COOPERATOR); % this is such a cool trick haha
        populationCount(step, 1) = numCooperators;
        populationCount(step, 2) = (worldSize*worldSize) - numCooperators;
    end

    % for each cell, calculate the score it gains from interacting with its neighbours
    function newScores = updateWorldScores()
        newScores = zeros(worldSize, worldSize);
        for m = 1:worldSize
            for n = 1:worldSize
                newScores(m, n) = getScoreFromInteractions(m, n);
            end
        end
    end

    % update the world for the next generation
    function newWorld = updateWorld(oldWorld, oldScores)
        newWorld = zeros(worldSize, worldSize);
        for m = 1:worldSize
            for n = 1:worldSize
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
                if m+i <= worldSize && m+i >= 1 && n+j <= worldSize && n+j >= 1
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
                if m+i <= worldSize && m+i >= 1 && n+j <= worldSize && n+j >= 1
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
        if World(m, n) == COOPERATOR
            if World(i, j) == DEFECTOR
                result = S;
            else % World(i, j) == COOPERATOR
                result = R;
            end
        end
        if World(m, n) == DEFECTOR
            if World(i, j) == DEFECTOR
                result = P;
            else % World(i, j) == COOPERATOR
                result = T;
            end
        end
    end
end
