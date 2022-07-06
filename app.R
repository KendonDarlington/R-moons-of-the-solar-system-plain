#Import our libraries
library(shiny)
library(tidyverse)

#The ui is the front end
ui <- fluidPage(
  
    #App title
    titlePanel("Moons Of The Solar System"),
    
    #Select Inputs are dropdowns. This one is filled with planets!
    selectInput("selectPlanet", h4("Select A Planet"), 
                choices = list(#"All" = "Sun", 
                               "Earth" = "Earth",
                               "Mars" = "Mars",
                               "Jupiter" = "Jupiter",
                               "Saturn" = "Saturn",
                               "Uranus" = "Uranus",
                               "Neptune" = "Neptune",
                               "Pluto" = "Pluto"
                               ), selected = "1"),
    
  
    tableOutput('moons')
)

#The server is the back end
server <- function(input, output) {
  
  #Import our csv of moons
  df <- read_csv('MoonsOfTheSolarSystem.csv')
  
  #This looks for our planet 
  output$moons <- renderTable({
    
    #Here is the table. Just a little bit of tidyverse here to filter our df to the selected planet.
    df %>% 
      filter(Parent == input$selectPlanet)
  })
}

#Run the app
shinyApp(ui = ui, server = server)
