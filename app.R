library(shiny)

# Define UI for NFL app ----
ui <- pageWithSidebar(

  # App title ----
  headerPanel("NFL Stats"),

  # Sidebar panel for inputs ----
  sidebarPanel(),

  # Main panel for displaying outputs ----
  mainPanel()
)

# Define server logic to plot various variables against mpg ----
server <- function(input, output) {

}

shinyApp(ui, server)