#: title  : huzi/xelatex-chinese
#: author : "Willian Paixao" <willian@ufpa.br>
#: version: "1.1.0"
FROM debian:8

LABEL version="1.1.0"

ENV DEBIAN_FRONTEND noninteractive

# Install all TeX and LaTeX dependences
RUN apt-get update && \
    apt-get install --yes --no-install-recommends \
    git \
    ca-certificates \
    inotify-tools \
    lmodern \
    make \
    fontconfig \
    texlive-full \
    texlive-fonts-recommended \
    texlive-generic-recommended \
    texlive-lang-english \
    texlive-lang-chinese && \
    # texlive-xetex && \
    apt-get autoclean && apt-get --purge --yes autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Copy local fonts in an indexable place
COPY /fonts /usr/share/fonts/truetype

# Update font cache
RUN fc-cache -f -v
# Export the output data
WORKDIR /data
VOLUME ["/data"]