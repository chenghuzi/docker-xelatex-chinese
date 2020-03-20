# XeLaTeX 中文Docker镜像


**注意：该镜像体积较大，接近4GB**

## Usage

编译

```
docker run --rm -v $PWD:/data huzi/xelatex-chinese xelatex {filename without extension}
```
查看支持的字体列表

```
docker run --rm huzi/xelatex-chinese fc-list :lang=zh-cn
```

示例文档

```
%!TEX program=xelatex
\documentclass{article}
\usepackage{fontspec,xltxtra,xunicode}
% \setromanfont{SimSun}
\setromanfont{KaiTi_GB2312}
\begin{document}
    你好！
\end{document}
```

也可以结合 Makefile 用：

Makefile 示例：
```
######################
#      Makefile      #
######################

filename=your_file_without_extension

pdf:
	xelatex ${filename}
	xelatex ${filename}

text: html
	html2text -width 100 -style pretty ${filename}/${filename}.html | sed -n '/./,$$p' | head -n-2 >${filename}.txt

html:
	@#latex2html -split +0 -info "" -no_navigation ${filename}
	htlatex ${filename}

view:
	while inotifywait --event modify,move_self,close_write ${filename}.tex; \
		do xelatex -halt-on-error ${filename} &&   xelatex -halt-on-error \
		${filename}; done

clean:
	rm -f ${filename}.{ps,pdf,log,aux,out,dvi,bbl,blg,snm,toc,nav}
```

用法
```
docker run --rm -v $PWD:/data huzi/xelatex-chinese make
```

或者

```
docker run --rm -v $PWD:/data huzi/xelatex-chinese make view
```
