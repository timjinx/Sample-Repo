CXX=gcc
SRCS=dos2unix.c
DPKG-DEB=/usr/bin/dpkg-deb

dos2unix.deb: dos2unix/usr/local/bin/dos2unix
	$(DPKG-DEB) --build dos2unix

dos2unix/usr/local/bin/dos2unix: dos2unix.c
	$(CXX) -o dos2unix/usr/local/bin/dos2unix ${SRCS}
