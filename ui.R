library(shiny)
fluidPage(
  style = "font-family: 'Verdana'",
  titlePanel("ARIMA Forecasting Tool"),
  sidebarLayout(
    sidebarPanel(
      tags$p(
        '- It accepts a text or csv input from any text or csv file for forecast analysis'),
      tags$p(
        '- If your file has a header, please check the appropriate box'),
      tags$p(
        '- Select The start year , month and frequency of the data based on your preference'),
      tags$p(
        '- Using this information it will plot a PACF and ACF graph'),
      tags$p(
        '- It will execute auto.arima and plot the normal time series data'),
      tags$hr(),
      fileInput('TextFile', 'Choose Text/CSV file to upload',
                accept = c(
                  'text/csv',
                  'text/comma-separated-values',
                  'text/tab-separated-values',
                  'text/plain'
                )
      ),
      tags$hr(),
      radioButtons('skipper', 'My data has a header row',
                             c(No=0,
                               Yes=1
                               )),
      tags$hr(),
      numericInput('year','Enter Starting Year',value =2018 ),
      tags$hr(),
      numericInput('month','Enter Starting month',value=01),
      tags$hr(),
      numericInput('frequency','Enter Frequency',value=12)
    ),
    
    mainPanel(
      tags$style(type="text/css",
                         ".shiny-output-error { visibility: hidden; }",
                         ".shiny-output-error:before { visibility: hidden; }"
    ),
      fluidRow("ARIMA",
        splitLayout(cellWidths = c("50%", "50%"), 
                    plotOutput("contents1"), plotOutput("contents2"))
        
      ))
  )
)