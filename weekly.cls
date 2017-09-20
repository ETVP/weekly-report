%% The template for weekly report
%% Copyright (C) 2017, Johann Lee <me@qinka.pro> (maintainer)
%%               2017, Q.L. Lee <liql@sxufe.edu.cn>
%% (LGPLv3+)
\ProvidesClass{weekly}[2017/09/20, Johann Lee<me@qinka.pro>, Ver.0.1.0]
\NeedsTeXFormat{LaTeX2e}
\LoadClass[oneside]{article}

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

%% new environment
%% for report
\makeatletter
\newenvironment{report}[2]{%
    \setlength\squwidth\textwidth \setlength\squiwidth\textwidth
    \advance\squwidth -12\tabcolsep \advance\squiwidth -2\tabcolsep
    \begin{center}
    \begin{tabular*}{\linewidth}{@{\extracolsep{\fill}}|c|c|c|c|c|c|} \hline
      \parbox{0.16\squwidth}{\centering \report@weekly@text} & \multicolumn{3}{|c|}{\parbox{0.5\squwidth}{\centering #1}} 
      &\parbox{0.17\squwidth}{\centering \report@hours@text} &  \parbox{0.17\squwidth}{\centering #2} \\ \hline 
      \parbox{0.16\squwidth}{\centering \report@name@text} & \parbox{0.17\squwidth}{\centering \the\name} & 
      \parbox{0.17\squwidth}{\centering \report@stuid@text} & \parbox{0.17\squwidth}{\centering \the\stuid}
      & \parbox{0.17\squwidth}{\centering \report@room@text} &\parbox{0.17\squwidth}{\centering \the\room} \\ \hline 
      \parbox{0.16\squwidth}{\centering \report@rchdr@text} & \multicolumn{5}{|c|}{\parbox{0.84\squwidth}{\centering \the\rchdr}} \\ \hline 
      \parbox{0.16\squwidth}{\centering \report@crchdr@text} & \multicolumn{5}{|c|}{\parbox{0.84\squwidth}{\centering \the\crchdr}} \\ \hline}
      {\end{tabular*}\end{center}}
\makeatother

\makeatletter
%% for report items
\newcommand\ritem[2]{%
\multicolumn{6}{|l|}{\addtocounter{report@counter}{1}\thereport@counter.\quad #1} \\ \hline
\multicolumn{6}{|c|}{\parbox{\squiwidth}{\parindent2em \vskip.7em #2 \vskip.7em}} \\ \hline}
\makeatother

%% this week task
\newcommand\thisweektask[1]{\ritem{This week's task}{#1}}

%% this week's problem
\newcommand\thisweekproblem[1]{\ritem{This week's problem}{#1}}

%% next week's plan
\newcommand\nextweekplan[1]{\ritem{Next week's plan}{#1}}
