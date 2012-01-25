%
% cvlatex.cls
%
% Classe LaTeX utile pour réaliser un CV.
%
% (C) 2011-2012 Guilhem Tiennot.
%
% This class is released under the terms of the GNU GPL version 2.
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{cvlatex}


% packages
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{wrapfig}


% Options
\newcommand\@ptsize{}
\newcommand\@haspicture{}
\newcommand\@cvcolor{}
\newcommand\@cvfirstsubcolor{}
\newcommand\@cvsecondsubcolor{}
\DeclareOption{a4paper}
              {\setlength{\paperheight}{297mm}%
               \setlength{\paperwidth}{210mm}}
\DeclareOption{10pt}
              {\renewcommand\@ptsize{0}}
\DeclareOption{11pt}
              {\renewcommand\@ptsize{1}}
\DeclareOption{12pt}
              {\renewcommand\@ptsize{2}}
\DeclareOption{sansserif}
              {\renewcommand\familydefault{\sfdefault}}
\DeclareOption{serif}
              {\renewcommand\familydefault{\rmdefault}}
\DeclareOption{nophoto}
              {\renewcommand\@haspicture{0}}
\DeclareOption{photo}
              {\renewcommand\@haspicture{1}}
\DeclareOption{color=blue}
              {\renewcommand\@cvcolor{\color{blue}}
               \renewcommand\@cvfirstsubcolor{\color[rgb]{0.3,0.3,1}}
               \renewcommand\@cvsecondsubcolor{\color[rgb]{0.6,0.6,1}}}
\DeclareOption{color=green}
              {\renewcommand\@cvcolor{\color[rgb]{0,0.5,0}}
               \renewcommand\@cvfirstsubcolor{\color[rgb]{0.3,0.6,0.3}}
               \renewcommand\@cvsecondsubcolor{\color[rgb]{0.6,0.9,0.6}}}
\DeclareOption{color=lightgreen}
              {\renewcommand\@cvcolor{\color{green}}
               \renewcommand\@cvfirstsubcolor{\color[rgb]{0.3,1,0.3}}
               \renewcommand\@cvsecondsubcolor{\color[rgb]{0.6,1,0.6}}}
\DeclareOption{color=yellow}
              {\renewcommand\@cvcolor{\color{yellow}}
               \renewcommand\@cvfirstsubcolor{\color[rgb]{1,1,0.3}}
               \renewcommand\@cvsecondsubcolor{\color[rgb]{1,1,0.6}}}
\DeclareOption{color=orange}
              {\renewcommand\@cvcolor{\color{orange}}
               \renewcommand\@cvfirstsubcolor{\color[rgb]{1,0.6,0.3}}
               \renewcommand\@cvsecondsubcolor{\color[rgb]{1,0.9,0.6}}}
\DeclareOption{color=red}
              {\renewcommand\@cvcolor{\color{red}}
               \renewcommand\@cvfirstsubcolor{\color[rgb]{1,0.3,0.3}}
               \renewcommand\@cvsecondsubcolor{\color[rgb]{1,0.6,0.6}}}
\DeclareOption{color=no}
              {\renewcommand\@cvcolor{}
               \renewcommand\@cvfirstsubcolor{\color[rgb]{0.3,0.3,0.3}}
               \renewcommand\@cvsecondsubcolor{\color[rgb]{0.6,0.6,0.6}}}
\ExecuteOptions{a4paper,10pt,sansserif,nophoto,color=blue}
\ProcessOptions

\input{size1\@ptsize.clo}



