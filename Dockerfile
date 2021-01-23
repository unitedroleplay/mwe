FROM fedora:latest

##
# Update system
##
RUN \
    yum update -y && \
    yum upgrade -y

##
# Install dependencies
##
RUN \
    yum install -y \
    curl \
    wget \
    psmisc \
    tar \
    git \
    glibc.i686 \
    libstdc++.i686

##
# Install sampctl
##
RUN \
    curl https://raw.githubusercontent.com/Southclaws/sampctl/master/install-rpm.sh | sh

##
# Set workdir
##
WORKDIR /app
ADD . /app

##
# Ensure packages
##
RUN \
    sampctl p ensure

##
# Build gamemode
##
RUN \
    sampctl p build

##
# Copy files from docker/ directory
##
COPY docker/* .
