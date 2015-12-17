%% The MIT License (MIT)
%%
%% Copyright (c) 2015 Daniil Belyakov
%%
%% Permission is hereby granted, free of charge, to any person obtaining a copy
%% of this software and associated documentation files (the "Software"), to deal
%% in the Software without restriction, including without limitation the rights
%% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
%% copies of the Software, and to permit persons to whom the Software is
%% furnished to do so, subject to the following conditions:
%%
%% The above copyright notice and this permission notice shall be included in all
%% copies or substantial portions of the Software.
%%
%% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
%% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
%% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
%% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
%% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
%% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
%% SOFTWARE.
\ProvidesClass{mcdowellcv}[2015/12/15 v0.9 McDowell CV class]

% Set font size and paper type
\LoadClass[11pt,letterpaper]{article} 

% Set font face
\usepackage{fontspec}
\setmainfont[SmallCapsFeatures={Renderer=Basic},
Ligatures={NoCommon, NoDiscretionary, NoHistoric, NoRequired, NoContextual}]{Calibri}

% Remove paragraph indentation
\usepackage[parfill]{parskip} 

% Required for boldface (\bf and \bfseries) tabular columns
\usepackage{array} 

% Required for ifthenelse statements
\usepackage{etoolbox} 

% Suppress page numbers
\pagestyle{empty} 

% Flexible tables
\usepackage{tabu}

% For custom margins
\usepackage{changepage}

% To remove list left margins
\usepackage{enumitem}
\setlist{leftmargin=*, noitemsep, topsep=-4pt}

% Set document margins
\usepackage[left=0.75in,top=0.6in,right=0.75in,bottom=0.6in]{geometry} 

% For spcaed small caps
\usepackage{microtype}

\DeclareMicrotypeSet*{smallcapsi} { 
	encoding = {OT1,T1,T2A,LY1,OT4,QX,T5,TS1,EU1,EU2},
	shape    = {sc*,si,scit}
}

%--------------------------------------------------------------------------------
%                             Header Setup and Printing                         -
%--------------------------------------------------------------------------------

% Address
\makeatletter

\def\address#1{\def\@address{#1}}
\def\@address{}

\def\printaddress{
	\small{\@address}
}

\makeatother

% Name
\makeatletter

\def\name#1{\def\@name{#1}}
\def\@name{}

\def\printname{
	\textbf{\LARGE\textls[110]{\textsc{\@name}}}
}

\makeatother

% Contacts
\makeatletter

\def\contacts#1{\def\@contacts{#1}}
\def\@contacts{}

\def\printcontacts{
	\small{\@contacts}
}

\makeatother

\makeatletter
\def\printheader{
	\begin{center}
		\begin{tabu} to 1\textwidth { X[l,m] X[2,c,m] X[r,m] }
			\printaddress & \printname & \printcontacts \\
		\end{tabu}	
	\end{center}
	\vspace*{3pt}
}
\makeatother

%--------------------------------------------------------------------------------
%                            Sections and Subsections                           -
%--------------------------------------------------------------------------------

% Print a section header
\makeatletter
\def\printsectionheader#1{
	\vspace*{4.75pt}
	% Set text margins to equal \tabcolsep (6pt by default)
	\begin{adjustwidth}{6pt}{6pt}
		\textsc{\textbf{#1}}
	\end{adjustwidth}
	\smallskip
	\hrule height 0.5pt
	\vspace*{-4pt}
}
\makeatother

% Print an entrie subsection
\makeatletter
% Define toggles
\newtoggle{subsecarg1}
\newtoggle{subsecarg2}
\newtoggle{subsecarg3}

\newcommand{\printsubsection}[4]{
	\notblank{#1}{\toggletrue{subsecarg1}}{}
	\notblank{#2}{\toggletrue{subsecarg2}}{}
	\notblank{#3}{\toggletrue{subsecarg3}}{}
	\ifboolexpr{togl {subsecarg1} or togl {subsecarg2} or togl {subsecarg3}}{
		\begin{tabu} to 1\textwidth { X[l,p] X[c,p] X[r,p] }
			\textbf{#1} & \textbf{#2} & \textbf{#3} \\
		\end{tabu}
		\vspace*{-18.5pt}
	}{
		\vspace*{2pt}
	}
	\togglefalse{subsecarg1}
	\togglefalse{subsecarg2}
	\togglefalse{subsecarg3}
	\begin{adjustwidth}{9pt}{9pt}
		#4
	\end{adjustwidth}
	\vspace*{4pt}
}
\makeatother