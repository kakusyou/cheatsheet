# git commit

## 示例

```bash
git commit -m <msg>
```

提交到HEAD。必须先暂存要提交的变更。

```bash
git commit -a -m <msg>
git commit --all -m <msg>
```

自动暂存所有变更并提交，但未跟踪的文件除外。

```bash
git commit --amend -m <msg>
```

修补提交。

```bash
git commit --amend --no-edit
```

修补提交，不修改消息。
