# yum

命令参数中，`xyz`表示包名，`xyz.rpm`表示rpm文件名，请注意区分。

## 安装

```bash
yum install xyz # 从仓库安装包
yum localinstall xyz.rpm # 安装本地rpm文件
```

安装过程中的依赖问题会自动通过仓库解决。

```bash
yum update # 更新所有已安装包
yum update xyz # 更新指定包
```

更新。

```bash
yum remove xyz
```

卸载。

## 查询

```bash
yum search xyz # 在包名、包说明中搜索。
```

在仓库中搜索包，非全字匹配。

```bash
yum provides '*/addr2line'
```

查询哪个包能提供指定文件或特性。
3.0.x版yum的匹配有问题，必须使用通配符路径。

该命令同时搜索已安装包及仓库。
想安装某个命令但不知道包名时可以进行查询。

```bash
yum deplist xyz
```

查询包的依赖。

```bash
yum list installed # 列出已安装包
yum list available # 列出仓库中可用包
```

列出相关包。

## 仓库管理

```bash
yum repolist [enable] # 列出所有可用仓库
yum repolist base # 列出base仓库的信息
yum repolist -v base # 列出base仓库的详细信息
yum repolist disable # 列出所有不可用仓库
yum repolist all # 列出所有仓库信息
```

列出仓库信息。

```bash
yum clean packages # 清空已下载的包
yum clean metadata # 清空元数据
yum clean all # 清空所有内容
```

清空仓库元数据缓存。

```bash
yum makecache
```

更新仓库元数据缓存。

```bash
yum check dependencies # 检查是否有缺失的依赖
yum check duplicates # 检查重复的包
yum check # 运行所有检查项
```

检查仓库相关内容。
