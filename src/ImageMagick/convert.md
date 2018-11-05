# convert

## 示例

```bash
convert +append 1.jpg 2.jpg 3.jpg 0.jpg
```

把1.jpg、2.jpg、3.jpg从左到右拼接成0.jpg。

```bash
convert -append 1.jpg 2.jpg 3.jpg 0.jpg
```

把1.jpg、2.jpg、3.jpg从上到下拼接成0.jpg。

```bash
convert -crop 100x100 1.jpg 0.jpg
```

将1.jpg切割成100*100大小的块，并保存成0-0.jpg、0-1.jpg、0-2.jpg等。

```bash
convert -crop 100x100+200+300 1.jpg 0.jpg
```

从1.jpg的(200,300)位置取一个100*100大小矩形区域，保存到0.jpg。指定起始位置则不会切割出多块。

## 用法

> convert [<in-option\>] <in-file\> [<out-option\>] <out-file\>

其中，`in-option`和`out-option`即为要对图片进行的操作，如`-crop`，详细请参见帮助。
