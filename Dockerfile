FROM node:14-buster-slim

WORKDIR /opt/

RUN echo "Installing packages...\n" && \
	export DEBIAN_FRONTEND="noninteractive" && \
	echo 'deb http://deb.debian.org/debian buster-backports main' >> /etc/apt/sources.list && \
	apt-get update -y && \
	apt-get install --no-install-recommends -y -q \
		ca-certificates git pkg-config \
		autoconf automake build-essential checkinstall libtool-bin usbmuxd \
		libusb-dev libusb-1.0-0-dev libtool libssl-dev \
		&& \
	echo "packages has been installed.\n" || exit 1 && \
	apt-get clean
	
RUN echo "Installing latest of libplist...\n" && \
	git clone https://github.com/libimobiledevice/libplist.git && \
	cd libplist && \
	./autogen.sh --without-cython && \
	make && \
	make install && \
	cd .. && \
	rm -rf libplist/
	
RUN echo "Installing latest of libusbmuxd...\n" && \
	git clone https://github.com/libimobiledevice/libusbmuxd.git && \
	cd libusbmuxd && \
	./autogen.sh --without-cython && \
	make && \
	make install && \
	ldconfig && \
	cd .. && \
	rm -rf libusbmuxd/
	
RUN echo "Installing latest of libimobiledevice...\n" && \
	git clone https://github.com/libimobiledevice/libimobiledevice.git && \
	cd libimobiledevice && \
	./autogen.sh && \
	make && \
	make install && \
	ldconfig && \
	cd .. && \
	rm -rf libimobiledevice/
	
RUN echo "Installing latest of usbmuxd...\n" && \
	git clone https://github.com/libimobiledevice/usbmuxd.git && \
	cd usbmuxd && \
	./autogen.sh && \
	make && \
	make install && \
	ldconfig && \
	cd .. && \
	rm -rf usbmuxd/

RUN echo "Installing latest of ios-webkit-debug-proxy...\n" && \
	git clone https://github.com/google/ios-webkit-debug-proxy.git && \
	cd ios-webkit-debug-proxy && \
	./autogen.sh && \
	make && \
	make install && \
	ldconfig && \
	cd .. && \
	rm -rf ios-webkit-debug-proxy/

RUN echo "Installing latest of remotedebug-ios-webkit-adapter...\n" && \
	npm install remotedebug-ios-webkit-adapter -g && \
	npm cache clean --force 

EXPOSE 8080

ENTRYPOINT ["remotedebug_ios_webkit_adapter", "--port=8080"]
