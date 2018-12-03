# git push

## 示例

```bash
git push
```

推送当前分支到上游分支。

```bash
git push origin
```

推送当前分支到origin仓库的同名分支。

```bash
git push origin master
```

推送master到origin仓库的同名分支。

```bash
git push -u origin master
```

`-u`表示推送成功后，将origin/master设置为master的上游分支。

```bash
git push origin master:dev
```

推送master分支到origin仓库的dev分支。

```bash
git push origin :dev
```

删除origin仓库的dev分支。


```bash
git push -f
git push origin +master:dev
```

`-f`与`+`两种方式都表示强制推送。
在与远程分支有分叉的情况下，会覆盖远程分支，导致其历史丢失。

安全的做法是先`pull`再`push`。

```bash
git push --no-verify
```

跳过pre-push hook。
