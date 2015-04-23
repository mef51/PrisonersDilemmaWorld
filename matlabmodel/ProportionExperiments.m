DEFECTOR = 0; % a constant, don't change this lel
COOPERATOR = 1; % don't change this either lel

worldSize = 200;
generations = 200;
b = 1.1:0.1:2.0;
proportionCoops = union(0.1:0.1:0.9, [0.01, 0.99]);

for i = 1:length(proportionCoops)
    World = ones(worldSize, worldSize)*DEFECTOR;
    proportion = proportionCoops(i);
    numCoops = round(proportion*(worldSize*worldSize)); % the # of coops we want in the world
    coopsSoFar = 0;
    while (coopsSoFar < numCoops)
        m = randi(worldSize);
        n = randi(worldSize);
        if World(m,n) == DEFECTOR % make sure we don't replace a cooperator we placed earlier
            World(m,n) = COOPERATOR;
            coopsSoFar = coopsSoFar + 1;
        end
    end
    
    for j = 1:length(b)
        temptation = b(j);
        suffix = strrep(num2str(temptation), '.', '-');
        percent = num2str(proportion*100);
        simName = strcat('PropExperiment', percent, 'pcc', suffix);
        prisonerworld(simName, World, generations, b(j));
    end
end
