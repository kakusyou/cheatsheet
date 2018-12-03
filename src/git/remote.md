# git remote

如果本地仓库是从远程仓库克隆而来，则已经默认添加了该远程仓库，其名称为`origin`。

## 示例

```bash
git remote add <name> <url>
```

添加远程仓库。

```bash
git remote rename <old-name> <new-name>
```

重命名远程仓库。
所有的远程追踪分支都会被重命名。

```bash
git remote rm <name>
```

删除远程仓库。
所有的远程追踪分支等相关内容都会被删除。
