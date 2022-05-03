if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
settings.inlinetex=true;
deletepreamble();
defaultfilename="calkin-wilf-2";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

import graph;
size(6cm);

draw((-8,4)--(0,0)--(8,4));

draw((4,8)--(8,4)--(12,8));
draw((-4,8)--(-8,4)--(-12,8));

draw((2,12)--(4,8)--(6,12));
draw((10,12)--(12,8)--(14,12));
draw((-2,12)--(-4,8)--(-6,12));
draw((-10,12)--(-12,8)--(-14,12));

filldraw(unitcircle, white);

filldraw(Circle((8, 4), 1), white);
filldraw(Circle((-8, 4), 1), white);

filldraw(Circle((4, 8), 1), white);
filldraw(Circle((12, 8), 1), white);
filldraw(Circle((-4, 8), 1), white);
filldraw(Circle((-12, 8), 1), white);

filldraw(Circle((2, 12), 1), white);
filldraw(Circle((6, 12), 1), white);
filldraw(Circle((10, 12), 1), white);
filldraw(Circle((14, 12), 1), white);
filldraw(Circle((-2, 12), 1), white);
filldraw(Circle((-6, 12), 1), white);
filldraw(Circle((-10, 12), 1), white);
filldraw(Circle((-14, 12), 1), white);
