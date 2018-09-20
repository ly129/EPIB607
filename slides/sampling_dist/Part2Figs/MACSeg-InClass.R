vbls<-c("id","mos","age","cd4","cd8","vload","aidscase","vtime","sctime","atime","dtime","ideath")
MACS<-read.table("data/MACS.txt",col.names=vbls)

library(nlme)
library(lattice)

smlMACS <- na.omit(smlMACS)
summary(smlMACS)

length(unique(MACS$id))-length(unique(smlMACS$id))
length(unique(smlMACS$id))

table(table(smlMACS$id))

drop <- as.numeric(names(table(smlMACS$id)[table(smlMACS$id)<3]))
smlMACS <- smlMACS[!(smlMACS$id %in% drop),]

smlMACS$lvl <- logb(smlMACS$vload,2)
#postscript("MACS-vlplots.eps")
par(mfrow=c(1,2))
hist(smlMACS$vload,xlab="Viral load",main="")
hist(smlMACS$lvl,xlab="Viral load (log2 scale)",main="")
#dev.off()

attach(smlMACS)

#postscript("MACS-cd4byTime.eps")
plot(smlMACS$cd4~smlMACS$mos,xlab="Time (months)",ylab="CD4 counts")
mod1<-lm(smlMACS$cd4~smlMACS$mos+I(smlMACS$mos^2)+I(smlMACS$mos^3))
lines(smlMACS$mos,fitted(mod1),col=4,lwd=3)
#dev.off()

n <- length(unique(smlMACS$id))
n.obs <- dim(smlMACS)[1]
cut.offs <- min(lvl) + c(1:5/6)*(max(lvl) - min(lvl))
round(c(min(lvl),rep(cut.offs,each=2),max(lvl)),1)
smlMACS$lvlcat <- lvlcat <- rep(0,n.obs)
for(i in 1:5) lvlcat[lvl > cut.offs[i]] <- i
smlMACS$lvlcat <- as.factor(lvlcat)

temp.obs <- NULL
how.many <- unlist(lapply(split(smlMACS$id,smlMACS$id),length))
for(i in 1:n) temp.obs <- c(temp.obs,1:how.many[i])
smlMACS$obs <- temp.obs

baseline.MACS <- smlMACS[smlMACS$obs==1,]
table(baseline.MACS$lvlcat)

#postscript("MACS-cd4byVLcat.eps")
par(mfrow=c(2,3))
for(i in 0:5) {
  plot(cd4~mos,data=smlMACS[smlMACS$lvlcat==i,],main=paste("Category",i,sep=" "))
  who <- unique(smlMACS$id[smlMACS$lvlcat==i])
  for(j in who) {
    lines(cd4[smlMACS$id == j]~mos[smlMACS$id == j],col="grey")
  }
}
#dev.off()

source("MYstacked2wide.R")
source("variogram_q.txt")
fit.sat <- lm(cd4~mos+I(mos^2)+I(mos^3)+lvlcat,data=smlMACS)
resids <- cd4 - fitted(fit.sat)

rmat <- stacked2wide(id, resids, mos, seq(10,45,by=5), 2.5)
cmat <- nmat <- matrix(0,8,8)

#postscript("MACS-pairsplot.eps")
pairs(rmat)
#dev.off()

for(i in 1:8) {
  for(j in 1:8) {
    njk <- sum(!is.na(rmat[,i]*rmat[,j]))
    sjk <- sum(rmat[,i]*rmat[,j],na.rm=T)/njk
    cmat[i,j] <- sjk
    nmat[i,j] <- njk
  }
}

print(round(cmat,2))
vvec <- diag(cmat)
round(sqrt(vvec))
cormat <- cmat/(outer(sqrt(vvec),sqrt(vvec)))

dimnames(nmat) <- dimnames(cormat) <- list(paste("mo",seq(10,45,by=5),sep=""),paste("mo",seq(10,45,by=5),sep=""))

nmat
print(round(cormat,2))

macs.vario <- lda.variogram(id,resids,mos)
var.est <- var(resids) #73430.98

#postscript("MACS-vario.eps")
plot(macs.vario$delta.x,macs.vario$delta.y,ylim=c(0,1.2*var.est),
    pch=".",xlab="Change in time",ylab="Change in residuals over time squared")
lines(smooth.spline(macs.vario$delta.x,macs.vario$delta.y,df=5),lwd=2,col=4)
#lines(lowess(macs.vario$delta.x,macs.vario$delta.y),lwd=2)
abline(h=var.est,lty=3,lwd=2)
abline(h=18000,lty=2,lwd=2)
abline(h=42000,lty=4,lwd=2)
#dev.off()

