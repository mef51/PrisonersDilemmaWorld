% Run a bunch of experiments
DEFECTOR = 0; % a constant, don't change this lel
COOPERATOR = 1; % don't change this either lel

worldSize = 199;
generations = 200;

% Experiment: 1 Defector in the middle of a World of cooperators 
simName = 'DoilyExperiment';
b = 1.9;
World = ones(worldSize,worldSize)*COOPERATOR;
World(round(worldSize/2), round(worldSize/2)) = DEFECTOR;
prisonerworld(simName, World, generations, b);

% Experiment: Try to do the doily experiment with cooperators in the middle of defectors.
worldSize = 59;
generations = 40;
simName = 'CDoilyExperiment';
b = 1.8;
World = ones(worldSize,worldSize)*DEFECTOR;
World(round(worldSize/2), round(worldSize/2)) = COOPERATOR;
World(round(worldSize/2), round(worldSize/2)+1) = COOPERATOR;
World(round(worldSize/2), round(worldSize/2)-1) = COOPERATOR;
World(round(worldSize/2)+1, round(worldSize/2)) = COOPERATOR;
World(round(worldSize/2)-1, round(worldSize/2)) = COOPERATOR;
World(round(worldSize/2)+1, round(worldSize/2)+1) = COOPERATOR;
World(round(worldSize/2)+1, round(worldSize/2)-1) = COOPERATOR;
World(round(worldSize/2)-1, round(worldSize/2)+1) = COOPERATOR;
World(round(worldSize/2)-1, round(worldSize/2)-1) = COOPERATOR;
prisonerworld(simName, World, generations, b);


%Experiment: Alternating 1 and 0 throughout the matrix
simName = 'UniformAlternating';
World = ones(worldSize,worldSize)*COOPERATOR;
for m = 1:worldSize
    for n = 1:worldSize
        if mod(n, 2) == 0
            if mod(m, 2) == 1
                World(m, n) = DEFECTOR;
            end
        else
            if mod(m+1, 2) == 1
                World(m, n) = DEFECTOR;
            end
        end
    end
end
prisonerworld(simName, World, generations, b);


