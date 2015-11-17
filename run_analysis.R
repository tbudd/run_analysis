run_analysis <- function(){
  ## necessary libraries
  library("dplyr")

  ## Read in data files and name the columns human readibly
  activ.labels<-tbl_df(read.table("UCI HAR Dataset\\activity_labels.txt",stringsAsFactors = FALSE))
  activ.labels<-select(activ.labels,ndx=V1,name=V2)

  features<-tbl_df(read.table("UCI HAR Dataset\\features.txt",stringsAsFactors = FALSE))
  features<-select(features,ndx=V1,name=V2)

  subj.train<-tbl_df(read.table("UCI HAR Dataset\\train\\subject_train.txt"))
  select(subj.train,subj=V1)

  y.train<-tbl_df(read.table("UCI HAR Dataset\\train\\y_train.txt"))

  x.train<-read.table("UCI HAR Dataset\\train\\x_train.txt")
  colnames(x.train)<-features$name

}

## use contains