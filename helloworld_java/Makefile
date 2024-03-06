JAVA_VER ?= 11
ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

# control log level
ifeq ($(DEBUG),1)
GRAMINE_LOG_LEVEL = debug
else
GRAMINE_LOG_LEVEL = error
endif

# control manifest creation for running outside of and within SGX enclave
.PHONY: all
all: java.manifest
ifeq ($(SGX),1)
all: java.manifest.sgx java.sig
endif

java.manifest: java.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Djava_dir=$(JAVA_VER) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

# mandatory configuration for running executable in SGX enclave
java.sig java.manifest.sgx: sgx_sign
	@:

.INTERMEDIATE: sgx_sign
sgx_sign: java.manifest java
	gramine-sgx-sign \
		--manifest $< \
		--output $<.sgx

.PHONY: clean
clean:
	$(RM) *.token *.sig *.manifest *.manifest.sgx
