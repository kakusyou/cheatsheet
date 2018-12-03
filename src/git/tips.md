# git tips

## 关闭路径转义

Git默认将路径中大于0x80的字节转义，导致中文路径不能正常显示。

如“中”字转义成：

> \344\270\255

关闭路径转义即可正常显示中文。

```bash
git config --global core.quotepath false
```

## 全局gitignore文件

对于私有的文件忽略规则，不想放到版本库的`.gitignore`文件中，可以配置到全局忽略规则中。

```bash
git config --global core.excludesfile <ignore-file-path>
```

## 统计某人代码量

```bash
git log --author=<name> --pretty=tformat: --numstat | awk '{ add += $1; subs += $2 } END { printf "add: %s, remove: %s\n", add, subs }'
```

## 获取当前分支名

```bash
git symbolic-ref --short -q HEAD
```
