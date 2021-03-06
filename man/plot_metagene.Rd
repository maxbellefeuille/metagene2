% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_metagene.R
\name{plot_metagene}
\alias{plot_metagene}
\title{Produce a metagene plot}
\usage{
plot_metagene(df, facet_by = NULL, group_by = NULL)
}
\arguments{
\item{df}{a \code{data.frame} obtained with the \code{get_data_frame}
function. Must have the following columns: "region", "design", "bin", 
"value", "qinf" and "qsup".}

\item{facet_by}{A formula to be used for facetting the metagene plot. This
formula can include any design metadata, or region_metadata 
\code{NA} can be used to keep the previous value.
Default: \code{NA}.}

\item{group_by}{A string representing a single column from design_metadata or
region_metadata which will be used to group observations 
together into lines and which will be used to generate the 
color scale. \code{NA} can be used to keep the previous 
value. Default: \code{NA}.}
}
\value{
A `ggplot` object.
}
\description{
Produce a metagene plot
}
\examples{
   mg <- get_demo_metagene()
   df <- mg$add_metadata()
   p <- metagene2::plot_metagene(df)
}
