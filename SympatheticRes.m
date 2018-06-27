function y = SympatheticRes(note,dur)
   t=0:1/8000:dur-(1/8000);                %creates time vector
   y1=cos(2*pi*(220*2^((note-1)/12).*t));  %creates signal function one half-step lower
   y2=cos(2*pi*(220*2^((note+1)/12).*t));  %creates signal function one half-step higher
   y=y1+y2;
end