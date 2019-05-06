library(httr)
library(jsonlite)
library(R.matlab)

url <- 'http://localhost:8086/'
blocksize = 1024
timestamp = 1

#percentage of offline data
percentage_offline = 0.5

label_baseline= 1
label_OuterRaceFault= 2
label_InnerRaceFault= 3

baseline_1_filename <- '/home/yyq/R/baseline_1.mat'
baseline_2_filename <- '/home/yyq/R/baseline_2.mat'
baseline_3_filename <- '/home/yyq/R/baseline_3.mat'

OuterRaceFault_1_filename = '/home/yyq/R/OuterRaceFault_1.mat'
OuterRaceFault_2_filename = '/home/yyq/R/OuterRaceFault_2.mat'
OuterRaceFault_3_filename = '/home/yyq/R/OuterRaceFault_3.mat'

InnerRaceFault_vload_1_filename = '/home/yyq/R/InnerRaceFault_vload_1.mat'
InnerRaceFault_vload_2_filename = '/home/yyq/R/InnerRaceFault_vload_2.mat'
InnerRaceFault_vload_3_filename = '/home/yyq/R/InnerRaceFault_vload_3.mat'
InnerRaceFault_vload_4_filename = '/home/yyq/R/InnerRaceFault_vload_4.mat'
InnerRaceFault_vload_5_filename = '/home/yyq/R/InnerRaceFault_vload_5.mat'
InnerRaceFault_vload_6_filename = '/home/yyq/R/InnerRaceFault_vload_6.mat'
InnerRaceFault_vload_7_filename = '/home/yyq/R/InnerRaceFault_vload_7.mat'

OuterRaceFault_vload_1_filename = '/home/yyq/R/OuterRaceFault_vload_1.mat'
OuterRaceFault_vload_2_filename = '/home/yyq/R/OuterRaceFault_vload_2.mat'
OuterRaceFault_vload_3_filename = '/home/yyq/R/OuterRaceFault_vload_3.mat'
OuterRaceFault_vload_4_filename = '/home/yyq/R/OuterRaceFault_vload_4.mat'
OuterRaceFault_vload_5_filename = '/home/yyq/R/OuterRaceFault_vload_5.mat'
OuterRaceFault_vload_6_filename = '/home/yyq/R/OuterRaceFault_vload_6.mat'
OuterRaceFault_vload_7_filename = '/home/yyq/R/OuterRaceFault_vload_7.mat'

#read data file
baseline_1_filedata <- readMat(baseline_1_filename)
baseline_2_filedata <- readMat(baseline_2_filename)
baseline_3_filedata <- readMat(baseline_3_filename)

OuterRaceFault_1_filedata <- readMat(OuterRaceFault_1_filename)
OuterRaceFault_2_filedata <- readMat(OuterRaceFault_2_filename)
OuterRaceFault_3_filedata <- readMat(OuterRaceFault_3_filename)

InnerRaceFault_vload_1_filedata <- readMat(InnerRaceFault_vload_1_filename)
InnerRaceFault_vload_2_filedata <- readMat(InnerRaceFault_vload_2_filename)
InnerRaceFault_vload_3_filedata <- readMat(InnerRaceFault_vload_3_filename)
InnerRaceFault_vload_4_filedata <- readMat(InnerRaceFault_vload_4_filename)
InnerRaceFault_vload_5_filedata <- readMat(InnerRaceFault_vload_5_filename)
InnerRaceFault_vload_6_filedata <- readMat(InnerRaceFault_vload_6_filename)
InnerRaceFault_vload_7_filedata <- readMat(InnerRaceFault_vload_7_filename)

OuterRaceFault_vload_1_filedata <- readMat(OuterRaceFault_vload_1_filename)
OuterRaceFault_vload_2_filedata <- readMat(OuterRaceFault_vload_2_filename)
OuterRaceFault_vload_3_filedata <- readMat(OuterRaceFault_vload_3_filename)
OuterRaceFault_vload_4_filedata <- readMat(OuterRaceFault_vload_4_filename)
OuterRaceFault_vload_5_filedata <- readMat(OuterRaceFault_vload_5_filename)
OuterRaceFault_vload_6_filedata <- readMat(OuterRaceFault_vload_6_filename)
OuterRaceFault_vload_7_filedata <- readMat(OuterRaceFault_vload_7_filename)

