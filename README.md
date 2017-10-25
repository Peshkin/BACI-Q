# BACI-Q

Stan models and related R code implementing the BACI-Q (Bayesian Approach to Confidence Intervals for protein Quantitation) 

Running this code requires installation of R-Stan
You can verify that the installation is complete by running in R (or Rstudio):
<pre>
   library(rstan)
   modelFile = "modelKappaMu.stan";
   modK = stan_model(modelFile, save_dso = TRUE, obfuscate_model_name = FALSE)
</pre>
you might get some warnings from compiler, which is not a problem. 

next, try to execute the following R code on-line as a test 
<pre>
  J=2; n = c(643,2); y = c(201,1)
  Delta = .9;
  Iterations = 2000;
  Warmup = 1000; 
  point_est <- optimizing(modK, data=c("J","y","n"), algorithm = "LBFGS", verbose = FALSE, iter = 5000)
  fit = sampling(modK, data=c("J","y","n"), chains = 4, iter = Iterations, warmup = Warmup, control = list(adapt_delta = Delta), cores = 1, refresh=-1)
  
   
