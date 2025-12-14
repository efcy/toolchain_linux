# Berlin United Linux ToolChain
This docker image simplifies the use of our toolchain that is need to compile the Berlin United Code.

## Use existing docker image
```
docker pull ghcr.io/efcy/toolchain_linux:latest
```
switch to the root of the naoth-2020 repo and run
```
# for compiling local binaries
docker run -it -v $PWD:/code -w /code/NaoTHSoccer/Make/ ghcr.io/efcy/toolchain_linux:latest ./compile_linux_native.sh

# for compiling for the robot:
docker run -it -v $PWD:/code -w /code/NaoTHSoccer/Make/ ghcr.io/efcy/toolchain_linux:latest ./compileGame.sh
```

## Build the docker image yourself 
You can build this with
```
docker build -t toolchain_linux --progress=plain -f Dockerfile .
```

switch to the root of the naoth-2020 repo and run
```
# for compiling local binaries
docker run -it -v $PWD:/code -w /code/NaoTHSoccer/Make/ toolchain_linux:latest ./compile_linux_native.sh

# for compiling for the robot:
docker run -it -v $PWD:/code -w /code/NaoTHSoccer/Make/ toolchain_linux:latest ./compileGame.sh
```

NOTE: The docker based approach only works if you dont have a `projectconfig.user.lua` in your `<naoth-2020>/NaoTHSoccer/Make` folder