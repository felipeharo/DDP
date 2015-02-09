library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Body % Calculator"),
  mainPanel(
    p('This application calculates your body fat percentage and your body mass index based on the information below. Just add your age, your gender, if you are an adult or a child and your weight and height. The BMI is calculated based on height and weight only, while the body fat percentage is calculated based on all the factors. Have Fun!!'),
    h3('Your Info'),
    numericInput('height','Height (cm):',170,min=10,max=500,step=1),
    numericInput('weight','Weight (Kg):',90,min=10,max=500,step=1),
    radioButtons('gender', 'Gender:',c("Boy"="boy","Girl"="girl"), selected = "boy"),
    radioButtons('type', 'I feel I am a:',c("Child"="child","Adult"="adult"), selected = "adult"),
    numericInput('age','Age:',20,min=2,max=140,step=1),
    actionButton("goButton","GO!")
  ),
  sidebarPanel(
#     h4('You entered'),
#     h5('Age:'),
#     verbatimTextOutput("age"),
#     h5('Height:'),
#     verbatimTextOutput("height"),
#     h5('Weight:'),
#     verbatimTextOutput("weight"),
#     h5('Gender:'),
#     verbatimTextOutput("gender"),
#     h5('Type:'),
#     verbatimTextOutput("type"),
    h3('This is your Body Fat Percentage:'),
    verbatimTextOutput("value"),
    h3('This is your Body Mass Index:'),
    verbatimTextOutput("value2")
  )
))