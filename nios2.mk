
nios2_builddir = build/nios2
nios2_lib      = $(nios2_builddir)/libspiffs.a
nios2_cfiles   = $(filter spiffs_%.c,$(CFILES))
nios2_objfiles = $(nios2_cfiles:%.c=$(nios2_builddir)/%.o)

all: $(nios2_builddir) $(nios2_lib)

$(nios2_lib): $(nios2_objfiles)
	nios2-elf-ar -qc $@ $^

$(nios2_builddir)/%.o: $(sourcedir)/%.c
	nios2-elf-gcc $(COMPILEROPTIONS) -c -o $@ $<

$(nios2_builddir):
	$(MKDIR) $@

clean: clean.nios2

clean.nios2:
	rm -f $(nios2_lib) $(nios2_objfiles)

