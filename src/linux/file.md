# file

## 功能

查看文件的类型、编码等信息。

## 示例

```bash
$ file sample.txt
sample.txt: UTF-8 Unicode text
```

查看文本文件编码。

```bash
$ file a.out
a.out: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.18, stripped
```

查看可执行文件格式。

```bash
$ file core.28073
core.28073: ELF 64-bit LSB core file x86-64, version 1 (SYSV), SVR4-style, from './a.out'
```

查看core dump文件信息。

```bash
$ file liba.so
liba.so: symbolic link to `liba.so.1.3'
```

查看符号链接。
