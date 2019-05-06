library(httr)

counter_onlR <- 1

con <- content(GET("http://localhost:8086/query", 
                   query=list('db'='db6', 
                              'q' = paste('select * from onlT order by time asc limit 1',sep=''))))
a<-unlist(strsplit(con$results[[1]]$series[[1]]$values[[1]][[1]], "[.]"))
a<-unlist(strsplit(a[2], "Z"))
counter_onlT = as.numeric(a)
while(TRUE){
  
  # Using onlT Measurement to visualize the data
  current_time <- floor(as.numeric(Sys.time()))
  con <- content(GET("http://localhost:8086/query", 
      query=list('db'='db6', 
                 'q' = paste('select * from onlT where time=',counter_onlT,sep=''))))
  
  label <- con$results[[1]]$series[[1]]$values[[1]][[2]]
  load <- con$results[[1]]$series[[1]]$values[[1]][[3]]
  rate <- con$results[[1]]$series[[1]]$values[[1]][[4]]
  sr <- con$results[[1]]$series[[1]]$values[[1]][[5]]
  value <- con$results[[1]]$series[[1]]$values[[1]][[6]]
  #print(paste('Writing onlT Datapoint:',counter,'at time:',current_time))
  POST("http://localhost:8086/write?db=db6&precision=s",
       content_type("application/x-www-form-urlencoded"),
       body = paste('onlTVisual,label=',label,',sr=',sr,',load=',load,
                    ',rate=',rate,' value=',label, ' ',current_time, sep=''))
  
  # Using onlR Measurement to visualize the data
  
  con <- content(GET("http://localhost:8086/query", 
                     query=list('db'='db6', 
                                'q' = paste('select * from onlR where time=',counter_onlR,sep=''))))
  label <- con$results[[1]]$series[[1]]$values[[1]][[2]]
  load <- con$results[[1]]$series[[1]]$values[[1]][[3]]
  rate <- con$results[[1]]$series[[1]]$values[[1]][[4]]
  sr <- con$results[[1]]$series[[1]]$values[[1]][[5]]
  value <- con$results[[1]]$series[[1]]$values[[1]][[6]]
  #print(paste('Writing onlR Datapoint:',counter,'at time:',current_time))
  POST("http://localhost:8086/write?db=db6&precision=s",
       content_type("application/x-www-form-urlencoded"),
       body = paste('onlRVisual,label=',label,',sr=',sr,',load=',load,
                    ',rate=',rate,' value=',label, ' ',current_time, sep=''))
  
  counter_onlT <- counter_onlT + 256
  counter_onlR <- counter_onlR + 1
  Sys.sleep(1)
  }