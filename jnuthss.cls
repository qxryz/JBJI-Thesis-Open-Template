% JBJI thesis open-source template.
% By JBJI 2022 grade students.(2026/4/5)
% 改编自原暨南大学论文latex模板（2021/06/21）

\ProvidesClass{jnuthss}[2021/06/21]

\newif\ifjnuthss@master\jnuthss@masterfalse
\newif\ifjnuthss@doctor\jnuthss@doctorfalse
\DeclareOption{master}{\jnuthss@mastertrue}
\DeclareOption{doctor}{\jnuthss@doctortrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
\newif\ifjnuthss@duplexlayout
\jnuthss@duplexlayoutfalse
% 处理选项信息

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 基础格式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\PassOptionsToPackage{quiet}{fontspec}
% 使用 ctexbook 作为中文文档基础类
\LoadClass[
a4paper,
\ifjnuthss@duplexlayout twoside\else oneside\fi,
openany,
fontset    = fandol, % ubuntu
zihao      = -4,
linespread = 1.0,
]{ctexbook}

% 正文字体设置为 12pt Times New Roman
\RequirePackage{mathptmx}
\setmainfont{Times New Roman}

\setCJKfamilyfont{lishu}[Path = ./misc/]{simli.ttf}
\newcommand{\lishu}{\CJKfamily{lishu}}
% 自定义隶书字体，供封面或特殊位置调用




\setlength{\parskip}{0pt}
\setlength{\parindent}{2em}




\RequirePackage{geometry}
\RequirePackage{setspace}
% 页面边距设置
\geometry{
    left       = 3cm,
    right      = 2cm,
    top        = 2.54cm,
    bottom     = 2.54cm,
    headheight = 12pt,
    headsep    = 0.616cm,
    footskip   = 0.79cm,
}

% ------------------------------------------------------------------
% 通用版式参数
% 将摘要页、目录页、题注、列表、表格、编号和链接等零散设置统一集中，每个参数单独占一行，后续统一修改这里即可。
\newcommand{\jnuthss@hyperrefPackageOptions}{bookmarks,hidelinks,pdfborder={0 0 0}} % hyperref 包选项：隐藏边框并保留书签
\newcommand{\jnuthss@citationStyle}{super} % 文内引用显示样式（super 为上标，authoryear 由下面 \setcitestyle 控制）
\newcommand{\jnuthss@hyperrefPdfSubject}{Yi-language document parsing} % PDF 主题
\newcommand{\jnuthssReferenceTitle}{References} % 参考文献页标题
\newcommand{\jnuthss@bibliographyStyleAuthorYear}{jnuthss-gbt7714-author-year} % 作者-年份制 bst 文件名
\newcommand{\jnuthss@bibliographyStyleNumerical}{jnuthss-gbt7714-numerical} % 数字编号制 bst 文件名
\newcommand{\jnuthssBibliographyStyle}{\jnuthss@bibliographyStyleAuthorYear} % 默认参考文献展示方式（当前默认：作者-年份制）
\newcommand{\jnuthssUseAuthorYearBibliography}{\renewcommand{\jnuthssBibliographyStyle}{\jnuthss@bibliographyStyleAuthorYear}} % 切换为作者-年份制
\newcommand{\jnuthssUseNumericalBibliography}{\renewcommand{\jnuthssBibliographyStyle}{\jnuthss@bibliographyStyleNumerical}} % 切换为数字编号制
% 参考文献切换说明：
% 1) 保持默认不改：作者-年份制（文内示例：(Smith, 2001)）
% 2) 想改成数字编号制：在导言区或此处加入 \jnuthssUseNumericalBibliography
% 3) 想切回作者-年份制：加入 \jnuthssUseAuthorYearBibliography
\newcommand{\jnuthss@figureNumberFormat}{\arabic{chapter}-\arabic{figure}} % 图片编号格式
\newcommand{\jnuthss@tableNumberFormat}{\arabic{chapter}-\arabic{table}} % 表格编号格式
\newcommand{\jnuthss@figureName}{Figure} % 图片名称
\newcommand{\jnuthss@tableName}{Table} % 表格名称
\newcommand{\jnuthss@applyEquationNumbering}{\numberwithin{equation}{chapter}} % 公式按章编号

