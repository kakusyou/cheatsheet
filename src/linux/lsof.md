# lsof

## 功能

列出打开的文件及其相关信息，所谓文件包括普通文件、目录、块设备、网络套接字等。

建议以`root`身份运行以获得更多信息，能更方便地分析资源占用问题。

## 示例

```bash
lsof test.txt
```

列出test.txt的打开情况。

```bash
lsof -u root
```

列出root用户打开的文件。

```bash
lsof -a -u root -d txt
```

列出root用户打开的程序文件。

```bash
lsof +d .
```

列出当前目录下打开的文件。

```bash
lsof -ni :80
```

列出80端口打开情况，`-n`禁用ip到name的转换，加快执行速度。

```bash
lsof -ni :ftp
```

列出ftp服务打开情况。

## 输出说明

`lsof`输出如下所示：

```bash
COMMAND    PID    USER     FD    TYPE    DEVICE    SIZE/OFF    NODE NAME
init         1    root    cwd     DIR     253,0        4096       2 /
```

各列的含义如下：

+ **COMMAND**: 进程名，默认显示前9个字符，可用`+c w`选项设为显示前`w`个字符
+ **PID**: 进程ID
+ **USER**: 进程所属用户
+ **FD**: 文件描述符，如：
    - `cwd`: 工作目录
    - `txt`: 程序文件(text)
    - `mem`: 内存映射文件
+ **TYPE**: 文件类型，如：
    - `DIR`: 目录
    - `REG`: 普通文件
    - `sock`: socket
+ **DEVICE**: 设备
+ **SIZE/OFF**: 文件大小/偏移
+ **NODE**: 对于磁盘文件是inode，对于socket文件是TCP/UDP
+ **NAME**: 文件名，对于普通文件是路径，对于socket文件是网络地址

## 用法

> lsof [<options\>] [ -- ] [<names\>]

所有参数都是可选的，不加参数地使用`lsof`会列出所有打开的文件，如果只想列出特定的文件，可以使用参数来筛选。

+ **names**: 列出指定文件，若有多个则是或的关系，若指定挂载点，则列出文件系统中所有打开的文件
+ **-u user**: 列出指定用户打开的文件
+ **-d fdset**：指定逗号分隔的描述符集合，列出符合的文件。(描述符指输出中的`FD`列)
+ **+d s**：列出指定目录下的文件
+ **+D s**: 列出指定目录下的文件，并递归列出子目录
+ **-a**: 对指定的多个条件执行与运算，否则是或运算
+ **-i**: 列出指定的socket文件，文件名格式为`[46][protocol][@hostname|hostaddr][:service|port]`
    - **46**: IPv4/IPv6
    - **protocol**: TCP/UDP
    - **hostname**: 主机名
    - **hostaddr**: IP地址
    - **service**: 网络服务名，可以是逗号分隔的多个值，取值列表详见`/etc/services`
    - **port**: 端口号，可以是逗号分隔的多个值
+ **-n**: 不进行网络地址到名称的转换，可加快执行速度
