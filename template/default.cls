%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% Latex Default Class %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%% by Sem Klauke, version 2025 %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
% Define the Class
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{template/default}
%% --------------------------------------------------- %%
%% --------------- Define Class options -------------- %%
%% --------------------------------------------------- %%
\RequirePackage{xifthen}
\RequirePackage{xkeyval}
%%%
% ****(OPTION)**** Font size pass through
% 10pt, 11pt [DEFAULT: 11pt]
\DeclareOptionX{10pt}{\PassOptionsToClass{10pt}{scrartcl}}
\DeclareOptionX{11pt}{\PassOptionsToClass{11pt}{scrartcl}}
\DeclareOptionX{12pt}{\PassOptionsToClass{12pt}{scrartcl}}
% ****(OPTION)**** babel lang pass through
% lang
\DeclareOptionX{lang}{%
    \PassOptionsToPackage{#1}{babel}%
    \PassOptionsToClass{#1}{scrartcl}%
}
% ****(OPTION)****
% indent [DEFAULT: 0pt]
\newcommand{\settingParidnent}{0pt}
\DeclareOptionX{indent}{\renewcommand{\settingParidnent}{#1}}
% ****(OPTION)**** include tikz
% tikz [yes|no] [DEFAULT: no] 
\newcommand{\settingTikz}{no}
\DeclareOptionX{tikz}{\renewcommand{\settingTikz}{yes}}
%%%
\ExecuteOptionsX{11pt}
\ProcessOptionsX
%%%
\LoadClass[a4paper]{scrartcl}
%% --------------------------------------------------- %%
%% -------------- Set Dimensions/Border -------------- %%
%% --------------------------------------------------- %%
\RequirePackage{geometry}
\RequirePackage{setspace}
\geometry{
    a4paper,
    left=2cm,
    right=2cm,
    top=2cm,
    bottom=3cm
}
%% --------------------------------------------------- %%
%% -------------- Custom Logic commands -------------- %%
%% --------------------------------------------------- %%
% Switch implementation
\newcommand{\ifequals}[3]{\ifthenelse{\equal{#1}{#2}}{#3}{}}
\newcommand{\ifnotequals}[3]{\ifthenelse{\equal{#1}{#2}}{}{#3}}
\newcommand{\case}[2]{#1 #2} % Dummy, so \renewcommand has something to overwrite...
\newenvironment{switch}[1]{\renewcommand{\case}{\ifequals{#1}}}{}
%% --------------------------------------------------- %%
%% --------------- Encoding & Language --------------- %%
%% --------------------------------------------------- %%
%\RequirePackage[T1]{fontenc}
%\RequirePackage{lmodern}
%\RequirePackage[utf8]{inputenc}
% Babel is loaded at the end of the file (see explentation there)
%% --------------------------------------------------- %%
%% -------------------- Packages --------------------- %%
%% --------------------------------------------------- %%
% Math symbols
\RequirePackage{amsmath, amsfonts, amssymb, amsthm, nccmath}
\RequirePackage{mathtools}
\RequirePackage{amssymb}
\RequirePackage{microtype}
\RequirePackage{stmaryrd}
% Grafics and pdfs
\RequirePackage{graphicx}
\RequirePackage{pdfpages}
% links and refs
\RequirePackage[hidelinks, unicode]{hyperref}
% tikz
\ifequals{\settingTikz}{yes}{%
    \RequirePackage{tikz}%
    \RequirePackage{tikz-qtree}%
    \usetikzlibrary{arrows,calc}%
    \usetikzlibrary{automata, positioning, arrows}%
    \usetikzlibrary{shapes.geometric}%
    \usetikzlibrary{backgrounds}%
}
% latex logic
\RequirePackage{scrlayer-scrpage}
\RequirePackage{changepage}
\RequirePackage{etoolbox}
\RequirePackage{environ}
% usefull
\RequirePackage{romannum}
\RequirePackage{multicol}
\RequirePackage{listings}
\RequirePackage{latexsym}
\RequirePackage{enumitem}
\RequirePackage{xcolor}
\RequirePackage{colortbl}
\RequirePackage{csquotes}
%% --------------------------------------------------- %%
%% --------------------- Styling --------------------- %%
%% --------------------------------------------------- %%
\renewcommand{\labelenumi}{(\alph{enumi})}
\pagestyle{plain}
\clearpairofpagestyles{}
\setlength{\headheight}{\baselineskip}
\setlength{\footheight}{\baselineskip}
%\renewcommand{\thepage}{\arabic{page}}
\ofoot*{\pagemark}
\setlength{\fboxrule}{0.4pt}
\setlength{\fboxsep}{4pt}
% load some common stuff at the \begin{document}
\AtBeginDocument[A]{%
    % if we have colortbl loaded we need to insert this hack, 
    % cause colortbl waits for some packages to load
    % https://tex.stackexchange.com/questions/212632/problem-to-store-tabulars-in-boxes-in-the-preamble-when-colortbl-is-loaded
    \@ifpackageloaded{colortbl}{%
        \expandafter\def\expandafter\@tabarray\expandafter{%
        \expandafter\CT@start\@tabarray}%
    }{}%
    \pagenumbering{arabic}%
    % insert pdf information
    \hypersetup{
        pdftitle = {},
        pdfauthor = {},
        pdfsubject = {}
    }%
    \setlength{\parindent}{\settingParidnent}%
}
%%%%% Later load packages so \PassOptionToPackage{} can reach them
\RequirePackage{babel}


%% --------------------------------------------------- %%
%% --------------- Custome Definitions --------------- %%
%% --------------------------------------------------- %%
\IfFileExists{template/custome_definitions.tex}{\input{template/custome_definitions}}{}