#get data file length
baseline_1_length = length(baseline_1_filedata[[1]][[2]])
baseline_2_length = length(baseline_2_filedata[[1]][[2]])
baseline_3_length = length(baseline_3_filedata[[1]][[2]])

OuterRaceFault_1_length <- length(OuterRaceFault_1_filedata[[1]][[3]])
OuterRaceFault_2_length <- length(OuterRaceFault_2_filedata[[1]][[3]])
OuterRaceFault_3_length <- length(OuterRaceFault_3_filedata[[1]][[3]])

InnerRaceFault_vload_1_length <- length(InnerRaceFault_vload_1_filedata[[1]][[3]])
InnerRaceFault_vload_2_length <- length(InnerRaceFault_vload_2_filedata[[1]][[3]])
InnerRaceFault_vload_3_length <- length(InnerRaceFault_vload_3_filedata[[1]][[3]])
InnerRaceFault_vload_4_length <- length(InnerRaceFault_vload_4_filedata[[1]][[3]])
InnerRaceFault_vload_5_length <- length(InnerRaceFault_vload_5_filedata[[1]][[3]])
InnerRaceFault_vload_6_length <- length(InnerRaceFault_vload_6_filedata[[1]][[3]])
InnerRaceFault_vload_7_length <- length(InnerRaceFault_vload_7_filedata[[1]][[3]])

OuterRaceFault_vload_1_length <- length(OuterRaceFault_vload_1_filedata[[1]][[3]])
OuterRaceFault_vload_2_length <- length(OuterRaceFault_vload_2_filedata[[1]][[3]])
OuterRaceFault_vload_3_length <- length(OuterRaceFault_vload_3_filedata[[1]][[3]])
OuterRaceFault_vload_4_length <- length(OuterRaceFault_vload_4_filedata[[1]][[3]])
OuterRaceFault_vload_5_length <- length(OuterRaceFault_vload_5_filedata[[1]][[3]])
OuterRaceFault_vload_6_length <- length(OuterRaceFault_vload_6_filedata[[1]][[3]])
OuterRaceFault_vload_7_length <- length(OuterRaceFault_vload_7_filedata[[1]][[3]])

#get leftover number
baseline_1_leftover = baseline_1_length%%blocksize
baseline_2_leftover = baseline_2_length%%blocksize
baseline_3_leftover = baseline_3_length%%blocksize

OuterRaceFault_1_leftover = OuterRaceFault_1_length%%blocksize
OuterRaceFault_2_leftover = OuterRaceFault_2_length%%blocksize
OuterRaceFault_3_leftover = OuterRaceFault_3_length%%blocksize

InnerRaceFault_vload_1_leftover = InnerRaceFault_vload_1_length%%blocksize
InnerRaceFault_vload_2_leftover = InnerRaceFault_vload_2_length%%blocksize
InnerRaceFault_vload_3_leftover = InnerRaceFault_vload_3_length%%blocksize
InnerRaceFault_vload_4_leftover = InnerRaceFault_vload_4_length%%blocksize
InnerRaceFault_vload_5_leftover = InnerRaceFault_vload_5_length%%blocksize
InnerRaceFault_vload_6_leftover = InnerRaceFault_vload_6_length%%blocksize
InnerRaceFault_vload_7_leftover = InnerRaceFault_vload_7_length%%blocksize

OuterRaceFault_vload_1_leftover = OuterRaceFault_vload_1_length%%blocksize
OuterRaceFault_vload_2_leftover = OuterRaceFault_vload_2_length%%blocksize
OuterRaceFault_vload_3_leftover = OuterRaceFault_vload_3_length%%blocksize
OuterRaceFault_vload_4_leftover = OuterRaceFault_vload_4_length%%blocksize
OuterRaceFault_vload_5_leftover = OuterRaceFault_vload_5_length%%blocksize
OuterRaceFault_vload_6_leftover = OuterRaceFault_vload_6_length%%blocksize
OuterRaceFault_vload_7_leftover = OuterRaceFault_vload_7_length%%blocksize

