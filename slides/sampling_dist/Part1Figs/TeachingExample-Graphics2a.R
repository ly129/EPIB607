rm(list=ls())

bf.dat <- read.csv("bfdataFORCLASS.csv")
summary(bf.dat[bf.dat$time==0,4:8])
sml.dat <- bf.dat[bf.dat$time==0,]
attach(sml.dat)

wt.grp <- cut(WEIGHT,c(2.5,3,3.5,3.75,5))
table(wt.grp)
round(table(wt.grp)/length(wt.grp)*100,1)
levels(wt.grp) <- c("small","normal-low","normal-high","big")

table(wt.grp[status==0])
sum(table(wt.grp[status==0]))
table(wt.grp[status==1])
sum(table(wt.grp[status==1]))


#postscript("bfBarPlot.eps",horiz=F)
par(mfrow=c(1,2))
barplot(table(wt.grp),ylab="Number") 
barplot(table(wt.grp)/length(wt.grp)*100,ylab="%") 
dev.off()

cbind(table(cut(WEIGHT,seq(2.5,5,.25))),round(as.vector(table(cut(WEIGHT,seq(2.5,5,.25)))/length(wt.grp)*100),1))
hist(WEIGHT,seq(2.5,5,.25),col=4)

col2 <- round(as.numeric(col1*100/sum(col1)),2)
cbind(col1,col2)
hist(left[tx==0],breaks=seq(20.5,25.5,.5),col=3,xlab="Left leg length -- controls",main="")

#postscript("bfHists.eps",horiz=F)
par(mfrow=c(2,2))
hist(WEIGHT,breaks=seq(2.5,5.1,.05),col=4,xlab="Birthweight",main="")
hist(WEIGHT,breaks=seq(2.5,5.1,.15),col=4,xlab="Birthweight",main="")
hist(WEIGHT,breaks=seq(2.5,5.1,.35),col=4,xlab="Birthweight",main="")
hist(WEIGHT,breaks=seq(2.5,5.5,.7),col=4,xlab="Birthweight",main="")
dev.off()

plot(rep(1,length(WEIGHT)),WEIGHT,
          xlab="",ylab="Birthweight",main="",axes=F,col=4)
axis(2) 

stem(WEIGHT)

x <- round(rnorm(15)*10)
sort(x)
stem(x)

boxplot(WEIGHT,ylab="Birthweight",col=3)
boxplot(WEIGHT~status,ylab="Birthweight",names=c("Control","Intervention"),col=c(7,4))

LLC.dens <- density(WEIGHT)
LLC.dens$x[LLC.dens$y==max(LLC.dens$y)]
plot(LLC.dens$x,LLC.dens$y,type="l",lwd=3,xlab="Leg Length",ylab="Proportion")
plot(LLC.dens$x,cumsum(LLC.dens$y)/sum(LLC.dens$y),type="l",lwd=3,xlab="Leg Length",ylab="Cumulative distribution")

#postscript("bfPDFs.eps",horiz=F)
par(mfrow=c(2,2))
LLC.dens <- density(WEIGHT,bw=.025)
plot(LLC.dens$x,LLC.dens$y,type="l",lwd=3,xlab="Leg Length",ylab="Proportion",main="bw=0.025")
LLC.dens <- density(WEIGHT,bw=.05)
plot(LLC.dens$x,LLC.dens$y,type="l",lwd=3,xlab="Leg Length",ylab="Proportion",main="bw=0.05")
LLC.dens <- density(WEIGHT)
plot(LLC.dens$x,LLC.dens$y,type="l",lwd=3,xlab="Leg Length",ylab="Proportion",main="Default bw")
LLC.dens <- density(WEIGHT,bw=.25)
plot(LLC.dens$x,LLC.dens$y,type="l",lwd=3,xlab="Leg Length",ylab="Proportion",main="bw=.25")
dev.off()


##### TWO VARIABLES

cbind(table(cut(WEIGHT[status==0],seq(2.5,5,.25))),round(as.vector(table(cut(WEIGHT[status==1],seq(2.5,5,.25)))),1))

stem(WEIGHT[status==0])
stem(WEIGHT[status==1])

