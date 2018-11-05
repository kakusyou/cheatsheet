# bash陷阱

## 重定向顺序

多个重定向是独立执行的，没有依赖关系，所以不同顺序结果可能不同。

```bash
make >log 2>&1
```

1和2都重定向到log。

```bash
make 2>&1 >log
```

1重定向到log，2重定向到屏幕。

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
