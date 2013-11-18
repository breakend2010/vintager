# Vintage Analysis in PostgreSQL and R
`pgvint` transforms source data into vintage analysis format. From detailed list of units (e.g. loans) and events (e.g. repayment), vintage curves are calculated.

## Pre-requisites
* R version 3.02 or higher
* PostgreSQL version 9.1 or higher
* ggplot2, sqldf, RPostgreSQL, devtools, XLSWrite, reshape2

## Installation

### Package installation

    library(devtools)
    install_github("pgvint",username="tomasgreif")
    library(pgvint)

### Create time_distance function and load sample data
    Connection <- c('user','password','database','host','port')
    CreateTimeDistanceFunction(Connection=Connection,LoadData=TRUE)

## Usage
`pgvint` can work with the following data design:

![alt tag](http://www.analytikdat.cz/images/easyblog_images/923/20131020-get-vintage-data-postgresql-r/pgvint-source-data-structure.png)

In the basic form, you can just use:

    Connection <- c('user','password','database','host','port') # Use real values!
    VintageUnitSQL <- "select * from vintage_units"
    PerformanceEventSQL <- "select * from performance_events"
    GetVintageData(VintageUnitSQL,PerformanceEventSQL,Connection=Connection)

For additional details see help:

    help(GetVintageData)
    help(PlotVintageData)
    help(PrintVintageData)
    help(AggregateVintageData)
    help(CreateTimeDistanceFunction)
    
`pgvint` has cool `shiny` interface. If you have `VintageData` data frame in global environment, you can start `pgvintshiny` easily:

    library(shiny)
    library(devtools)
    runGitHub(repo="pgvintshiny",username="tomasgreif")  

![alt tag](http://www.analytikdat.cz/images/easyblog_images/923/20131020-get-vintage-data-postgresql-r/pgvintshiny-plot-vintage-data-in-shiny.png)

Note: `pgvintshiny` requires `shiny` package version 0.8 or higher.


## Sample outputs

Vintage data:

![alt tag](http://www.analytikdat.cz/images/easyblog_images/923/20131020-get-vintage-data-postgresql-r/pgvint-vintage-data-print.png)

Standard vintage curves:

![alt tag](http://www.analytikdat.cz/images/easyblog_images/923/20131020-get-vintage-data-postgresql-r/pgvint-vintage-data-plot.png)

Tranposed vintage curves:

![alt tag](http://www.analytikdat.cz/images/easyblog_images/923/20131020-get-vintage-data-postgresql-r/pgvint-vintage-data-plot-transposed.png)

Tranposed vintage curves by two groups, partitioned by distance:

![alt tag](http://www.analytikdat.cz/images/easyblog_images/923/20131020-get-vintage-data-postgresql-r/pgvint-vintage-data-plot-transposed-exploded.png)

