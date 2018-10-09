
library(shiny)

shinyApp(
  ui = fluidPage(
    #leave some spacing
    br(),
    sidebarLayout(
      sidebarPanel(),
      
      mainPanel(
        sliderInput("nrow", label = "Select rows",
                    min = 1, max = 32, value = c(1, 5)),
        tableHTML_output("mytable"))
    )
  ),
  server = function(input, output) {
    output$mytable <- render_tableHTML( 
      tableHTML(mtcars[input$nrow[1]:input$nrow[2], ], theme = 'rshiny-blue')
    )
  }
)
