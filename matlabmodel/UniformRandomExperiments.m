% Simulations of a random world sweeping b = 1.1 to b = 2.0
% At b = 2.1 The defectors wipe out the cooperators. I assumed it was the
% same case for any b larger than that.
DEFECTOR = 0; % a constant, don't change this lel
COOPERATOR = 1; % don't change this either lel

worldSize = 200;
generations = 200;
% make a random world and use it over and over so all the initial worlds are the same
World = randi([DEFECTOR COOPERATOR], worldSize, worldSize);

% Experiment: Uniform Random distribution of defectors and cooperators
b = 1.1:0.1:2.0;
for i = 1:length(b)
    temptation = b(i);
    suffix = strrep(num2str(temptation), '.', '-');
    simName = strcat('UniRandExperiment', suffix);
    prisonerworld(simName, World, generations, temptation);
end

% I saw that from the UniformRandomExperiments, when b went from 1.7 to
% 1.8, a lot more noise showed up in the later stages of the population
% graph. I also saw that when b went from 1.8 to 1.9, the cooperators no
% longer overtook the defectors, which they had for all b smaller than 1.9.
% So the following experiments look more closely at b values between 1.7 and 1.9
b = 1.70:0.02:1.9;
for i = 1:length(b)
    temptation = b(i);
    suffix = strrep(num2str(temptation), '.', '-');
    simName = strcat('UniRandExperiment', suffix);
    prisonerworld(simName, World, generations, temptation);
end

% Ok the change is still very sudden between 1.78 and 1.8. Let's look
% more closely
b = 1.78:0.0025:1.81;
for i = 1:length(b)
    temptation = b(i);
    suffix = strrep(num2str(temptation), '.', '-');
    simName = strcat('UniRandExperiment', suffix);
    prisonerworld(simName, World, generations, temptation);
end

b = [1.7999, 1.8];
for i = 1:length(b)
    temptation = b(i);
    suffix = strrep(num2str(temptation), '.', '-');
    simName = strcat('UniRandExperiment', suffix);
    prisonerworld(simName, World, generations, temptation);
end

b = 1.8;
suffix = strrep(num2str(b), '.', '-');
simName = strcat('UniRandExperimentLong', suffix);
prisonerworld(simName, World, 500, b);