# Server
# ==============================================================================

server <- function(input, output) {

  data <- reactive({
    path <- input$path
    if (is.null(path)) {
      return(NULL)
    } else {
      return(read.csv(path$datapath))
    }
  })

  output$mental <- renderPlot(
    if (!is.null(data())) {
      hist(data()$memory_test_1, probability = TRUE,
        xlab = "Score", main = "Mental Skill")
      dens <- density(data()$memory_test_1)
      lines(dens, col = "blue", lwd = 1)
    }, height = 700
  )

  output$physical <- renderPlot(
    if (!is.null(data())) {
      hist(data()$cup_ball_1, probability = TRUE,
        xlab = "Score", main = "Physical Skill")
      dens <- density(data()$cup_ball_1)
      lines(dens, col = "blue", lwd = 1)
    }, height = 700
  )
}
