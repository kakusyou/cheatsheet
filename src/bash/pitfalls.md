# bash陷阱

## 重定向到另一个描述符

```bash
make 2>&1 >log # 2仍然指向屏幕，而不会跟随1指向log
make >log 2>&1 # 1/2都指向log
```

2>&1，是将2重定向到1当时指向的文件，而不是让2跟随1的变化。

## 复制文件到目录

复制文件到目录时，目标路径应当以`/`结尾，明确表示是一个目录。
这样当目标目录不存在时会报错，而不是复制成与目标目录同名的文件，导致非预期的结果。

```bash
cp file dir
```

如果dir不存在，则复制成文件dir，非预期结果。

```bash
cp file dir/
```

如果dir不存在，则报错：

> cp: cannot create regular file 'dir/': Is a directory
