# =======================================================================
# 岗位清单：名字就是 -jobname，同时也是清单文件名 profiles/<名字>.tex
# 加新岗位：写一份 profiles/CV-xxx.tex，再把 CV-xxx 加进下面这个列表。
# =======================================================================
JOBS = CV CV-agent CV-neural

# 所有源码：改了其中的任何一个，PDF 都该重编。
# 不做这一步的话，改了 content/ 下的正文，make 会因为「清单没变」而不重新编译。
SOURCES = CV.tex .latexmkrc \
          $(wildcard preamble/*.tex) \
          $(wildcard content/*.tex content/*/*.tex)

# -----------------------------------------------------------------------
# `make` 的默认目标：只出通用版 CV.pdf，与重构前行为一致。
# 想要全部岗位：`make all`
# 想要单个岗位：`make CV-agent.pdf`
# -----------------------------------------------------------------------
default: CV.pdf

all: $(addsuffix .pdf,$(JOBS))

# 每个岗位单独一条规则：CV-agent.pdf ← profiles/CV-agent.tex
# 实际的「读哪份清单」由 -jobname 决定（CV.tex 里用 \IfFileExists 据此挑选）。
$(addsuffix .pdf,$(JOBS)): %.pdf: profiles/%.tex $(SOURCES)
	latexmk -jobname=$*

clean:
	rm -f $(addsuffix .pdf,$(JOBS)) \
	      $(addsuffix .xdv,$(JOBS)) \
	      $(addsuffix .synctex.gz,$(JOBS)) \
	      $(addsuffix .aux,$(JOBS)) \
	      $(addsuffix .log,$(JOBS)) \
	      $(addsuffix .fls,$(JOBS)) \
	      $(addsuffix .fdb_latexmk,$(JOBS))

.PHONY: default all clean
