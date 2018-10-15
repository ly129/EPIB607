#' Plot null and alternative distributions
#' @param n sample size
#' @param s population standard deviation (or estimated standard deviation)
#' @param mu0 mean under the null hypothesis
#' @param mha mean under the alternative hypothesis
#' @param alternative is alternative hypothesis greater than or less than mu0.
#'   Defaults to 'less'
#' @param legend show legend? Defaults to TRUE
#' @param ... other arguments passed to graphics::title

power_plot <- function(n, s, mu0, mha, cutoff, 
                       alternative = c("less","greater"),
                       legend = TRUE, ...) {
  
  cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", 
                 "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
  alternative <- match.arg(alternative)
  SEM <- s / sqrt(n)
  
  if (alternative == "greater") {
    if (mha < mu0) stop("mean under Ha is less than the null. select alternative='less'")
    
    x <- seq(mu0 - 4.25*SEM, mha + 3*SEM, length = 1000)
    dh0 <- dnorm(x, mu0, SEM)
    dh1 <- dnorm(x, mha, SEM)
    ht <- 1.1 * dnorm(mu0, mu0, SEM)
    
    
    plot.new()
    plot.window(xlim = range(x), ylim = c(.01*ht, 3.2*ht)) 
    axis(1)
    title(...)
    # null
    green <- seq(mu0 - 3 * SEM, cutoff, length.out = 1000)
    d <- c(dnorm(green,mu0,SEM),0)
    I <- 1
    polygon(c(green,cutoff),d + I * ht, col = cbPalette[4], border = NA)
    
    red <- seq(cutoff, mu0 + 3 * SEM, length.out = 1000)
    d <- c(dnorm(red, mu0, SEM), 0)
    polygon(c(red,cutoff), d + I * ht, col = "red", border = NA)
    points(mu0, I * ht, cex = 0.7, pch = 19)
    text(labels = latex2exp::TeX(sprintf("$\\mu_{H_0} = %#.4f$", mu0)), 
         x = mu0, y = I*ht*.90)
    
    # alternative
    green <- seq(mha - 3 * SEM, cutoff, length.out = 1000)
    d <- c(dnorm(green, mha, SEM), 0)
    polygon(c(green,cutoff),d + (I + 1) * ht, col = cbPalette[6], border = NA)
    points(mha, (I + 1) * ht, cex = 0.7, pch = 19)
    text(labels = latex2exp::TeX(sprintf("$\\mu_{H_A} = %#.4f$", mha)), 
         x = mha, y = (I + 1) * ht * .95)
    
    red <- seq(cutoff, mha + 3 * SEM, length.out = 1000)
    d <- c(dnorm(red, mha, SEM), 0)
    polygon(c(red,cutoff), d + (I + 1) * ht, col = cbPalette[2], border = NA)
    
    alpha <- pnorm(cutoff, mu0, SEM, lower.tail = FALSE)
    beta <- pnorm(cutoff, mha, SEM)
    
    labs.h0 <- latex2exp::TeX(sprintf("$\\alpha$ = %#.3f", alpha))
    labs.h1a <- latex2exp::TeX(sprintf("$\\beta$ = %#.3f", beta))
    labs.h1b <- latex2exp::TeX(sprintf("$1 - \\beta$ = %#.3f",1 - beta))
    
    if (legend) legend("topleft", legend = c(labs.h0, labs.h1a, labs.h1b), pch = 15,cex = 1.2,
                       col = c("red", cbPalette[c(6,2)]))
    
    segments(cutoff,(I)*ht*0.2,
             cutoff,(I+1)*ht,lwd=0.5,col="red")
    text(labels = latex2exp::TeX(sprintf("cutoff = %#.4f$", cutoff)), 
         x = cutoff, y = (I)*ht*0.15)
    
    arrows(mu0,(I-0.25)*ht,
           cutoff,(I-0.25)*ht,length=0.05,
           code=3,angle=20,col=cbPalette[6],lwd=1.5)
    arrows(cutoff,(I+1-0.25)*ht,
           mha,(I+1-0.25)*ht,length=0.05,
           code=3,angle=15,col="red",lwd=1.5)
    segments(mha, I * ht, mha,
             (I + 2) * ht * 1.2,lwd=0.5,col="grey60")
  } 
  
  if (alternative == "less") {
    if (mha > mu0) stop("mean under Ha is greater than the null. select alternative='greater'")
    # browser()
    x <- seq(mha - 4.25*SEM, mu0 + 3*SEM, length = 1000)
    dh0 <- dnorm(x, mu0, SEM)
    dh1 <- dnorm(x, mha, SEM)
    ht <- 1.1 * dnorm(mu0, mu0, SEM)
    
    plot.new()
    plot.window(xlim = range(x), ylim = c(.01*ht, 3.2*ht)) 
    axis(1)
    title(...)
    # null
    green <- seq(mu0 + 3 * SEM, cutoff, length.out = 1000)
    d <- c(dnorm(green,mu0,SEM),0)
    I <- 1
    polygon(c(green,cutoff),d + I * ht, col = cbPalette[4], border = NA)
    
    red <- seq(mu0 - 3 * SEM, cutoff, length.out = 1000)
    d <- c(dnorm(red, mu0, SEM), 0)
    polygon(c(red,cutoff), d + I * ht, col = "red", border = NA)
    points(mu0, I * ht, cex = 0.7, pch = 19)
    text(labels = latex2exp::TeX(sprintf("$\\mu_{H_0} = %#.4f$", mu0)), 
         x = mu0, y = I*ht*.90)
    
    # alternative
    green <- seq(mha + 3 * SEM, cutoff, length.out = 1000)
    d <- c(dnorm(green, mha, SEM), 0)
    polygon(c(green,cutoff),d + (I + 1) * ht, col = cbPalette[6], border = NA)
    points(mha, (I + 1) * ht, cex = 0.7, pch = 19)
    text(labels = latex2exp::TeX(sprintf("$\\mu_{H_A} = %#.4f$", mha)), 
         x = mha, y = (I + 1) * ht * .95)
    
    red <- seq(mha - 3 * SEM, cutoff, length.out = 1000)
    d <- c(dnorm(red, mha, SEM), 0)
    polygon(c(red,cutoff), d + (I + 1) * ht, col = cbPalette[2], border = NA)
    
    alpha <- pnorm(cutoff, mu0, SEM, lower.tail = TRUE)
    beta <- pnorm(cutoff, mha, SEM, lower.tail = FALSE)
    
    labs.h0 <- latex2exp::TeX(sprintf("$\\alpha$ = %#.3f", alpha))
    labs.h1a <- latex2exp::TeX(sprintf("$\\beta$ = %#.3f", beta))
    labs.h1b <- latex2exp::TeX(sprintf("$1 - \\beta$ = %#.3f",1 - beta))
    
    if (legend) legend("topleft", legend = c(labs.h0, labs.h1a, labs.h1b), pch = 15,cex = 1.2,
                       col = c("red", cbPalette[c(6,2)]))
    
    segments(cutoff,(I)*ht*0.2,
             cutoff,(I+1)*ht,lwd=0.5,col="red")
    text(labels = latex2exp::TeX(sprintf("cutoff = %#.4f$", cutoff)), 
         x = cutoff, y = (I)*ht*0.15)
    
    arrows(mu0,(I-0.25)*ht,
           cutoff,(I-0.25)*ht,length=0.05,
           code=3,angle=20,col=cbPalette[6],lwd=1.5)
    arrows(cutoff,(I+1-0.25)*ht,
           mha,(I+1-0.25)*ht,length=0.05,
           code=3,angle=15,col="red",lwd=1.5)
    segments(mha, I * ht, mha,
             (I + 2) * ht * 1.2,lwd=0.5,col="grey60")
    
    
  }
}