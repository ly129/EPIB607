rm(list=ls())

#this code works for greater alternative 
alternative <- "greater"

mu.m=-0.540 # mu under the null
mu.1pct = 0.99* mu.m # under the alternative
sigma=0.008 # sd
n=20 # sample size
SEM = sigma/sqrt(n)

if(alternative == "greater"){
  crit.value = mu.m + qnorm(0.95)*SEM
} else {
  crit.value = mu.m - qnorm(0.95)*SEM
}

Green="blue"
ht=1.6*dnorm(0,0,SEM)

dev.off()
par(mfrow=c(1,1),mar = c(5,0.001,0.001,0.001) )
plot(c(mu.m-4.25*SEM,mu.1pct+3*SEM),c(-1.5*ht,16*ht), 
     col="white",xlab="Freezing point (degrees C)")
segments(mu.1pct,0,mu.1pct,
         12*ht,lwd=0.5,col="grey60")
# text(-0.51,3*ht,"Probability (pct.)
#      of exceeding cutoff",adj=c(1,0),col="red")
# 
# text(-0.555,16*ht,
#      expression(paste(
#        sigma,
#        " = 0.0080;  SEM = ",
#        sigma/sqrt(n))) ,
#      adj=c(0,0))
# 
# text(-0.555,15*ht,
#      "cutoff = -0.54 + 1.645*SEM (alpha=0.05, 1 sided alternative)",
#      adj=c(0,0))
# text(-0.555,16*ht,
#      expression(paste(
#        sigma,
#        " = 0.0080;  SEM = ",
#        sigma/sqrt(n))) ,
#      adj=c(0,0))

# n=5
# sem = sigma/sqrt(n)
# 
# n80 = round(( ( 1.645+0.84)^2 ) * (sigma/0.0054)^2,1)

I=0    
# for ( m in c(1:2,n80/5,3,4) ){
  # m=2.72
  # if(m==1) text(-0.52,-ht/2,"Added Water",
  #               cex=0.75, adj=c(0,0.5))
  m = n
  SEM = sem/sqrt(m)
  
  text(-0.55,(I+1.0)*ht,
       paste("n =",toString(n*m)) ,
       adj=c(1,0))
  
  
  
  crit.value = mu.m + 1.646 * SEM
  
  rect(mu.m-4*sem,(I-0.8)*ht, mu.1pct+3*sem,(I+2.2)*ht)
  # null
  green= seq(mu.m-3*SEM,crit.value,length.out=50)
  d = c(dnorm(green,mu.m,SEM),0)
  polygon(c(green,crit.value),d + I*ht,col=Green,border=NA)
  
  text(-0.548,(I+1.0)*ht,
       paste("SEM = ",
             toString(round(SEM,4))), 
       cex=0.65,adj=c(0,0))
  
  red= seq(crit.value,mu.m+3*SEM,length.out=50)
  d = c(dnorm(red,mu.m,SEM),0)
  polygon(c(red,crit.value),d + I*ht,col="red",border=NA)
  points(mu.m,I*ht,cex=0.3,pch=19)
  
  #alt
  green= seq(mu.1pct-3*SEM,
             crit.value,length.out=50)
  d = c(dnorm(green,mu.1pct,SEM),0)
  polygon(c(green,crit.value),d + (I+1)*ht,col=Green,border=NA)
  points(mu.1pct,(I+1)*ht,cex=0.3,pch=19)
  
  red= seq(crit.value,mu.1pct+3*SEM,length.out=50)
  d = c(dnorm(red,mu.1pct,SEM),0)
  polygon(c(red,crit.value),d + (I+1)*ht,col="red",border=NA)
  
  segments(crit.value,I*ht ,
           crit.value,(I+1)*ht,lwd=0.5,col="red")
  
  arrows(mu.m,(I-0.25)*ht,
         crit.value,(I-0.25)*ht,length=0.05,
         code=3,angle=20,col=Green,lwd=1.5)
  arrows(crit.value,(I+1-0.25)*ht,
         mu.1pct,(I+1-0.25)*ht,length=0.05,
         code=3,angle=15,col="red",lwd=1.5)
  
  x = mu.1pct+1*SEM
  y = (I+1)*ht+0.8*max(d)
  
  if(m!=round(m))rect(
    x - 0.0011,y-0.10*ht,
    x + 0.0011,y+0.60*ht,
    col="beige",border="purple",
    lwd=2)
  
  text(x, y,
       paste(toString( round(100*pnorm( 
         crit.value,mu.1pct, 
         SEM,lower.tail=FALSE)) ),"%",sep=""),
       adj=c(0.5,0),col="red")
  
  if(m!=round(m)){
    text(-0.5305,(I+1.55)*ht,"qnorm(0.8,
         lower.tail=FALSE)
         -0.84",		cex=0.65,family="mono",adj=c(0,0.5),col="red")
    x = (crit.value+mu.1pct)/2
    lines(x+c(0,0,0.005),
          (I+1-0.25+c(0,-.3,-.3))*ht,col="red")
    text(x+0.005,
         (I+1-0.25-0.3)*ht,
         "0.84 * SEM",col="red",
         adj=c(-0.1,0.5),cex=0.65)
    
    text(-0.553,(I-0.4)*ht,"qnorm(0.05,
         lower.tail=FALSE)
         1.96",		cex=0.65,family="mono",adj=c(0,0),col=Green)
    
    x = (crit.value+mu.m)/2
    lines(x+c(0,0,-0.005),
          (I-0.25+c(0,-.15,-.15))*ht,col=Green)
    text(x-0.005,
         (I-0.25-0.15)*ht,
         "1.645 * SEM",col=Green,
         adj=c(1.1,0),cex=0.65)
    
    sum <- "(1.645 + 0.84)"
    
    txt = substitute(
      paste("n = ",  
            s^2,
            phantom(0),
            scriptstyle(x), 
            phantom(0), 
            (sigma/Delta)^2),
      list(s = sum))
    
    rect(-0.554,(I+1.55)*ht,
         -0.5445,(I+2.17)*ht,
         col="beige",border="purple",
         lwd=4)
    
    
    
    text(-0.553,(I+1.6)*ht,txt, 
         adj=c(0,0), cex=0.75)
    
    arrows(mu.m,   (I-0.6)*ht,
           mu.1pct,(I-0.6)*ht,length=0.05,
           code=3,angle=20,lwd=1.5)
    text(mu.1pct,(I-0.6)*ht,
         expression(paste(
           Delta, " = 1.645*SEM + 0.84*SEM")),
         adj=c(-0.1,0.5), cex=0.75
    )
    
    
  } # special
  
  I = I+3