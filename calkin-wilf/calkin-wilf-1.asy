if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
settings.inlinetex=true;
deletepreamble();
defaultfilename="calkin-wilf-1";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

import graph;
size(250);

draw((-8,-4)--(0,0)--(8,-4));

draw((4,-8)--(8,-4)--(12,-8));
draw((-4,-8)--(-8,-4)--(-12,-8));

draw((2,-12)--(4,-8)--(6,-12));
draw((10,-12)--(12,-8)--(14,-12));
draw((-2,-12)--(-4,-8)--(-6,-12));
draw((-10,-12)--(-12,-8)--(-14,-12));

filldraw(unitcircle, white);

filldraw(Circle((8, -4), 1), white);
filldraw(Circle((-8, -4), 1), white);

filldraw(Circle((4, -8), 1), white);
filldraw(Circle((12, -8), 1), white);
filldraw(Circle((-4, -8), 1), white);
filldraw(Circle((-12, -8), 1), white);

filldraw(Circle((2, -12), 1), white);
filldraw(Circle((6, -12), 1), white);
filldraw(Circle((10, -12), 1), white);
filldraw(Circle((14, -12), 1), white);
filldraw(Circle((-2, -12), 1), white);
filldraw(Circle((-6, -12), 1), white);
filldraw(Circle((-10, -12), 1), white);
filldraw(Circle((-14, -12), 1), white);

label("$\frac{1}{1}$", (0,0));

label("$\frac{1}{2}$", (-8,-4));
label("$\frac{2}{1}$", (8,-4));

label("$\frac{1}{3}$", (-12,-8));
label("$\frac{3}{2}$", (-4,-8));
label("$\frac{2}{3}$", (4,-8));
label("$\frac{3}{1}$", (12,-8));

label("$\frac{1}{4}$", (-14,-12));
label("$\frac{4}{3}$", (-10,-12));
label("$\frac{3}{5}$", (-6,-12));
label("$\frac{5}{2}$", (-2,-12));
label("$\frac{2}{5}$", (2,-12));
label("$\frac{5}{3}$", (6,-12));
label("$\frac{3}{4}$", (10,-12));
label("$\frac{4}{1}$", (14,-12));

dot((0, -14));
dot((0, -15));
dot((0, -16));
