%% The template for weekly report
%% Copyright (C) 2017, Johann Lee <me@qinka.pro> (maintainer)
%%               2017, Q.L. Lee <liql@sxufe.edu.cn>
%% (LGPLv3+)
\ProvidesClass{weekly}[2017/09/20, Johann Lee<me@qinka.pro>, Ver.0.2.2]
\NeedsTeXFormat{LaTeX2e}
\LoadClass[border=1cm]{standalone}

\usepackage{boxedminipage}

\RequirePackage{hyperref}
\hypersetup{colorlinks,linkcolor=blue,anchorcolor=blue,citecolor=red,bookmarksnumbered}


%% tokens for report
\newcommand\report@weekly@text{Date(week)}
\newcommand\report@hours@text{Working Hours}
\newcommand\report@name@text{Name}
\newcommand\report@stuid@text{Stu.Id.}
\newcommand\report@room@text{Room}
\newcommand\report@rchdr@text{Research Direction}
\newcommand\report@crchdr@text{Current Research Direction}

% your name
\newtoks\name
% student id number
\newtoks\stuid
% room
\newtoks\room
% Research direction
\newtoks\rchdr
% current research direction
\newtoks\crchdr

\RequirePackage{tikz}
\RequirePackage{tikzpagenodes}

%% counter
\newcounter{report@counter}


%% new comment for parbox
%% parbox with vskip
\newcommand\vskpparbox[3]{\parbox{#2}{\vskip#1 #3 \vskip#1}}
%% parbox for report's head
\newcommand\rhparbox[2]{\vskpparbox{.25em}{#1}{#2}}
%% parbox for items' head
\newcommand\rihparbox[2]{\vskpparbox{.5em}{#1}{#2}}
%% parbox for items
\newcommand\riparbox[2]{\vskpparbox{.7em}{#1}{\parindent2em #2}}

%% new length
\newlength\squwidth
\newlength\squiwidth

%% new command
\newcommand\report[2]{%
    \setlength\squwidth{20cm} \setlength\squiwidth{20cm}
    \advance\squwidth -12\tabcolsep \advance\squiwidth -2\tabcolsep
    %\setlength\LTleft{0pt}
   % \setlength\LTright{0pt}
    \pdfbookmark[1]{#1}{report:#1}
    \label{report:#1}
    \setcounter{report@counter}{0}
    \begin{center}\begin{tabular}{@{\extracolsep{\fill}}|c|c|c|c|c|c|} \hline
        \rhparbox{0.15\squwidth}{\centering \report@weekly@text} & \multicolumn{3}{|c|}{\rhparbox{0.5\squwidth}{\centering #1}} 
        &\rhparbox{0.17\squwidth}{\centering \report@hours@text} &  \rhparbox{0.17\squwidth}{\centering #2} \\ \hline 
        \rhparbox{0.15\squwidth}{\centering \report@name@text} & \rhparbox{0.17\squwidth}{\centering \the\name} & 
        \rhparbox{0.17\squwidth}{\centering \report@stuid@text} & \rhparbox{0.17\squwidth}{\centering \the\stuid}
        & \rhparbox{0.17\squwidth}{\centering \report@room@text} &\rhparbox{0.17\squwidth}{\centering \the\room} \\ \hline 
        \rhparbox{0.15\squwidth}{\centering \report@rchdr@text} & \multicolumn{5}{|c|}{\rhparbox{0.84\squwidth}{\centering \the\rchdr}} \\ \hline 
        \rhparbox{0.15\squwidth}{\centering \report@crchdr@text} & \multicolumn{5}{|c|}{\rhparbox{0.84\squwidth}{\centering \the\crchdr}} \\ \hline
    \end{tabular}\end{center}
}


%%% 
\newcommand\subreport[1]{%
    \par\noindent
    \rule{\textwidth}{1pt}
    \par 
    \addtocounter{report@counter}{1}
    \thereport@counter.\quad #1
    \par\noindent
    \rule{\textwidth}{1pt}
    \par
}

\newcommand\thisweektask{\subreport{This week's task}}
\newcommand\thisweekproblem{\subreport{This week's problem}}
\newcommand\nextweekplan{\subreport{Next week's plan}}





\let\oldbegdocument\document

\let\oldenddocument\enddocument

\def\document{\oldbegdocument\begin{boxedminipage}[b]{21cm}}
    
\def\enddocument{\end{boxedminipage}\oldenddocument}
