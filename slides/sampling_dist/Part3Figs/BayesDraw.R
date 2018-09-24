x <- seq(90,115,.1)



plot(x,dnorm(x,102.95,sqrt(6.3)),type="l",xlab="Mean Intelligence",ylab="Posterior density")
#dev.off()


#postscript("Bayes8b.eps",horiz=F)
x <- seq(40,160,.1)
plot(x,dnorm(x,102.95,sqrt(6.3)),type="l",xlab="Mean Intelligence",ylab="Posterior density",lwd=3)
lines(x,dnorm(x,100,20),col=4,lwd=2)
lines(x,dnorm(x,103,8/sqrt(10)),col=5,lwd=2,lty=2)
legend(50,.13,c("Prior","Likelihood","Posterior"),lty=c(1,2,1),col=c(4,5,1),lwd=c(2,2,3))
dev.off()


x <- seq(40,160,.1)
theta <- 80
tau <- 30
x.bar <- 103
se <- 8/sqrt(10)
omega <- se^2/(tau^2+se^2)
post.mean <- omega*theta + (1-omega)*x.bar
post.sd <- sqrt((1-omega)*se^2)
plot(x,dnorm(x,post.mean,post.sd),type="l",xlab="Mean Intelligence",ylab="Posterior density",lwd=3)
lines(x,dnorm(x,theta,tau),col=4,lwd=2)
lines(x,dnorm(x,x.bar,se),col=5,lwd=2,lty=2)
legend(50,.13,c("Prior","Likelihood","Posterior"),lty=c(1,2,1),col=c(4,5,1),lwd=c(2,2,3))

