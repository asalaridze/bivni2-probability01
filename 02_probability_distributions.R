require(ggplot2)
# равномерное распределение (unif)
set.seed(1234)
punif(40000,min=30000,max=60000)
qunif(1/3,min=30000,max=60000)
qunif(1/2,min=30000,max=60000)
rnd_unif  <- data.frame(x=runif(20000))
require(ggplot2)
ggplot(data=rnd_unif,aes(x=x,y=..density..))+
  geom_histogram(fill="red")+geom_density()
# график теоретической плотности равномерного распределения, наложеннный на
# гистограмму
fun_unif <- data.frame(x=seq(-.5,1.5,length.out = 2000))

fun_unif$val <- dunif(fun_unif$x,min=0,max=1)
ggplot(data=rnd_unif,aes(x=x,y=..density..))+
  geom_histogram(fill="red")+
    geom_line(data=fun_unif,aes(x,val),size=2,col="blue")


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
# добабление графика функции средсвами ggplot2::stat_func()
rnd_norm_10_2<- data.frame(x=rnorm(200000,mean = 10,sd=2))
ggplot(data=rnd_norm_10_2,aes(x=x))+
  geom_histogram(fill="red",aes(y=..density..))+
  stat_function(data=rnd_norm_10_2,fun=dnorm, col="blue",size=2,n=500,
                args = list(mean=mean(rnd_norm_10_2$x),sd=sd(rnd_norm_10_2$x)))

summary(rnd_norm_10_2)
mean(rnd_norm_10_2$x)
median(rnd_norm_10_2$x)
sd(rnd_norm_10_2$x)
var(rnd_norm_10_2$x)


# биноминальное распределение (binom)
rnd_binom_20<- data.frame(x=rbinom(200000,size=20,prob=0.5))
ggplot(data=rnd_binom_20,aes(x=x,y=..density..))+
  geom_histogram(fill="red",binwidth=0.2)+geom_density()



# распределение Пуассона (pois) The Poisson Distribution

# график плотности (density)
ggplot(data.frame(x=c(0,50)),aes(x)) + stat_function(fun=dpois,args = list(lambda=20),geom="bar") 

# экспонециальное распределение

ggplot(data.frame(x=c(0,1.4)),aes(x)) + stat_function(fun=dexp,args = list(rate=20),geom="line") 

nosim <- 10000
lambda <- 20
rnd_exp_samples <- rexp(n = nosim,rate = lambda)
rnd_pois_samples <- rpois(n = nosim,lambda  = lambda)

mean(rnd_exp_samples)
sd(rnd_exp_samples)
mean(rnd_pois_samples)
sd(rnd_pois_samples)
mean(rnd_exp_samples) * mean(rnd_pois_samples)
