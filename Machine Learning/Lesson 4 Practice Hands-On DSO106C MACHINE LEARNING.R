trials <-10000

alpha <- 9
beta <- 1

samplesA <- rbeta(trials, 27+alpha, 39 + beta)
samplesB <- rbeta(trials, 10+alpha, 45 + beta)

Bsuperior <- sum(samplesB > samplesA) / trials

Bsuperior

# There is a chance that the bleach is 0.0126% effective