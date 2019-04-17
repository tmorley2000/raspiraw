CROSS_COMPILE ?=

CC	:= $(CROSS_COMPILE)gcc
#CFLAGS ?= -I/opt/vc/include -pipe -W -Wall -Wextra -g -O0
CFLAGS ?= -I/opt/vc/include -pipe -W -Wall -Wextra -g -O3 -mcpu=cortex-a53 -mfloat-abi=hard -mfpu=neon-fp-armv8 -mneon-for-64bits -mtune=cortex-a53
LDFLAGS	?=
LIBS	:= -L/opt/vc/lib -lrt -lbcm_host -lvcos -lmmal_core -lmmal_util -lmmal_vc_client -lvcsm

%.o : %.c
	$(CC) $(CFLAGS) -c -o $@ $<

all: raspiraw

raspiraw: raspiraw.o RaspiCLI.o
	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)

clean:
	-rm -f *.o
	-rm -f raspiraw

