# Potential Midterm Questions


1. From the "what teacher dont know" paper. The CLEC SE is larger primarily due to the smaller sample
size and secondly to the larger sample sd in the original data. Ask why bootstrap SE might be smaller or larger? The bootstrap separates the concept of a standard error—the
standard deviation of a sampling distribution—from the common
formula s/√n for estimating the SE of a sample mean.
This separation should help students understand the concept.
Based on extensive experience interviewing job candidates, I
attest that a better way to teach about SEs is needed—too many
do not understand SEs, and even confuse SEs in other contexts
with the formula for the SE of a sample mean.


2. The bootstrap distribution is centered at the observed statistic,
not the population parameter, for example, at x¯, not μ.
This has two profound implications. First, it means that we do
not use the mean of the bootstrap statistics as a replacement for
the original estimate.1 For example, we cannot use the bootstrap
to improve on x¯; no matter how many bootstrap samples we take, they are centered at x¯, not μ. Instead we use the bootstrap
to tell how accurate the original estimate is. In this regard the
bootstrap is like formula methods that use the data twice—once
to compute an estimate, and again to compute a standard error
for the estimate. The bootstrap just uses a different approach to
estimating the standard error.