peaky-stan
==========

Example of uniform prior on parameters providing WRONG prior information.

**Likelihood**

Bivariate normal with unit (dentity) covariance matrix but mean vector
constraint to be in a leaf-region of the first quadrant.

$p(y|a,b) = \frac{1}{2\pi}\exp(-|y-\mu|^{2}/2)$
