function x=mysoft(y,thld)

x = abs(y);
x = sign(y).*(x >= thld).*(x - thld); 