%%%%% Définition de marges personnalisées %%%%%
%
% Suppression de l'entête, inutile ici
\setlength{\headheight}{0cm}
\setlength{\headsep}{0cm}
%
% Suppression de la marge à gauche sur les pages
% paires, puis impaires
\setlength{\oddsidemargin}{-0.5cm}
\setlength{\evensidemargin}{-0.5cm}
%
% Suppression de la marge supérieure
\setlength{\topmargin}{-1cm}
%
% Suppression des notes en marge à droite
\setlength{\marginparsep}{0cm}
\setlength{\marginparwidth}{0cm}
%
\setlength{\textwidth}{17cm}
\setlength{\textheight}{27.7cm}
% Suppression de l'indentation des paragraphes
\setlength{\parindent}{0cm}
%
% Largeur de la colonne années
\newlength{\yearwidth}
\setlength{\yearwidth}{1.9cm}
% Largeur de la colonne description
\newlength{\descriptionwidth}
\setlength{\descriptionwidth}{\textwidth}
\addtolength{\descriptionwidth}{-\yearwidth}
%
%
% --- Ces longueurs ne sont utilisés que pour les cv sans photo ---
% Largeur de la colonne nom/profession
\newlength{\@namewidth}
\setlength{\@namewidth}{8cm}
%
% Largeur de la colonne coordonnées
\newlength{\@coordwidth}
\setlength{\@coordwidth}{\textwidth}
\addtolength{\@coordwidth}{-\@namewidth}
%%%%% Fin de la définition des marges %%%%%




% commandes

% La commande \profession est optionnelle
\newcommand{\@profession}{}

\newsavebox{\coordbox}
\newenvironment{coordonnees}{%
  \if\@haspicture0
    \parbox[b]{\@namewidth}{%
      {\Huge \@nom}
      \par
      \vspace{0.2cm}
      \@profession
    }%
    \begin{lrbox}{\coordbox}
    \begin{minipage}{\@coordwidth}
    \begin{flushright}
  \else
    \@photo

    {\Large \@nom
    \par}
    {\large \@profession
    \par}
  \fi
}
{
  \if\@haspicture0
    \end{flushright}
    \end{minipage}
    \end{lrbox}
    \usebox{\coordbox}
  \fi
  \vspace{0.5cm}
}

\newcommand{\nom}[1]{\newcommand{\@nom}{#1}}
\newcommand{\profession}[1]{\renewcommand{\@profession}{\textit{\large\color[rgb]{0.4,0.4,0.4}#1}}}
\newcommand{\adresse}[1]{#1\par}
\newcommand{\telephone}[1]{#1\par}
\newcommand{\portable}[1]{#1\par}
\newcommand{\fax}[1]{#1\par}
\newcommand{\email}[1]{\texttt{#1}\par}
\newcommand{\website}[1]{\texttt{#1}\par}
\newcommand{\autre}[1]{#1\par}
\newcommand{\photo}[2][1]{%
  \newcommand{\@photo}{%
    \begin{wrapfigure}{r}{5cm}
      \begin{flushright}
        \includegraphics[scale=#1]{#2}
      \end{flushright}
    \end{wrapfigure}
  }
}

%%% Catégorie où classer des compétences

\newenvironment{categorie}[1]%
{%
  {
    \@cvsecondsubcolor{}
    \rule[0.25em]{0.25cm}{0.25cm}
    \@cvfirstsubcolor{}
    \rule[0.25em]{0.25cm}{0.25cm}
    \@cvcolor{}
    \rule[0.25em]{0.25cm}{0.25cm}
    \LARGE #1
  }
  \normalsize

  \vspace{0.25cm}
}%
{%
}

%%% paragraphe décrivant une compétence

\newcommand{\competence}[4]{%
  \parbox[t]{\yearwidth}{\textit{#1}}%
  \parbox[t]{\descriptionwidth}{%
    \if#2%
    \else%
      \textbf{\@cvcolor{}#2}
      \emph{\@cvfirstsubcolor{}#3}
      \par
    \fi%
    #4
    \par\vspace{0.2cm}
  }%
}


%%% Au cas où le cv comporterait un titre

\newcommand\maketitle{%
  \begin{center}
    \Huge\@title
  \end{center}%
}

\endinput
