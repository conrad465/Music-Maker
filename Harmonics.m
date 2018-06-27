function y = Harmonics(note,dur)            
    t=0:1/8000:dur-(1/8000); 
   y1=cos(2*pi*(220*2^((note-12)/12).*t)); %creates a variation of sin functions that  
   y2=cos(2*pi*(220*2^((note+12)/12).*t)); %are harmonics of the input note and
   y3=cos(2*pi*(220*2^((note+24)/12).*t)); %have the same duration
   y4=cos(2*pi*(220*2^((note-24/12)).*t)); %by adding/subtracting a factor of 12 to note one can
                                            % get the same note in a higher/lower octave

   y=(3/8)*y1+(5/8)*y2;  %combines harmonics one octave higher and one octave lower
                         %than the base frequency and returns it-- only used two because it sounded like an
                         %organ otherwise. Additionally, I weighted higher harmonics higher because
                         %in my research i discovered short strings have higher susceptability to resonant effects
%    y=y+.03*y3;
%    y=y+.03*y4;
end