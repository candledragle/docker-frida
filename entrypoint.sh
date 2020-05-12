#!/bin/bash

cd /root \
&& mv /etc/apt/sources.list /etc/apt/sources.list.back \
&& echo "deb https://mirrors.aliyun.com/debian  stable main contrib non-free"> /etc/apt/sources.list \
&& echo "deb https://mirrors.aliyun.com/debian  stable-updates main contrib non-free" >> /etc/apt/sources.list \
&& apt-get update \
&& wget -O android-ndk-r21b.zip https://dl.google.com/android/repository/android-ndk-r21b-linux-x86_64.zip \
&& unzip android-ndk-r21b.zip \
&& rm -f android-ndk-r21b.zip \
&& export ANDROID_NDK_ROOT=${PWD}/android-ndk-r21b \
&& update-alternatives --install /usr/bin/python python /usr/bin/python2.7 20 \
&& update-alternatives --install /usr/bin/python python /usr/bin/python3.7 30 \
&& apt-get install -y git flex bison \
&& git clone --recurse-submodules https://github.com/frida/frida \
&& cd frida \
&& make build/frida-android-arm/lib/pkgconfig/frida-core-1.0.pc \
&& make build/frida-android-arm64/lib/pkgconfig/frida-core-1.0.pc \
&& DESTDIR=/frida_out
&& make build/frida-android-arm/lib/pkgconfig/frida-core-1.0.pc \
&& make build/frida-android-arm64/lib/pkgconfig/frida-core-1.0.pc