% Run a bunch of experiments
DEFECTOR = 0; % a constant, don't change this lel
COOPERATOR = 1; % don't change this either lel

worldSize = 99;
generations = 50;
b = 1.9;

% Experiment: Random distribution of defectors and cooperators
simName = 'UniformRandomExperiment';
World = randi([DEFECTOR COOPERATOR], worldSize, worldSize);
prisonerworld(simName, World, generations, b);

% Experiment: 1 Defector in the middle of a World of cooperators 
simName = 'DoilyExperiment';
World = ones(worldSize,worldSize)*COOPERATOR;
World(round(worldSize/2), round(worldSize/2)) = DEFECTOR;
prisonerworld(simName, World, generations, b);