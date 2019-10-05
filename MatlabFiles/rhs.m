function dxdt = rhs(t,x,m1,m2,kw,ks,b)
    dxdt=[x(2);((kw*exp(-t)*sin(t))-(kw*x(1))-(ks*(x(1)-x(3)))-(b*(x(2)-x(4))))/m1;x(4);(-(ks*(x(3)-x(1)))-(b*(x(4)-x(2))))/m2];
    
end