#### Assemble code into binary
```
nasm -f bin ./boot.asm -o ./boot.bin
```

#### Run in QEMU
```
qemu-system-x86_64 -hda ./boot.bin -nographic
```

