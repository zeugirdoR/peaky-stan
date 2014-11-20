data {
  real c;
  int<lower=0> N;
  real y[N,2];
}
parameters {
  real a;
  real b;
}
transformed parameters {
  real m1;
  real m2;
  m1 <- exp(-50.*(square(a)+square(b)));
  m2 <- exp(-50.*(square(a-c)+square(b-c)));
}
model {
  increment_log_prob(log(fabs(a-b))-100.*(square(a)+square(b))+10.*(a+b));
  for (n in 1:N) {
    y[n,1] ~ normal(m1,1);
    y[n,2] ~ normal(m2,1);
  }
}

