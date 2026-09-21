# XeLaTeX：xelatex -> .xdv -> xdvipdfmx -> .pdf
$pdf_mode = 5;
$xelatex  = 'xelatex -synctex=1 -interaction=nonstopmode';

# 骨架文件。正文由 -jobname 决定：latexmk -jobname=CV-agent
# 会让 CV.tex 去读 profiles/CV-agent.tex，并产出 CV-agent.pdf。
# 不加 -jobname 就是默认的 profiles/CV.tex -> CV.pdf。
@default_files = ('CV.tex');

# latexmk -c 时额外清理
$clean_ext = 'synctex.gz';
