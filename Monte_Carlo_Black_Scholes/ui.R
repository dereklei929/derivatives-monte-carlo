#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Monte Carlo Simulation for Options Pricing"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      numericInput("S0","Current stock price",min=0,max=500,step=1,value=100),
      uiOutput("KControl"),
      sliderInput("r","Risk free rate (%)",min=-10,max=50,step=0.1,value=5),
      sliderInput("s","Volitility (%)",min=0,max=50,step=0.1,value=20),
      sliderInput("t","Time to maturity (days)",min=1,max=3600,step=1,value=360),
      sliderInput("d","Dividend rate (%)",min=0,max=50,step=0.1,value=2),
      selectInput("type","Type of Options",choices=c("European Call","European Put"),selected="European Call"),
      sliderInput("N","Number of Sample",min=100,max=10000,step=1,value=1000),
      sliderInput("N1","Number of Simulation for each sample",min=1,max=100000,step=1,value=10000),
      numericInput("seed","Randomization seed",min=0,max=1000,step=1,value=702)
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Results",plotOutput("results")),
        tabPanel("Plots",plotOutput("plots"))
      )
    )
  )
  
))


