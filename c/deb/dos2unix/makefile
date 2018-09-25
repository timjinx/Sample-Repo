CXX=gcc
PNAME=dos2unix
SRCS=${PNAME}.c
DPKG-DEB=/usr/bin/dpkg-deb

${PNAME}: ${PNAME}/usr/local/bin/${PNAME}
	$(DPKG-DEB) --build dos2unix
	rm -rf ${PNAME}/usr/local/bin

${PNAME}/usr/local/bin/${PNAME}: ${PNAME}.c
	mkdir -p ${PNAME}/usr/local/bin
	$(CXX) -o ${PNAME}/usr/local/bin/${PNAME} ${SRCS}
