%% The template for weekly report
%% Copyright (C) 2017, Johann Lee <me@qinka.pro> (maintainer)
%%               2017, Q.L. Lee <liql@sxufe.edu.cn>
%% (LGPLv3+)
\ProvidesClass{weekly}[2017/09/20, Johann Lee<me@qinka.pro>, Ver.0.1.0]
\NeedsTeXFormat{LaTeX2e}
\LoadClass[oneside]{article}

%% package
\RequirePackage{longtable}

%% package
\RequirePackage{hyperref}
\hypersetup{colorlinks,linkcolor=blue,anchorcolor=blue,citecolor=red,bookmarksnumbered}

%% new length
\newlength\squwidth
\newlength\squiwidth

%% pakcgae
\RequirePackage{environ}

%% tokens for report
\makeatletter
\newcommand\report@weekly@text{Date(week)}
\newcommand\report@hours@text{Working Hours}
\newcommand\report@name@text{Name}
\newcommand\report@stuid@text{Stu.Id.}
\newcommand\report@room@text{Room}
\newcommand\report@rchdr@text{Research Direction}
\newcommand\report@crchdr@text{Current Research Direction}
\makeatother

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

%% counter
\makeatletter
\newcounter{report@counter}
\makeatother

%% new comment for parbox
%% parbox with vskip
\newcommand\vskpparbox[3]{\parbox{#2}{\vskip#1 #3 \vskip#1}}
%% parbox for report's head
\newcommand\rhparbox[2]{\vskpparbox{.25em}{#1}{#2}}
%% parbox for items' head
\newcommand\rihparbox[2]{\vskpparbox{.5em}{#1}{#2}}
%% parbox for items
\newcommand\riparbox[2]{\vskpparbox{.7em}{#1}{\parindent2em #2}}



%% new environment
%% for report
\makeatletter
\newenvironment{report}[2]{%
    \setlength\squwidth\textwidth \setlength\squiwidth\textwidth
    \advance\squwidth -12\tabcolsep \advance\squiwidth -2\tabcolsep
    \setlength\LTleft{0pt}
    \setlength\LTright{0pt}
    \pdfbookmark[1]{#1}{}
    \begin{center}
    \begin{longtable}{@{\extracolsep{\fill}}|c|c|c|c|c|c|} \hline
      \rhparbox{0.16\squwidth}{\centering \report@weekly@text} & \multicolumn{3}{|c|}{\rhparbox{0.5\squwidth}{\centering #1}} 
      &\rhparbox{0.17\squwidth}{\centering \report@hours@text} &  \rhparbox{0.17\squwidth}{\centering #2} \\ \hline 
      \rhparbox{0.16\squwidth}{\centering \report@name@text} & \rhparbox{0.17\squwidth}{\centering \the\name} & 
      \rhparbox{0.17\squwidth}{\centering \report@stuid@text} & \rhparbox{0.17\squwidth}{\centering \the\stuid}
      & \rhparbox{0.17\squwidth}{\centering \report@room@text} &\rhparbox{0.17\squwidth}{\centering \the\room} \\ \hline 
      \rhparbox{0.16\squwidth}{\centering \report@rchdr@text} & \multicolumn{5}{|c|}{\rhparbox{0.84\squwidth}{\centering \the\rchdr}} \\ \hline 
      \rhparbox{0.16\squwidth}{\centering \report@crchdr@text} & \multicolumn{5}{|c|}{\rhparbox{0.84\squwidth}{\centering \the\crchdr}} \\ \hline}
      {\end{longtable}\end{center}}
\makeatother

\makeatletter
%% for report items
\newcommand\ritem[2]{%
\multicolumn{6}{|l|}{\addtocounter{report@counter}{1} \rihparbox{\squiwidth}{\thereport@counter.\quad #1}} \\ \hline
\multicolumn{6}{|c|}{\riparbox{\squiwidth}{#2}} \\ \hline}
\makeatother

%% this week task
\newcommand\thisweektask[1]{\ritem{This week's task}{#1}}

%% this week's problem
\newcommand\thisweekproblem[1]{\ritem{This week's problem}{#1}}

%% next week's plan
\newcommand\nextweekplan[1]{\ritem{Next week's plan}{#1}}
