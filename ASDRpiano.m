function b = ASDRpiano(y)
    x1=linspace(0,6,length(y)/7);
    x2=linspace(6,2,length(y)/7);
    x3=linspace(2,3,length(y)/7);
    x4=linspace(3,2,length(y)/7);
    x5=linspace(2,2,2*length(y)/7);
    x6=linspace(2,0,length(y)/7);
    b=[x1,x2,x3,x4,x5,x6];
    extra=length(y)-length(b);
    filler=zeros(1,extra);
    b=[b,filler];
    disp(length(b));
end