# Write a Makefile which includes:
# - A default target which builds the “writer” application
# - A clean target which removes the “writer” application and all .o files
# - Support for cross-compilation.  You should be able to generate an application 
#   for the native build platform when GNU make variable CROSS_COMPILE is not
#   specified on the make command line.  When CROSS_COMPILE is specified with 
#   aarch64-none-linux-gnu- (note the trailing -)your makefile should compile 
#   successfully using the cross compiler installed in step 1.

default: writer.c
ifdef CROSS_COMPILE
ifneq (,$(findstring aarch64-none-linux-gnu-,$(CROSS_COMPILE)))
	aarch64-none-linux-gnu-gcc writer.c -o writer_cc
else
	echo "The value given for CROSS_COMPILE, ${CROSS_COMPILE}, is invalid"
endif
else
	cc writer.c -o writer
endif

clean:
	rm -f writer writer_cc