\newcommand{\jnuthss@disableInsertedBlankPages}{\let\cleardoublepage\clearpage} % 禁用自动插入的空白页
\newcommand{\jnuthss@frontMatterLineSpread}{1.25} % 前置部分行距
\newcommand{\jnuthss@mainMatterLineSpread}{1.5} % 正文部分行距
\newcommand{\jnuthss@backMatterLineSpread}{1.25} % 后置部分行距
\newcommand{\jnuthss@chapterTitleBeforeSkip}{12pt} % 章标题前间距
\newcommand{\jnuthss@chapterTitleAfterSkipFrontBack}{18pt plus 6pt minus 6pt} % 前后置部分章标题后间距
\newcommand{\jnuthss@chapterTitleAfterSkipMain}{12pt plus 4pt minus 4pt} % 正文部分章标题后间距
\newcommand{\jnuthss@sectionBeforeSkip}{18pt plus 6pt minus 6pt} % 一级标题前间距
\newcommand{\jnuthss@sectionAfterSkip}{6pt plus 2pt minus 2pt} % 一级标题后间距
\newcommand{\jnuthss@subsectionBeforeSkip}{12pt plus 4pt minus 4pt} % 二级标题前间距
\newcommand{\jnuthss@subsectionAfterSkip}{6pt plus 2pt minus 2pt} % 二级标题后间距
\newcommand{\jnuthss@captionAboveSkip}{2pt} % 题注上间距
\newcommand{\jnuthss@captionBelowSkip}{0pt} % 题注下间距
\newcommand{\jnuthss@abstractBodyFontSize}{12pt} % 摘要正文字号
\newcommand{\jnuthss@abstractBodyBaseline}{18pt} % 摘要正文基线距离
\newcommand{\jnuthss@referenceFontSize}{12pt} % 参考文献字号
\newcommand{\jnuthss@referenceBaseline}{18pt} % 参考文献基线距离
\newcommand{\jnuthss@statementENTitleFontSize}{22pt} % 英文声明标题字号
\newcommand{\jnuthss@statementENTitleBaseline}{40pt} % 英文声明标题基线距离
\newcommand{\jnuthss@statementENBodyFontSize}{12pt} % 英文声明正文字号
\newcommand{\jnuthss@statementENBodyBaseline}{25pt} % 英文声明正文基线距离
\newcommand{\jnuthss@statementCNTitleFontSize}{22pt} % 中文声明标题字号
\newcommand{\jnuthss@statementCNTitleBaseline}{36pt} % 中文声明标题基线距离
\newcommand{\jnuthss@statementCNBodyFontSize}{15pt} % 中文声明正文字号
\newcommand{\jnuthss@statementCNBodyBaseline}{31pt} % 中文声明正文基线距离
\newcommand{\jnuthss@captionSetup}{font=normalsize, labelfont=bf, labelsep=space, justification=centering, singlelinecheck=false, aboveskip=\jnuthss@captionAboveSkip, belowskip=\jnuthss@captionBelowSkip} % 题注上间距

\newcommand{\jnuthss@tocTitleAfterSkip}{-5em} % 目录标题后间距
\newcommand{\jnuthss@tocDepth}{3} % 目录显示层级深度（3 表示到 subsubsection）
\newcommand{\jnuthss@tocDotSep}{1.5} % 目录引导点密度
\newcommand{\jnuthss@tocChapIndent}{0pt} % 目录章标题左缩进
\newcommand{\jnuthss@tocChapNumWidth}{2.6em} % 目录章编号占位宽度
\newcommand{\jnuthss@tocSecIndent}{1.9em} % 目录节标题左缩进
\newcommand{\jnuthss@tocSecNumWidth}{3.2em} % 目录节编号占位宽度
\newcommand{\jnuthss@tocSubsecIndent}{4.9em} % 三级目录缩进
\newcommand{\jnuthss@tocSubsecNumWidth}{4.2em} % 目录小节编号占位宽度
\newcommand{\jnuthss@tocBeforeChapSkip}{6pt plus 1pt minus 1pt} % 目录中“章”条目前垂直间距
\newcommand{\jnuthss@contentsTitle}{Contents} % 目录标题文字
\newcommand{\jnuthss@abstractTitleFont}{\zihao{4}\bfseries} % 摘要标题字体
\newcommand{\jnuthss@abstractTitleInnerGap}{1em} % 摘要标题内部间距
\newcommand{\jnuthss@abstractBodyTopSpace}{2em} % 摘要正文顶部空白
\newcommand{\jnuthss@abstractCNBodyExtraTopSpace}{0.30cm} % 中文摘要正文额外顶部空白
\newcommand{\jnuthss@abstractBodyStyle}{\setlength{\parskip}{0pt}\fontsize{\jnuthss@abstractBodyFontSize}{\jnuthss@abstractBodyBaseline}\selectfont\setlength{\baselineskip}{\jnuthss@abstractBodyBaseline}} % 摘要正文字号
\newcommand{\jnuthss@abstractKeywordsTopSpace}{1.25em} % 摘要正文与关键词之间间距
\newcommand{\jnuthss@floatTextSep}{10pt plus 2pt minus 2pt} % 页顶/页底浮动体与正文间距
\newcommand{\jnuthss@floatSep}{10pt plus 2pt minus 2pt} % 浮动体之间间距
\newcommand{\jnuthss@inTextSep}{10pt plus 2pt minus 2pt} % 浮动体与正文间距

\newcommand{\jnuthss@baseListLeftMargin}{0pt} % 列表默认左边距
\newcommand{\jnuthss@baseListLabelWidth}{24pt} % 列表默认标签列宽
\newcommand{\jnuthss@baseListParIndent}{48pt} % 列表段落缩进
\newcommand{\jnuthss@baseListItemIndent}{48pt} % 列表条目缩进

