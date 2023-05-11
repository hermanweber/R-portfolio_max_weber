library(rvest)
library(rworldmap)
library(rworldxtra)
gdp_data_raw <- read_html("https://en.wikipedia.org/wiki/List_of_sovereign_states_in_Europe_by_GDP_(nominal)_per_capita")
tablez <- gdp_data_raw %>% html_element("tbody")
country_data <- html_table(tablez)
yes <- joinCountryData2Map(country_data, joinCode = "NAME", 
                    nameJoinColumn = "Country",
                    nameCountryColumn = "Country", 
                    suggestForFailedCodes = TRUE,
                    mapResolution = "high", 
                    projection = NA, 
                    verbose = TRUE)
mapCountryData(mapToPlot = yes, 
               nameColumnToPlot = "WB[6] 2019", 
               numCats = 46,
               mapRegion = "europe",
               catMethod = "diverging",
               colourPalette = "heat", 
               addLegend = TRUE, 
               borderCol = "grey",
               mapTitle = "GDP Per Capita in Europe", 
               oceanCol = "black", 
               aspect = 1,
               missingCountryCol = "black", 
               add = FALSE, 
               nameColumnToHatch = "",
               lwd = 0.5)

