% Run a bunch of experiments
DEFECTOR = 0; % a constant, don't change this lel
COOPERATOR = 1; % don't change this either lel

worldSize = 200;
generations = 200;

% Experiment: 1 Defector in the middle of a World of cooperators 
simName = 'DoilyExperiment';
b = 1.9;
World = ones(worldSize,worldSize)*COOPERATOR;
World(round(worldSize/2), round(worldSize/2)) = DEFECTOR;
prisonerworld(simName, World, generations, b);