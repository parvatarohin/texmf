% xarticle.cls
% Copyright 2024 parvatarohin <parvatarohin@gmail.com>
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   https://www.latex-project.org/lppl.txt
% and version 1.3c or later is part of all distributions of LaTeX
% version 2008 or later.
%
% This work has the LPPL maintenance status `maintained'.
% The Current Maintainer of this work is @parvatarohin.
% This work consists of the files xarticle.dtx and xarticle.ins
% and the derived file xarticle.cls.
% Please report bugs and other problems as well as suggestions for improvements
% by using the issue tracker on GitHub: https://github.com/parvatarohin/texmf/issues
% or sending an email to <parvatarohin@gmail.com>.

\NeedsTeXFormat{LaTeX2e}[2022-06-01]
\ProvidesClass{xarticle}[2024-03-19 v1.00 XeLaTeX article class]

\newcommand\xarticle@fontsize{12pt}
\DeclareOption{10pt}{\renewcommand\xarticle@fontsize{10pt}}
\DeclareOption{11pt}{\renewcommand\xarticle@fontsize{11pt}}
\DeclareOption{12pt}{\renewcommand\xarticle@fontsize{12pt}}
\PassOptionsToClass{\xarticle@fontsize}{article}

\newcommand\xarticle@papersize{a4paper}
\DeclareOption{a4paper}{\renewcommand\xarticle@papersize{a4paper}}
\DeclareOption{a5paper}{\renewcommand\xarticle@papersize{a5paper}}
\PassOptionsToClass{\xarticle@papersize}{article}

\newif\if@twoside\@twosidefalse
\DeclareOption{twoside}{\PassOptionsToClass{\CurrentOption}{article}\@twosidetrue}
\DeclareOption{oneside}{\PassOptionsToClass{\CurrentOption}{article}}

\newif\if@portrait\@portraitfalse
\DeclareOption{portrait}{\PassOptionsToClass{\CurrentOption}{article}\@portraittrue}
\DeclareOption{landscape}{\PassOptionsToClass{\CurrentOption}{article}}

\DeclareOption*{
  \ClassWarning{xarticle}{Unknown or non-standard option '\CurrentOption'.
    I'll see if I can load it from the article class. If you get a warning
    unused global option(s): `\CurrentOption` then the option is not
    supported!}
  \PassOptionsToClass{\CurrentOption}{article}
}

\ProcessOptions\relax
\LoadClass{article}

\RequirePackage{iftex}
\RequireXeTeX

\RequirePackage{ifthen}
\RequirePackage{xparse}
\RequirePackage{xspace}
\RequirePackage{tabularx}
\RequirePackage{metalogo,hologo}

\RequirePackage[nomarginpar]{geometry}
\setlength{\parindent}{0pt}
\setlength{\parskip}{6pt plus 2pt minus 4pt}
\setlength{\emergencystretch}{3em}
\frenchspacing

\makeatletter
\let\ps@plain\ps@empty
\makeatother

\clubpenalty=9996
\widowpenalty=9999
\brokenpenalty=4991

\predisplaypenalty=10000
\postdisplaypenalty=1549
\displaywidowpenalty=1602

\interfootnotelinepenalty 10
\vfuzz2pt
\hfuzz2pt

% Clear header style on the last empty odd pages
\renewcommand{\cleardoublepage}{\clearpage\if@twoside \ifodd\c@page\else%
      \hbox{}%
      \thispagestyle{empty} % Empty header styles
      \newpage%
      \if@twocolumn\hbox{}\newpage\fi\fi\fi}

\RequirePackage[nottoc]{tocbibind}
\renewcommand{\contentsname}{Table of contents}
\renewcommand{\listfigurename}{List of figures}
\renewcommand{\listtablename}{List of tables}

\RequirePackage[title,titletoc]{appendix}
\renewcommand{\appendixtocname}{List of appendices}

% Hide Contents appearing from ToC, but add it to bookmarks
\let\temptableofcontents\tableofcontents
\renewcommand{\tableofcontents}{
  % \clearpage
  \pdfbookmark[0]{\contentsname}{Contents}
  \temptableofcontents
}

% Remove pagenumber appearing from TOC
\addtocontents{toc}{\protect\thispagestyle{empty}}
\addtocontents{toc}{\protect\vspace*{3ex}}

\RequirePackage{titlesec}

\titleformat{\section}
{\normalfont\Large\bfseries} % format of title
{\makebox[1pc][r]{\thesection\hspace{1pc}}} % label
{0pt} % length of separation between label and title
{} % before-code hook
\titlespacing*{\section}
{-1pc}{18pt}{10pt}[10pc]

\titleformat{\subsection}
{\normalfont\large\bfseries} % format of title
{\makebox[1pc][r]{\thesubsection\hspace{1pc}}} % label
{0pt} % length of separation between label and title
{} % before-code hook
\titlespacing*{\subsection}
{-1pc}{16pt}{10pt}[10pc]

\titleformat{\subsubsection}
{\normalfont\normalsize\bfseries} % format of title
{\makebox[1pc][r]{\thesubsection\hspace{1pc}}} % label
{0pt} % length of separation between label and title
{} % before-code hook
\titlespacing*{\subsubsection}
{-1pc}{14pt}{10pt}[10pc]

\RequirePackage[cmyk,dvipsnames]{xcolor}
\RequirePackage{latexcolors}
\definecolor{darkpowderblue}{rgb}{0.0, 0.2, 0.6}
\definecolor{cadmiumred}{rgb}{0.89, 0.0, 0.13}
\definecolor{darkred}{cmyk}{0,.91,.72,.23}
\definecolor{lightgray}{cmyk}{0,0,0,.56}

\RequirePackage{graphicx}
% \setkeys{Gin}{width=0.9\textwidth,height=0.9\textheight,keepaspectratio}
\setkeys{Gin}{width=\linewidth,totalheight=\textheight,keepaspectratio}
\DeclareGraphicsExtensions{.png, .jpg, .jpeg, .pdf}

\RequirePackage{fancyvrb}
\fvset{gobble=1,numbers=left}

\RequirePackage{enumitem}
\setlist[itemize]{noitemsep}
\setlist[description]{style=nextline,leftmargin=1.25em}

\RequirePackage{caption}
\captionsetup{margin=10pt, font=small, labelfont=bf}

% Define headers and footers of the pages
\RequirePackage{fancyhdr}
\fancyhead{}
\fancyfoot{}
\fancyfoot[LE,RO]{\small\thepage}
\renewcommand{\headrulewidth}{\iffloatpage{0pt}{0pt}}
\renewcommand{\footrulewidth}{0pt}

\RequirePackage{fontspec}
\defaultfontfeatures{Scale=MatchLowercase,Mapping=tex-text}

\setmainfont{brill}[%
  Extension      = .ttf,
  UprightFont    = *-roman,
  ItalicFont     = *-italic,
  BoldFont       = *-bold,
  BoldItalicFont = *-bolditalic,
  Numbers        = Lining
]

\setsansfont{libertinus-sans}[%
  Extension           = .otf,
  UprightFont         = *-regular,
  ItalicFont          = *-italic,
  ItalicFeatures      = {SmallCapsFont=*-italic},
  SlantedFont         = *-regular,
  SlantedFeatures     = {FakeSlant=0.2},
  BoldFont            = *-bold,
  BoldFeatures        = {SmallCapsFont=*-bold},
  BoldItalicFont      = *-italic,
  BoldItalicFeatures  = {RawFeature={embolden=3},SmallCapsFont=*-italic},
  BoldSlantedFont     = *-bold,
  BoldSlantedFeatures = {FakeSlant=0.2,SmallCapsFont=*-bold},
  SmallCapsFont       = *-regular,
  SmallCapsFeatures   = {Letters=SmallCaps},
  RawFeature          = {+lnum;-onum;+tnum},
  Scale               = MatchLowercase
]

\RequirePackage{polyglossia}
\setmainlanguage[variant=british]{english}
\setotherlanguage{sanskrit}

\newfontfamily\sanskritfont[Script=Latin,Numbers=Lining,Scale=MatchLowercase]{Brill}
\newfontfamily\devanagarifont[Script=Devanagari,Mapping=iast-dn,Scale=MatchLowercase]{Shobhika}

\newenvironment{sloka}
{\begingroup
  \setlength{\topsep}{0pt}
  \setlength{\partopsep}{0pt}
  \list{}{\rightmargin\leftmargin}%
  \item\relax}
{\endlist\endgroup}

\newcommand{\dn}[1]{\textsanskrit{\devanagarifont#1}}
\newcommand{\sa}[1]{\textsanskrit{\sanskritfont#1}}
\newcommand{\tl}[1]{\emph{\textsanskrit\sanskritfont#1}}

\newcommand{\danda}{{\dn।}\@\xspace}
\newcommand{\ddanda}{{\dn॥}\@\xspace}
\newcommand{\iti}[1]{\begin{center}{\dn॥}\@\xspace \textsanskrit#1 {\dn॥}\end{center}\par}

\newcommand{\ensa}[2]{\sa{#1} (\dn{#2})}
\newcommand{\saen}[2]{\dn{#1} (\sa{#2})}

\newcommand{\st}{\textsuperscript{\textup{st}}\xspace}
\newcommand{\nd}{\textsuperscript{\textup{nd}}\xspace}
\newcommand{\rd}{\textsuperscript{\textup{rd}}\xspace}
\renewcommand{\th}{\textsuperscript{\textup{th}}\xspace}

\newcommand\eg{\textit{e.g.,}\xspace}
\newcommand\ie{\textit{i.e.,}\xspace}
\newcommand\viz{\textit{viz.}\@\xspace}
\newcommand\etc{\textit{etc.}\@\xspace}
\newcommand\etal{\textit{et~al.}\@\xspace}

\newcommand{\AD}{\textsc{ce}{}\@\xspace}
\newcommand{\BC}{\textsc{bce}{}\@\xspace}
\newcommand{\BCE}{\textsc{bce}{}\@\xspace}
\newcommand{\CE}{\textsc{ce}{}\@\xspace}
\newcommand{\IAST}{\textsc{iast}{}\@\xspace}

\def\fr#1/#2{{\addfontfeatures{Fractions=On}#1/#2}}

% fine-tune hyperreferences (hyperref should be called last)
\RequirePackage[unicode=false,xetex,psdextra]{hyperref}
\RequirePackage{url}
% the new pdf-management scheme loads the bookmarks package internally.
% authors should use hypersetup to set details, in root .tex file
\hypersetup{%
  bookmarksopen=false,%
  linktocpage,%
  colorlinks=true,%
  linkcolor=darkred,%
  urlcolor=darkred,%
  citecolor=darkred,%
  pdfdisplaydoctitle=true%
}
\urlstyle{same}
\providecommand\hrefurl[2]{\href{#1}{#2}}% in case \DocumentMetadata has not been loaded

% PDF meta-information
\AtBeginDocument{
  \hypersetup{%
    pdfcreator={XeLaTeX},%
    pdfproducer={LaTeX with hyperref and xarticle}%
  }
}

\endinput
