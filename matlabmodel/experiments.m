% Run a bunch of experiments
DEFECTOR = 0; % a constant, don't change this lel
COOPERATOR = 1; % don't change this either lel

worldSize = 30;
generations = 30;

% Experiment: 1 Defector in the middle of a World of cooperators 
simName = 'DoilyExperiment';
b = 1.9;
World = ones(worldSize,worldSize)*COOPERATOR;
World(round(worldSize/2), round(worldSize/2)) = DEFECTOR;
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


simName = 'Uniform Percentage';
World = ones(worldSize, worldSize)*DEFECTOR;
percentage = 0.1; %set percent of cooperators
final_coop = round(percentage*(worldSize*worldSize));
sofar_coop=0;
while (sofar_coop<final_coop)
    m=randi(worldSize);
    n=randi(worldSize);
    if World(m,n)==DEFECTOR
        World(m,n)=COOPERATOR;
        sofar_coop=sofar_coop+1;
    end
end
prisonerworld(simName, World, generations, b);
