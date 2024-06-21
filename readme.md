# Dot Net To JScript and HTA using Docker

Csharp code convert to JScript and MSHTA from docker

Edit from https://github.com/tyranid/DotNetToJScript

## Build Docker
```
sudo docker build -t dotnet2jscript_hta .
```

## Edit TestClass.cs
```
cp TestClass.cs_template TestClass.cs
```

Edit the content, if you need to execute shellcode, the shellcode must be 64 bit!!


## Run Docker
```
sudo docker run -it --rm -v $(pwd):/app/ExampleAssembly dotnet2jscript_hta
```

The result will in output folder.

