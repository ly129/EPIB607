library(pwr)
pwr.norm.test(d = 10/15, n = 9, sig.level = 0.05, alternative = c("two.sided"))
pwr.norm.test(d = 15/15, n = 9, sig.level = 0.05, alternative = c("two.sided"))
pwr.norm.test(d = 5/15, n = 9, sig.level = 0.05, alternative = c("two.sided"))
pwr.norm.test(d = 10/15, n = 25, sig.level = 0.05, alternative = c("two.sided"))
pwr.norm.test(d = 10/15, n = 9, sig.level = 0.01, alternative = c("two.sided"))


pwr.norm.test(d = 10/15, sig.level = 0.05, power = 0.80, alternative = c("two.sided"))
pwr.norm.test(d = 15/15, sig.level = 0.05, power = 0.80, alternative = c("two.sided"))
pwr.norm.test(d = 5/15, sig.level = 0.05, power = 0.80, alternative = c("two.sided"))
pwr.norm.test(d = 10/15, sig.level = 0.05, power = 0.80, alternative = c("two.sided"))
pwr.norm.test(d = 10/15, sig.level = 0.01, power = 0.80, alternative = c("two.sided"))

pwr.t.test(n = 9, d = 5/12.7, sig.level = 0.05, 
    type = c("one.sample"), alternative = c("two.sided"))

t.star <- qt(.975,8)
t.star
cv <- t.star*12.7/3+100
cv 
(t.star*12.7/3+100-105)/(12.7/3)
pnorm((t.star*12.7/3+100-105)/(12.7/3))
1-pnorm((t.star*12.7/3+100-105)/(12.7/3))
pnorm((-t.star*12.7/3+100-105)/(12.7/3))
1-pnorm((t.star*12.7/3+100-105)/(12.7/3))+pnorm((-t.star*12.7/3+100-105)/(12.7/3))


pwr.t.test(n = 9, d = 5/12.7, sig.level = 0.05, 
    type = c("one.sample"), alternative = c("two.sided"))
pwr.t.test(d = 5/12.7, sig.level = 0.05, power = 0.8, 
    type = c("one.sample"), alternative = c("two.sided"))

t.star <- 1.96
t.star
t.star*15/3+100
(t.star*15/3+100-105)/(15/3)
pnorm((t.star*15/3+100-105)/(15/3))
1-pnorm((t.star*15/3+100-105)/(15/3))
pnorm((-t.star*15/3+100-105)/(15/3))

