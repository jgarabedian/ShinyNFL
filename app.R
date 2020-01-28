library(shiny)

# Define UI for NFL app ----
ui <- pageWithSidebar(

  # App title ----
  headerPanel("NFL Stats"),

  # Sidebar panel for inputs ----
  sidebarPanel(
    # Input: Selector for variable to query table ----
    selectInput("season", "Season:", 
                selected = 2017,
                c("2017" = 2017,
                  "2018" = 2018,
                  "2019" = 2019)),
    numericInput("week", "Week Number",
                 1, min = 1, max = 17, step = 1)
  ),

  # Main panel for displaying outputs ----
  mainPanel(
    h2(textOutput("header")),
    DT::dataTableOutput("games")
  )
)

# Define server logic to plot various variables against mpg ----
server <- function(input, output) {
  output$games <- DT::renderDataTable({
    library(nflscrapR)
    games <- as.data.frame.table(scrape_game_ids(input$season, weeks = input$week))
    games <- games[which(games$Var2 == 'game_id'),]
  })
  output$header <- renderText({
    paste("Scores in week", input$week, "for the", input$season, "season")
  })
}

shinyApp(ui, server)