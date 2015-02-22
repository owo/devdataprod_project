#
# A simple shiny app for the Developing Data Products course
# on Coursera.
#
# @author: Ossama W. Obeid
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Movies Data Explorer"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
    
      fluidRow (
        column(12,
               selectInput("genre",
                           label = h3("Genre"), 
                           choices = list("Action" = 18,
                                          "Animation" = 19,
                                          "Comedy" = 20,
                                          "Drama" = 21,
                                          "Documentary" = 22,
                                          "Romance" = 23,
                                          "Short" = 24),
                           selected = 18)),
        column(12,
               selectInput("property",
                           label = h3("Property"), 
                           choices = list("Year" = 2,
                                          "Length (mins)" = 3,
                                          "Budget ($)" = 4,
                                          "IMDB Rating" = 5),
                           selected = 1))
      )
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      p(
"This app can be used to explore the movies data set provided with the ggplot2 library in R.
The side bar allows you to choose a genre of movies as well as a selected property.
The below plot displays a histogram of the distribution of values of the selected property for the selected genre.
Aditionally, a green line is drawn where the mean of that property for the genre is located and a red line
for the mean same property across all genres."
),
      plotOutput("distPlot")
    )
  )
))
