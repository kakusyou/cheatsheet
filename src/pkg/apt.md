# apt

命令参数中，`xyz`表示包名，`xyz.deb`表示deb文件名，请注意区分。

## 安装

```bash
apt-get install xyz
apt-get install xyz=0.1 # 安装指定版本
```

安装过程中的依赖问题会自动通过仓库解决。

```bash
apt-get upgrade # 更新所有已安装包
apt-get upgrade xyz # 更新指定包
```

更新。

```bash
apt-get remove xyz # 保留配置文件
apt-get purge xyz # 删除配置文件
```

卸载。

```bash
apt-get autoremove
```

删除那些为解决依赖而自动安装，并且已经不再需要的包。

## 查询

```bash
apt-cache search xyz # 在包名、包说明中搜索
apt-cache search --names-only xyz # 只在包名中搜索
```

在仓库中搜索包，非全字匹配，支持正则表达式。

```bash
apt-file list xyz
```

查询包内容列表。

```bash
apt-file search file
```

查询哪个包能提供指定文件。
只能指定文件，不能指定路径。

```bash
apt-cache depends xyz
```

查询包的依赖。

```bash
apt-cache rdepends xyz
```

查询被哪些包依赖。

```bash
apt-get build-dep xyz
```

一键安装编译该包所需的全部依赖。

## 仓库管理

```bash
apt-get update
```

更新仓库元数据缓存。
