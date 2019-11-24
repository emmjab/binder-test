FROM renku/singleuser-r:0.3.7-renku0.5.2

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    apt-utils \
    dirmngr \
    gpg-agent \
    vim \
    gawk \
    less \
    libcurl4-openssl-dev \
    libxml2-dev \
    texlive-latex-base \
    libudunits2-dev \
    libjpeg62-turbo-dev \
    gdal-bin \
    proj-bin \
    lbzip2 \
    libfftw3-dev \
    libgdal-dev \
    libgeos-dev \
    libgsl0-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    libhdf4-alt-dev \
    libhdf5-dev \
    libjq-dev \
    liblwgeom-dev \
    libpq-dev \
    libproj-dev \
    libprotobuf-dev \
    libnetcdf-dev \
    libsqlite3-dev \
    libssl-dev \
    libudunits2-dev \
    netcdf-bin \
    postgis \
    protobuf-compiler \
    sqlite3 \
    tk-dev \
    unixodbc-dev \
    software-properties-common 
    
# Uncomment and adapt if code is to be included in the image
# COPY src /code/src

USER ${NB_USER}

# install additional packages
COPY install.R /tmp/install.R
RUN R -f /tmp/install.R

# install the python dependencies
COPY requirements.txt /tmp/
RUN pip3 install -r /tmp/requirements.txt

RUN jupyter-nbextension install rise --py --sys-prefix
