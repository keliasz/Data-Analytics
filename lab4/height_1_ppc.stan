generated quantities {
  real<lower=0> mu = normal_rng(154, 7);
  real<lower=0> std_dev = normal_rng(15, 5);
  real<lower=0> height = normal_rng(mu, std_dev); 
}