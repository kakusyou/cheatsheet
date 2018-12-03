# git diff

## 示例

```bash
git diff
```

比较索引与工作区。

```bash
git diff --cached
git diff --staged
```

比较HEAD与索引。

```bash
git diff -- <path>
```

只比较<path\>路径。

```bash
git diff <rev1> <rev2>
```

比较<rev1\>和<rev2\>两个版本。

```bash
git diff <rev>
```

比较<rev\>版本与HEAD。

```bash
git diff --ignore-space-at-eol
```

比较时忽略行尾空白字符的差异。

```bash
git diff --stat
git diff --numstat
```

不比较内容，而是输出一个变更统计。
`--numstat`的输出更加机器友好，便于自动化处理。
