data { 
     int<lower=2> J;          // number of coins 
     int<lower=0> y[J];	      // heads in respective coin trials
     int<lower=1> n[J];	      // total in respective coin trials
}
parameters {
     real<lower = 0, upper = 1> mu;
     real<lower = 0> kappa;
}
transformed parameters {
    real<lower=0> alpha;
    real<lower=0> beta;

    alpha = kappa * mu;
    beta = kappa - alpha;
}
model {
    mu ~ uniform(0, 1); 
    kappa ~ exponential(0.05); // 
    y ~ beta_binomial(n, alpha, beta);
}
  
