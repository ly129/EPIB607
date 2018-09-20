vbls<-c("id","mos","age","cd4","cd8","vload","aidscase","vtime","sctime","atime","dtime","ideath")
MACS<-read.table("data/MACS.txt",col.names=vbls)
names(MACS)
summary(MACS)
length(unique(MACS$id))

newid <- c(1,diff(MACS$id))
newid[newid!=0] <- 1
baseVL <- MACS$vload[newid==1]
baseVL[!is.na(baseVL)]
par(mfrow=c(1,2))
hist(baseVL,main="",col=4,xlab="Baseline VL")
hist(log(baseVL),main="",col=4,xlab="Baseline log VL")
