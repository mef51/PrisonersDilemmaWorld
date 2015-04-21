% Simulations of a random world sweeping b = 1.1 to b = 2.0
% At b = 2.1 The defectors wipe out the cooperators. I assumed it was the
% same case for any b larger than that.
DEFECTOR = 0; % a constant, don't change this lel
COOPERATOR = 1; % don't change this either lel

worldSize = 200;
generations = 200;
% make a random world and use it over and over so all the initial worlds are the same
World = randi([DEFECTOR COOPERATOR], worldSize, worldSize);

% Experiment: Random distribution of defectors and cooperators
simName = 'UniformRandomExperiment1-1';
b = 1.1;
prisonerworld(simName, World, generations, b);

% Experiment: Random distribution of defectors and cooperators
simName = 'UniformRandomExperiment1-2';
b = 1.2;
prisonerworld(simName, World, generations, b);

% Experiment: Random distribution of defectors and cooperators
simName = 'UniformRandomExperiment1-3';
b = 1.3;
prisonerworld(simName, World, generations, b);

% Experiment: Random distribution of defectors and cooperators
simName = 'UniformRandomExperiment1-4';
b = 1.4;
prisonerworld(simName, World, generations, b);

% Experiment: Random distribution of defectors and cooperators
simName = 'UniformRandomExperiment1-5';
b = 1.5;
prisonerworld(simName, World, generations, b);

% Experiment: Random distribution of defectors and cooperators
simName = 'UniformRandomExperiment1-6';
b = 1.6;
prisonerworld(simName, World, generations, b);

% Experiment: Random distribution of defectors and cooperators
simName = 'UniformRandomExperiment1-7';
b = 1.7;
prisonerworld(simName, World, generations, b);

% Experiment: Random distribution of defectors and cooperators
simName = 'UniformRandomExperiment1-8';
b = 1.8;
prisonerworld(simName, World, generations, b);

% Experiment: Random distribution of defectors and cooperators
simName = 'UniformRandomExperiment1-9';
b = 1.9;
prisonerworld(simName, World, generations, b);

% Experiment: Random distribution of defectors and cooperators
simName = 'UniformRandomExperiment2-0';
b = 2.0;
prisonerworld(simName, World, generations, b);