% I saw that from the UniformRandomExperiments, when b went from 1.7 to
% 1.8, a lot more noise showed up in the later stages of the population
% graph. I also saw that when b went from 1.8 to 1.9, the cooperators no
% longer overtook the defectors, which they had for all b smaller than 1.9.
% So this file looks more closely at b values between 1.7 and 1.9
DEFECTOR = 0; % a constant, don't change this lel
COOPERATOR = 1; % don't change this either lel

worldSize = 200;
generations = 200;
% make a random world and use it over and over so all the initial worlds are the same
World = randi([DEFECTOR COOPERATOR], worldSize, worldSize); 

% Experiment: Random distribution of defectors and cooperators
simName = 'UniformRandomExperiment1-70';
b = 1.70;
prisonerworld(simName, World, generations, b);

% Experiment: Random distribution of defectors and cooperators
simName = 'UniformRandomExperiment1-72';
b = 1.72;
prisonerworld(simName, World, generations, b);

% Experiment: Random distribution of defectors and cooperators
simName = 'UniformRandomExperiment1-74';
b = 1.74;
prisonerworld(simName, World, generations, b);

% Experiment: Random distribution of defectors and cooperators
simName = 'UniformRandomExperiment1-76';
b = 1.76;
prisonerworld(simName, World, generations, b);

% Experiment: Random distribution of defectors and cooperators
simName = 'UniformRandomExperiment1-78';
b = 1.78;
prisonerworld(simName, World, generations, b);

% Experiment: Random distribution of defectors and cooperators
simName = 'UniformRandomExperiment1-80';
b = 1.80;
prisonerworld(simName, World, generations, b);

% Experiment: Random distribution of defectors and cooperators
simName = 'UniformRandomExperiment1-82';
b = 1.82;
prisonerworld(simName, World, generations, b);

% Experiment: Random distribution of defectors and cooperators
simName = 'UniformRandomExperiment1-84';
b = 1.84;
prisonerworld(simName, World, generations, b);

% Experiment: Random distribution of defectors and cooperators
simName = 'UniformRandomExperiment1-86';
b = 1.86;
prisonerworld(simName, World, generations, b);

% Experiment: Random distribution of defectors and cooperators
simName = 'UniformRandomExperiment1-88';
b = 1.88;
prisonerworld(simName, World, generations, b);

% Experiment: Random distribution of defectors and cooperators
simName = 'UniformRandomExperiment1-90';
b = 1.90;
prisonerworld(simName, World, generations, b);