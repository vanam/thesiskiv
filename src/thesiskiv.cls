% Standardní vzhled kvalifikační práce
%
% Západočeská univerzita v Plzni
% Fakulta aplikovaných věd
% Katedra informatiky a výpočetní techniky
%
% Petr Lobaz, lobaz@kiv.zcu.cz, 2016/03/14
% Martin Váňa, vanam@students.zcu.cz, 2018/05/10
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesiskiv}[2016/03/14 Thesis at DCSE (KIV)]
\DeclareOption{czech}{\def\KIV@lng{czech}}
\DeclareOption{english}{\def\KIV@lng{british}}
\DeclareOption{BP}{}
\DeclareOption{DP}{}
\DeclareOption{onesideprinting}{}
\DeclareOption{draft}{}
\ExecuteOptions{czech}
\ProcessOptions\relax
%
% DEFAULT PAGE LAYOUT, etc.
%
\@ifclasswith{thesiskiv}{onesideprinting}
  {%
    \newcommand{\onesideprinting}{\twosideprintingfalse}
  }{%
    \newcommand{\twosideprinting}{\twosideprintingtrue}
    \PassOptionsToClass{twoside,openright}{report}
  }%
\LoadClass[12pt]{report}
\RequirePackage{lmodern}
\RequirePackage[czech,british]{babel}
\RequirePackage{emptypage}      % empty pages without numbers
% select default language at the beginning of the document
% (other selection schemes, such as calling babel with [czech,british]
% or [british,czech], did not work properly)
\expandafter\AtBeginDocument%
 \expandafter{%
 \expandafter\selectlanguage%
 \expandafter{\KIV@lng}}
