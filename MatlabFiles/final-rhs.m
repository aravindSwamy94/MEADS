function dxdt = rhs(t,x,R1,R2,R3,L,C,d)
    dxdt=[((-R1-R2+(R2^2/(R2+R3)))/L)*x(1) - ((R2/((R2+R3)*L*C))*x(2)) + ((R2/((R2+R3)*L))*d(t)) ; (R2/(R2+R3))*x(1) - ((1/((R2+R3)*C))*x(2)) + ((1/(R2+R3))*d(t))];    
end