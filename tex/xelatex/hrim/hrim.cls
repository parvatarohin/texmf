% hrim.cls
% Copyright 2023 parvatarohin <parvatarohin@gmail.com>
% Version: 0.01-2023-12-26
% License: LPPL 1.3c
% GitHub Repo: https://github.com/parvatarohin/texmf/
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, in its
% version 1.3c. This version of this license is in
% http://www.latex-project.org/lppl/lppl-1-3c.txt
% and the latest version of this license is in
% http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of
% LaTeX version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
% The Current Maintainer of this work is @parvatarohin.
% Please report bugs and other problems as well as suggestions for improvements
% by using the issue tracker on GitHub: https://github.com/parvatarohin/texmf/issues
% or sending an email to <parvatarohin@gmail.com>.

\NeedsTeXFormat{LaTeX2e}[2022-06-01]
\ProvidesClass{hrim}[2023-11-26 v0.3 Article class for typsetting documents in IAST/Devanāgarī]

\newcommand\hrim@fontsize{12pt} % Set default fontsize to 12pt
\DeclareOption{10pt}{\renewcommand\hrim@fontsize{10pt}}%
\DeclareOption{11pt}{\renewcommand\hrim@fontsize{11pt}}%
\DeclareOption{12pt}{\renewcommand\hrim@fontsize{12pt}}%
\PassOptionsToClass{\hrim@fontsize}{article}%

\newcommand\hrim@papersize{a4paper} % Set default as a4paper
\DeclareOption{a4paper}{\renewcommand\hrim@papersize{a4paper}}%
\DeclareOption{a5paper}{\renewcommand\hrim@papersize{a5paper}}%
\PassOptionsToClass{\hrim@papersize}{article}%

\newif\if@oneside\@onesidefalse
\DeclareOption{oneside}{\PassOptionsToClass{\CurrentOption}{article}\@onesidetrue}%
\DeclareOption{twoside}{\PassOptionsToClass{\CurrentOption}{article}}%

\DeclareOption*{
  \ClassWarning{hrim}{Unknown or non-standard option '\CurrentOption'.
    I'll see if I can load it from the article class. If you get a warning
    unused global option(s): `\CurrentOption` then the option is not
    supported!}
  \PassOptionsToClass{\CurrentOption}{article}%
}

\ProcessOptions\relax%
\LoadClass{article}%

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

% Extra control of appendices
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

\RequirePackage[cmyk,dvipsnames]{xcolor}
\definecolor{hrimred}{cmyk}{0,.91,.72,.23}
\definecolor{hrimgray}{cmyk}{0,0,0,.56}

\RequirePackage{graphicx}
\DeclareGraphicsExtensions{.png, .jpg, .jpeg, .pdf}
% \setkeys{Gin}{width=0.9\textwidth,height=0.9\textheight,keepaspectratio}
\setkeys{Gin}{width=\linewidth,totalheight=\textheight,keepaspectratio}

% Define headers and footers of the pages
\RequirePackage{fancyhdr}
\fancyhead{}
\setlength{\headheight}{14.49998pt}
\fancyhead[LO,RE]{\bfseries\small\mytitle}
\fancyhead[LE,RO]{\small\thepage}
\fancyfoot{}
% \fancyfoot[LE,RO]{\small\thepage}
% \renewcommand{\headrulewidth}{.25pt}
\renewcommand{\headrulewidth}{\iffloatpage{0pt}{0pt}}
\renewcommand{\footrulewidth}{0pt}

% Use fontspec and OpenType fonts with XeLaTeX
\RequirePackage{fontspec}
\defaultfontfeatures{Mapping=tex-text}
\setmainfont{brill}[%
  Extension      = .ttf,
  UprightFont    = *-roman,
  ItalicFont     = *-italic,
  BoldFont       = *-bold,
  BoldItalicFont = *-bolditalic,
  Numbers=Lining
]

\setsansfont{librasans-modern}[%
  Extension      = .otf,
  UprightFont    = *-regular,
  ItalicFont     = *-italic,
  BoldFont       = *-bold,
  BoldItalicFont = *-bolditalic
]

\setmonofont{Inconsolatazi4}[Scale=0.88]

% Multilingual support
\RequirePackage{polyglossia}
\setmainlanguage[variant=british]{english}
\setotherlanguage{sanskrit}
\setotherlanguage{telugu}

% Sanskrit text in Roman tranliteration (IAST)
\newfontfamily\sanskritfont[Script=Latin,Numbers=Lining]{Brill}
\newcommand{\sa}[1]{\emph{\textsanskrit\sanskritfont#1}}

% Sanskrit text in Devanāgarī
\newfontfamily\devanagarifont[Script=Devanagari,Mapping=iast-dn,Scale=MatchLowercase]{Shobhika}
\newcommand{\dn}[1]{\textsanskrit{\devanagarifont#1}}

% Telugu
\newfontfamily\telugufont[Script=Telugu,Scale=MatchLowercase]{Tiro Telugu}
\newcommand{\te}[1]{\texttelugu{\telugufont#1}}

% Adjust kern and drop parameters for XeLaTeX logo
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

% Lists
\RequirePackage{enumitem}
\setlist[itemize]{noitemsep}
% \setlist[enumerate]{noitemsep}
\setlist[description]{style=nextline,leftmargin=1.25em}

% Customization of captions in floating environments
\RequirePackage{caption}
\captionsetup{margin=10pt, font=small, labelfont=bf}

\RequirePackage{fancyvrb}
\fvset{gobble=1,numbers=left}

% Fine-tune hyperreferences (hyperref should be called last)
\RequirePackage[unicode=false,xetex,psdextra]{hyperref}
\RequirePackage{url}
% The new pdf-management scheme loads the bookmarks package internally.
% Authors should use hypersetup to set details, in root .tex file
\hypersetup{%
  bookmarksopen=false,
  linktocpage,%
  colorlinks=true,%
  linkcolor=hrimred,%
  urlcolor=hrimred,%
  citecolor=hrimred,%
  pdfdisplaydoctitle=true%
}
\urlstyle{same}

% Subtitle (optional)
\newcommand{\@subtitle}{}
\newcommand{\subtitle}[1]{\renewcommand{\@subtitle}{#1}}

% Subjectline (This subject will appear in the PDF meta-information
% called `pdfsubject`.)
\newcommand{\@subject}{}
\newcommand{\subject}[1]{\renewcommand{\@subject}{#1}}

% Keywords (These keywords will appear in the PDF meta-information
% called `pdfkeywords`.)
\newcommand{\@keywords}{}
\newcommand{\keywords}[1]{\renewcommand{\@keywords}{#1}}

% PDF meta-information
\AtBeginDocument{
  \hypersetup{%
    pdftitle={\@title},%
    pdfauthor={\@author},%
    pdfsubject={\@subject},%
    pdfkeywords={\@keywords},%
    pdfcreator={XeLaTeX},%
    pdfproducer={LaTeX with hyperref and hrīṃ}%
  }
}

% End of hrim.cls
\endinput
