x <- seq(-3.75,3.75,.1)
x1 <- dnorm(x)
x2 <- dt(x,3)
x3 <- dt(x,6)
x4 <- dt(x,11)

postscript("tDistns.eps",horiz=F)
plot(x,x1,lwd=2,type="l",xlab="",ylab="Density",main="")
lines(x,x2,lwd=2,lty=2,col=4)
lines(x,x3,lwd=2,lty=2,col=2)
lines(x,x4,lwd=2,lty=2,col=3)
legend(-3.85,.35,c("Normal","t(11)","t(6)","t(3)"),lty=c(1,2,2,2),col=c(1,3,2,4))
dev.off()


round(qnorm(c(0.005,0.01,0.025,0.05)),2)
round(qt(c(0.005,0.01,0.025,0.05),50),2)
round(qt(c(0.005,0.01,0.025,0.05),30),2)
round(qt(c(0.005,0.01,0.025,0.05),10),2)

round(pnorm(qnorm(c(0.005,0.01,0.025,0.05))),3)
round(pt(qnorm(c(0.005,0.01,0.025,0.05)),30),3)
round(pt(qnorm(c(0.005,0.01,0.025,0.05)),50),3)

### Read in data for HepC/HIV study.
rm(list=ls())
hep.dat <- read.csv("DEC_hepC.csv",header=T)
attach(hep.dat)
postscript("APRIdistns.eps",horiz=F)
par(mfrow=c(2,2))
hist(exp(lnAPRI),xlab="APRI",main="")
plot(density(exp(lnAPRI)),xlab="APRI",main="")
hist((lnAPRI),xlab="log of APRI",main="")
plot(density(lnAPRI),xlab="log of APRI",main="")
dev.off()

mean(exp(lnAPRI))
median(exp(lnAPRI))
sd(exp(lnAPRI))

n <- length(lnAPRI)
x.bar <- mean(lnAPRI)
se <- sd(lnAPRI)/sqrt(n)
z.star <- abs(qnorm(0.005))
round(c(x.bar,x.bar-z.star*se,x.bar+z.star*se),3)
round(exp(c(x.bar,x.bar-z.star*se,x.bar+z.star*se)),3)

