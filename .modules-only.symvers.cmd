cmd_modules-only.symvers := sed 's/\.ko$$/.lto\.o/' modules.order | scripts/mod/modpost -m  -E -o modules-only.symvers -i vmlinux.symvers   -T -
