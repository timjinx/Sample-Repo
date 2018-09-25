CXX=/usr/bin/g++
GZIP=gzip
CP=/bin/cp
PNAME=mortgage
SRCS=${PNAME}.cpp
DPKG-DEB=/usr/bin/dpkg-deb
FLAGS=

${PNAME}.deb: ${PNAME}/usr/local/bin/${PNAME}
	$(DPKG-DEB) --build ${PNAME}
	rm -rf ${PNAME}/usr/local/bin

${PNAME}/usr/local/bin/${PNAME}: ${PNAME}.cpp
	mkdir -p ${PNAME}/usr/local/bin
	$(CXX) -o ${PNAME}/usr/local/bin/${PNAME} ${SRCS} ${FLAGS}

