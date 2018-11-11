# dpkg

命令参数中，`xyz`表示包名，`xyz.deb`表示deb文件名，请注意区分。

## 安装

```bash
dpkg -i xyz.deb
```

安装。

```bash
dpkg -r xyz # 保留配置文件
dpkg -P xyz # 删除配置文件
```

卸载。

## 查询

```bash
dpkg -l # 列出所有已安装包
dpkg -l xyz # 列出指定的已安装包
```

列出已安装包的状态。

```bash
dpkg -L xyz # 查询已安装包的内容列表
dpkg -c xyz.deb # 查询deb文件的内容列表
```

查询包中内容列表。

```bash
dpkg -S /path/to/file
```

查询已安装文件来自哪个包。

```bash
dpkg -I xyz.deb | grep 'Depends'
```

查询deb文件的依赖。

```bash
dpkg -s xyz # 查看已安装包信息
dpkg -I xyz.deb # 查看deb文件信息
```

列出包信息，如名称、大小、版本、依赖等。

## deb重打包

如果需要对deb包进行一些简单地定制，可以不从源码重新构建，
而是直接将现有deb包解包修改后再打包。

1. 建立工作目录

    ```bash
    mkdir -p extract/DEBIAN
    mkdir build
    ```

1. 解压包文件到extract目录下

    ```bash
    dpkg-deb -X debfile extract/
    ```

1. 解压控制信息到extract/DEBIAN/目录下

    ```bash
    dpkg-deb -e debfile extract/DEBIAN/
    ```

1. 进行所需修改

    如修改ssh包默认配置：

    ```bash
    sed -i 's/PermitRootLogin yes/PermitRootLogin no/g' extract/etc/ssh/sshd_config
    ```

    如修改依赖关系：

    ```bash
    # 编辑控制文件中定义的依赖
    vim extract/DEBIAN/control
    ```

1. 重新打包到build目录下

    ```bash
    dpkg-deb -b extract/ build/
    ```
