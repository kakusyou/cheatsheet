# 逻辑卷管理器

## 常用命令

```bash
pvcreate /dev/sdb1
```

在/dev/sdb1分区上创建物理卷。

```bash
pvdisplay [/dev/sdb1]
```

显示已有物理卷，参数可选，若指定分区，则只显示该分区上的物理卷。

```bash
vgcreate <vgname> /dev/sdb1[,/dev/sdc1]...
```

创建物理卷组，`vgname`是自定义卷组名，后接多个要加入该组的物理卷或者分区，如果指定的是未曾创建物理卷的分区，则自动使用`pvcreate`创建物理卷。

## 从物理裸磁盘创建逻辑卷

一般操作步骤如下：

1. 磁盘分区

    使用`parted`等工具给磁盘分区，分区需要打上`lvm`标记。

    parted /dev/sdb

1. 创建物理卷

    pvcreate /dev/sdb1 ...

1. 创建物理卷组

    vgcreate tank /dev/sdb1 ...

    tank为物理卷组名，可自定义。

1. 激活物理卷组

    vgchange -ay tank

1. 创建逻辑卷

    lvcreate -l 1234 -n data1 tank

    大小为1024个PE（PE为物理卷最小分配单位），名字data1。
    若要使用MB/GB等单位，用-L1024m。

1. 格式化并挂载

    `/dev/mapper/tank-data1`即最终的逻辑卷，可像普通分区一样格式化及挂载。
