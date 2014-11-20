data {
  real c;
  int<lower=0> N;
  real y[N,2];
}
parameters {
  real a;
  real b;
}
model {
  real m1;
  real m2;
  // no prior specification for (a,b).
  m1 <- exp(-50.*(square(a)+square(b)));
  m2 <- exp(-50.*(square(a-c)+square(b-c)));
  for (n in 1:N) {
    y[n,1] ~ normal(m1,1);
    y[n,2] ~ normal(m2,1);
  }
}

