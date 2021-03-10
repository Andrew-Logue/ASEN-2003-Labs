function Int = Simpson(x,y)
%SIMPSON  Given equally spaced values, this program will carry out the
%         numerical integral using Simpson's rule.
foo = 1:length(x);          %Give each value of x an index.
fin = length(x);            %Largest value of the index.
h = (x(fin)-x(1))/(fin-1);  %Integration step size.
odd = find(rem(foo,2)~=0);  %Generate all odd indices.
even = find(rem(foo,2)==0); %Generate all even indices.
%Perform integration. Note that the variable usually labelled as x0 is here
%labelled as x1. As a result, the odd and even prefactors switch around.
IntOdd = 2*y(odd);          %All odd-indexed terms in the integrand.
IntEven = 4*y(even);        %All even-indexed terms in the integrand.
if rem(foo(fin),2)~=0       %Total number of integration values is odd.
    Int = (h/3)*(sum(IntOdd) + sum(IntEven)-y(1)-y(fin));
else                        %Toal number of integration values is even.
    Int = (h/3)*(sum(IntOdd) + sum(IntEven)-y(1)-3*y(fin));
end
end