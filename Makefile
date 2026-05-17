CC ?= $(CROSS_COMPILE)gcc
CFLAGS ?= -O2 -fPIC
LDFLAGS ?=
O ?= build

all: $(O)/libhello.so.1.0

$(O)/libhello.so.1.0: $(O)/hello-lib.o
	$(CC) $(CFLAGS) $(LDFLAGS) -shared -Wl,-soname=libhello.so.1 -o $@ $^

$(O)/%.o: %.c
	mkdir -p $(O)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(O)
