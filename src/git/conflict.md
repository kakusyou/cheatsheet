# git冲突

## 冲突管理

查看冲突文件：

```bash
$ git status
both modified:   sample.txt
```

对于冲突文件，git会在索引中保存发生冲突的3个版本,
并以此作为冲突与否的判断标准，而不是根据文件内容。

+ BASE  \
    共同父版本
+ LOCAL \
    当前分支的修改
+ REMOTE \
    冲突分支的修改

通过`ls-files`命令可以查看这3个版本：

```bash
$ git ls-files -s sample.txt
100644 eb8527731cad9837beda7bcb0497258095a9ff09 1       sample.txt
100644 f88216543b6ea72c16ec322266c0e5aaa9a1f8dd 2       sample.txt
100644 914a0a7ed13b3dc04a6212722ac88d82dc428fc2 3       sample.txt
```

第三列的1/2/3分别代表BASE/LOCAL/REMOTE。

一旦更新索引，git就认为冲突已经解决，并删除1~3版本，以更新后的结果为准。

所以，冲突处理的一般步骤是：

1. 修改文件（编辑内容/重命名）
1. 更新索引
1. 提交

## 使用外部工具

git支持调用外部工具来编辑冲突文件。
使用外部工具解决冲突之后，git会自动更新索引，清除冲突状态。

git内置了对常用工具的支持。对于这些工具，只需要配置名称、路径即可，否则需要完整配置调用命令等内容。

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
    git config --global mergetool.<tool>.cmd tool $BASE $LOCAL $REMOTE $MERGED
    ```

    $BASE等是git的内置变量，代表冲突文件的相应版本。$MERGED是供工具写入的结果文件。
    在调用工具前，git会在工作区生成相应的文件，并按照配置传递给外部工具。
    不同的工具需要的参数及顺序不同，配置时需要参考工具文档。

1. 是否使用工具的返回值

    ```bash
    git config --global mergetool.<tool>.trustExitCode true|false
    ```

    设为true时，git根据工具返回值来判断冲突是否已解决。设为false时，git会询问用户冲突是否已解决。

1. 是否保留备份文件

    ```bash
    git config --global mergetool.keepBackup true|false
    ```

当冲突发生时，使用如下命令来调用外部工具：

```bash
git mergetool
```