#get data file length without leftover
baseline_1_length = baseline_1_length-baseline_1_leftover
baseline_2_length = baseline_2_length-baseline_2_leftover
baseline_3_length = baseline_3_length-baseline_3_leftover

OuterRaceFault_1_length <- OuterRaceFault_1_length-OuterRaceFault_1_leftover
OuterRaceFault_2_length <- OuterRaceFault_2_length-OuterRaceFault_2_leftover
OuterRaceFault_3_length <- OuterRaceFault_3_length-OuterRaceFault_3_leftover

InnerRaceFault_vload_1_length <- InnerRaceFault_vload_1_length-InnerRaceFault_vload_1_leftover
InnerRaceFault_vload_2_length <- InnerRaceFault_vload_2_length-InnerRaceFault_vload_2_leftover
InnerRaceFault_vload_3_length <- InnerRaceFault_vload_3_length-InnerRaceFault_vload_3_leftover
InnerRaceFault_vload_4_length <- InnerRaceFault_vload_4_length-InnerRaceFault_vload_4_leftover
InnerRaceFault_vload_5_length <- InnerRaceFault_vload_5_length-InnerRaceFault_vload_5_leftover
InnerRaceFault_vload_6_length <- InnerRaceFault_vload_6_length-InnerRaceFault_vload_6_leftover
InnerRaceFault_vload_7_length <- InnerRaceFault_vload_7_length-InnerRaceFault_vload_7_leftover

OuterRaceFault_vload_1_length <- OuterRaceFault_vload_1_length-OuterRaceFault_vload_1_leftover
OuterRaceFault_vload_2_length <- OuterRaceFault_vload_2_length-OuterRaceFault_vload_2_leftover
OuterRaceFault_vload_3_length <- OuterRaceFault_vload_3_length-OuterRaceFault_vload_3_leftover
OuterRaceFault_vload_4_length <- OuterRaceFault_vload_4_length-OuterRaceFault_vload_4_leftover
OuterRaceFault_vload_5_length <- OuterRaceFault_vload_5_length-OuterRaceFault_vload_5_leftover
OuterRaceFault_vload_6_length <- OuterRaceFault_vload_6_length-OuterRaceFault_vload_6_leftover
OuterRaceFault_vload_7_length <- OuterRaceFault_vload_7_length-OuterRaceFault_vload_7_leftover



#Total length
total_length = 
  baseline_1_length+
  baseline_2_length+
  baseline_3_length+
  OuterRaceFault_1_length+
  OuterRaceFault_2_length+
  OuterRaceFault_3_length+
  InnerRaceFault_vload_1_length+
  InnerRaceFault_vload_2_length+
  InnerRaceFault_vload_3_length+
  InnerRaceFault_vload_4_length+
  InnerRaceFault_vload_5_length+
  InnerRaceFault_vload_6_length+
  InnerRaceFault_vload_7_length+
  OuterRaceFault_vload_1_length+
  OuterRaceFault_vload_2_length+
  OuterRaceFault_vload_3_length+
  OuterRaceFault_vload_4_length+
  OuterRaceFault_vload_5_length+
  OuterRaceFault_vload_6_length+
  OuterRaceFault_vload_7_length

total_length_left =total_length

