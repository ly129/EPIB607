pacman::p_load(Stat2Data)
# titanic <- titanic_all
age_counts <- hist(titanic$age, breaks = (0:15) * 5 + .01, plot = FALSE)$counts
# data("Titanic")
titanic <- Titanic
age_counts <- hist(titanic$age, breaks = (0:15) * 5 + .01, plot = FALSE)$counts
age_hist <- data.frame(`age range` = c("0--5", "6--10", "11--15", "16--20", "21--25", "26--30", "31--35", "36--40", "41--45", "46--50", "51--55", "56--60", "61--65", "66--70", "71--75"),
                       count = age_counts,
                       check.names = FALSE)
titanic
pacman::p_load_gh('clauswilke/dviz.supp')
as.data.frame(rbind(c("JH", "James Hanley notes"),
                    c("AAO", "Against all odds lecture series"),
                    c("B&M", "The practice of statistics in the life sciences by Baldi and Moore")))
knitr::kable(as.data.frame(rbind(c("JH", "James Hanley notes"),
                                 c("AAO", "Against all odds lecture series"),
                                 c("B&M", "The practice of statistics in the life sciences by Baldi and Moore"))),
             col.names = c("Abbreviation","Description"),
             booktabs = TRUE)
knitr::kable(as.data.frame(rbind(c("JH", "James Hanley notes"),
                                 c("AAO", "Against all odds video series"),
                                 c("B&M", "The practice of statistics in the life sciences by Baldi and Moore, 3rd edition"),
                                 c("Freedman","Statistics by Freedman, Pisani, Purves, Adhikari"))),
             col.names = c("Abbreviation","Description"),
             booktabs = TRUE)
pacman::p_load(mosaic)
xpnorm(2, mean=0, sd=1)
trellis.par.set(theme=col.mosaic())
xpnorm(2, mean=0, sd=1)
pacman::p_unload(ggplot2)
xpnorm(2, mean=0, sd=1)
pacman::p_load(mosaic)
xpnorm(2, mean=0, sd=1)
xpnorm(2, mean=0, sd=1, system = "lattic")
xpnorm(2, mean=0, sd=1, system = "lattice")
xpnorm(2, mean=0, sd=1, system = "base")
xpnorm(2, mean=1.2, sd=1, system = "base")
xpbinom(2,size = 4, prob = 0.5)
xpbinom(2,size = 4, prob = 0.5) + theme_classic()
xpbinom(2,size = 4, prob = 0.5)
plotDist( "norm", mean=m[1], sd=s[1], col="red", add=TRUE, packets=1)
plotDist( "norm", mean=m[2], sd=s[2], col="blue", under=TRUE, packets=2)
histogram( ~age|sex, data=HELPrct)
m <- mean( ~age|sex, data=HELPrct)
s <- sd(~age|sex, data=HELPrct)
plotDist( "norm", mean=m[1], sd=s[1], col="red", add=TRUE, packets=1)
plotDist( "norm", mean=m[2], sd=s[2], col="blue", under=TRUE, packets=2)
plotDist( "norm", mean=m[1], sd=s[1], col="red", add=TRUE, packets=1)
dev.off()
plotDist( "norm", mean=m[1], sd=s[1], col="red", add=TRUE, packets=1)
dev.off()
plotDist( "norm", mean=m[1], sd=s[1], col="red", add=TRUE, packets=1)
xpnorm(80, mean=100, sd=15)
xpnorm(c(80,120), mean=100, sd=15)
qdist("t", c(.025, .975) , df=5)
savehistory("~/git_repositories/epib607/mosaic.Rhistory")

plotDist("norm", col="blue", mean=0,sd = 1, xlim=c(-4,4))
plotDist("norm", col="red", mean=0,sd = 2,add=TRUE,  xlim=c(-4,4))
plotDist("t", col="green", n = 10, df = 50, add=TRUE,  xlim=c(-4,4))

# 100 Bernoulli trials -- no need for replace=TRUE
resample(0:1, 100)
tally(resample(0:1, 100))
Small <- sample(KidsFeet, 10)
resample(Small)
tally(~ sex, data=resample(Small))
tally(~ sex, data=resample(Small))
