# parted

## 示例

使用`parted /dev/sdb`命令进入交互式界面，对指定硬盘分区。

```bash
mktable gpt
```

创建`gpt`分区表。

```bash
mkpart xfs 2048s 100%
```

从2048扇区到硬盘末尾划分为一个分区，文件系统为xfs。
从2048s开始是为了分区对齐，不同硬盘值可能不同。

```bash
toggle lvm
```

打上特殊分区标记，如`lvm`用的分区。
