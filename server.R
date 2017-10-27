library(shiny)
library(lubridate)



shinyServer(function(input, output,session){
  
  ##Server code for home tab
  
  time<-Sys.time()
  format_time<-strftime(time,format="%d.%m.%Y,  %H:%M")
  output$Today_Date<-renderText({paste("Logged in since:",format_time)})
  
  


   output$new_data<-renderDataTable({
     if(is.null(input$file1))
       return(NULL)
     inFile<-input$file1
  temp<-read.csv(inFile$datapath)
  output$my_data<-renderDataTable({
    temp
  })

  
    size_of_temp<-dim(temp)
    name<-inFile$name
  
     output$file_name<-renderText({
       paste("File Name:",name)
     })
     output$file_num_rec<-renderText({
       paste("Number of records:",size_of_temp[1])
     })
     
     output$file_num_field<-renderText({
       paste("Number of fields:",size_of_temp[2])
     })
  
    
  
    
    output$stats <- renderDataTable({
      Desc<-matrix(data=NA,nrow=size_of_temp[2],ncol = 6)
      colnames(Desc)<-c("Field Name","Data Type","Minimum Value","Maximum Value","Mean Value","Missing Records")
      
      for (i in 1:size_of_temp[2]){
          Desc[i,1]<- colnames(temp[i])  #Name of the ith field
        
          Desc[i,2]<- sapply(temp[i],class)
          
      if (is.numeric(temp[,i])){
        Desc[i,3]<- sapply(temp[i],min)
        Desc[i,4]<-sapply(temp[i],max)
        Desc[i,5]<-sapply(temp[i],mean)
      }else {Desc[i,3:5]<- 'not numeric'}
        
        Desc[i,6]<-sum(is.na(temp[i]))
        
      }
      Desc
      })
    
   })

output$barplot<-renderPlot()
  
})#end of shiny server