#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$KControl<- renderUI({
    sliderInput("K","Strike Price",min=input$S0-0.5*input$S0,max=input$S0+0.5*input$S0,step=1,value=input$S0)
  })
  output$plots<-renderPlot({
    set.seed(input$seed)
    D<-rep(0,input$N)
    for(i in 1:input$N){
      bt<-rnorm(input$N1,m=0,s=1)
      rt<-bt*(input$s/100)+(input$r/100)-0.5*((input$s/100)^2)
      S<-input$S0*exp(rt)
      D[i]<-mean(pmax(S-input$K,0)*exp(-(input$t/360)*(input$r/100)))
    }
    ggplot(data.frame(D),aes(x=D))+geom_histogram()

  })
})
