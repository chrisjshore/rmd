# rmd

The Linux command rmdir cannot recursively delete directories, this program can.  Plus rm -r is too much to type and remember.

## Compiling

Run the below command to compile the program.

```bash
ldc2 rmd.d
```

For better optimization, compile using the below options.

```bash
ldc2 -O3 -release rmd.d
```

## Test it out

Run the shell script to create some dummy directories and files.

```bash
chmod +x stage.sh
./stage.sh
./rmd dir
```