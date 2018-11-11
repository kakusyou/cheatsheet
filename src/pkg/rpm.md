# rpm

命令参数中，`xyz`表示包名，`xyz.rpm`表示rpm文件名，请注意区分。

## 安装

```bash
rpm -ivh xyz.rpm
rpm -ivh --nodeps xyz.rpm # 跳过依赖检查
rpm -ivh --force xyz.rpm # 强制覆盖安装
```

安装。

```bash
rpm -Uvh xyz.rpm
rpm -Uvh --nodeps xyz.rpm # 跳过依赖检查
```

更新。

```bash
rpm -e xyz
rpm -e --nodeps xyz # 跳过依赖检查
```

卸载。

## 查询

```bash
rpm -qa # 列出所有已安装包
rpm -qa xyz # 列出指定已安装包
```

列出已安装的包名。

```bash
rpm -ql xyz # 查询已安装包的内容列表
rpm -qlp xyz.rpm # 查询rpm文件的内容列表
```

查询包中内容列表。

```bash
rpm -q --whatprovides /path/to/file
```

*存疑*。查询哪个包能提供指定文件或特性。

```bash
rpm -qf /path/to/file
```

查询已安装文件或特性来自哪个包。

```bash
rpm -qR xyz # 查询已安装包依赖
rpm -qRp xyz.rpm # 查询rpm文件依赖
```

查询包的依赖。

```bash
rpm -q --whatrequires glibc # 按包名查询
rpm -q --whatrequires libc.so.6 # 按包内容查询
```

在已安装包中查询被哪些包依赖。

## rpm解包

```bash
rpm2cpio xyz.rpm | cpio -div # 解压到当前目录
rpmdev-extract xyz.rpm # 解压到同名目录
```

解开rpm包中的内容。
