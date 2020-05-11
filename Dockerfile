#I do not recommend overwriting BASEIMG. 20.04 is the newest LTS and the only that i tested.
ARG BASEIMG=ubuntu:20.04
FROM $BASEIMG

#libtagc0-dev uses tzdata as dependency so we configure it with TIMEZONE
#It's a good idea to overwrite it by the value that /etc/timezone has on your system.
ARG TIMEZONE=Etc/UTC
RUN echo $TIMEZONE > /etc/timezone && ln -s /usr/share/zoneinfo/$TIMEZONE /etc/localtime

RUN apt-get update && apt-get install -y pkg-config make gcc git libmad0-dev libao-dev libtagc0-dev && rm -rf /var/lib/apt/lists/*

#If you have your own fork with changes, you'll want to change REPOLOCATION and REPOBRANCH.
#REPODIR only needs to be changed if you renamed your fork or if you are cloning from a
#non-github repo (e.g. gitlab) and the dir with '.git' is not named shell-fm.
ARG REPOLOCATION=https://github.com/jkramer/shell-fm
ARG REPODIR=shell-fm
ARG REPOBRANCH=master
WORKDIR /root
RUN git clone $REPOLOCATION
WORKDIR /root/$REPODIR
RUN git checkout $REPOBRANCH
