GPPPRAMS = -m32
ASPRAMS = --32
LDPARAMS = -melf_i386

objects = loader.o kernel.o

%.o: %.cpp
	g++ ${GPPPRAMS} -o $@ -c $<

%.o: %.s
	as ${ASPRAMS} -o $@ $<

mykernel.bin: linker.ld ${objects}
	ld ${LDPARAMS} -T $< -o $@ ${objects}

install: mykernel.bin
	sudo cp $< /boot/mybernel.bin
