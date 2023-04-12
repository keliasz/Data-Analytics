data {
  int<lower=0> N;
  vector[N] weight;
}

generated quantities {
  real alpha = normal_rng(154, 7);
  real beta = lognormal_rng(0, 1);
  real mu = normal_rng(15, 5);
  vector[N] height;

  for (i in 1:N) {
    height[i] = normal_rng(alpha + beta * weight[i], mu);
  }
}