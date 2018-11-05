# makefile

## 通配规则

```makefile
%.o: %.c
obj/%.o: src/%.c
```

## 内置变量

| 变量 | 含义 |
| --   | --  |
| $@ | 所有目标         |
| $^ | 所有依赖文件      |
| $< | 第一个依赖文件    |
| $* | 被`%`匹配到的部分 |

## 内置函数

```makefile
$(patsubst %.c, %.o, x.c y.c z.c)
```

将.c替换成.o，结果为`x.o y.o z.o`。

```makefile
$(wildcard *.c)
$(wildcard *.so lib/*.so)
```

使用通配符生成文件列表，不递归匹配子目录。

```makefile
$(notdir /path/to/file.ext)
```

去除路径中的目录部分，只保留文件名。
