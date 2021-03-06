FROM python:2.7
MAINTAINER nasuno@ascade.co.jp

# RUN apt-get update && apt-get -y install make gcc

ADD http://fantom.gsc.riken.jp/5/suppl/rRNAdust/rRNAdust1.02.tgz /
RUN tar zxf rRNAdust1.02.tgz
RUN cd rRNAfilter && sed -i 's/\$(CC) \$(CFLAGS) \$(LD) \$(OBJECTS) -o \$(PROGS)/\$(CC) -o \$(PROGS) \$(OBJECTS) \$(CFLAGS) \$(LD)/' Makefile
RUN cd rRNAfilter; make && mv rRNAdust /usr/local/bin/
RUN rm -rf rRNAdust1.02.tgz rRNAfilter

ADD http://kirill-kryukov.com/study/tools/fastq-splitter/fastq-splitter-0.1.2.zip /
RUN zcat fastq-splitter-0.1.2.zip > /usr/local/bin/fastq-splitter.pl && chmod +x /usr/local/bin/fastq-splitter.pl
RUN rm fastq-splitter-0.1.2.zip
