data {
  int N;
  vector[N] n_i;
  int y[N];
}

parameters {
  real alpha;
  real theta;
}

transformed parameters {
  real lambda[N];
  for (i in 1:N) {
    lambda[i] = exp(alpha + theta * n_i[i]);
  }
}


model {
  alpha ~ normal(3, 1);
  theta ~ normal(0.5, 0.1);
  
  for (i in 1:N) {
    y[i] ~ poisson(lambda[i]);
  }
}

generated quantities {
    real y_pred[N];
    for (i in 1:N){
        y_pred[i] = poisson_rng(lambda[i]);
    }
}