peaky-stan
==========

Example of uniform prior on parameters providing WRONG prior information.

**Likelihood**

Bivariate normal with unit covariance matrix but mean vector
constrained to a leaf-region of the first quadrant. The parameters
are $(a,b)$ free ranging over the whole plane.

$p(y|a,b) = \frac{1}{2\pi}\exp(-|y-\mu|^{2}/2)$

where  $\mu = \mu(a,b)$ maps the plane to the small leaf.
Concreatly: (without desperately seeking \LateX)

mu = [ exp(-50(a^2+b^2)), exp(-50((a-.1)^2+(b-.1)^2)) ]

*(peaky.stan)*
There is NO-LEARNING from 100 iid samples from this model when
the prior for (a,b) is flat over a large region of the plane.

*(peakyOK.stan)*
All ok when the prior is the info volume (area in this 2D case).

See also:
[http://arxiv.org/abs/0709.1067]


**Moral**

Let's teach Stan to use reasonable priors, i.e. entropic priors.


