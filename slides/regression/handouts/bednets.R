df <- data.frame(month = rep(c(paste0(c("june","july","august","september","october",
                                    "november","december"),"2014"),
                           paste0(c("may"),"2015"),
                           paste0(c("june","july","august","september","october",
                                    "november","december"),"2015")
                           ), 
                           each = 2),
                 exposure = rep(c(0,1), 15),
                 years = c(79,0,123,0,103,23,79,39,81,63,78,81,80,84,
                           89,82,
                           59,77,54,99,29,123,0,139,0,166,0,185,0,189),
                 cases = c(33,0,454,0,244,43,177,66,212,155,193,170,111,92,
                           15,14,42,50,146,223,64,266,0,271,0,337,0,304,0,56)
                 )


df$years <- ifelse(df$years==0, 0.00001, df$years)

sum(df$years)
sum(df$cases)

library(mosaic)
df_stats(cases ~ exposure, data = df, sum)
df_stats(years ~ exposure, data = df, sum)


fit <- glm(cases ~ exposure + offset(log(years)), 
           data = df, family = poisson(link = log))
summary(fit)
exp(confint(fit))
exp(coef(fit))

exp(coef(fit)[1])
exp(sum(coef(fit)))

fit <- glm(cases ~ -1 + years + years:exposure, 
           data = df, family = poisson(link = identity))
summary(fit)
