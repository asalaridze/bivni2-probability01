library(ggplot2)
library(manipulate)

g1_proc  <-  function (lambda, red_flag) {
  ggplot(data.frame(x=c(0,1.4)),aes(x)) + stat_function(fun=dexp,args = list(rate=lambda),geom="line",color=ifelse(red_flag,"red","green")) 
}

manipulate(g1_proc(lambda,red_flag), lambda=slider(15,100), 
           red_flag=checkbox(initial = T, label="red color"))
