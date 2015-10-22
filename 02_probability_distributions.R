# равномерное распределение (unif)
rnd_unif  <- data.frame(x=runif(200000))

punif(40000,min=30000,max=60000)
qunif(1/3,min=30000,max=60000)
qunif(1/2,min=30000,max=60000)
require(ggplot2)
ggplot(data=rnd_unif,aes(x=x,y=..density..))+
  geom_histogram(fill="red")+geom_density()
# нормальное  распределение (norm)
rnd_norm<- data.frame(x=rnorm(200000))
ggplot(data=rnd_norm,aes(x=x,y=..density..))+
  geom_histogram(fill="red")+geom_density()
fun_norm  <-data.frame(x = seq(-5,5,length.out = 20000))
fun_norm$val  <-  dnorm(fun_norm$x)
ggplot(data=rnd_norm,aes(x=x,y=..density..))+
  geom_histogram(fill="red")+
#  geom_density()+
  geom_line(data=fun_norm,aes(col="green",x=x,y=val))

rnd_norm_10_2<- data.frame(x=rnorm(200000,mean = 10,sd=2))
ggplot(data=rnd_norm_10_2,aes(x=x,y=..density..))+
  geom_histogram(fill="red")+geom_density()

summary(rnd_norm_10_2)
mean(rnd_norm_10_2$x)
median(rnd_norm_10_2$x)
sd(rnd_norm_10_2$x)
var(rnd_norm_10_2$x)


# биноминальное распределение (binom)
rnd_binom_20<- data.frame(x=rbinom(200000,size=20,prob=0.5))
ggplot(data=rnd_binom_20,aes(x=x,y=..density..))+
  geom_histogram(fill="red")+geom_density()



# распределение Пуассона (pois) The Poisson Distribution


