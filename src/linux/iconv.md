# iconv

## 功能

对文本编码进行转换。

## 示例

```bash
iconv -o out.txt -f gbk -t utf-8 data.txt
```

将data.txt从gbk转换成utf-8，并将结果写入到out.txt。

## 用法

> iconv [<options\>] [-f <from-encoding\>] [-t <to-encoding\>] [<inputfile\>] ...

+ **options**: 控制转换过程的一些选项
    - *-o <outputfiles>*: 将转换结果写入ouputfiles，若不指定，则写入标准输出。
    - *-ls*: 列出所支持的编码。
    - *-c*: 遇到错误时忽略而不是停止转换。
+ **from-encoding**: inputfile的编码，若不指定，则使用当前环境默认编码。
+ **to-encoding**: 目标编码，若不指定，则使用当前环境默认编码。
+ **inputfile**: 要转换的源文件，若不指定，则转换标准输入中的内容。
