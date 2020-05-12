FROM rocker/shiny-verse

COPY shiny-server.conf /etc/shiny-server/shiny-server.conf
COPY . /srv/shiny-server/

WORKDIR /srv/shiny-server/
# install dependencies
RUN Rscript -e "install.packages('renv')"
RUN Rscript -e "install.packages(setdiff(renv::dependencies(quiet = TRUE)[, 'Package'], .packages(all.available = TRUE)))"

EXPOSE 8080

USER shiny
