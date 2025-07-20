export TOPDIR	:=	$(CURDIR)

export LIBFAT_MAJOR	:= 1
export LIBFAT_MINOR	:= 2
export LIBFAT_REVISION	:= 0

VERSION	:=	$(LIBFAT_MAJOR).$(LIBFAT_MINOR).$(LIBFAT_REVISION)

.PHONY: release debug clean all

all: include/libfatversion.h release debug

include/libfatversion.h : Makefile
	@echo "#ifndef __LIBFATVERSION_H__" > $@
	@echo "#define __LIBFATVERSION_H__" >> $@
	@echo >> $@
	@echo "#define LIBFAT_MAJOR    $(LIBFAT_MAJOR)" >> $@
	@echo "#define LIBFAT_MINOR    $(LIBFAT_MINOR)" >> $@
	@echo "#define LIBFAT_REVISION $(LIBFAT_REVISION)" >> $@
	@echo >> $@
	@echo '#define _LIBFAT_STRING "libFAT Release '$(LIBFAT_MAJOR).$(LIBFAT_MINOR).$(LIBFAT_PATCH)'"' >> $@
	@echo >> $@
	@echo "#endif // __LIBFATVERSION_H__" >> $@


#-------------------------------------------------------------------------------
release: lib
#-------------------------------------------------------------------------------
	echo $(LIBNDS)
	$(MAKE) -C arm9 BUILD=release

#-------------------------------------------------------------------------------
debug: lib
#-------------------------------------------------------------------------------
	$(MAKE) -C arm9 BUILD=debug

#-------------------------------------------------------------------------------
lib:
#-------------------------------------------------------------------------------
	mkdir lib

#-------------------------------------------------------------------------------
clean:
#-------------------------------------------------------------------------------
	@$(MAKE) -C arm9 clean
	@$(RM) -r include/libfatversion.h lib

