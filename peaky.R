## the peaky prior.
#
library(rstan)
N <- 100
c <- 0.1
a.true <- 0.025
b.true <- -0.01

y1 <- rnorm(N,exp(-50*(a.true^2+b.true^2)))
y2 <- rnorm(N,exp(-50*((a.true-c)^2+(b.true-c)^2)))

peaky_dat <- list(N=N,c=c,y=cbind(y1,y2))

# with flat N(0,100)xN(0,100) prior: NO LEARNING.
peaky_fit <- stan(file = 'peaky.stan',data=peaky_dat, verbose = FALSE)
peaky_fit

# with uniform prior on manifold:
peakyOK_fit <- stan(file = 'peakyOK.stan',data=peaky_dat, verbose = FALSE)

## add more samples: Nailed it!
## a = 0 \pm 0.03  and b = -0.01 \pm 0.03
peakyOK <- stan(fit = peakyOK_fit, data=peaky_dat, iter = 20000, chains=4)
peakyOK


## with no specs for prior: Stan claims posterior improper!
peaky0 <- stan(file='peaky0.stan',data=peaky_dat, verbose = FALSE)

## with (a,b) iid U[-1,1]:
peakyU <- stan(file='peakyU.stan',data=peaky_dat,verbose=FALSE)

## give sims to rv
# thetas <- extract(stanfit,pars="m")$m
# th <- rvsims(thetas,n.sims=dim(thetas))

# with transformed parameters block:
peakyT <- stan(file='peakyT.stan',data=peaky_dat,verbose=FALSE)

# more samples
peakyT1 <- stan(fit=peakyT,data=peaky_dat,iter=20000,verbose=FALSE)
as <- extract(peakyT1,pars="a")$a
a <- rvsims(as,n.sims=dim(as))
rvhist(a)
bs <- extract(peakyT1,pars="b")$b
b <- rvsims(bs,n.sims=dim(bs))
rvhist(b)
