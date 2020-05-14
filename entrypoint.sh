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
&& wget -O android-ndk-r21b.zip https://dl.google.com/android/repository/android-ndk-r21b-linux-x86_64.zip \
&& unzip android-ndk-r21b.zip \
&& rm -f android-ndk-r21b.zip \
&& export ANDROID_NDK_ROOT=${PWD}/android-ndk-r21b \
&& update-alternatives --install /usr/bin/python python /usr/bin/python2.* 20 \
&& update-alternatives --install /usr/bin/python python /usr/bin/python3.* 50 \
&& curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - \
&& apt-get install -y nodejs \
&& apt-get install -y npm \
&& git clone --recurse-submodules https://github.com/frida/frida \
&& cd frida \
&& DESTDIR=/frida_out \
&& make build/frida-android-arm/lib/pkgconfig/frida-core-1.0.pc \
&& make build/frida-android-arm64/lib/pkgconfig/frida-core-1.0.pc
