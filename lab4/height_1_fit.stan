data {
  int<lower=0> N;
  vector[N] heights;
}

parameters {
  real<lower=0> mu;
  real<lower=0> std_dev;
}

model {
  mu ~ normal(154, 7);
  std_dev ~ normal(15, 5);
  heights ~ normal(mu, std_dev);
}

generated quantities {
  real y_pred = normal_rng(mu, std_dev);
}
