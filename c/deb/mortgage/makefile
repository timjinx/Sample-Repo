CXX=gcc
GZIP=gzip
CP=/bin/cp
PNAME=mortgage
SRCS=${PNAME}.c
DPKG-DEB=/usr/bin/dpkg-deb
FLAGS="-lm"

${PNAME}.deb: ${PNAME}/usr/local/bin/${PNAME}
	$(DPKG-DEB) --build ${PNAME}
	rm -rf ${PNAME}/usr/local/bin

${PNAME}/usr/local/bin/${PNAME}: ${PNAME}.c
	mkdir -p ${PNAME}/usr/local/bin
	$(CXX) -o ${PNAME}/usr/local/bin/${PNAME} ${SRCS} ${FLAGS}

