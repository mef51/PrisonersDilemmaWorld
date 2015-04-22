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

%Experiment: Alternating 1 and 0 throughout the matrix
simName = 'UniformAlternating';
World = ones(worldSize,worldSize)*COOPERATOR;
for m=1:worldSize
    for n=1:worldSize
        if 1==mod(m+n,2)
            World(m,n)=DEFECTOR;          
        end
        if 0==mod(m+n,2)
           World(m,n)=DEFECTOR;
        end
    end
end
prisonerworld(simName, World, generations, b);