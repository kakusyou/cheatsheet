# git branch

## 示例

```bash
git branch # 列出本地分支，当前分支用'*'标记
git branch -r # 列出远程分支
git branch -a # 列出本地及远程分支
git branch -v # 列出各分支最新提交及其与上游分支的差异
git branch -vv # 在-v的基础上再列出上游分支名
```

列出分支信息。

```bash
git branch <new-branch> # 在当前分支处创建<new-branch>分支
git branch <new-branch> <rev> # 在<rev>提交处创建<new-branch>分支
```

创建新分支但不检出。

```bash
git branch -t <new-branch> <upstream>
```

在<upstream\>处创建<new-branch\>分支，同时将<upstream\>设置为其上游分支。

```bash
git branch -m <new-name> # 将当前分支重命名为<new-name>
git branch -m <old-name> <new-name> # 将<old-name>分支重命名为<new-name>
```

分支重命名。

```bash
git branch -u <upstream> # 将<upstream>设置为当前分支的上游分支
git branch -u <upstream> <branch> # 将<upstream>设置为<branch>分支的上游分支
```

设置上游分支。上游分支必须已存在，通常是远程追踪分支，但也可以是本地分支。

```bash
git branch --unset-upstream # 取消当前分支的上游分支
git branch --unset-upstream <branch> # 取消<branch>分支的上游分支
```

取消上游分支。

```bash
git branch -d <branch>
```

删除<branch\>分支。
如果该分支上有未合并到其它分支的提交，则删除失败。

```bash
git branch -D <branch>
```

**强制**删除<branch\>分支，丢弃未合并到其它分支的提交。
