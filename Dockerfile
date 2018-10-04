FROM debian:jessie
MAINTAINER Michael Mayne mike@stonepower.co

RUN apt-get update \
 && apt-get install -y cmake binutils make build-essential \
    pkg-config perl-modules libdigest-md5-file-perl python git llvm clang \
    libfreetype6-dev libx11-dev libxinerama-dev libxrandr-dev libxcursor-dev \
    mesa-common-dev libasound2-dev freeglut3-dev libxcomposite-dev libcurl4-gnutls-dev \
    libxext-dev libwebkit2gtk-4.0-dev libgtk-3-dev libstdc++6

RUN git clone https://github.com/WeAreROLI/JUCE.git
RUN cd JUCE/extras/Projucer/Builds/LinuxMakefile && make
RUN mkdir /app && cp JUCE/extras/Projucer/Builds/LinuxMakefile/build/Projucer /app

ENTRYPOINT	[ "/app/Projucer" ]
