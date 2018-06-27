function temp = Echo(y)
b=zeros(1,800);                         %fills an array of length 800 with zeros
index=length(y)-800;                   
temp=y(1,1:index).*asdr(y(1,1:index));  %fills an array with the frequency function y that is 800 
                                        %shorter than the original
temp=[b,temp];                          %returns the two arrays which gives the effect of 
                                        %the note being played over itself with delay

end
    