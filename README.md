# Vintage Analysis in PostgreSQL and R
## Pre-requisites
* R version 3.02 or higher
* PostgreSQL version 9.1 or higher
* ggplot2, sqldf, RPostgreSQL, devtools

## Installation

### Package installation

    library(devtools)
    install_github("pgvint",username="tomasgreif")
    library(pgvint)

### Creating time_distance function and load sample data
    Connection <- c('user','password','database','host','port')
    CreateTimeDistanceFunction(Connection=Connection,LoadData=TRUE)

## Usage
See help:

    help(GetVintageData)
    help(PlotVintageData)

## Sample plots

Standard vintage curves:
![alt tag](http://www.analytikdat.cz/images/easyblog_images/923/20131020-get-vintage-data-postgresql-r/pgvint-vintage-data-plot.png)

Tranposed vintage curves:
![alt tag](http://www.analytikdat.cz/images/easyblog_images/923/20131020-get-vintage-data-postgresql-r/pgvint-vintage-data-plot-transposed.png)
