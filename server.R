library(shiny)
show<-F
BMI<-function(height,weight){
  met<-height/100
  bmi<-weight/(met^2)
  if(bmi>3)
    return(bmi)
  else
    return("Yeah sure... those measurements do not exist")
}
fat<-function(height,weight,age,gender,type){
  g<-0
  output<-0
  met<-height/100
  bmi<-weight/(met^2)
  if(gender=="boy")
    g=1
  if(type=="child")
    output<-1.51*bmi-0.7*age-3.6*g+1.4
  else
    output<-1.2*bmi+0.23*age-10.8*g-5.4
  if(bmi>3)
    return(output)
  else
    return("Yeah sure... those measurements do not exist")
    
}

shinyServer(
  function(input,output){
      output$value<-renderPrint({
        if (input$goButton == 0)
          return("")
        isolate(fat(input$height,input$weight,input$age,input$gender,input$type))
      })
      output$value2<-renderPrint({
        if (input$goButton == 0)
          return("")
        isolate(BMI(input$height,input$weight))
      })
      
  }
)