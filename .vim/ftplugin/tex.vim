
nnoremap <buffer> ;tb i\textbf{}<Esc>T{i
nnoremap <buffer> ;ti i\textit{}<Esc>T{i
nnoremap <buffer> ;sec i\section{}<Esc>T{i
nnoremap <buffer> ;ssec i\subsection{}<Esc>T{i
nnoremap <buffer> ;sssec i\subsubsection{}<Esc>T{i
nnoremap <buffer> ;le i\begin{enumerate}<Enter><Enter>\end{enumerate}<Esc>k
nnoremap <buffer> ;ii i\item<Space>
nnoremap <buffer> ;li i\begin{itemize}<Enter><Enter>\end{itemize}<Esc>k
nnoremap <buffer> ;ld i\begin{description}<Enter><Enter>\end{description}<Esc>k
nnoremap <buffer> ;md ggi\documentclass{article}<Enter><Enter>\usepackage{polski}<Enter>\usepackage{indentfirst}<Enter>\usepackage[utf8]{inputenc}<Enter><Enter>\author{Rafał Borysionek}<Enter>\title{}<Enter><Enter>\begin{document}<Enter>\maketitle<Enter><Enter><Enter>\end{document}<Esc>2ki
nnoremap <buffer> ;up i\usepackage<Space>
nnoremap <buffer> ;b :w<CR>:cd %:p:h<CR>:!pdflatex %:t<CR>:cd ~<CR>
