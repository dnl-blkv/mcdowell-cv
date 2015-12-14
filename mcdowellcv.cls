\ProvidesClass{mcdowellcv}[2015/12/14 v0.5 McDowell CV class]

\LoadClass[11pt,letterpaper]{article} % Font size and paper type

% Set font to Calibri
\usepackage{fontspec}
\setmainfont{Calibri}

% Remove paragraph indentation
\usepackage[parfill]{parskip} 

% Required for boldface (\bf and \bfseries) tabular columns
\usepackage{array} 

% Required for ifthenelse statements
\usepackage{ifthen} 

% Suppress page numbers
\pagestyle{empty} 

% Flexible tables
\usepackage{tabu}

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
	\textbf{\LARGE{\@name}}
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
		\begin{tabu} to 1\textwidth { X[m,l] X[-1,m,c] X[m,r] }
			\printaddress & \printname & \printcontacts \\
		\end{tabu}	
	\end{center}
}
\makeatother