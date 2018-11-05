# git tips

## 常用命令

```bash
git config --global core.quotepath false
```

关闭git的路径转义，防止中文被转义显示（如“中”显示成“\344\270\255”）。

```bash
git config --global core.excludesfile <ignore-file-path>
```

配置全局`.gitignore`文件，定制私有的忽略规则，不需要放到版本库中。

```bash
git log --author="your_name_here" --pretty=tformat: --numstat | awk '{ add += $1; subs += $2 } END { printf "add: %s, remove: %s\n", add, subs }'
```

统计某人代码量。

```bash
git symbolic-ref --short -q HEAD
```

查看当前分支名。