#postscript("bfScatter1.eps",horiz=F)
plot(bf.dat$WEIGHT[bf.dat$time==0],bf.dat$WEIGHT[bf.dat$time==6],ylab="Weight at 6 months (kg)",xlab="Birthweight (kg)",col=4)
dev.off()
#postscript("bfScatter2.eps",horiz=F)
plot(bf.dat$WEIGHT[bf.dat$time==0],bf.dat$WEIGHT[bf.dat$time==6],ylab="Weight at 6 months (kg)",xlab="Birthweight (kg)",col=4)
lines(lowess(bf.dat$WEIGHT[bf.dat$time==0][!is.na(bf.dat$WEIGHT[bf.dat$time==6])],bf.dat$WEIGHT[bf.dat$time==6][!is.na(bf.dat$WEIGHT[bf.dat$time==6])]),col=4,lwd=2)
dev.off()
#postscript("bfScatter3.eps",horiz=F)
plot(bf.dat$WEIGHT[bf.dat$time==0 & bf.dat$status==0],bf.dat$WEIGHT[bf.dat$time==6 & bf.dat$status==0],ylab="Weight at 6 months (kg)",xlab="Birthweight (kg)",col=4)
points(bf.dat$WEIGHT[bf.dat$time==0 & bf.dat$status==1],bf.dat$WEIGHT[bf.dat$time==6 & bf.dat$status==1],col=3,pch=2)
legend(4.25,7,c("Control","Intervention"),col=c(3,4),pch=c(2,1))
dev.off()
#postscript("bfScatter4.eps",horiz=F)
plot(bf.dat$WEIGHT[bf.dat$time==0 & bf.dat$status==0],bf.dat$WEIGHT[bf.dat$time==6 & bf.dat$status==0],ylab="Weight at 6 months (kg)",xlab="Birthweight (kg)",col=4)
lines(lowess(bf.dat$WEIGHT[bf.dat$time==0 & bf.dat$status==0][!is.na(bf.dat$WEIGHT[bf.dat$time==6 & bf.dat$status==0])],
      bf.dat$WEIGHT[bf.dat$time==6 & bf.dat$status==0][!is.na(bf.dat$WEIGHT[bf.dat$time==6 & bf.dat$status==0])]),col=4,lwd=2)
points(bf.dat$WEIGHT[bf.dat$time==0 & bf.dat$status==1],bf.dat$WEIGHT[bf.dat$time==6 & bf.dat$status==1],col=3,pch=2)
lines(lowess(bf.dat$WEIGHT[bf.dat$time==0 & bf.dat$status==1][!is.na(bf.dat$WEIGHT[bf.dat$time==6 & bf.dat$status==1])],
      bf.dat$WEIGHT[bf.dat$time==6 & bf.dat$status==1][!is.na(bf.dat$WEIGHT[bf.dat$time==6 & bf.dat$status==1])]),col=3,lwd=2)
legend(4.25,7,c("Control","Intervention"),col=c(3,4),pch=c(2,1))
dev.off()


### time series
mean.wt <- c(mean(bf.dat$WEIGHT[bf.dat$time==0],na.rm=T),mean(bf.dat$WEIGHT[bf.dat$time==1],na.rm=T),
   mean(bf.dat$WEIGHT[bf.dat$time==2],na.rm=T),mean(bf.dat$WEIGHT[bf.dat$time==3],na.rm=T),
   mean(bf.dat$WEIGHT[bf.dat$time==6],na.rm=T),mean(bf.dat$WEIGHT[bf.dat$time==9],na.rm=T),
   mean(bf.dat$WEIGHT[bf.dat$time==12],na.rm=T))
age <- c(0,1,2,3,6,9,12)
#postscript("bfTime1.eps",horiz=F)
plot(age,mean.wt,type="l",lwd=2,ylab="Average weight",xlab="Age (months)")
dev.off()

mean.wt0 <- c(mean(bf.dat$WEIGHT[bf.dat$time==0 & bf.dat$status==0],na.rm=T),mean(bf.dat$WEIGHT[bf.dat$time==1 & bf.dat$status==0],na.rm=T),
   mean(bf.dat$WEIGHT[bf.dat$time==2 & bf.dat$status==0],na.rm=T),mean(bf.dat$WEIGHT[bf.dat$time==3 & bf.dat$status==0],na.rm=T),
   mean(bf.dat$WEIGHT[bf.dat$time==6 & bf.dat$status==0],na.rm=T),mean(bf.dat$WEIGHT[bf.dat$time==9 & bf.dat$status==0],na.rm=T),
   mean(bf.dat$WEIGHT[bf.dat$time==12 & bf.dat$status==0],na.rm=T))
mean.wt1 <- c(mean(bf.dat$WEIGHT[bf.dat$time==0 & bf.dat$status==1],na.rm=T),mean(bf.dat$WEIGHT[bf.dat$time==1 & bf.dat$status==1],na.rm=T),
   mean(bf.dat$WEIGHT[bf.dat$time==2 & bf.dat$status==1],na.rm=T),mean(bf.dat$WEIGHT[bf.dat$time==3 & bf.dat$status==1],na.rm=T),
   mean(bf.dat$WEIGHT[bf.dat$time==6 & bf.dat$status==1],na.rm=T),mean(bf.dat$WEIGHT[bf.dat$time==9 & bf.dat$status==1],na.rm=T),
   mean(bf.dat$WEIGHT[bf.dat$time==12 & bf.dat$status==1],na.rm=T))
#postscript("bfTime2.eps",horiz=F)
plot(age,mean.wt,type="n",ylab="Average weight",xlab="Age (months)")
lines(age,mean.wt0,lwd=2,col=3)
lines(age,mean.wt1,lwd=2,col=4)
dev.off()




