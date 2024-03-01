JFLAGS = -Wall
JC = javac
WARN = -Wall

# control log level
ifeq ($(DEBUG),1)
GRAMINE_LOG_LEVEL = debug
JFLAGS += -g
else
GRAMINE_LOG_LEVEL = error
JFLAGS += -03
endif

# control manifest creation for running outside of and within SGX enclave
.PHONY: all
all: helloworld helloworld.manifest
ifeq ($(SGX),1)
all: helloworld.manifest.sgx helloworld.sig
endif

helloworld: helloworld.class
	java helloworld

helloworld.class: helloworld.java
	$(JC) $(JFLAGS) helloworld.java

helloworld.manifest: helloworld.manifest.template
	gramine-manifest \
		-Dlog_level=$(GRAMINE_LOG_LEVEL) \
		-Darch_libdir=$(ARCH_LIBDIR) \
		$< > $@

# mandatory configuration for running executable in SGX enclave
helloworld.sig helloworld.manifest.sgx: sgx_sign
	@:

.INTERMEDIATE: sgx_sign
sgx_sign: helloworld.manifest helloworld
	gramine-sgx-sign \
		--manifest $< \
		--output $<.sgx

.PHONY: clean
clean:
	$(RM) *.token *.sig *.manifest *.manifest.sgx *.class
