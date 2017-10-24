data {
  int K;  // num dims
  int N;  // num observations
  int y[N, K];  // multinomial observations
}
parameters {
  vector<lower=0>[K] alpha;  
  simplex[K] theta[N];
}
model {
  alpha ~ lognormal(0, 5);   //  prior on alpha
  for (n in 1:N) {
    theta[n] ~ dirichlet(alpha);  // theta[n] ~ dirichlet(alpha);
    y[n] ~ multinomial(theta[n]);
  }
} 