#####
postscript("densities.eps",horiz=F)
par(mfrow=c(2,2))
x<-rgamma(500,.5,5)
x.dens <- density(x)
plot(x.dens$x,x.dens$y,type="l",lwd=3,xlab="x",ylab="Proportion")
abline(v=mean(x),col=2,lwd=3)
abline(v=median(x),col=4,lwd=3,lty=3)
abline(v=x.dens$x[x.dens$y==max(x.dens$y)],col=3,lwd=3,lty=2)
x<- -rexp(500,3)
x.dens <- density(x)
plot(x.dens$x,x.dens$y,type="l",lwd=3,xlab="x",ylab="Proportion")
abline(v=mean(x),col=2,lwd=3)
abline(v=median(x),col=4,lwd=3,lty=3)
abline(v=x.dens$x[x.dens$y==max(x.dens$y)],col=3,lwd=3,lty=2)
x<-rnorm(500)
x.dens <- density(x)
plot(x.dens$x,x.dens$y,type="l",lwd=3,xlab="x",ylab="Proportion")
abline(v=mean(x),col=2,lwd=3)
abline(v=median(x),col=4,lwd=3,lty=3)
abline(v=x.dens$x[x.dens$y==max(x.dens$y)],col=3,lwd=3,lty=2)
x<-c(rnorm(250,0,1),rnorm(250,2.5,.65))
x.dens <- density(x)
plot(x.dens$x,x.dens$y,type="l",lwd=3,xlab="x",ylab="Proportion")
dev.off()

postscript("transform.eps",horiz=F)
par(mfrow=c(2,2))
x<-rnorm(10000,1,.5)
x.dens <- density(exp(x))
plot(x.dens$x,x.dens$y,type="l",lwd=3,xlab="x",ylab="Proportion")
abline(v=mean(exp(x)),col=2,lwd=3)
abline(v=median(exp(x)),col=4,lwd=3,lty=3)
x.dens <- density(x)
plot(x.dens$x,x.dens$y,type="l",lwd=3,xlab="Log x",ylab="Proportion")
abline(v=mean(x),col=2,lwd=3)
abline(v=median(x),col=4,lwd=3,lty=3)
#dev.off()
#postscript("transform.eps",horiz=F)
#par(mfrow=c(1,2))
x<-rgamma(10000,10,4)
x.dens <- density(x)
plot(x.dens$x,x.dens$y,type="l",lwd=3,xlab="x",ylab="Proportion")
abline(v=mean(x),col=2,lwd=3)
abline(v=median(x),col=4,lwd=3,lty=3)
x.dens <- density(log(x))
plot(x.dens$x,x.dens$y,type="l",lwd=3,xlab="Log x",ylab="Proportion")
abline(v=mean(log(x)),col=2,lwd=3)
abline(v=median(log(x)),col=4,lwd=3,lty=3)
dev.off()



##### Variance example:
x1 <-c(0,0,0,1,1,1,1,4,4)
x2 <-c(0,0,0,2,2,2,2,8,8)
postscript("VarianceEg2.eps",horiz=F)
par(mfrow=c(1,2))
hist(x1,breaks=seq(0,8.5,.5),xlab="Divisor of n",main="")
abline(v=8/3,col=4,lwd=3)
abline(v=mean(x1),col=2,lwd=3,lty=2)
hist(x2,breaks=seq(0,8.5,.5),xlab="Divisor of n-1",main="")
abline(v=8/3,col=4,lwd=3)
abline(v=mean(x2),col=2,lwd=3,lty=2)
dev.off()


##### Normals

postscript("TwoNormals-equalProb.eps",horiz=F)
par(mfrow=c(1,2))
x2 <- rnorm(50000)
dens.x2 <- density(x2)
plot(dens.x2,xlab="",main="",lwd=3)
ploy.xvals <- c(dens.x2$x[length(dens.x2$x)],dens.x2$x[length(dens.x2$x):(length(dens.x2$x)-sum(dens.x2$x>2.31)+1)],dens.x2$x[(length(dens.x2$x)-sum(dens.x2$x>2.31)+1)],dens.x2$x[(length(dens.x2$x)-sum(dens.x2$x>2.31)+1)])
ploy.yvals <- c(0,dens.x2$y[length(dens.x2$x):(length(dens.x2$x)-sum(dens.x2$x>2.31)+1)],dens.x2$y[(length(dens.x2$x)-sum(dens.x2$x>2.31)+1)],0)
polygon(ploy.xvals,ploy.yvals,col=4)
dens.x2 <- density(100+13*x2)
plot(dens.x2,xlab="",main="",lwd=3)
ploy.xvals <- c(dens.x2$x[length(dens.x2$x)],dens.x2$x[length(dens.x2$x):(length(dens.x2$x)-sum(dens.x2$x>130)+1)],dens.x2$x[(length(dens.x2$x)-sum(dens.x2$x>130)+1)],dens.x2$x[(length(dens.x2$x)-sum(dens.x2$x>130)+1)])
ploy.yvals <- c(0,dens.x2$y[length(dens.x2$x):(length(dens.x2$x)-sum(dens.x2$x>130)+1)],dens.x2$y[(length(dens.x2$x)-sum(dens.x2$x>130)+1)],0)
polygon(ploy.xvals,ploy.yvals,col=4)
dev.off()

1-pnorm(2.31)