#
# A simple shiny app for the Developing Data Products course
# on Coursera.
#
# @author: Ossama W. Obeid
#

library(shiny);
library(ggplot2);
library(reshape2);

data(movies);

# Generate global means to plot
global_data_num <- lapply(movies[, 2:5], as.numeric);
global_means <- lapply(global_data_num, mean, na.rm=TRUE);
global_means_df <- melt(global_means);

# Labels of properties for use in plots
property_labels <- c("year", "length (mins)", "budget ($)", "rating");

shinyServer(function(input, output) {

  output$distPlot <- renderPlot({

    # Extract data based on parameters
    genre_filter <-  movies[movies[as.integer(input$genre)] == 1,];
    data <- as.numeric(genre_filter[,as.integer(input$property)]);
    
    # Calculate mean of property for given genre and wrap in data frame
    data_mean_df <- data.frame(value=mean(data, na.rm=TRUE));

    # Plot data
    ggplot(data.frame(x=data)) +
      geom_histogram(aes(x=x, y=..density..), color="black", fill="white") +
      geom_vline(data=global_means_df[as.integer(input$property)-1,],
                 aes(xintercept=value, color="red"),
                 linetype=2,
                 size=0.8,
                 show_guide=FALSE) +
      geom_vline(data=data_mean_df,
                 aes(xintercept=value, color="darkturquiose"),
                 linetype=2,
                 size=0.8,
                 show_guide=FALSE) +
      xlab(property_labels[as.integer(input$property)-1]);
  })

});