#probability of files
baseline_1_probability = baseline_1_length/total_length
baseline_2_probability =baseline_2_length/total_length
baseline_3_probability =baseline_3_length/total_length
OuterRaceFault_1_probability =OuterRaceFault_1_length/total_length
OuterRaceFault_2_probability =OuterRaceFault_2_length/total_length
OuterRaceFault_3_probability =OuterRaceFault_3_length/total_length
InnerRaceFault_vload_1_probability =InnerRaceFault_vload_1_length/total_length
InnerRaceFault_vload_2_probability =InnerRaceFault_vload_2_length/total_length
InnerRaceFault_vload_3_probability =InnerRaceFault_vload_3_length/total_length
InnerRaceFault_vload_4_probability =InnerRaceFault_vload_4_length/total_length
InnerRaceFault_vload_5_probability =InnerRaceFault_vload_5_length/total_length
InnerRaceFault_vload_6_probability =InnerRaceFault_vload_6_length/total_length
InnerRaceFault_vload_7_probability =InnerRaceFault_vload_7_length/total_length
OuterRaceFault_vload_1_probability =OuterRaceFault_vload_1_length/total_length
OuterRaceFault_vload_2_probability =OuterRaceFault_vload_2_length/total_length
OuterRaceFault_vload_3_probability =OuterRaceFault_vload_3_length/total_length
OuterRaceFault_vload_4_probability =OuterRaceFault_vload_4_length/total_length
OuterRaceFault_vload_5_probability =OuterRaceFault_vload_5_length/total_length
OuterRaceFault_vload_6_probability =OuterRaceFault_vload_6_length/total_length
OuterRaceFault_vload_7_probability =OuterRaceFault_vload_7_length/total_length


#select a file with the probability which defined by its length
selectFile <-function() {
  sample(1:20,1, replace = FALSE,
         prob =c(
           baseline_1_probability,
           baseline_2_probability,
           baseline_3_probability,
           OuterRaceFault_1_probability,
           OuterRaceFault_2_probability,
           OuterRaceFault_3_probability,
           InnerRaceFault_vload_1_probability,
           InnerRaceFault_vload_2_probability,
           InnerRaceFault_vload_3_probability,
           InnerRaceFault_vload_4_probability,
           InnerRaceFault_vload_5_probability,
           InnerRaceFault_vload_6_probability,
           InnerRaceFault_vload_7_probability,
           OuterRaceFault_vload_1_probability,
           OuterRaceFault_vload_2_probability,
           OuterRaceFault_vload_3_probability,
           OuterRaceFault_vload_4_probability,
           OuterRaceFault_vload_5_probability,
           OuterRaceFault_vload_6_probability,
           OuterRaceFault_vload_7_probability
         )
  )
}


#SensorRate <- as.double(readline(prompt="Please enter SensorRate(Hz): "))
SensorRate = 1000;
SleepTime <-1/SensorRate
#print(1/SensorRate)

#print(blocksize)

#contunue read from last position and insert into database
InsertData_type1 = function(data, pt, label, blocksize, metric_name, timestamp, SleepTime)
{
  datalength=length(data[[1]][[2]])
  if(blocksize>datalength-pt+1){
    #leftover is less then blocksize
    return(0)
  }
  else {
    endpt=pt + blocksize-1
    InsertData <- ""
    
    for(i in pt:endpt)
    {
      addlData <- paste(metric_name, ',label=', label, ',sr=', data[[1]][[1]],
                          ',load=', data[[1]][[3]], ',rate=', data[[1]][[4]],
                          ' value=', data[[1]][[2]][[i]], ' ',timestamp, sep='')
      InsertData <- paste(InsertData, addlData, sep='\n')

      timestamp = timestamp + 1
    }
    response <- POST("http://localhost:8086/write?db=bearingfault", 
                     content_type("application/x-www-form-urlencoded"),
                     body = InsertData)
    return(blocksize)
  }
}





#different file data format
InsertData_type2 = function(data, pt, label, blocksize,metric_name,timestamp, SleepTime){
  datalength=length(data[[1]][[3]])
  if(blocksize>datalength-pt+1)
  {
    return(0)
  }
  else
  {
    endpt=pt + blocksize-1
    InsertData <- ""
    for(i in pt:endpt)
    {
      addlData <- paste(metric_name, ',label=', label, 
                        ',sr=', data[[1]][[4]],
                        ',load=', data[[1]][[2]], 
                        ',rate=', data[[1]][[1]],
                        ' value=', data[[1]][[3]][[i]], 
                        ' ',timestamp, sep='')
      InsertData <- paste(InsertData, addlData, sep='\n')
      timestamp = timestamp + 1
    }
    response <- POST("http://localhost:8086/write?db=bearingfault", 
                     content_type("application/x-www-form-urlencoded"),
                     body = InsertData)
    #number of data which has not been read
    #total_length_left=total_length_left-(endpt-pt +1)
    return(blocksize)
    
  }
}

