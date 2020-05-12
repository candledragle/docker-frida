#!/bin/bash

cd /root \
&& apt-get update \
&& apt-get install -y python-software-properties software-properties-common \
&& add-apt-repository -y ppa:ubuntu-toolchain-r/test \
&& apt-get update \
&& apt-get install -y build-essential gcc-multilib lib32stdc++-5-dev python-dev python3-dev git gcc-9 g++-9
&& wget -O android-ndk-r21b.zip https://dl.google.com/android/repository/android-ndk-r21b-linux-x86_64.zip \
&& unzip android-ndk-r21b.zip \
&& rm -f android-ndk-r21b.zip \
&& export ANDROID_NDK_ROOT=${PWD}/android-ndk-r21b \
&& update-alternatives --install /usr/bin/python python /usr/bin/python2.7 20 \
&& update-alternatives --install /usr/bin/python python /usr/bin/python3.7 30 \
&& apt-get install -y git flex bison build-essential gcc-multilib lib32stdc++-5-dev \
&& curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - \
&& apt-get install -y nodejs npm \
&& git clone --recurse-submodules https://github.com/frida/frida \
&& cd frida \
&& DESTDIR=/frida_out \
&& make build/frida-android-arm/lib/pkgconfig/frida-core-1.0.pc \
&& make build/frida-android-arm64/lib/pkgconfig/frida-core-1.0.pc