\newcommand{\jnuthss@enumerateLabel}{\arabic*.} % 编号列表标签格式
\newcommand{\jnuthss@enumerateLeftMargin}{2.2em} % 编号列表左边距
\newcommand{\jnuthss@enumerateLabelWidth}{1.6em} % 编号列表标签格式
\newcommand{\jnuthss@enumerateLabelSep}{0.6em} % 编号列表标签格式
\newcommand{\jnuthss@enumerateItemIndent}{0pt} % 编号列表条目额外缩进
\newcommand{\jnuthss@enumerateTopSep}{3pt} % 编号列表顶部间距
\newcommand{\jnuthss@enumerateItemSep}{2pt} % 编号列表条目间距
\newcommand{\jnuthss@enumerateParsep}{0pt} % 编号列表段内段间距
\newcommand{\jnuthss@enumeratePartopSep}{0pt} % 编号列表段前附加间距

\newcommand{\jnuthss@itemizeLabel}{} % 项目列表标签内容
\newcommand{\jnuthss@itemizeLeftMargin}{2em} % 项目列表左边距
\newcommand{\jnuthss@itemizeLabelWidth}{0pt} % 项目列表标签内容
\newcommand{\jnuthss@itemizeLabelSep}{0pt} % 项目列表标签内容
\newcommand{\jnuthss@itemizeItemIndent}{0pt} % 项目列表条目额外缩进
\newcommand{\jnuthss@itemizeTopSep}{3pt} % 项目列表顶部间距
\newcommand{\jnuthss@itemizeItemSep}{2pt} % 项目列表条目间距
\newcommand{\jnuthss@itemizeParsep}{0pt} % 项目列表段内段间距
\newcommand{\jnuthss@itemizePartopSep}{0pt} % 项目列表段前附加间距

\newcommand{\jnuthss@arrayStretch}{1.3} % 表格行高倍率
\newcommand{\jnuthss@tabColSep}{8pt} % 表格列间距
\newcommand{\jnuthss@fboxSep}{0pt} % fbox 内边距
\newcommand{\jnuthss@fboxRule}{1.5pt} % fbox 线宽
\newcommand{\jnuthss@duplexReadyNote}{????????????????????} % 双面打印提示文本

% 提供给摘要分文件调用的公开宏
\newcommand{\jnuthssAbstractTitleFont}{\jnuthss@abstractTitleFont} % 摘要标题字体
\newcommand{\jnuthssAbstractTitleInnerGap}{\jnuthss@abstractTitleInnerGap} % 摘要标题内部间距
\newcommand{\jnuthssAbstractBodyTopSpace}{\jnuthss@abstractBodyTopSpace} % 摘要正文顶部空白
\newcommand{\jnuthssAbstractCNBodyExtraTopSpace}{\jnuthss@abstractCNBodyExtraTopSpace} % 中文摘要正文额外顶部空白
\newcommand{\jnuthssAbstractBodyStyle}{\jnuthss@abstractBodyStyle} % 摘要正文样式
\newcommand{\jnuthssAbstractKeywordsTopSpace}{\jnuthss@abstractKeywordsTopSpace}






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 临时工具


%\RequirePackage{showframe} 显示版心边界；%\RequirePackage[]{changes} 显示修订；%\def\showfontsize{...} 输出字号
% 显示字体大小






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 图表、公式与绘图支持

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{multicol}
% 分栏支持
\RequirePackage{amsmath}
% 数学公式支持

\RequirePackage{booktabs}
% 三线表支持
\RequirePackage{graphicx}
% 图片支持
\RequirePackage{tikz}
\usetikzlibrary{positioning}
% TikZ 定位库
\usetikzlibrary{patterns}
% TikZ 图案库
\RequirePackage{pgfplots}
\pgfplotsset{
    compat = newest,
    width  = 10cm,
    height = 8cm,
}

\pgfplotsset{
    every axis/.append style      = {line width = 1pt, font = \footnotesize},
    error bars/error bar style    = {line width = 1pt, solid},
    error bars/error mark options = {line width = 1pt, mark size = 2pt, rotate = 90}
}

\RequirePackage{siunitx}
% 数值与单位排版
% 使用 \sim 作为数值范围连接符，并以文本模式输出单位
\sisetup{
    range-phrase       = $\ \sim \ $,
    range-units        = single,
    mode               = text,
    inter-unit-product = \ensuremath{{}\cdot{}}
}

\fboxsep  = \jnuthss@fboxSep % fbox 内边距
% fbox 内边距
\fboxrule = \jnuthss@fboxRule % fbox 线宽
% fbox 线宽

\RequirePackage{caption}
% 题注样式
\expandafter\captionsetup\expandafter{\jnuthss@captionSetup} % 题注整体样式
\setlength{\textfloatsep}{\jnuthss@floatTextSep}
\setlength{\floatsep}{\jnuthss@floatSep} % 浮动体之间间距
\setlength{\intextsep}{\jnuthss@inTextSep} % 浮动体与正文间距







