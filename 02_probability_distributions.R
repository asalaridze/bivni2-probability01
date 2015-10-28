require(ggplot2)
# равномерное распределение (unif)
set.seed(1234)
rnd_unif <- data.frame( x=runif(20000,min = 0,max=1) )
ggplot(data=rnd_unif,aes(x=x,fill=I("red")))+geom_histogram(aes(y=..density..,fill="red")) +geom_density()

fun_unif$x <- data.frame(x=seq(-.5,1.5,length.out = 2000))

fun_unif$val <- dunif(fun_unif$x,min=0,max=1)

ggplot(data=fun_unif,aes(x=x,fill=I("red")))+geom_histogram(aes(y=..density..,fill="red")) +geom_density()
# нормальное  распределение (norm)

# биноминальное распределение (binom)

# распределение Пуассона (pois) The Poisson Distribution