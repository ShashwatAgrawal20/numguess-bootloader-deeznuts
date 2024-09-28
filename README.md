# A shitty number guessing game

### Run the Code
1. Generates a 512 byte long binary
```bash
nasm -f bin ./game.asm
```

2. Qemu
here we are specifying our binary as a hard disk
```bash
qemu-system-x86_64 -hda ./game
```

### Example Output
![Output](./output.png)