\RequirePackage{enumitem}
\setlist{
leftmargin    = \jnuthss@baseListLeftMargin,
labelwidth    = \jnuthss@baseListLabelWidth,
listparindent = \jnuthss@baseListParIndent, % 列表段落缩进
itemindent    = \jnuthss@baseListItemIndent, % 列表条目缩进
nosep,
}
% 统一设置列表环境


\RequirePackage{gbt7714}
% 参考文献使用 gbt7714-2015 规范宏包

\expandafter\RequirePackage\expandafter[\jnuthss@hyperrefPackageOptions]{hyperref}
% 引用、目录及链接启用可点击跳转







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 章节、目录及页眉页脚
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




\RequirePackage{tocloft}

\setcounter{tocdepth}{\jnuthss@tocDepth}
% 目录深度统计到三级标题
\renewcommand\cftaftertoctitleskip{\jnuthss@tocTitleAfterSkip} % 目录标题后间距
% 目录标题与正文距离

\renewcommand{\cftdot}{$\cdot$}
% 统一目录引导点样式


\renewcommand\cftchapdotsep{\jnuthss@tocDotSep}
\renewcommand\cftsecdotsep{\jnuthss@tocDotSep}
\renewcommand\cftsubsecdotsep{\jnuthss@tocDotSep}

\setlength{\cftchapindent}{\jnuthss@tocChapIndent}
\setlength{\cftchapnumwidth}{\jnuthss@tocChapNumWidth}
\setlength{\cftsecindent}{\jnuthss@tocSecIndent}
\setlength{\cftsecnumwidth}{\jnuthss@tocSecNumWidth}
\setlength{\cftsubsecindent}{\jnuthss@tocSubsecIndent} % 三级目录缩进
\setlength{\cftsubsecnumwidth}{\jnuthss@tocSubsecNumWidth}
\setlength{\cftbeforechapskip}{\jnuthss@tocBeforeChapSkip}
\setlength{\cftbeforesecskip}{0pt}
\setlength{\cftbeforesubsecskip}{0pt}


\renewcommand{\cftchapfont}{\mdseries}
\renewcommand{\cftchappagefont}{\mdseries}
% 目录页码使用常规字重

\renewcommand{\cftsecpagefont}{\mdseries}
\renewcommand{\cftsecafterpnum}{}
\renewcommand{\cftchappagefont}{\mdseries}
\renewcommand{\cftchapafterpnum}{}
\renewcommand{\cftsubsecpagefont}{\mdseries}
\renewcommand{\cftsubsecafterpnum}{}




\ctexset{section = {
  format     = {\bfseries\normalsize},
  beforeskip = \jnuthss@sectionBeforeSkip, % 一级标题前间距
  afterskip  = \jnuthss@sectionAfterSkip, % 一级标题后间距
  afterindent= false,
  fixskip    = true,
  }
}
% 节标题
\ctexset{subsection={
   format     = {\bfseries\normalsize},
   beforeskip = \jnuthss@subsectionBeforeSkip, % 二级标题前间距
   afterskip  = \jnuthss@subsectionAfterSkip, % 二级标题后间距
   afterindent= false,
   fixskip    = true,
   }
}
% 小节标题

\RequirePackage{fancyhdr}
% 页眉页脚支持
\RequirePackage{emptypage}
% 偶数空白页去掉页眉页脚


\fancypagestyle{myfancy}{
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\cfoot{\zihao{-5}\thepage}
}

\fancypagestyle{plain}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \cfoot{\zihao{-5}\thepage}
}




\renewcommand\frontmatter{%
    \if@openright
        \cleardoublepage
    \else
        \clearpage
    \fi
\@mainmatterfalse
\pagenumbering{Roman}\pagestyle{plain}
\setstretch{\jnuthss@frontMatterLineSpread} % 前置部分行距
\ctexset{
    chapter = {
        name       = {},
        number     = {},
        format     = {\centering\bfseries\fontsize{14bp}{21bp}\selectfont},
        beforeskip = \jnuthss@chapterTitleBeforeSkip, % 章标题前间距
        afterskip  = \jnuthss@chapterTitleAfterSkipFrontBack, % 前后置部分章标题后间距
        fixskip    = true,
    }
}
}
% 前置部分页码用罗马数字编号，
\renewcommand\mainmatter{%
    \if@openright
        \cleardoublepage
    \else
        \clearpage
    \fi
\@mainmattertrue
\pagenumbering{arabic}\pagestyle{myfancy}
\setstretch{\jnuthss@mainMatterLineSpread} % 正文部分行距
\ctexset{
    chapter = {
        name       = {},
        number     = {\arabic{chapter}},
        aftername  = {. },
        format     = {\bfseries\normalsize},
        beforeskip = \jnuthss@chapterTitleBeforeSkip, % 章标题前间距
        afterskip  = \jnuthss@chapterTitleAfterSkipMain, % 正文部分章标题后间距
        afterindent= false,
        fixskip    = true,
        pagestyle  = myfancy,
    }
}
}
% 正文部分页码用阿拉伯数字编号，有页脚，有页眉
\renewcommand\backmatter{%
    \if@openright
        \cleardoublepage
    \else
        \clearpage
    \fi
\@mainmatterfalse
\pagestyle{plain}
\setstretch{\jnuthss@backMatterLineSpread} % 后置部分行距
\ctexset{
    chapter = {
        name       = {},
        number     = {},
        format     = {\centering\bfseries\fontsize{14bp}{21bp}\selectfont},
        beforeskip = \jnuthss@chapterTitleBeforeSkip, % 章标题前间距
        afterskip  = \jnuthss@chapterTitleAfterSkipFrontBack, % 前后置部分章标题后间距
        fixskip    = true,
    }
}
}

















