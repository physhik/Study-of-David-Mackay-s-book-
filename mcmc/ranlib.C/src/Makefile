# MAKEFILE FOR ansi library.

CFLAGS = $(INCDIRS) \
            	 -ansi -pedantic -g \
		 -Wall -Wconversion -Wstrict-prototypes\
                 -Wformat -Wmissing-prototypes -Wshadow\
                 -Wpointer-arith -Wcast-qual -Wwrite-strings -O2 -funroll-loops
# to profile    gprof opt2
# to not profile, remove -pg here and below. 
#
# to optimize add -O2 -funroll-loops
CC = gcc


tst:		tst.o  ../src/ranlib.o ../src/com.o ../linpack/linpack.o
	$(CC) tst.o ../src/ranlib.o ../src/com.o ../linpack/linpack.o -lm -o tst

tst.o:	tst.c
tstgmn:		tstgmn.o  ../src/ranlib.o ../src/com.o ../linpack/linpack.o
	$(CC) tstgmn.o ../src/ranlib.o ../src/com.o ../linpack/linpack.o -lm -o tstgmn

tstgmn.o:	tstgmn.c
tstmid:		tstmid.o  ../src/ranlib.o ../src/com.o ../linpack/linpack.o
	$(CC) tstmid.o ../src/ranlib.o ../src/com.o ../linpack/linpack.o -lm -o tstmid

tstmid.o:	tstmid.c
tstbot:		tstbot.o  ../src/ranlib.o ../src/com.o ../linpack/linpack.o
	$(CC) tstbot.o ../src/ranlib.o ../src/com.o ../linpack/linpack.o -lm -o tstbot

tstbot.o:	tstbot.c
../src/ranlib.o:		../src/ranlib.c  		
	cd ../src; make ranlib.o
../src/com.o:		../src/com.c  		
	cd ../src; make com.o
../linpack/linpack.o:  ../linpack/linpack.c
	cd  ../linpack; make linpack.o

