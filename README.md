This repository features a LaTeX version of a convenient CV class and a template
showing it usage. The template design was originally proposed by Gayle L. McDowell at 
http://www.careercup.com/resume.

Commands
========
The class features the following commands:
 - `\name{name}` - defines the applicant's name to be printed by `\printheader`.
 - `\address{address}` - defines the applicant's address to be printed by `\printheader`.
 - `\contacts{contacts}` - defines the applicant's contacts to be printed by `\printheader`.
 - `\printheader` - prints the CV header consisting of name (see the `\name` command), address (see the `\address` command) and contacts (see the `\contacts` command).
 - `\printsectionheader{sectionname}` - prints a section header consisting of the name and a page-wide horizontal line below.
 - `\printsubsection{left}{center}{right}{content}` - prints a subsection consisting of the left, center and right headers and the subsection content.
