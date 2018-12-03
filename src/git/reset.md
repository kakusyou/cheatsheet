# git reset

## 示例

```bash
git reset
```

将索引重置为HEAD版本，工作区不变，相当于撤销所有暂存。

```bash
git reset -- <path>
```

将索引中的<path\>路径重置为HEAD版本，工作区不变，相当于撤销指定路径的暂存。

这是`reset`的特殊形式，除路径外，不能同时指定其它参数。

```bash
git reset --hard
```

将索引和工作区重置为HEAD版本，恢复到干净状态。

```bash
git reset <rev>
```

将当前分支和索引重置为<rev\>提交，但工作区不变。

```bash
git reset --soft <rev>
git reset --mixed <rev>
git reset --hard <rev>
```

指明在重置分支时如何对待索引及工作区：

+ --soft: 索引和工作区保持不变。
+ **--mixed**: 默认值。重置索引，工作区不变。
+ --hard: 重置索引和工作区，未提交的修改会丢失。
