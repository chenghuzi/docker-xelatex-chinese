# XeLaTex 中文镜像

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