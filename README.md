# Berlin United Linux ToolChain

You can build this with
```
docker build -t toolchain_linux --progress=plain -f Dockerfile .
```

then use it in the naoth repo path like this:

```
docker run -it -v $PWD:/code -w /code/NaoTHSoccer/Make/ toolchain_linux ./compile_linux_native.sh
```

Note: you need to be in a folder that has `NaoTHSoccer` as subfolder