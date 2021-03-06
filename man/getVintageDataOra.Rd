% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/getVintageDataOra.R
\name{getVintageDataOra}
\alias{getVintageDataOra}
\title{Get vintage data for Oracle}
\usage{
getVintageDataOra(vintageUnitSql, performanceEventSql, timeGroup, timeExpansion,
  con, result, distanceFunctionSchema, sqlModifier, verbose, debug)
}
\arguments{
\item{vintageUnitSql}{Valid SQL \code{SELECT} statement. \cr If
  \code{sqlModifier} is not used than result has to have the following
  structure (Note: optional elements are denoted as \code{[...]}):
  \tabular{ll}{ Column \tab Description\cr \code{id} \tab Unique
  identificator of row. Is considered to be a primary key of
  \code{performanceEventSql}. Duplicates will result in incorrect results as
  join between vintage units and events will be multiplicated. Any (reasonable) data type
  possible.\cr \code{vintage_unit_date} \tab Has to be of type date. It is
  not necessary to round dates to months/quarters/years.\cr
  \code{[vintage_unit_weight]} \tab Optional weight. When no weight is
  defined than every row is considered to be one unit (every row in result
  represents one unit). Has to be of numeric type (integer, numeric,
  float).\cr \code{[Slicers]} \tab Any number of columns used to form
  vintages. There are no constraints on data types. Any name except \code{id,
  vintage_unit_date, vintage_unit_weight} can be used. Every unique
  combination of \code{Slicers} will be considered as one vintage. When there
  are no \code{Slicers} then only one vintage will be created. \cr }}

\item{performanceEventSql}{Valid SQL \code{SELECT} statement. Result has to
have the following structure (Note: optional elements are denoted as
\code{[...]}): \tabular{ll}{ Column \tab Description\cr \code{id} \tab
Identificator of vintage unit to which event belongs. Has to be of same
data type as column \code{id} in \code{vintageUnitSql}. \cr
\code{event_date} \tab Date when event occured. Has to be of type date. It
is not necessary to round dates to months/quarters/years.\cr
\code{[event_weight]} \tab Optional weight. When no weight is defined than
every row is considered to be one unit (every row in result represents one
event). Has to be of numeric type (integer, numeric, float).\cr } Note: it
does not make sense to include any other columns as these are not used by
the function. Currently, only single column key is supported.}

\item{timeGroup}{Aggregation of vintage data. Defines how distance between
\code{vintage_unit_date} and \code{event_date} is measured. Possible values
are \code{month, quarter, year}. In PostgreSQL,  distance calculation is performed by
custom function named \code{time_distance}. Code to create this
function is stored in \code{exec/time_distance.sql}. For Oracle, standard
date functions are used.}

\item{timeExpansion}{Defines how time expansion is performed. By default,
vintages will be generated up to last existing point in events. E.g. when
maximum distance in data is 10 than every vintage will have 10
observations. There are three other options, using \code{now} or date in
\code{yyyy-mm-dd} format or \code{local}. \code{now} will be internally
replaced by current date. \code{local} will use maximum event date
available for every vintage. If any of these option is used than value of
parameter will be used as last available point in data. Thus, number of
points for every vintage will be expanded. Note that this might return
unexpected results if this date is earlier than last point in events.}

\item{con}{Connection to PostgreSQL or Oracle database. This is an
connection object as produced by \code{dbConnect(...)} function.}

\item{result}{Type of results to return. By default (\code{data}), vintage
data are returned. The other option is to use \code{sql} - this will return
SQL statement to get vintage data.}

\item{distanceFunctionSchema}{Name of database schema where
\code{time_distance} function is available. This is valid for PostgreSQL only.}

\item{sqlModifier}{This will constraint result of \code{vintageUnitSql} to selected
columns and/or rows. Vector with 1 or 2 elements. In the first element,
required columns are specified, the second can contain additional
\code{WHERE} condition. If used than \code{vintageUnitSql} is wrapped into
\code{SELECT id, vintage_unit_date [, First Element] FROM (VintageUnitSQL)
x [WHERE Second Element]}. When only \code{WHERE} clause should be used and
columns should remain unchanged  than first element has to be asterisk
('*'). If first element is empty string or NA than only columns \code{id}
and \code{vintage_unit_date} will be used from results of
\code{vintageUnitSql}.}

\item{verbose}{Prints additional diagnostics messages when \code{TRUE}.
Default is \code{FALSE}.}

\item{debug}{Prints low level diagnostic messages. Usefull mainly for package
developer. Default is \code{FALSE}}
}
\description{
Get vintage data for Oracle
}