#GenerateData(blocksize)
#generate data
#GenerateData = function(blocksize){
#file reading point to record current reading position in a file
baseline_1_pt = 1
baseline_2_pt = 1
baseline_3_pt = 1
OuterRaceFault_1_pt = 1
OuterRaceFault_2_pt = 1
OuterRaceFault_3_pt = 1

InnerRaceFault_vload_1_pt = 1
InnerRaceFault_vload_2_pt = 1 
InnerRaceFault_vload_3_pt = 1 
InnerRaceFault_vload_4_pt = 1 
InnerRaceFault_vload_5_pt = 1 
InnerRaceFault_vload_6_pt = 1
InnerRaceFault_vload_7_pt = 1 

OuterRaceFault_vload_1_pt = 1 
OuterRaceFault_vload_2_pt = 1 
OuterRaceFault_vload_3_pt = 1 
OuterRaceFault_vload_4_pt = 1 
OuterRaceFault_vload_5_pt = 1 
OuterRaceFault_vload_6_pt = 1
OuterRaceFault_vload_7_pt = 1




#print(paste('total_length_left:',total_length_left))
totalRead <- 0
while(total_length_left > 100){
  #l=0
  # pick a file number randomly  
  #RandNum=selectFile()
  
  if(total_length_left<=total_length*(1-percentage_offline))
    metric_name = 'onlT' 
  else
    metric_name = 'offlT' 
  
  start.time <- Sys.time()
  switch(selectFile(),
         {InsertLength =InsertData_type1(baseline_1_filedata, baseline_1_pt, label_baseline, blocksize,metric_name,timestamp, SleepTime)
         baseline_1_pt = baseline_1_pt + InsertLength},
         {InsertLength =InsertData_type1(baseline_2_filedata, baseline_2_pt, label_baseline, blocksize,metric_name,timestamp, SleepTime)
         baseline_2_pt = baseline_2_pt + InsertLength},
         {InsertLength =InsertData_type1(baseline_3_filedata, baseline_3_pt, label_baseline, blocksize,metric_name,timestamp, SleepTime)
         baseline_3_pt = baseline_3_pt + InsertLength},
         {InsertLength =InsertData_type2(OuterRaceFault_1_filedata, OuterRaceFault_1_pt, label_OuterRaceFault, blocksize,metric_name,timestamp, SleepTime)
         OuterRaceFault_1_pt=OuterRaceFault_1_pt+InsertLength},
         {InsertLength =InsertData_type2(OuterRaceFault_2_filedata, OuterRaceFault_2_pt, label_OuterRaceFault, blocksize,metric_name,timestamp, SleepTime)
         OuterRaceFault_2_pt=OuterRaceFault_2_pt+InsertLength},
         {InsertLength =InsertData_type2(OuterRaceFault_3_filedata, OuterRaceFault_3_pt, label_OuterRaceFault, blocksize,metric_name,timestamp, SleepTime)
         OuterRaceFault_3_pt=OuterRaceFault_3_pt+InsertLength},
         {InsertLength =InsertData_type2(InnerRaceFault_vload_1_filedata, InnerRaceFault_vload_1_pt,label_InnerRaceFault, blocksize,metric_name,timestamp, SleepTime)
         InnerRaceFault_vload_1_pt=InnerRaceFault_vload_1_pt+InsertLength},
         {InsertLength =InsertData_type2(InnerRaceFault_vload_2_filedata, InnerRaceFault_vload_2_pt,label_InnerRaceFault, blocksize,metric_name,timestamp, SleepTime)
         InnerRaceFault_vload_2_pt=InnerRaceFault_vload_2_pt+InsertLength},
         {InsertLength =InsertData_type2(InnerRaceFault_vload_3_filedata, InnerRaceFault_vload_3_pt,label_InnerRaceFault, blocksize,metric_name,timestamp, SleepTime)
         InnerRaceFault_vload_3_pt=InnerRaceFault_vload_3_pt+InsertLength},
         {InsertLength =InsertData_type2(InnerRaceFault_vload_4_filedata, InnerRaceFault_vload_4_pt,label_InnerRaceFault, blocksize,metric_name,timestamp, SleepTime)
         InnerRaceFault_vload_4_pt=InnerRaceFault_vload_4_pt+InsertLength},
         {InsertLength =InsertData_type2(InnerRaceFault_vload_5_filedata, InnerRaceFault_vload_5_pt,label_InnerRaceFault, blocksize,metric_name,timestamp, SleepTime)
         InnerRaceFault_vload_5_pt=InnerRaceFault_vload_5_pt+InsertLength},
         {InsertLength =InsertData_type2(InnerRaceFault_vload_6_filedata, InnerRaceFault_vload_6_pt,label_InnerRaceFault, blocksize,metric_name,timestamp, SleepTime)
         InnerRaceFault_vload_6_pt=InnerRaceFault_vload_6_pt+InsertLength},
         {InsertLength =InsertData_type2(InnerRaceFault_vload_7_filedata, InnerRaceFault_vload_7_pt,label_InnerRaceFault, blocksize,metric_name,timestamp, SleepTime)
         InnerRaceFault_vload_7_pt=InnerRaceFault_vload_7_pt+InsertLength},
         {InsertLength =InsertData_type2(OuterRaceFault_vload_1_filedata, OuterRaceFault_vload_1_pt,label_OuterRaceFault, blocksize,metric_name,timestamp, SleepTime)
         OuterRaceFault_vload_1_pt=OuterRaceFault_vload_1_pt+InsertLength},
         {InsertLength =InsertData_type2(OuterRaceFault_vload_2_filedata, OuterRaceFault_vload_2_pt,label_OuterRaceFault, blocksize,metric_name,timestamp, SleepTime)
         OuterRaceFault_vload_2_pt=OuterRaceFault_vload_2_pt+InsertLength},
         {InsertLength =InsertData_type2(OuterRaceFault_vload_3_filedata, OuterRaceFault_vload_3_pt,label_OuterRaceFault, blocksize,metric_name,timestamp, SleepTime)
         OuterRaceFault_vload_3_pt=OuterRaceFault_vload_3_pt+InsertLength},
         {InsertLength =InsertData_type2(OuterRaceFault_vload_4_filedata, OuterRaceFault_vload_4_pt,label_OuterRaceFault, blocksize,metric_name,timestamp, SleepTime)
         OuterRaceFault_vload_4_pt=OuterRaceFault_vload_4_pt+InsertLength},
         {InsertLength =InsertData_type2(OuterRaceFault_vload_5_filedata, OuterRaceFault_vload_5_pt,label_OuterRaceFault, blocksize,metric_name,timestamp, SleepTime)
         OuterRaceFault_vload_5_pt=OuterRaceFault_vload_5_pt+InsertLength},
         {InsertLength =InsertData_type2(OuterRaceFault_vload_6_filedata, OuterRaceFault_vload_6_pt,label_OuterRaceFault, blocksize,metric_name,timestamp, SleepTime)
         OuterRaceFault_vload_6_pt=OuterRaceFault_vload_6_pt+InsertLength},
         {InsertLength =InsertData_type2(OuterRaceFault_vload_7_filedata, OuterRaceFault_vload_7_pt,label_OuterRaceFault, blocksize,metric_name,timestamp, SleepTime)
         OuterRaceFault_vload_7_pt=OuterRaceFault_vload_7_pt+InsertLength}
  )
  end.time <- Sys.time()
  time.taken <- end.time - start.time
  elapse = as.numeric(time.taken, units="secs")
  wps = InsertLength / elapse;
  total_length_left=total_length_left-InsertLength
  timestamp=timestamp+InsertLength
  totalRead <- totalRead + InsertLength
  print(paste('Total read =', totalRead, '|', 
              'Left =', total_length_left, '|', 
              'block size =', InsertLength, '|',
              'writes per second =', InsertLength / elapse))

}
while(TRUE){
  #reset the total_length_left and all pt if leftover<1000
  if(total_length_left<1000)
  {
    total_length_left = total_length
    totalRead = 0
    
    baseline_1_pt = 1
    baseline_2_pt = 1
    baseline_3_pt = 1
    OuterRaceFault_1_pt = 1
    OuterRaceFault_2_pt = 1
    OuterRaceFault_3_pt = 1
    
    InnerRaceFault_vload_1_pt = 1
    InnerRaceFault_vload_2_pt = 1 
    InnerRaceFault_vload_3_pt = 1 
    InnerRaceFault_vload_4_pt = 1 
    InnerRaceFault_vload_5_pt = 1 
    InnerRaceFault_vload_6_pt = 1
    InnerRaceFault_vload_7_pt = 1 
    
    OuterRaceFault_vload_1_pt = 1 
    OuterRaceFault_vload_2_pt = 1 
    OuterRaceFault_vload_3_pt = 1 
    OuterRaceFault_vload_4_pt = 1 
    OuterRaceFault_vload_5_pt = 1 
    OuterRaceFault_vload_6_pt = 1
    OuterRaceFault_vload_7_pt = 1
    
  }
  #l=0
  # pick a file number randomly  
  #RandNum=selectFile()
  metric_name = 'onlT' 
  
  start.time <- Sys.time()
  switch(selectFile(),
         {InsertLength =InsertData_type1(baseline_1_filedata, baseline_1_pt, label_baseline, blocksize,metric_name,timestamp, SleepTime)
         baseline_1_pt = baseline_1_pt + InsertLength},
         {InsertLength =InsertData_type1(baseline_2_filedata, baseline_2_pt, label_baseline, blocksize,metric_name,timestamp, SleepTime)
         baseline_2_pt = baseline_2_pt + InsertLength},
         {InsertLength =InsertData_type1(baseline_3_filedata, baseline_3_pt, label_baseline, blocksize,metric_name,timestamp, SleepTime)
         baseline_3_pt = baseline_3_pt + InsertLength},
         {InsertLength =InsertData_type2(OuterRaceFault_1_filedata, OuterRaceFault_1_pt, label_OuterRaceFault, blocksize,metric_name,timestamp, SleepTime)
         OuterRaceFault_1_pt=OuterRaceFault_1_pt+InsertLength},
         {InsertLength =InsertData_type2(OuterRaceFault_2_filedata, OuterRaceFault_2_pt, label_OuterRaceFault, blocksize,metric_name,timestamp, SleepTime)
         OuterRaceFault_2_pt=OuterRaceFault_2_pt+InsertLength},
         {InsertLength =InsertData_type2(OuterRaceFault_3_filedata, OuterRaceFault_3_pt, label_OuterRaceFault, blocksize,metric_name,timestamp, SleepTime)
         OuterRaceFault_3_pt=OuterRaceFault_3_pt+InsertLength},
         {InsertLength =InsertData_type2(InnerRaceFault_vload_1_filedata, InnerRaceFault_vload_1_pt,label_InnerRaceFault, blocksize,metric_name,timestamp, SleepTime)
         InnerRaceFault_vload_1_pt=InnerRaceFault_vload_1_pt+InsertLength},
         {InsertLength =InsertData_type2(InnerRaceFault_vload_2_filedata, InnerRaceFault_vload_2_pt,label_InnerRaceFault, blocksize,metric_name,timestamp, SleepTime)
         InnerRaceFault_vload_2_pt=InnerRaceFault_vload_2_pt+InsertLength},
         {InsertLength =InsertData_type2(InnerRaceFault_vload_3_filedata, InnerRaceFault_vload_3_pt,label_InnerRaceFault, blocksize,metric_name,timestamp, SleepTime)
         InnerRaceFault_vload_3_pt=InnerRaceFault_vload_3_pt+InsertLength},
         {InsertLength =InsertData_type2(InnerRaceFault_vload_4_filedata, InnerRaceFault_vload_4_pt,label_InnerRaceFault, blocksize,metric_name,timestamp, SleepTime)
         InnerRaceFault_vload_4_pt=InnerRaceFault_vload_4_pt+InsertLength},
         {InsertLength =InsertData_type2(InnerRaceFault_vload_5_filedata, InnerRaceFault_vload_5_pt,label_InnerRaceFault, blocksize,metric_name,timestamp, SleepTime)
         InnerRaceFault_vload_5_pt=InnerRaceFault_vload_5_pt+InsertLength},
         {InsertLength =InsertData_type2(InnerRaceFault_vload_6_filedata, InnerRaceFault_vload_6_pt,label_InnerRaceFault, blocksize,metric_name,timestamp, SleepTime)
         InnerRaceFault_vload_6_pt=InnerRaceFault_vload_6_pt+InsertLength},
         {InsertLength =InsertData_type2(InnerRaceFault_vload_7_filedata, InnerRaceFault_vload_7_pt,label_InnerRaceFault, blocksize,metric_name,timestamp, SleepTime)
         InnerRaceFault_vload_7_pt=InnerRaceFault_vload_7_pt+InsertLength},
         {InsertLength =InsertData_type2(OuterRaceFault_vload_1_filedata, OuterRaceFault_vload_1_pt,label_OuterRaceFault, blocksize,metric_name,timestamp, SleepTime)
         OuterRaceFault_vload_1_pt=OuterRaceFault_vload_1_pt+InsertLength},
         {InsertLength =InsertData_type2(OuterRaceFault_vload_2_filedata, OuterRaceFault_vload_2_pt,label_OuterRaceFault, blocksize,metric_name,timestamp, SleepTime)
         OuterRaceFault_vload_2_pt=OuterRaceFault_vload_2_pt+InsertLength},
         {InsertLength =InsertData_type2(OuterRaceFault_vload_3_filedata, OuterRaceFault_vload_3_pt,label_OuterRaceFault, blocksize,metric_name,timestamp, SleepTime)
         OuterRaceFault_vload_3_pt=OuterRaceFault_vload_3_pt+InsertLength},
         {InsertLength =InsertData_type2(OuterRaceFault_vload_4_filedata, OuterRaceFault_vload_4_pt,label_OuterRaceFault, blocksize,metric_name,timestamp, SleepTime)
         OuterRaceFault_vload_4_pt=OuterRaceFault_vload_4_pt+InsertLength},
         {InsertLength =InsertData_type2(OuterRaceFault_vload_5_filedata, OuterRaceFault_vload_5_pt,label_OuterRaceFault, blocksize,metric_name,timestamp, SleepTime)
         OuterRaceFault_vload_5_pt=OuterRaceFault_vload_5_pt+InsertLength},
         {InsertLength =InsertData_type2(OuterRaceFault_vload_6_filedata, OuterRaceFault_vload_6_pt,label_OuterRaceFault, blocksize,metric_name,timestamp, SleepTime)
         OuterRaceFault_vload_6_pt=OuterRaceFault_vload_6_pt+InsertLength},
         {InsertLength =InsertData_type2(OuterRaceFault_vload_7_filedata, OuterRaceFault_vload_7_pt,label_OuterRaceFault, blocksize,metric_name,timestamp, SleepTime)
         OuterRaceFault_vload_7_pt=OuterRaceFault_vload_7_pt+InsertLength}
  )
  end.time <- Sys.time()
  time.taken <- end.time - start.time
  elapse = as.numeric(time.taken, units="secs")
  wps = InsertLength / elapse;
  total_length_left=total_length_left-InsertLength
  timestamp=timestamp+InsertLength
  totalRead <- totalRead + InsertLength
  print(paste('Total read =', totalRead, '|', 
              'Left =', total_length_left, '|', 
              'block size =', InsertLength, '|',
              'writes per second =', InsertLength / elapse))
  
}