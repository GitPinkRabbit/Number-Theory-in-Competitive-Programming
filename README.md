# 算法竞赛中的数论 – 系列课件

正在绝赞编写中！

本系列课件的 PDF 版本遵循 CC BY-SA 4.0 版权协议。  
本系列课件的 LaTeX 源代码以 GNU GPL v3.0 协议开源。  
（注意 GNU GPL v3.0 包含 CC BY-SA 4.0）

力求做到的目标：

- 比任何现存算法竞赛博客更精炼的表述（欢迎提 issue）
- 更具整体逻辑的知识点编排结构（欢迎提 issue）
- 涵盖大部分 NOI 级别及以下的数论知识点（欢迎提 issue）
- 毫无经验的初学者按照顺序阅读，不借助其他资料也可完全掌握（欢迎提 issue）

包含以下内容：

1. 基础知识、简单素数筛法、与解线性 Diophantine 方程
   - 感觉每个课件需要插入一个专门讲例题的课件（关于例题的选取有什么想法吗？）
2. \[未开始\] 计划是讲一下欧拉定理、特定数论函数的求法、与中国剩余定理（这三个不像是应该拼一起的样子）
3. 敬请期待……（欢迎提 issue）

----

内容：

- 翻译时丢弃人名形容词后缀（[带后缀的数学家名字，例如「abelian」，在译为中文而保留英文名字「abel」时，是否应该保留后缀？](https://www.zhihu.com/question/54747550)）。
- 减少单页文字数量。

格式：

- 行间数学公式优先考虑使用 `\[ \]` 或 `\begin{align*} \end{align*}`，记得在前后文添加 `%` 注释防止多余换行。
- 关于上一条中的多余换行问题，注意 `center` 环境前后是否分段应由上下文决定。
- 换行后手动缩进记得添加 `\-`。
- mymulticols 环境相比 multicol 宏包的 multicols 环境，删除了附加垂直间距，并提供对开头与（或）结尾为 list（itemize、enumerate、description）的适配（添加对应的垂直 `\topsep` 间距）（具体见自定义文档类）。

关于动画：

- 在简单页面，尽量多地使用 `\pause` 进行简单动画，而不是复杂的 overlay specification 例如 `only`、`uncover` 等。
- 为了与 `\pause` 相符，应使用 `\uncover` 和 `uncoverenv` 环境，而不是 `\visible` 和 `visibleevn` 环境。这也方便他人进行 `\setbeamercovered{transparent}` 等设置。  
  注意此时要考虑到 `uncover` 并未隐藏内容而只是增加透明度，所以可以出现内层 `only` 的 overlay specification 超出外层的 `uncover` 的情况。并且需要尽量避免 `uncover` 或其他 overlay specification（非 `only`）的嵌套造成透明度不正确，也需要避免 `\pause` 后的 `uncover` 或其他 overlay specification（非 `only`），或 `uncover` 或其他 overlay specification（非 `only`）内部的 `\pause`，而连续的 `\pause` 当然是允许的。
- 在 `\pause` 需要嵌套在 `only` 内部时，使用与 `only` 同步的 `\pause` 而非 `\pause[number]`（否则可能造成页脚消失），见 Part 1 中 Euclid 算法一页（frame 45）。  
- PDF 最好要经过 `\setbeamercovered{transparent}` 和 `\setbeamercovered{invisible}` 两重测试。