%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% 首页%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





\ifjnuthss@master
    \newcommand{\thsstype}{} % 暨南大学硕士学位论文（当前模板未直接显示）
    \else
        \newcommand{\thsstype}{} % 暨南大学博士学位论文（当前模板未直接显示）
\fi
% 硕博类型判断

\newcommand\ctitle[1]{\def\jnuthss@value@ctitle{#1}} % 中文题目
\newcommand\etitle[1]{\def\jnuthss@value@etitle{#1}} % 英文题目（完整）
\newcommand\etitlelinea[1]{\def\jnuthss@value@etitlelinea{#1}} % 英文封面题目第一行
\newcommand\etitlelineb[1]{\def\jnuthss@value@etitlelineb{#1}} % 英文封面题目第二行

\renewcommand\author[1]{\def\jnuthss@value@author{#1}} % 英文作者名
\newcommand\cauthor[1]{\def\jnuthss@value@cauthor{#1}} % 中文作者名
\newcommand\studentid[1]{\def\jnuthss@value@studentid{#1}} % 学号
\newcommand\college[1]{\def\jnuthss@value@college{#1}} % 学院
\newcommand\department[1]{\def\jnuthss@value@department{#1}} % 学系/系别
\newcommand\emajor[1]{\def\jnuthss@value@emajor{#1}} % 英文专业
\newcommand\cmajor[1]{\def\jnuthss@value@cmajor{#1}} % 中文专业
\newcommand\esupervisor[1]{\def\jnuthss@value@esupervisor{#1}} % 英文导师名
\newcommand\csupervisor[1]{\def\jnuthss@value@csupervisor{#1}} % 中文导师名
\newcommand\edate[1]{\def\jnuthss@value@edate{#1}} % 英文日期
\newcommand\cdate[1]{\def\jnuthss@value@cdate{#1}} % 中文日期

\newcommand\mentora[1]{\def\jnuthss@value@mentora{#1}} % 预留：导师A姓名
\newcommand\mentoradegree[1]{\def\jnuthss@value@mentoradegree{#1}} % 预留：导师A学位
\newcommand\mentoratitle[1]{\def\jnuthss@value@mentoratitle{#1}} % 预留：导师A职称

\newcommand\mentorb[1]{\def\jnuthss@value@mentorb{#1}} % 预留：导师B姓名
\newcommand\mentorbdegree[1]{\def\jnuthss@value@mentorbdegree{#1}} % 预留：导师B学位
\newcommand\mentorbtitle[1]{\def\jnuthss@value@mentorbtitle{#1}} % 预留：导师B职称

\newcommand\branch[1]{\def\jnuthss@value@branch{#1}} % 预留：学科分支
\newcommand\major[1]{\def\jnuthss@value@major{#1}} % 预留：专业方向
\newcommand\degreetype[1]{\def\jnuthss@value@degreetype{#1}} % 预留：学位类型
% 个人信息定义
\def\jnuthss@value@ctitle{}
\def\jnuthss@value@etitle{}
\def\jnuthss@value@etitlelinea{}
\def\jnuthss@value@etitlelineb{}
\def\jnuthss@value@author{}
\def\jnuthss@value@cauthor{}
\def\jnuthss@value@studentid{}
\def\jnuthss@value@college{}
\def\jnuthss@value@department{}
\def\jnuthss@value@emajor{}
\def\jnuthss@value@cmajor{}
\def\jnuthss@value@esupervisor{}
\def\jnuthss@value@csupervisor{}
\def\jnuthss@value@edate{}
\def\jnuthss@value@cdate{}






% ------------------------------------------------------------------
% 前置部分参数区
% 前置部分的封面、声明、摘要等参数统一放在这里，避免后续再回到正文宏中逐项查找。
\newcommand{\jnuthss@coverENFont}{\fontsize{17pt}{21pt}\selectfont} % 英文封面统一字体
\newcommand{\jnuthss@coverENTitleTopSpace}{2.82cm} % 英文封面标题区顶部空白
\newcommand{\jnuthss@coverENTitleLabelWidth}{1.45cm} % 英文封面标题标签列宽
\newcommand{\jnuthss@coverENTitleValueWidth}{12.95cm} % 英文封面标题内容列宽
\newcommand{\jnuthss@coverENTitleLineGap}{0.28cm} % 英文封面两行题目间距
\newcommand{\jnuthss@coverENInfoTopSpace}{6.84cm} % 英文封面信息区顶部空白
\newcommand{\jnuthss@coverENInfoLabelWidth}{4.62cm} % 英文封面信息标签列宽
\newcommand{\jnuthss@coverENInfoValueWidth}{6.98cm} % 英文封面信息内容列宽
\newcommand{\jnuthss@coverENInfoRowGap}{0.27cm} % 英文封面信息行距

\newcommand{\jnuthss@coverCNHeadlineFont}{\CJKfontspec[AutoFakeBold=2.0]{SimHei}\bfseries\fontsize{26pt}{31pt}\selectfont} % 中文封面顶部大标题字体
\newcommand{\jnuthss@coverCNLabelFont}{\CJKfontspec[AutoFakeBold=2.8]{SimSun}\bfseries\fontsize{15pt}{15pt}\selectfont} % 中文封面字段标签字体
\newcommand{\jnuthss@coverCNValueFont}{\CJKfontspec{SimSun}\fontsize{15pt}{15pt}\selectfont} % 中文封面内容字体
\newcommand{\jnuthss@coverCNTopSpace}{1.57cm} % 中文封面页顶空白
\newcommand{\jnuthss@coverCNHeadlineGap}{0.35cm} % 中文封面两行大标题之间间距
\newcommand{\jnuthss@coverCNTitleTopSpace}{3.82cm} % 中文封面“论文题目”块顶部间距
\newcommand{\jnuthss@coverCNInfoTopSpace}{4.73cm} % 中文封面信息表格顶部间距
\newcommand{\jnuthss@coverCNInfoIndent}{3.55cm} % 中文封面信息表格整体左缩进
\newcommand{\jnuthss@coverCNLabelWidth}{2.15cm} % 中文封面标签列宽
\newcommand{\jnuthss@coverCNValueWidth}{5.55cm} % 中文封面内容列宽
\newcommand{\jnuthss@coverCNRowGap}{0.27cm} % 中文封面信息行距
\newcommand{\jnuthss@coverCNDateTopSpace}{0.42cm} % 中文封面日期上方间距

\newcommand{\jnuthss@statementENTitleFont}{\bfseries\fontsize{\jnuthss@statementENTitleFontSize}{\jnuthss@statementENTitleBaseline}\selectfont} % 英文声明标题字号
\newcommand{\jnuthss@statementENBodyFont}{\fontsize{\jnuthss@statementENBodyFontSize}{\jnuthss@statementENBodyBaseline}\selectfont} % 英文声明正文字号
\newcommand{\jnuthss@statementENTopSpace}{2.11cm} % 英文声明页顶空白
\newcommand{\jnuthss@statementENTitleGap}{1.29cm} % 英文声明标题与正文间距
\newcommand{\jnuthss@statementENSignTopSpace}{5.08cm} % 英文声明正文到签名区间距
\newcommand{\jnuthss@statementENSignIndent}{0.95cm} % 英文声明签名区左缩进
\newcommand{\jnuthss@statementENSignGap}{4.00cm} % 英文声明签名与日期间距

\newcommand{\jnuthss@statementCNTitleFont}{\CJKfontspec[AutoFakeBold=2.2]{KaiTi}\bfseries\fontsize{\jnuthss@statementCNTitleFontSize}{\jnuthss@statementCNTitleBaseline}\selectfont} % 中文声明标题字号
\newcommand{\jnuthss@statementCNBodyFont}{\CJKfontspec{KaiTi}\fontsize{\jnuthss@statementCNBodyFontSize}{\jnuthss@statementCNBodyBaseline}\selectfont} % 中文声明正文字号
\newcommand{\jnuthss@statementCNTopSpace}{1.45cm} % 中文声明页顶空白
\newcommand{\jnuthss@statementCNTitleGap}{1.21cm} % 中文声明标题与正文间距
\newcommand{\jnuthss@statementCNSignTopSpace}{3.81cm} % 中文声明正文到签名区间距
\newcommand{\jnuthss@statementCNSignIndent}{2.25cm} % 中文声明签名区左缩进







\AtBeginDocument{%
\hypersetup{pdftitle={\jnuthss@value@etitle},pdfauthor={\jnuthss@value@author},pdfsubject={\jnuthss@hyperrefPdfSubject}} % PDF 主题
\setcitestyle{authoryear,round,aysep={, },notesep={; },semicolon}% 文内引用形如 (Smith, 2001)
\let\cite\citep% 将 \cite 统一映射为 natbib 的括号引用
\renewcommand{\bibpreamble}{}% 清空参考文献导语
\setlength{\bibhang}{2em}% 参考文献悬挂缩进
\setlength{\bibsep}{0.35\baselineskip}% 参考文献条目间距
\renewcommand{\bibfont}{\fontsize{\jnuthss@referenceFontSize}{\jnuthss@referenceBaseline}\selectfont} % 参考文献字号
\renewcommand{\thefigure}{\jnuthss@figureNumberFormat} % 图片编号格式
\renewcommand{\thetable}{\jnuthss@tableNumberFormat} % 表格编号格式
\renewcommand{\figurename}{\jnuthss@figureName} % 图片名称
\renewcommand{\tablename}{\jnuthss@tableName} % 表格名称
\setlist[enumerate]{label=\jnuthss@enumerateLabel,leftmargin=\jnuthss@enumerateLeftMargin,labelwidth=\jnuthss@enumerateLabelWidth,labelsep=\jnuthss@enumerateLabelSep,itemindent=\jnuthss@enumerateItemIndent,listparindent=\parindent,align=left,topsep=\jnuthss@enumerateTopSep,itemsep=\jnuthss@enumerateItemSep,parsep=\jnuthss@enumerateParsep,partopsep=\jnuthss@enumeratePartopSep} % 编号列表标签格式
\setlist[itemize]{label=\jnuthss@itemizeLabel,leftmargin=\jnuthss@itemizeLeftMargin,labelwidth=\jnuthss@itemizeLabelWidth,labelsep=\jnuthss@itemizeLabelSep,itemindent=\jnuthss@itemizeItemIndent,listparindent=\parindent,align=left,topsep=\jnuthss@itemizeTopSep,itemsep=\jnuthss@itemizeItemSep,parsep=\jnuthss@itemizeParsep,partopsep=\jnuthss@itemizePartopSep} % 项目列表标签内容
\renewcommand{\arraystretch}{\jnuthss@arrayStretch} % 表格行高倍率
\setlength{\tabcolsep}{\jnuthss@tabColSep} % 表格列间距
\jnuthss@applyEquationNumbering % 公式按章编号
\jnuthss@disableInsertedBlankPages % 禁用自动插入的空白页
}

% 参考文献使用 gbt7714-2015 规范宏包








% ------------------------------------------------------------------
% 封面% ------------------------------------------------------------------

\newcommand{\jnuthssmaketableofcontents}{\chapter*{\texorpdfstring{\jnuthss@contentsTitle}{}}\renewcommand{\contentsname}{}\tableofcontents} % 统一目录入口（隐藏默认 Contents 重复标题）
\renewcommand\maketitle[1]{%

\thispagestyle{empty}

\vspace*{\jnuthss@coverENTitleTopSpace} % 英文封面标题区顶部空白
\noindent
\begin{tabular}{@{}p{\jnuthss@coverENTitleLabelWidth}p{\jnuthss@coverENTitleValueWidth}@{}} % 英文封面标题标签列宽
{\jnuthss@coverENFont Title} & % 英文封面统一字体
{\jnuthss@coverENFont \underline{\jnuthss@value@etitlelinea}}\\[\jnuthss@coverENTitleLineGap] % 英文封面统一字体
&
{\jnuthss@coverENFont \underline{\jnuthss@value@etitlelineb}}\\ % 英文封面统一字体
\end{tabular}

\vspace{\jnuthss@coverENInfoTopSpace} % 英文封面信息区顶部空白
\noindent
\begin{tabular}{@{}p{\jnuthss@coverENInfoLabelWidth}p{\jnuthss@coverENInfoValueWidth}@{}} % 英文封面信息标签列宽
{\jnuthss@coverENFont Student Name} & {\jnuthss@coverENFont \underline{\jnuthss@value@author}}\\[\jnuthss@coverENInfoRowGap] % 英文封面统一字体
{\jnuthss@coverENFont Student No.} & {\jnuthss@coverENFont \underline{\jnuthss@value@studentid}}\\[\jnuthss@coverENInfoRowGap] % 英文封面统一字体
{\jnuthss@coverENFont Major} & {\jnuthss@coverENFont \underline{\jnuthss@value@emajor}}\\[\jnuthss@coverENInfoRowGap] % 英文封面统一字体
{\jnuthss@coverENFont Supervisor} & {\jnuthss@coverENFont \underline{\jnuthss@value@esupervisor}}\\[\jnuthss@coverENInfoRowGap] % 英文封面统一字体
{\jnuthss@coverENFont Date (dd/mm/yyyy)} & {\jnuthss@coverENFont \underline{\jnuthss@value@edate}}\\ % 英文封面统一字体
\end{tabular}

\clearpage
\thispagestyle{empty}
\vspace*{\jnuthss@coverCNTopSpace}
{\centering\jnuthss@coverCNHeadlineFont
\makebox[1.36cm][c]{暨}\makebox[1.36cm][c]{南}\makebox[1.36cm][c]{大}\makebox[1.36cm][c]{学}\par}
\vspace{\jnuthss@coverCNHeadlineGap}
{\centering\jnuthss@coverCNHeadlineFont
\makebox[1.01cm][c]{本}\makebox[1.01cm][c]{科}\makebox[1.01cm][c]{生}\makebox[1.01cm][c]{毕}\makebox[1.01cm][c]{业}\makebox[1.01cm][c]{论}\makebox[1.01cm][c]{文}\par}

\vspace{\jnuthss@coverCNTitleTopSpace}
{\centering\jnuthss@coverCNLabelFont 论文题目\quad
\underline{{\jnuthss@coverCNValueFont \jnuthss@value@ctitle}}\par} % 中文封面内容字体

\vspace{\jnuthss@coverCNInfoTopSpace}
\noindent\hspace*{\jnuthss@coverCNInfoIndent}
\begin{tabular}{@{}p{\jnuthss@coverCNLabelWidth}p{\jnuthss@coverCNValueWidth}@{}} % 中文封面标签列宽
{\jnuthss@coverCNLabelFont 学\qquad 院} & \underline{\makebox[\jnuthss@coverCNValueWidth][l]{{\jnuthss@coverCNValueFont \jnuthss@value@college}}}\\[\jnuthss@coverCNRowGap] % 中文封面内容字体
{\jnuthss@coverCNLabelFont 学\qquad 系} & \underline{\makebox[\jnuthss@coverCNValueWidth][l]{{\jnuthss@coverCNValueFont \jnuthss@value@department}}}\\[\jnuthss@coverCNRowGap] % 中文封面内容字体
{\jnuthss@coverCNLabelFont 专\qquad 业} & \underline{\makebox[\jnuthss@coverCNValueWidth][l]{{\jnuthss@coverCNValueFont \jnuthss@value@cmajor}}}\\[\jnuthss@coverCNRowGap] % 中文封面内容字体
{\jnuthss@coverCNLabelFont 姓\qquad 名} & \underline{\makebox[\jnuthss@coverCNValueWidth][l]{{\jnuthss@coverCNValueFont \jnuthss@value@cauthor}}}\\[\jnuthss@coverCNRowGap] % 中文封面内容字体
{\jnuthss@coverCNLabelFont 学\qquad 号} & \underline{\makebox[\jnuthss@coverCNValueWidth][l]{{\jnuthss@coverCNValueFont \jnuthss@value@studentid}}}\\[\jnuthss@coverCNRowGap] % 中文封面内容字体
{\jnuthss@coverCNLabelFont 指导教师} & \underline{\makebox[\jnuthss@coverCNValueWidth][l]{{\jnuthss@coverCNValueFont \jnuthss@value@csupervisor}}}\\ % 中文封面内容字体
\end{tabular}

\vspace{\jnuthss@coverCNDateTopSpace}
{\centering{\jnuthss@coverCNValueFont \jnuthss@value@cdate}\par} % 中文封面内容字体

\thispagestyle{empty}
\clearpage{\thispagestyle{empty}\cleardoublepage}

}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 中英文诚信声明%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ------------------------------------------------------------------
% 诚信声明% ------------------------------------------------------------------
\newcommand{\makestatement}[1]{

\thispagestyle{empty}


{
\vspace*{\jnuthss@statementENTopSpace}
\centering{\jnuthss@statementENTitleFont Statement of Originality\par} % 英文声明标题字体
\vspace{\jnuthss@statementENTitleGap}
}

{\jnuthss@statementENBodyFont\setlength{\parindent}{0pt} % 英文声明正文字体
I hereby declare that the thesis presented is the result of research performed by me personally, under guidance from my supervisor. This thesis does not contain any content (other than those cited with references) that has been previously published or written by others, nor does it contain any material previously presented to other educational institutions for degree or certificate purpose to the best of my knowledge. I promise that all facts presented in this thesis are true and creditable.\par}

\vspace{\jnuthss@statementENSignTopSpace}

\noindent\hspace*{\jnuthss@statementENSignIndent}
\begin{tabular}{@{}p{4.8cm}@{\hspace{\jnuthss@statementENSignGap}}p{6.6cm}@{}} % 英文声明签名与日期间距
{\fontsize{12pt}{40pt}\selectfont Signed:\underline{\hspace{6em}}} & {\fontsize{12pt}{40pt}\selectfont Date:\underline{\hspace{3.8em}}(dd/mm/yyyy)}\\
\end{tabular}

\newpage

{
\vspace*{\jnuthss@statementCNTopSpace}
\centering{{\jnuthss@statementCNTitleFont 诚\hspace{0.9em}信\hspace{0.9em}声\hspace{0.9em}明}\par} % 中文声明标题字体
\vspace{\jnuthss@statementCNTitleGap}
}

{\jnuthss@statementCNBodyFont\setlength{\parindent}{2em}我声明，所呈交的毕业论文是本人在老师指导下进行的研究工作及取得的研究成果。据我查证，除了文中特别加以标注和致谢的地方外，论文中不包含其他人已经发表或撰写过的研究成果，也不包含为获得其他教育机构的学位或证书而使用过的材料。我承诺，论文中的所有内容均真实、可信。\par} % 中文声明正文字体

\vspace{\jnuthss@statementCNSignTopSpace}

\noindent\hspace*{\jnuthss@statementCNSignIndent}
\begin{tabular}{@{}p{5.55cm}p{6.65cm}@{}}
{\hspace*{-\jnuthss@statementCNSignIndent}\jnuthss@statementCNBodyFont 毕业论文作者签名：} & {\hspace*{0.35cm}\jnuthss@statementCNBodyFont 签名日期：\quad 年\quad 月\quad 日}\ % 中文声明正文字体
\end{tabular}



\thispagestyle{empty}
\clearpage{\thispagestyle{empty}\cleardoublepage}

}
