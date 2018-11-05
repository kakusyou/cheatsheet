# CHM

CHM格式只能在Windows下发布，且需要安装如下工具：

+ [Pandoc](http://www.pandoc.org/)
    将Markdown文件转换成HTML文件。
+ [HTML Help Workshop](https://www.microsoft.com/en-us/download/details.aspx?id=21138)
    将HTML文件编译成CHM文件。
+ Make
    管理构建过程。

其中，Make没有Windows版，需要先在Windows上安装一个Linux模拟环境。

Windows 7建议安装[msys2](http://www.msys2.org/)，
Windows 10建议安装[WSL](https://docs.microsoft.com/zh-cn/windows/wsl/install-win10)。

将工具可执行文件的路径加入环境变量后，执行如下命令进行发布：

```bash
$ cd build
$ make chm
```

执行成功后，CHM文件位于`build/out/cheatsheet.chm`。
