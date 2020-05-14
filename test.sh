#!/bin/bash
cd /root \
&& apt-get update \
&& apt-get install -y python-software-properties software-properties-common \
&& add-apt-repository -y ppa:ubuntu-toolchain-r/test \
&& apt-get update \
&& apt-get install -y build-essential gcc-multilib lib32stdc++-5-dev python-dev python3-dev git gcc-9 g++-9 \
flex bison curl wget unzip libterm-readkey-perl \
&& update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 20 \
&& update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 20 \
&& update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 50 \
&& update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 50 \
&& ls /usr/bin/python* \
&& curl -sL https://deb.nodesource.com/setup_10.x | bash - \
&& apt-get install -y nodejs \
&& apt-get install -y npm \