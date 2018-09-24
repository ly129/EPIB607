library(pwr)

pwr.t.test(n=9,d=5/12.7,type="one.sample",alt="two.sided",sig=0.05)


Cr<-qt(0.975,8)

delta<-5/(12.7/sqrt(9))

1-(pt(Cr-delta,8)-pt(-Cr-delta,8))

nval<-9
nreps<-1000000

Tstats<-rt(nreps,df=nval-1,ncp=5/(12.7/sqrt(nval)))

nout<-sum(Tstats < -Cr | Tstats > Cr)
nout/nreps

