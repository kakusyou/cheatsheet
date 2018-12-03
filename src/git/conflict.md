# git冲突

## 发现冲突

```bash
$ git status
both modified:   sample.txt
```

当文件变成`both modified`等状态时，说明应用某个变更时发生了冲突。
冲突通常发生在合并、变基等过程中。

此时，Git会在冲突文件的工作区的副本中插入冲突标记`<<<<<<<=======>>>>>>>`，
描述发生冲突的具体行：

    hello
    <<<<<<< HEAD
    modification in HEAD.
    =======
    modification in dev.
    >>>>>>> dev
    world

## 冲突管理

冲突发生时，Git在索引中保存了冲突文件的3个版本，
并以此作为冲突与否的判断标准，而不是根据工作区副本中的冲突标记。

+ BASE: 共同父版本。
+ LOCAL: 当前分支的修改，又称ours版本。
+ REMOTE: 冲突分支的修改，又称theirs版本。

通过`ls-files`命令可以查看这3个版本：

```bash
$ git ls-files -u sample.txt
100644 eb8527731cad9837beda7bcb0497258095a9ff09 1       sample.txt # BASE
100644 f88216543b6ea72c16ec322266c0e5aaa9a1f8dd 2       sample.txt # LOCAL
100644 914a0a7ed13b3dc04a6212722ac88d82dc428fc2 3       sample.txt # REMOTE
```

第三列的1/2/3分别代表BASE/LOCAL/REMOTE。

还可以将相应版本签出到工作区：

```bash
git checkout --ours -- sample.txt # LOCAL
git checkout --theirs -- sample.txt # REMOTE
```

签出命令会覆盖工作区的副本。

一旦更新索引，Git就认为冲突已经解决，并删除1~3版本。

再次强调，Git不会依赖工作区的副本来做冲突状态管理。
工作区副本中的冲突标记是给编辑器或者用户看的。
对于Git来说，冲突标记没有特殊含义。
如果你原意，可以不作任何处理，直接更新索引并提交。
此时，带有冲突标记的文件就会进入版本库称为正式版本。

## 冲突处理

综上，冲突处理的一般步骤是：

1. 修改工作区文件。有很多编辑器（如vscode）能识别冲突标记，从而简化冲突文件的编辑。

1. 更新索引。如：

    > git add

    告诉Git，冲突已经解决。

1. 继续冲突前的操作。如：

    > git merge --continue

    继续冲突前的合并操作。

## 使用外部工具

除了手工处理冲突之外，还可以通过`mergetool`命令调用外部工具来处理冲突。
Git会为每一个冲突文件调用配置好的外部编辑工具，并在冲突解决后自动更新索引。

```bash
git mergetool
```

Git内置了对常用冲突编辑工具的支持，如TortoiseMerge。
对于这些工具，只需要配置名称、路径即可。
对于非内置工具，还需要配置调用方法。

完整配置方法如下：

1. 配置工具名称

    ```bash
    git config --global merge.tool <tool>
    ```

1. 配置工具路径

    ```bash
    git config --global mergetool.<tool>.path <path>
    ```

1. 配置调用命令

    ```bash
    git config --global mergetool.<tool>.cmd tool <arg> ...
    ```

    参数可以使用如下变量：

    > $BASE/$LOCAL/$REMOTE

    即冲突文件的多个版本。
    Git会生成这些文件的临时副本，并作为参数传递给工具。

    > $MERGED

    冲突文件的工作区副本。

    不同的工具需要的参数及顺序不同，配置时需要参考工具文档。

1. 是否信任工具的返回值

    ```bash
    git config --global mergetool.<tool>.trustExitCode true|false
    ```

    设为true时，Git根据工具返回值来判断冲突是否已解决。
    设为false时，Git会询问用户冲突是否已解决。

1. 是否保留备份文件

    ```bash
    git config --global mergetool.keepBackup true|false
    ```

    调用工具前，Git会创建一个`$MERGED.orig`备份文件。
    此处配置是否在冲突解决后自动删除备份文件。
