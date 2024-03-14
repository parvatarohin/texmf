% xminimal.cls
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
% This work consists of the files xminimal.dtx and xminimal.ins
% and the derived file xminimal.cls.
% Please report bugs and other problems as well as suggestions for improvements
% by using the issue tracker on GitHub: https://github.com/parvatarohin/texmf/issues
% or sending an email to <parvatarohin@gmail.com>.

\NeedsTeXFormat{LaTeX2e}[2022-06-01]
\ProvidesClass{xminimal}[2024-03-01 v1.00 Minimalist XeLaTeX article class]

\newcommand\xminimal@fontsize{12pt}
\DeclareOption{10pt}{\renewcommand\xminimal@fontsize{10pt}}
\DeclareOption{11pt}{\renewcommand\xminimal@fontsize{11pt}}
\DeclareOption{12pt}{\renewcommand\xminimal@fontsize{12pt}}
\PassOptionsToClass{\xminimal@fontsize}{article}

\newcommand\xminimal@papersize{a4paper}
\DeclareOption{a4paper}{\renewcommand\xminimal@papersize{a4paper}}
\DeclareOption{a5paper}{\renewcommand\xminimal@papersize{a5paper}}
\PassOptionsToClass{\xminimal@papersize}{article}

\newif\if@oneside\@onesidefalse
\DeclareOption{oneside}{\PassOptionsToClass{\CurrentOption}{article}\@onesidetrue}
\DeclareOption{twoside}{\PassOptionsToClass{\CurrentOption}{article}}

\newif\if@portrait\@portraitfalse
\DeclareOption{portrait}{\PassOptionsToClass{\CurrentOption}{article}\@portraittrue}
\DeclareOption{landscape}{\PassOptionsToClass{\CurrentOption}{article}}

\DeclareOption*{
  \ClassWarning{xminimal}{Unknown or non-standard option '\CurrentOption'.
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

\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{latexcolors}
\definecolor{darkpowderblue}{rgb}{0.0, 0.2, 0.6}
\definecolor{cadmiumred}{rgb}{0.89, 0.0, 0.13}

\RequirePackage{graphicx}
\setkeys{Gin}{width=\linewidth,totalheight=\textheight,keepaspectratio}
\DeclareGraphicsExtensions{.png, .jpg, .jpeg, .pdf}

\RequirePackage{fancyvrb}
\fvset{gobble=1,numbers=left}

\RequirePackage{enumitem}
\setlist[itemize]{noitemsep}
\setlist[description]{style=nextline,leftmargin=1.25em}

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

\endinput
