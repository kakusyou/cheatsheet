# bash变量操作

## 取长度

```bash
${#var}
```

## 索引切片

切片索引从0开始计数。
注意倒数计数时，'-'前有一个空格，可也用0代替。

| 表达式 | 功能 |
| -- | -- |
| ${var:s}     | 从第s个字符取所有     |
| ${var:s:n}   | 从第s个字符取n个      |
| ${var: -r}   | 从倒数第r个字符取所有 |
| ${var: -r:n} | 从倒数第r个字符取n个  |

## 模式裁剪

| 表达式 | 功能 |
| -- | -- |
| ${var#pattern}  | 从左侧匹配最短pattern子串并删除 |
| ${var##pattern} | 从左侧匹配最长pattern子串并删除 |
| ${var%pattern}  | 从右侧匹配最短pattern子串并删除 |
| ${var%%pattern} | 从右侧匹配最长pattern子串并删除 |

## 模式替换

| 表达式 | 功能 |
| -- | -- |
| ${var/pattern/replace}  | 替换第一个匹配 |
| ${var//pattern/replace} | 替换所有匹配   |
| ${var/#pattern/replace} | 从左侧匹配替换 |
| ${var/%pattern/replace} | 从右侧匹配替换 |

## 大小写转换

| 表达式 | 功能 |
| -- | -- |
| ${var^}  | 首字母大写   |
| ${var^^} | 所有字母大写 |
| ${var,}  | 首字母小写   |
| ${var,,} | 所有字母小写 |

## 初始化及条件赋值

| 表达式 | var未设置 | var为空 | var非空 |
| --    | --        | --      | --      |
| ${var:-word} | 返回word | 返回word | - |
| ${var-word}  | 返回word | - | - |
| ${var:+word} | - | - | 返回word |
| ${var+word}  | - | - | 返回word |
| ${var:=word} | word赋给var并返回 | word赋给var并返回 | - |
| ${var=word}  | word赋给var并返回 | - | - |
| ${var:?word} | 输出word到stderr | 输出word到stderr | - |
| ${var?word}  | 输出word到stderr | - | - |

其中，`word`可以是直接量，也可以是变量`$varname`。
