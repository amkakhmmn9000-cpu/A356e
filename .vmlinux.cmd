cmd_vmlinux := sh scripts/link-vmlinux.sh "ld.lld" "-EL  -maarch64elf -z norelro --thinlto-cache-dir=.thinlto-cache -mllvm -import-instr-limit=5 -z noexecstack" "--no-undefined -X -shared -Bsymbolic -z notext  --no-apply-dynamic-relocs --fix-cortex-a53-843419 --build-id=sha1 --pack-dyn-relocs=relr --use-android-relr-tags --orphan-handling=warn";  make -f ./arch/arm64/Makefile.postlink vmlinux

source_vmlinux := scripts/link-vmlinux.sh

deps_vmlinux := \
    $(wildcard include/config/LTO_CLANG) \
    $(wildcard include/config/MODVERSIONS) \
    $(wildcard include/config/STACK_VALIDATION) \
    $(wildcard include/config/UNWINDER_ORC) \
    $(wildcard include/config/FTRACE_MCOUNT_USE_OBJTOOL) \
    $(wildcard include/config/VMLINUX_VALIDATION) \
    $(wildcard include/config/CPU_UNRET_ENTRY) \
    $(wildcard include/config/FRAME_POINTER) \
    $(wildcard include/config/GCOV_KERNEL) \
    $(wildcard include/config/RETPOLINE) \
    $(wildcard include/config/X86_SMAP) \
    $(wildcard include/config/SLS) \
    $(wildcard include/config/VMLINUX_MAP) \
    $(wildcard include/config/CPU_BIG_ENDIAN) \
    $(wildcard include/config/KALLSYMS_ALL) \
    $(wildcard include/config/KALLSYMS_ABSOLUTE_PERCPU) \
    $(wildcard include/config/KALLSYMS_BASE_RELATIVE) \
    $(wildcard include/config/SHELL) \
    $(wildcard include/config/DEBUG_INFO_BTF) \
    $(wildcard include/config/KALLSYMS) \
    $(wildcard include/config/BPF) \
    $(wildcard include/config/BUILDTIME_TABLE_SORT) \
    $(wildcard include/config/CRYPTO_SKC_FIPS) \

vmlinux: $(deps_vmlinux)

$(deps_vmlinux):
