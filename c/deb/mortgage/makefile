CXX=gcc
PNAME=mortgage
SRCS=${PNAME}.c
DPKG-DEB=/usr/bin/dpkg-deb
FLAGS="-lm"

${PNAME}.deb: ${PNAME}/usr/local/bin/${PNAME}
	$(DPKG-DEB) --build ${PNAME}

${PNAME}/usr/local/bin/${PNAME}: ${PNAME}.c
	$(CXX) -o ${PNAME}/usr/local/bin/${PNAME} ${SRCS} ${FLAGS}

