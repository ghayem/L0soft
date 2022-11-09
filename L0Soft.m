function [x, err]=L0Soft(y, A, xo, bet, L, iter, c)

% y=Ax
% xo: original sparse signal
% bet: parameter of tangh(bet*x) that approximates the sign function
% L: number of inner-loop iterations
% iter: number of outer-loop iterations
% c: decreasing factor of aplha

A_pinv=pinv(A);
x=A_pinv*y;
alph=1;
err=zeros(1,iter);
nxo=norm(xo);
xp=x;
zp=tanh(bet*x);
z=zp;

for i=1:iter 
    
    mu=2/(2.5*bet^2);
    
    for j=1:L
        
        % z-update
        zz=mysoft(0.95*tanh(bet*x)+0.05*zp, alph);
        zp=z;
        z=zz;
        
        % x-update
        xx=x-mu*(bet.*sech(bet*x).^2.*(tanh(bet*xn)-z))+0.85*(x-xp);
        xx = xx - A_pinv*(A*xx-y);   % Projection
        xp=x;
        x=xx;
        
    end
    
    alph=alph*c;
    err(i)=norm(x-xo)/nxo;

end

return