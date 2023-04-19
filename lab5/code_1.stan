generated quantities {
    real alpha = normal_rng(3, 1);
    real theta = normal_rng(0.5, 0.1);
    real n = normal_rng(0, 1);
    real lambda = exp(alpha + theta * n);
    int y_pred = poisson_rng(lambda);
}