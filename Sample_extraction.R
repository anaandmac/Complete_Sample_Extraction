############################
#Function
############################
function.sample=function(conf.level,error,prop,data){
  (if (missing(conf.level)) conf.level=0.95)
  (if (missing(error)) error=0.05)
  (if (missing(prop)) prop=0.5)
  n=dim(data)[1]
  sig.level=(1-conf.level)/2
  #Cochran (1977) categorical data
  n0=((1-prop)*prop*qnorm(sig.level)^2)/(error^2)
  size.sample=n0/(1+n0/n)+1
  print(paste("The sample size is",as.integer(size.sample),"(Sign. Level -",conf.level,"Error -",error,")"))
  #Sample
  sample.final=data[sample(seq(1,n),replace=FALSE,size=size.sample),]
  print("Sample recorded to defined directory!")
  write.csv(sample.final,file=paste("Sample_",file_name,".csv",sep=""))
}
############################

#Recording Location
setwd("C:/Users/ana.andrade/Desktop/Analises/Amostras eletronicos")

function.sample(data=data)

