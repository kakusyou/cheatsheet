# git checkout

## 示例

```bash
git checkout <branch> # 索引或工作区有修改时不能切换
git checkout -m <branch> # 索引或工作区有修改时合并到目标分支
```

切换到<branch\>分支，使之成为当前分支。

```bash
git checkout -- <path>
```

从索引签出<path\>路径，通常用于撤销工作区的修改。

```bash
git checkout <rev> -- <path>
```

从<rev\>版本签出<path\>路径，索引及工作区的修改都会被覆盖。

```bash
git checkout -b <new-branch> <rev>
```

在<rev\>提交处创建<new-branch\>分支，并签出。

```bash
git checkout -b <new-branch> <branch>
```

在<branch\>分支处创建<new-branch\>分支，并签出。

```bash
git checkout @~
git checkout dae86e
```

签出指定版本，进入`DETACHED HEAD`模式。
此时，HEAD指向的不是分支，而是提交ID，因此不能执行提交操作。
