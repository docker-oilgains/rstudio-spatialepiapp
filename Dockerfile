FROM rocker/rstudio-stable:latest
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    libproj-dev \
    libgdal-dev


RUN install2.r --error \
    rgeos  \
    rgdal  \
    SpatialEpiApp

RUN echo "r <- getOption('repos'); r['CRAN'] <- 'https://inla.r-inla-download.org/R/stable'; options(repos = r);" > ~/.Rprofile
RUN Rscript -e "install.packages('INLA', dep=TRUE)"



