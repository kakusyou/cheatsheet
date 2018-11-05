# readlink

## 功能

打印符号链接实际指向的文件。

## 示例

```bash
readlink /usr/bin/java
```

打印`/usr/bin/java`指向的目标文件。
如果文件不是符号链接，则什么也不打印。

```bash
readlink -f /usr/bin/java
```

如果文件不是符号链接，则直接打印当前文件。
如果目标文件也是符号链接，则继续查找直到最终文件。

```bash
readlink /proc/<pid>/exe
```

结合`proc`文件系统可以根据`pid`查找可执行文件路径。
