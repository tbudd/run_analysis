run_analysis <- function(){
  ## This function computes the average of the mean() and std() variables in the UCI HAR dataset.
  ## First it combines the subject and activity variables with each of the test and training tables.
  ## Then it combines the test and training tables and extracts only the mean() and st() variables for averaging.
  ## Finally, it averages the variables and prints the result to a file and returns the result as well
  
  ## This function assumes all of the files are in ".\UCI HAR Dataset" in the original file heirarchy
  ## For field and file descriptions refer to the run_analysis code book.
  
  ## necessary libraries
  library("dplyr")

  ## Read in activity labels; col act is the numeric index; activity is the text descriptor
  activ.labels<-tbl_df(read.table("UCI HAR Dataset\\activity_labels.txt",stringsAsFactors = FALSE))
  activ.labels<-select(activ.labels,act=V1,activity=V2)
  
  ## Read in features; ndx is the index; name is the text descriptor
  features<-tbl_df(read.table("UCI HAR Dataset\\features.txt",stringsAsFactors = FALSE))
  features<-select(features,ndx=V1,name=V2)

  ## Read in the training files. Prepend the data values with the subjects and actvities
  subj.train<-read.table("UCI HAR Dataset\\train\\subject_train.txt")
  y.train<-read.table("UCI HAR Dataset\\train\\y_train.txt")
  x.train<-read.table("UCI HAR Dataset\\train\\x_train.txt")
  train<-cbind(subj.train,y.train,x.train)
  
  ## Read in the test files. Prepend the data values with the subjects and actvities
  subj.test<-read.table("UCI HAR Dataset\\test\\subject_test.txt")
  y.test<-read.table("UCI HAR Dataset\\test\\y_test.txt")
  x.test<-read.table("UCI HAR Dataset\\test\\x_test.txt")
  test<-cbind(subj.test,y.test,x.test)
  
  ## Append the test observations to the training observations
  merged<-rbind(train,test)
  
  ## Initialize "extracted" for the std and mean column data and "cols" for the names of those columns
  extracted<-NULL
  cols<-NULL
  
  ## The limit of the for loop is the number of features
  col_cnt<-dim(features)[1]

  ## Build up the "extracted" matrix with only the std and mean columns, plus the correct column names "cols"  
  for(i in 1:col_cnt){
    if(grepl("mean\\(",features[i,2]) || grepl("std\\(",features[i,2])){
      extracted<-cbind(extracted,merged[,i+2])
      cols<-c(cols,features[i,2])
  }
    i<-i+1
  }

  ## Add back on the subject and activity columns at the front
  extracted<-cbind(merged[,1:2],extracted)
  
  ## Add the "subj" and "act" names to the cols vector
  cols<-c("subject","act",cols)
  
  ## Name the columns correctly using the built up column vector
  colnames(extracted)<-cols
  
  ## Join the activ.labels and extracted tables on "act" to associate the activity names with the numeric key
  result<-merge(activ.labels,extracted)
  
  ## Remove the now superfluous act, which the tables above were joined on
  result<-select(result,-act)
  
  ## Tidy the data and calculate the averages for each variable by activity and subject
  means = aggregate(result, by=list(activity=result$activity, subject=result$subject), mean)
  
  ## remove extraneous rows from aggregate
  means[,3] <- NULL
  means[,3] <- NULL

  ## Write the result to a file
  write.table(means, "means.txt", sep="\t", row.names = FALSE)
  
  ## Return the result
  means
}