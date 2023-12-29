%% mnml.cls
%% Copyright 2023 parvatarohin <parvatarohin@gmail.com>
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
%
% The Current Maintainer of this work is @parvatarohin.
%
% This work consists of the files mnml.dtx and mnml.ins
% and the derived file mnml.cls.

% Please report bugs and other problems as well as suggestions for improvements
% by using the issue tracker on GitHub: https://github.com/parvatarohin/texmf/issues
% or sending an email to <parvatarohin@gmail.com>.

\NeedsTeXFormat{LaTeX2e}[2022-06-01]
\ProvidesClass{mnml}[2023-12-01 v1.00 Minimalist LaTeX article class]

\newcommand\mnml@fontsize{12pt}
\DeclareOption{10pt}{\renewcommand\mnml@fontsize{10pt}}
\DeclareOption{11pt}{\renewcommand\mnml@fontsize{11pt}}
\DeclareOption{12pt}{\renewcommand\mnml@fontsize{12pt}}
\PassOptionsToClass{\mnml@fontsize}{article}

\newcommand\mnml@papersize{a4paper}
\DeclareOption{a4paper}{\renewcommand\mnml@papersize{a4paper}}
\DeclareOption{a5paper}{\renewcommand\mnml@papersize{a5paper}}
\PassOptionsToClass{\mnml@papersize}{article}

\newif\if@oneside\@onesidefalse
\DeclareOption{oneside}{\PassOptionsToClass{\CurrentOption}{article}\@onesidetrue}
\DeclareOption{twoside}{\PassOptionsToClass{\CurrentOption}{article}}

\DeclareOption*{
  \ClassWarning{mnml}{Unknown or non-standard option '\CurrentOption'.
    I'll see if I can load it from the article class. If you get a warning
    unused global option(s): `\CurrentOption` then the option is not
    supported!}
  \PassOptionsToClass{\CurrentOption}{article}
}

\ProcessOptions\relax
\LoadClass{article}

\RequirePackage{iftex}
\RequirePackage{ifthen}
\RequirePackage{xparse}
\RequirePackage{tabularx}

\RequirePackage[nomarginpar]{geometry}
\setlength{\parindent}{0pt}
\setlength{\parskip}{6pt plus 2pt minus 4pt}
\setlength{\emergencystretch}{3em}
\frenchspacing

\clubpenalty=9996
\widowpenalty=9999
\brokenpenalty=4991

\predisplaypenalty=10000
\postdisplaypenalty=1549
\displaywidowpenalty=1602

\interfootnotelinepenalty 10
\vfuzz2pt
\hfuzz2pt

\RequirePackage{metalogo,hologo}
\setlogokern{Xe}{-0.061em}
\setlogokern{eL}{-0.057em}
\setlogokern{La}{-0.265em}
\setlogokern{aT}{-0.0585em}
\setlogokern{Te}{-0.0575em}
\setlogokern{eX}{-0.072em}
\setlogokern{eT}{-0.056em}
\setlogokern{X2}{0.1667em}
\setlogodrop{0.153em}

\RequirePackage{polyglossia}
\setmainlanguage[variant=british]{english}
\setotherlanguage{sanskrit}
\setotherlanguage{telugu}

\RequirePackage{fontspec}
\setmainfont{brill}[%
  Extension      = .ttf,
  UprightFont    = *-roman,
  ItalicFont     = *-italic,
  BoldFont       = *-bold,
  BoldItalicFont = *-bolditalic,
  Numbers        = Lining
]

\setsansfont{Inter}[Scale=MatchLowercase]
\setmonofont{Inconsolatazi4}[Scale=0.88]

\newfontfamily\sanskritfont[Script=Latin,Numbers=Lining]{Brill}
\newfontfamily\devanagarifont[Script=Devanagari,Mapping=iast-dn,Scale=MatchLowercase]{Shobhika}
\newfontfamily\telugufont[Script=Telugu,Scale=MatchLowercase]{Tiro Telugu}

\newcommand{\sa}[1]{\emph{\textsanskrit\sanskritfont#1}}
\newcommand{\dn}[1]{\textsanskrit{\devanagarifont#1}}
\newcommand{\te}[1]{\texttelugu{\telugufont#1}}

\RequirePackage[usenames, dvipsnames]{xcolor}
\RequirePackage{latexcolors}
\definecolor{darkpowderblue}{rgb}{0.0, 0.2, 0.6} % From http://latexcolor.com/
\definecolor{cadmiumred}{rgb}{0.89, 0.0, 0.13}   % From http://latexcolor.com/

\RequirePackage{graphicx}
\setkeys{Gin}{width=\linewidth,totalheight=\textheight,keepaspectratio}
\DeclareGraphicsExtensions{.png, .jpg, .jpeg, .pdf}

\RequirePackage{fancyvrb}
\fvset{gobble=1,numbers=left}

\RequirePackage{enumitem}
\setlist[itemize]{noitemsep}
% \setlist[enumerate]{noitemsep}
\setlist[description]{style=nextline,leftmargin=1.25em}

\RequirePackage{xspace}
\newcommand{\st}{\textsuperscript{\textup{st}}\xspace}
\newcommand{\nd}{\textsuperscript{\textup{nd}}\xspace}
\newcommand{\rd}{\textsuperscript{\textup{rd}}\xspace}
\renewcommand{\th}{\textsuperscript{\textup{th}}\xspace}

\newcommand\eg{\textit{e.g.,}\xspace}
\newcommand\ie{\textit{i.e.,}\xspace}
\newcommand\viz{\textit{viz.}\@\xspace}
\newcommand\etal{\textit{et~al.}\@\xspace}
\newcommand\etc{\textit{etc.}\@\xspace}

\newcommand{\AD}{\textsc{ce}{}}
\newcommand{\BC}{\textsc{bce}{}}
\newcommand{\BCE}{\textsc{bce}{}}
\newcommand{\CE}{\textsc{ce}{}}

% \diatop, by Christina Thiele,
% used for r underdot overbar (ṝ, F6, 246)
% See Conference Proceedings, TeXniques no. 5, p.11.
\def\diatop[#1|#2]{\leavevmode{\setbox1=\hbox{{#1{}}}\setbox2=\hbox{{#2{}}}%
    \dimen0=\ifdim\wd1>\wd2\wd1\else\wd2\fi%
    \dimen1=\ht2\advance\dimen1by-1ex%
    \setbox1=\hbox to1\dimen0{\hss#1\hss}%
    \rlap{\raise1\dimen1\box1}%
    \hbox to1\dimen0{\hss#2\hss}}}%
% e.g. of use: \diatop[\'|{\=o}] gives o macron acute

\def\fr#1/#2 {{\addfontfeatures{Fractions=On}#1/#2} }
\def\frx#1/#2 {{\addfontfeatures{Fractions=On}#1/#2}}
