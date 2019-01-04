function test_stopcrit()
%function to test the stopping criterium
Nruns = 100;
Ngen = 10;
req_impr = 0.01;
fit_begin = zeros(Nruns,1);
fit_end = zeros(Nruns,1);
stop_gen = zeros(Nruns,1);
fit_stop = zeros(Nruns,1);

for i=1:Nruns
    [fit_begin(i), fit_end(i), t] = run_ga_test_stopcrit(Ngen, req_impr, 50, 200, 0.05, 0.95, 0.95, 0.1, 'xalt_edges', 0);
    stop_gen(i) = t(1,1); 
    fit_stop(i)= t(1,2);
end

mean(fit_begin)
mean(fit_end)
mean(stop_gen)
mean(fit_stop)
