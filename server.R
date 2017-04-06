# server.R

source("helpers.R")
counties <- readRDS("data/counties.rds")
library(maps)
library(mapproj)

shinyServer(
  function(input, output) {
	  
    output$map <- renderPlot({
	 print(input$var)
	 print(input$range)

	 map_color <- "darkgreen"
	 min_a <- input$range[1]
	 max_a <- input$range[2]

	 if (input$var == "Percent White")
	 {
		  percent_map(var=counties$white, color=map_color, legend.title="Percent White", min=min_a, max=max_a)
	 }
	 else if (input$var == "Percent Black")
	 {
		  percent_map(var=counties$black, color=map_color, legend.title="Percent Black", min=min_a, max=max_a)
	 }
	 else if (input$var == "Percent Hispanic")
	 {
		  percent_map(var=counties$hispanic, color=map_color, legend.title="Percent Hispanic", min=min_a, max=max_a)
	 }
	 else if (input$var == "Percent Asian")
	 {
		  percent_map(var=counties$asian, color=map_color, legend.title="Percent Asian", min=min_a, max=max_a)
	 }
    })
      
  }
)
    
