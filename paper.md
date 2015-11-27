---
title: Publishing Papers with Pandoc
author:
  - Gabe Lee
date: 2015-11-26
tags: [Publishing]
bibliography: template/mylib.bib
# cls: chinese-gb7714-2005-numeric.csl # 默认为使用芝加哥「作者－日期」格式
number-sections: yes
documentclass: ctexart
classoption: "hyperref,"
classoption: "a4paper"
#geometry: margin=1in # mytemplate.tex 已经设置了。
fontsize: 12pt

---

# 引言


This is a guide by Andrew Hobden @abc:2015. This demos a reference using the
provided CSL.

使用**pandoc** 写作学术论文，很方便，也很geeker @abc:2015。使用 `marked 2`实时
预览`markdown`文件。配置好了实时预览功能，解决了找不到文件的问题，而且可以预览
数学公式，这点太好了，只要保存即可实现。看看如何修改。

还有几点想实现的功能：

* 公式标签和引用
* 参考文献的引用格式的自定义
* 插入图片及其引用问题
* 追踪修改过程

## 数学公式显示

(@) 行内公式这是一行有数学公式 $x^2 + y = 1$ 的地方，好像没有编译，问题在哪里？
  哦，我知道了，原来`$$`里面不能有空格，否则认不出公式。

(@) 行间公式
  
$$ x_{n=0}^{100} x^{n} = x $$

$$ \frac{x+y}{x-y} = x^2 + \sqrt{y} $$

(@) **pandoc math demos**
This is some math.

$$
\begin{aligned}
x&=1\label{eq:1}\\
y&=2
\end{aligned}
$$

End of math. $\eqref{eq:1}$

公式引用，例如，请参考公式 $\eqref{eq:1}$


$$a^2 + b^2 = c^2$$

$$v(t) = v_0 + \frac{1}{2} t^2$$

$$\gamma = \frac{1}{\sqrt{1 - v^2/c^2}}$$

$$\exists x \forall y (Rxy \equiv Ryx)$$

$$p \wedge q \models p$$

$$\Box\diamond p\equiv\diamond p$$

$$\int_{0}^{1} x dx = \left[ \frac{1}{2}x^2 \right]_{0}^{1} = \frac{1}{2}$$

$$e^x = \sum_{n=0}^\infty \frac{x^n}{n!} = \lim_{n\rightarrow\infty} (1+x/n)^n$$

* 使用 $\LaTeX$  的环境

## 引用与参考文献 

引用资讯放在方括号中，以分号区隔。每一条引用都会有个 `key`，由 `@` 加上资料库中的
`引用 ID` 组成，并且可以选择性地包含**前缀**、**定位**以及**后缀**。例如，


- @yanghongli2015 says blah

- @yangrudai2015 [p. 30] says blah.

- @yangyang2015 [p. 30, with suffix] says blah.

- @zhangshaohua2015 [-@zhaojunzhu2014 p. 30; see also @zhouwei2014] says
    blah.


- A citation group
    [see @zhangshaohua2015 p. 34-35; also @zhouwei2014 chap. 3].

- Another one [see @zhangshaohua2015 p. 34-35].


- Citation with a suffix and locator
    [@zhangshaohua2015 pp. 33, 35-37, and nowhere else].

- Citation with suffix only [@zhangshaohua2015 and nowhere else].

- With some markup [*see* @zhangshaohua2015 p. **32**].

## 自定义清单

术语 1
:   这是术语1的定义 Definition 1。

Term 2 with *inline markup*
:   Definition 2

        { some code, part of Definition 2 }

    Third paragraph of definition 2.

### 独立清单

1.  one
2.  two
3.  three

<!-- -->

1.  uno
2.  dos
3.  tres

# 表格

## 简单表格

简单表格看起来像这样子：

  Right     Left     Center     Default
-------     ------ ----------   -------
     12     12        12            12
    123     123       123          123
      1     1          1             1
    344       33        233         323

Table:  Demonstration of simple table syntax.

直行的对齐则依照表头的文字和其底下虚线的相对位置来决定：

- 如果虚线与表头文字的右侧有切齐，而左侧比表头文字还长，则该直行为靠右对齐。
- 如果虚线与表头文字的左侧有切齐，而右侧比表头文字还长，则该直行为靠左对齐。
- 如果虚线的两侧都比表头文字长，则该直行为置中对齐。
- 如果虚线与表头文字的两侧都有切齐，则会套用预设的对齐方式（在大多数情况下，
  这将会是靠左对齐）。
  
## 多行表格

多行表格允许表头与表格资料格的文字能以复数行呈现（但不支援横跨多栏或纵跨多列的资料格）。以下为范例：

-------------------------------------------------------------
 Centered   Default           Right Left
  Header    Aligned         Aligned Aligned
----------- ------- --------------- -------------------------
   First    row                12.0 Example of a row that
                                    spans multiple lines.

  Second    row                 5.0 Here's another one. Note
                                    the blank line between
                                    rows.
-------------------------------------------------------------

Table: Here's the caption. It, too, may span
multiple lines.

## 格框表格

格框表格看起来像这样：

: Sample grid table.

+---------------+---------------+--------------------+
| Fruit         | Price         | Advantages         |
+===============+===============+====================+
| Bananas       | $1.34         | - built-in wrapper |
|               |               | - bright color     |
+---------------+---------------+--------------------+
| Oranges       | $2.10         | - cures scurvy     |
|               |               | - tasty            |
+---------------+---------------+--------------------+

以 = 串成的一行区分了表头与表格本体，这在没有表头的表格中也是可以省略的。在格框表格中的资料格可以包含任意的区块元素（复数段落、代码区块、清单等等）。不支援对齐，也不支援横跨多栏或纵跨多列的资料格。格框表格可以在 Emacs table mode 下轻松建立

## 管线表格

管线表格看起来像这样：

| Right | Left | Default | Center |
|------:|:-----|---------|:------:|
|   12  |  12  |    12   |    12  |
|  123  |  123 |   123   |   123  |
|    1  |    1 |     1   |     1  |

  : Demonstration of simple table syntax.
  
这个语法与 PHP markdown extra 中的表格语法相同。开始与结尾的管线字元是可选的，但各直行间则必须以管线区隔。上面范例中的冒号表明了对齐方式。表头可以省略，但表头下的水平虚线必须保留，因为虚线上定义了资料栏的对齐方式。

注意：Pandoc 也可以看得懂以下形式的管线表格，这是由 Emacs 的 orgtbl-mod 所绘制：

| One | Two   |
|-----+-------|
| my  | table |
| is  | nice  |


主要的差别在于以 + 取代了部分的 |。其他的 orgtbl 功能并未支援。如果要指定非预
设的直行对齐形式，你仍然需要在上面的表格中自行加入冒号。

再来一个试试，使用 orgtbl的命令： `orgtbl-mode` `C-c |`

| name | 性别 | 年龄 |
|------+------+------|
| 张三 | 男   |   23 |
| 李四 | 男   |   33 |
| 王二 | 男   |   34 |
| 宫二 | 女   | 18   |



# References
