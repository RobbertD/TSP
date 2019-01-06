function test_parentSelection()
%function to test the parent selection method
Nruns = 50;
Ngen = 28;
parentSelectionMethod = 'fpropselect'
all_mean_fit = zeros(Nruns,Ngen);
all_best_fit = zeros(Nruns,Ngen);


for i=1:Nruns
    i
    [mean_fit, best_fit] = run_ga_test_parentselect(parentSelectionMethod, 179, Ngen, 0.0, 0.95, 0.95, 0.3, 'scx', 0);
    all_best_fit(i,:) = best_fit;
    all_mean_fit(i,:) = mean_fit;
end

avg_best = mean(all_best_fit);
avg_mean = mean(all_mean_fit);

avg_best_last = avg_best(28)

figure(1)

plot(avg_best, 'r')
hold on
plot(avg_mean, 'b')
hold on
title('FPS')
xlabel('Generation'), ylabel('Fitness')
