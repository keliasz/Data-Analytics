data {
    int<lower=0> N;
    vector[N] heights;
    vector[N] weight;
}

parameters {
    real<lower=0> alpha;
    real<lower=0> std_dev;
    real<lower=0> beta;
    real<lower=0> gamma;
}

transformed parameters {
    vector[N] mean;
    for (i in 1:N) {
      mean[i] = alpha + beta * weight[i] + gamma * weight[i] * weight[i];
  }
}

model {
    alpha ~ normal(154, 7);
    std_dev ~ normal(15, 5);
    beta ~ lognormal(0, 1);
    gamma ~ lognormal(0, 1);
    
    heights ~ normal(mean, std_dev);
}

generated quantities {
    vector[N] y_pred;
    for (i in 1:N) {
        y_pred[i] = normal_rng(mean[i], std_dev);
    }
}