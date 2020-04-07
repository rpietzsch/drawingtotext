FROM alpine
 
RUN apk --update add gcc make g++ zlib-dev autoconf automake libtool python-dev swig texinfo curl

COPY . /tmp/dwgtotext/

WORKDIR /tmp/dwgtotext/libredwg/
RUN sh autogen.sh
RUN ./configure --enable-trace
RUN make
RUN make install

WORKDIR /tmp/dwgtotext/dxflib/
RUN ./configure
RUN make
RUN make install

WORKDIR /tmp/dwgtotext/
#RUN ldconfig 
RUN make
RUN mv drawingtotext /usr/local/bin/ && chmod +x /usr/local/bin/drawingtotext
