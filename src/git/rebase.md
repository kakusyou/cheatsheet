# git rebase

## 示例

```bash
git rebase
```

将当前分支变基到上游分支。

```bash
git rebase <upstream>
```

将当前分支变基到<upstream\>分支。

```bash
git rebase <upstream> <branch>
```

将<branch\>分支变基到<upstream\>分支。
如果<branch\>不是当前分支，则会先自动checkout再rebase。

```bash
git rebase -i
```

交互式变基。
可以在变基过程中合并、删除、更改提交。

```bash
git rebase --continue
git rebase --skip
git rebase --abort
```

当变基操作因为冲突而暂停时，可以继续、跳过或取消变基。