\RequirePackage[utf8]{inputenc}
\RequirePackage[usenames,svgnames]{xcolor}  % typesetting in color
\RequirePackage[final]{pdfpages}
\RequirePackage[T1]{fontenc}
\RequirePackage[a4paper,left=37mm,right=37mm,top=33mm,bottom=40mm]{geometry}
\linespread{1.1}
%
% USER COMMANDS
%
% Czech double quotes: use \uv{quoted text}
\ifx\uv\undefined
 \newcommand{\uv}[1]{\quotedblbase{#1}\textquotedblleft}
\fi
%
\newcommand{\university}[1]{\def\@university{#1}}
\newcommand{\faculty}[1]{\def\@faculty{#1}}
\newcommand{\department}[1]{\def\@department{#1}}
\newcommand{\subject}[1]{\def\@subject{#1}}
\newcommand{\titlepageyear}[1]{\def\KIV@titlepageyear{#1}}
\newcommand{\titlepagetown}[1]{\def\KIV@titlepagetown{#1}}
\newcommand{\declarationtown}[1]{\def\KIV@declarationtown{#1}}
\newcommand{\declarationdate}[1]{\def\KIV@declarationdate{#1}}
\newcommand{\specificationfile}[1]{\def\KIV@specificationfile{#1}}
\newcommand{\abstracttexten}[1]{\long\def\KIV@abstracttexten{#1}}
\newcommand{\abstracttextcz}[1]{\long\def\KIV@abstracttextcz{#1}}
\newcommand{\acknowledgement}[1]{\long\def\KIV@acknowledgement{#1}}
%
% in Czech, Declaration text differs if the writer is male or female
%
\newif\ifdeclarationfemale
\newcommand{\declarationfemale}{\declarationfemaletrue}
\newcommand{\declarationmale}{\declarationfemalefalse}
%
% CHAPTER LOOK
%
\def\@makechapterhead#1{%
  {\parindent \z@ \raggedright \normalfont
    \Huge\bfseries
    \ifnum \c@secnumdepth >\m@ne
    	\hangindent=1.5em
        \noindent\hbox to 1.5em{\thechapter\hfil}%
    \fi%
    #1\par\nobreak
    \vskip 40\p@
  }}
\def\@makeschapterhead#1{%
  {\parindent \z@ \raggedright \normalfont
    \interlinepenalty\@M
    \Huge \bfseries  #1\par\nobreak
    \vskip 40\p@
  }}
%
% OPENING PAGES
%
% top offset of the Declaration and the Abstract(s)
\def\KIV@chapstarrule{\vrule width0pt height 120pt}
%
\renewcommand\maketitle{
  \pdfbookmark{Title Page}{title}
  {% first page is a bit bigger
  \enlargethispage{25mm}
  \addtolength{\topmargin}{-8mm}
  \thispagestyle{empty}
  \begin{titlepage}%
  \begin{center}%
	{\fontsize{22}{28}\selectfont
	 \@university\par
	 \@faculty\par
	 \hbox to \textwidth{\hss\@department\hss}}\vskip 26mm
	{\fontsize{28}{35}\selectfont\bfseries
	 \@subject\par\vskip 17mm
 	 \@title\par}\vfill
    {\fontsize{16}{16}\selectfont\KIV@titlepagetown\ \KIV@titlepageyear
	 \hfill\@author}
  \end{center}
  \end{titlepage}%
  }
  %
  % ASSIGNMENT PAGE
  %
  \setcounter{page}{2}
  \ifdefined\twosideprinting
    \newpage\null\thispagestyle{empty}\newpage
  \fi
  \pdfbookmark{\KIV@specificationname}{specification}
  \ifdefined\KIV@specificationfile
    \includepdf[pages={1,2}]{\KIV@specificationfile}
  \else
    \thispagestyle{empty}
    \hbox{}\vfill
    {\centering\Huge\bfseries\color{red} Místo této strany bude\\ zadání práce.\par}
    \vfill\vfill
    \ifdefined\twosideprinting
    \newpage
    \thispagestyle{empty}
    \hbox{}\vfill
    {\centering\Huge\bfseries\color{red} Místo této strany bude\\ druhá strana\\ zadání práce.\par}
    \vfill\vfill%
    \fi
  \fi
  %
  % DECLARATION PAGE
  %
  \newpage
  \thispagestyle{empty}
  {%
    \pdfbookmark{\KIV@declarationname / \KIV@acknowledgementname}{declarationacknowledgement}
    \section*{\KIV@chapstarrule\KIV@declarationname}
    \KIV@declarationtext\par
    \vskip 1.5em
    \noindent\KIV@declarationfoot\KIV@declarationdate\par
    \vskip 0.7em
    \noindent\hfill\@author\hspace*{10mm}\par
    \vspace{6em} % active only if both abstracts fit on a single page
    \section*{\KIV@chapstarrule\KIV@acknowledgementname}
    \medskip
    \parbox{\textwidth}{\parindent 1.5em\noindent \KIV@acknowledgement}
  }%
  \newpage
  %
  % ABSTRACT PAGE(S)
  %
  \pagestyle{empty}
  {%
  \pdfbookmark{Abstract / Abstrakt}{abstract}
  \begin{otherlanguage}{british}
  \section*{\KIV@chapstarrule Abstract}
  \medskip
  \parbox{\textwidth}{\parindent 1.5em\noindent \KIV@abstracttexten}
  \end{otherlanguage}
  \begin{otherlanguage}{czech}
  \section*{\KIV@chapstarrule Abstrakt}
  \medskip
  \parbox{\textwidth}{\parindent 1.5em\noindent \KIV@abstracttextcz}
  \end{otherlanguage}
  }%
  \newpage
  %
  % Just one set of the opening pages is permitted
  %
  \global\let\maketitle\relax
  \pagestyle{plain}
}
%
% MAKE FRONT
%
\newcommand\makefront{
  \maketitle
  \pdfbookmark{\contentsname}{toc}
  \setcounter{tocdepth}{1}
  \tableofcontents
  \setcounter{tocdepth}{2}

  % Empty page before introduction
  \ifdefined\twosideprinting
    \newpage\null\thispagestyle{empty}\newpage
    \thispagestyle{empty}
    \cleardoublepage
  \fi

  \newpage
  \pagenumbering{arabic}
  \setcounter{page}{1}
}
%
% LANGUAGE DEPENDENT DEFAULT SETTINGS
%
\@ifclasswith{thesiskiv}{czech}{
 \university{Západočeská univerzita v Plzni}
 \faculty{Fakulta aplikovaných věd}
 \department{Katedra informatiky a výpočetní techniky}
 \@ifclasswith{thesiskiv}{BP}
  {\subject{Bakalářská práce}\def\KIV@thesistype{bakalářskou}}{}
 \@ifclasswith{thesiskiv}{DP}
  {\subject{Diplomová práce}\def\KIV@thesistype{diplomovou}}{}
 \titlepagetown{Plzeň}
 \declarationtown{Plzni}
 \def\KIV@specificationname{Zadání}
 \def\KIV@declarationname{Prohlášení}
 \def\KIV@acknowledgementname{Poděkování}
 \def\KIV@declarationtext{Prohlašuji, že jsem \KIV@thesistype\ práci vypracoval\ifdeclarationfemale{a}\fi\ samostatně a výhradně s~použitím citovaných pramenů.}
 \def\KIV@declarationfoot{V \KIV@declarationtown\ dne\ }
}{}
\@ifclasswith{thesiskiv}{english}{
 \university{University of West Bohemia}
 \faculty{Faculty of Applied Sciences}
 \department{Department of Computer Science and Engineering}
 \@ifclasswith{thesiskiv}{BP}
   {\subject{Bachelor's Thesis}\def\KIV@thesistype{bachelor's}}{}
 \@ifclasswith{thesiskiv}{DP}
  {\subject{Master's Thesis}\def\KIV@thesistype{master's}}{}
 \titlepagetown{Plzeň}
 \declarationtown{Plzeň}
 \def\KIV@specificationname{Specification}
 \def\KIV@declarationname{Declaration}
 \def\KIV@acknowledgementname{Acknowledgement}
 \def\KIV@declarationtext{I hereby declare that this \KIV@thesistype\ thesis is completely my own work and that I used only the cited sources.}
 \def\KIV@declarationfoot{\KIV@declarationtown,\ }
}{}
%
% DRAFT OPTION
%
\@ifclasswith{thesiskiv}{draft}
  {
    \usepackage{draftwatermark}				%Sets watermarks up.
    \SetWatermarkScale{0.3}
    \SetWatermarkText{\bfseries Draft: \today}
  }
  {}
%
% OTHER DEFAULT SETTINGS
%
\pagenumbering{roman}
\titlepageyear{\number\year}
\declarationdate{\today}
\declarationmale
%
% END OF CLASS DEFINITION
%
