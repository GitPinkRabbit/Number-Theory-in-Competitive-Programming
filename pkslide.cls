%% 
%% This is file `../pkslide.cls'.
%% 
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{../pkslide}
[2022/07/19 PinkRabbit Slide class]





% 禁止选项 c 扰乱 beamer 的页对齐
\DeclareOption{c}{\OptionNotUsed}
% 处理剩下的选项
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbeamer}}
\ProcessOptions\relax
% 使用 ctexbeamer 文档类 —— CTeX 宏集提供的对 beamer 的汉化版
% 使用 UTF8 选项，指定 tex 文件使用 UTF-8 编码
% 使用 t 选项，指定每页幻灯片默认靠顶部对齐
% 使用 fontset = none 选项，自行设置中文字体
\LoadClass[UTF8, t, fontset = none]{ctexbeamer}




% =============================================================================
% 以下是 cls 文件的主体部分，即导言区的前一半



% ===================================================================
% 调用宏包


% 实际上，ctexbeamer 文档类会自动调用 hyperref 宏包，所以也可注释掉
\RequirePackage{hyperref}


% 启用 \verb 和 verbatim 环境
% 以及使用 comment 环境方便地进行注释
\RequirePackage{verbatim}


% 用于调整（西文）字体
\RequirePackage{fontspec}


% 实际上，ctexbeamer 文档类会自动调用 xeCJK 宏包，所以也可注释掉
% 用于调整中文字体（\setCJK...font{...}）
\RequirePackage{xeCJK}


% 实际上，ctexbeamer 文档类会自动调用以下 AMS 宏包，所以也可注释掉
\RequirePackage{amsmath, amssymb, amsthm}


% 实际上，ctexbeamer 文档类会自动调用 xcolor 宏包，所以也可注释掉
\RequirePackage{xcolor}


% 为了使用 \mathscr 必须调用此宏包
\RequirePackage{mathrsfs}


% 此宏包是为了分栏显示目录而调用的
% 使用了 multicols 环境
\RequirePackage{multicol}


% 用于显示 XeLaTeX 等标志
\RequirePackage{bxtexlogo}


% 用于 larger、smaller、textlarger、textsmaller 等相对当前字体大小改变字体大小的宏
\RequirePackage{relsize}


% etoolbox 和 xparse 宏包对在文档类中方便地定义命令有很大帮助
\RequirePackage{etoolbox, xparse}


% 目前最新的画表格宏包，使用 tblr 环境
\RequirePackage{tabularray}



% ===================================================================
% 设置 beamer 显示形式


% 设置 tt 字体族使用 Cascadia Mono
\setmonofont[BoldFont = Cascadia Mono SemiBold]{Cascadia Mono SemiLight}


% 设置中文字体，使用思源宋体和思源黑体，对应于 rm 和 sf 字体族，tt 字体族使用方正黑仿 简，it 字体形统一使用霞鹜文楷
\setCJKmainfont[ItalicFont = LXGW WenKai, BoldItalicFont = LXGW WenKai Bold]{Source Han Serif SC}
\setCJKsansfont[ItalicFont = LXGW WenKai, BoldItalicFont = LXGW WenKai Bold]{Source Han Sans SC}
\setCJKmonofont[ItalicFont = LXGW WenKai, BoldItalicFont = LXGW WenKai Bold]{FZHeiFangS}


% 此为 hyperref 宏包的设置，令 PDF 书签显示到 subsubsection 级别
\hypersetup{bookmarksdepth=4}


% 使用 Berlin 主题
\usetheme{Berlin}


% 改变内容文字边距，对于 Berlin 主题相当于加宽文字宽度（减小边距）
\setbeamersize{text margin left = .7cm, text margin right = .7cm}


% Berlin 原本使用的是 miniframes 这一外部主题（outer theme）
% 将页眉模板调整为增加 subsubsection（如果有的话）在页眉中 subsection 的右侧显示
% 下面的 headline 模板由 beamerouterthememiniframes.sty 中的部分复制而来
\makeatletter
\setbeamertemplate{headline}
{%
  \begin{beamercolorbox}[colsep=1.5pt]{upper separation line head}
  \end{beamercolorbox}
  \begin{beamercolorbox}{section in head/foot}
    \vskip2pt\insertnavigation{\paperwidth}\vskip2pt
  \end{beamercolorbox}%
  \ifbeamer@theme@subsection%
  \begin{beamercolorbox}[colsep=1.5pt]{middle separation line head}
  \end{beamercolorbox}
  \begin{beamercolorbox}[ht=2.5ex,dp=1.125ex,%
    leftskip=.3cm,rightskip=.3cm plus1fil]{subsection in head/foot}
    \usebeamerfont{subsection in head/foot}\insertsubsectionhead\hfill\insertsubsubsectionhead
  \end{beamercolorbox}%
  \fi%
  \begin{beamercolorbox}[colsep=1.5pt]{lower separation line head}
  \end{beamercolorbox}
}
\makeatother


% Berlin 原本使用的是 miniframes 这一外部主题（outer theme）
% 将页脚模板设置为 infolines 这一外部主题提供的格式，并以完整形式（当前/总数）加入页码
% 下面的 footline 模板由 beamerouterthemeinfolines.sty 中的部分复制而来
\setbeamertemplate{page number in head/foot}[totalframenumber]%
\makeatletter
\setbeamertemplate{footline}
{%
  \leavevmode%
  \hbox{%
  \begin{beamercolorbox}[wd=.333333\paperwidth,ht=2.25ex,dp=1ex,center]{author in head/foot}%
    \usebeamerfont{author in head/foot}\insertshortauthor\expandafter\ifblank\expandafter{\beamer@shortinstitute}{}{~~(\insertshortinstitute)}
  \end{beamercolorbox}%
  \begin{beamercolorbox}[wd=.333333\paperwidth,ht=2.25ex,dp=1ex,center]{title in head/foot}%
    \usebeamerfont{title in head/foot}\insertshorttitle
  \end{beamercolorbox}%
  \begin{beamercolorbox}[wd=.333333\paperwidth,ht=2.25ex,dp=1ex,leftskip=2ex,rightskip=2ex,sep=0pt]{date in head/foot}%
    \hfill%
    \usebeamerfont{date in head/foot}%
    \insertshortdate{}%
    \hfill%
    \usebeamercolor[fg]{page number in head/foot}%
    \usebeamerfont{page number in head/foot}%
    \usebeamertemplate{page number in head/foot}%
  \end{beamercolorbox}}%
  \vskip0pt%
}
\makeatother


% 正文字体应使用无衬线字体，但数学公式统一调整为原本 article 等文档类下的衬线字体
\usefonttheme{professionalfonts}


% tabularry 宏包进行了行列间距调整，这里调整回与原本的 array 相同的间距
% 原版 tabular 的列间距比 array 宽一点，为 6pt，与 tblr 相同
\SetTblrInner{rowsep = 0pt} % tabularry : match the original array
\SetTblrInner{colsep = 5pt} % tabularry : match the original array


% 使用 bxtexlogo 宏包提供的 primary logos 以使用 \XeLaTeX 等类似命令
\bxtexlogoimport{*}


% beamer 重定义了 \frame 命令导致 \topsep 在 list 类环境外不正确
% 此 length 只适用于第一层 list 环境，并只用于在 multicols 环境头部或尾部为 list 类环境时修正间距
% 不建议使用此文档类时嵌套 list 类环境
\newlength{\BeamerMulticolsListITopsep}
\setlength{\BeamerMulticolsListITopsep}{3pt plus 2pt minus 2.5pt} % 此数值取自 beamerbaselocalstructure.sty
% 定义 mymulticols 环境
% usage: \begin{mymulticols}[s1][s2]{number}
% <number> is passed to multicols environment in package multicol: \begin{multicol}{number}
% nonempty <s1> indicates a list-like environment is at the beginning of mymulticols
% nonempty <s2> indicates a list-like environment is at the end of mymulticols
% basically, setting <s1> and <s2> to either empty string or "l" can do the job
\NewDocumentEnvironment{mymulticols}{O{}O{}m}{%
  \ifblank{#1}{%
    \vspace*{-\multicolsep}%
  }{%
    \vspace*{\dimexpr\BeamerMulticolsListITopsep-\multicolsep\relax}%
  }%
  \begin{multicols}{#3}%
}{%
  \end{multicols}%
  \ifblank{#2}{%
    \vspace*{-\multicolsep}%
  }{%
    \vspace*{\dimexpr\BeamerMulticolsListITopsep-\multicolsep\relax}%
  }%
}



% ===================================================================
% 设置自动化插入标题页、节标题、小小节插入进度等功能


% 自动插入标题页
\AddToHook{begindocument/end}{
  \begin{frame}
    \titlepage
  \end{frame}
  
  \begin{frame}[c]
    \frametitle{目录}
    
    \begin{mymulticols}{2}
      \tableofcontents
    \end{mymulticols}
  \end{frame}
}


% 定义 \miniframeson 和 \miniframesoff 命令，以在导航栏中隐藏节标题的小圆圈
% 来自 https://tex.stackexchange.com/q/234269
\makeatletter
\let\beamer@writeslidentry@miniframeson=\beamer@writeslidentry
\def\beamer@writeslidentry@miniframesoff{%
  \expandafter\beamer@ifempty\expandafter{\beamer@framestartpage}{}% does not happen normally
  {%else
    % removed \addtocontents commands
    \clearpage\beamer@notesactions%
  }
}
\newcommand*{\miniframeson}{\let\beamer@writeslidentry=\beamer@writeslidentry@miniframeson}
\newcommand*{\miniframesoff}{\let\beamer@writeslidentry=\beamer@writeslidentry@miniframesoff}
\makeatother
% 自动插入节标题
\AtBeginSection{
  \miniframesoff    %       remove navigation circle
  \begin{frame}[c]
    \sectionpage
  \end{frame}
  \miniframeson     % undo: remove navigation circle
}


% 定义 \progressnow 以显示当前进度，在 frame 环境外部使用
\newcommand{\progressnow}{%
  \begin{frame}[c]
    \frametitle{当前进度}
    \setbeamercolor{subsection in toc}{fg = red}
    \setbeamercolor{subsection in toc shaded}{fg = black}
    \setbeamercolor{subsubsection in toc}{fg = red}
    \setbeamercolor{subsubsection in toc shaded}{fg = black}
    \begin{mymulticols}{2}
      \tableofcontents[sectionstyle = show/shaded, subsectionstyle = show/shaded/hide, subsubsectionstyle = show/shaded/hide]
    \end{mymulticols}
  \end{frame}%
}
% 自动在 subsubsection 前插入当前进度
\AtBeginSubsubsection{\progressnow}
% 定义 \pseudosubsubsection 以在小节不需要进一步分段时显示当前进度
\newcommand{\pseudosubsubsection}{\progressnow}



% ===================================================================
% 自定义一些命令


% 定义 small caps 字形
\newcommand{\rmsc}[1]{{\rmfamily{}\scshape{}#1}}
\newcommand{\mathsc}[1]{{\text{\rmfamily{}\scshape{}#1}}}


% 空一行
\newcommand{\emptyline}{\vspace{0.6\baselineskip}}


% \textboldcolor 相当于变色 + 文字加粗 + 公式加粗
% 通过 \boldmath 和 \unboldmath 实现公式加粗
% 不应跨段落使用
\newcommand{\textboldcolor}[2]{\textcolor{#1}{\bfseries{}\boldmath{}#2\unboldmath{}}}
% 意为 first-define，即概念定义时使用
\newcommand{\fdf}[1]{\textboldcolor{red}{#1}}



% ===================================================================
% 不影响显示形式的，需要在导言区引入的信息


% author、institute 信息
\newcommand{\PKAuthorPDFName}{小粉兔\ 测试}
\newrobustcmd{\PKAuthorLongName}{\begin{tabular}[t]{@{}c@{}}小粉兔\ 测试\\PinkRabbit Test\end{tabular}}
\newrobustcmd{\PKAuthorShortName}{PRTest}
\newrobustcmd{\PKInstituteLongName}{百京带学\\Baijing Oniversity}
\newrobustcmd{\PKInstituteShortName}{BaiJO}
% usage: \firstauthor{realname}[nickname][shortname]
% if <nickname> not specified, empty
% if <shortname> not specified, if <nickname> also not specified, <realname>, otherwise <nickname>
\NewDocumentCommand{\firstauthor}{m o o}{%
  \renewcommand{\PKAuthorPDFName}{#1}
  \renewrobustcmd{\PKAuthorLongName}{\IfNoValueT{#2}{#1}{\begin{tabular}[t]{@{}c@{}}#1\\#2\end{tabular}}}
  \renewrobustcmd{\PKAuthorShortName}{\IfValueTF{#3}{#3}{\IfValueTF{#2}{#2}{#1}}}%
}
% usage: \firstinstitute{name}[englishname]{shortname}
% if <englishname> not specified, empty
\NewDocumentCommand{\firstinstitute}{m o m}{%
  \renewrobustcmd{\PKInstituteLongName}{#1\IfValueT{#2}{\\#2}}
  \renewrobustcmd{\PKInstituteShortName}{#3}%
}
% usage: \addauthor{realname}[nickname][shortname]
% if <nickname> not specified, empty
% if <shortname> not specified, if <nickname> also not specified, <realname>, otherwise <nickname>
\NewDocumentCommand{\addauthor}{m o o}{%
  \appto\PKAuthorPDFName{\and#1}
  \appto\PKAuthorLongName{\and\IfNoValueT{#2}{#1}{\begin{tabular}[t]{@{}c@{}}#1\\#2\end{tabular}}}
  \appto\PKAuthorShortName{\and\IfValueTF{#3}{#3}{\IfValueTF{#2}{#2}{#1}}}%
}
% usage: \addinstitute{name}[englishname]{shortname}
% if <englishname> not specified, empty
\NewDocumentCommand{\addinstitute}{m o m}{%
  \appto\PKInstituteLongName{\and#1\IfValueT{#2}{\\#2}}
  \appto\PKInstituteShortName{\and#3}%
}


% date 信息
\newrobustcmd{\PKDateLong}{编译于 \today}
\newrobustcmd{\PKDateShort}{\today}
% usage: \originalfinaldate[*][original date]{final date}
% if <original date> not specified, empty (that is, there's only one version)
% if starred, print compile date (\today)
\NewDocumentCommand{\originalfinaldate}{s o m}{%
  \renewrobustcmd{\PKDateLong}{#3\smaller[2]\IfValueT{#2}{\\初版于 #2}\IfBooleanT{#1}{\\编译于 \today}}
  \renewrobustcmd{\PKDateShort}{#3}%
}


% AtEndPreamble 需要 etoolbox
% 将标题信息推迟到导言区结束时执行，这是为了保证 hyperref 读取 PDF 作者时可以读取到已完整添加的宏
\AtEndPreamble{
  \author[\PKAuthorShortName]{\texorpdfstring{\PKAuthorLongName}{\PKAuthorPDFName}}
  \institute[\PKInstituteShortName]{\PKInstituteLongName}
  \date[\PKDateShort]{\PKDateLong}
}



% 以上是 cls 文件的主体部分，即导言区的前一半
% =============================================================================
