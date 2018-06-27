function y= SoundMaker(noteletter,dur)
t=0:1/8000:dur-(1/8000);
rest=1;           %(rest=0) when a rest note gets passed in to create an empty array
note=0;
switch noteletter %switch case to assign a numerical value to each note based on the 
    case"e"       %equation for frequency generation 
        note=-5;  %special characters are mapped as follows h-> high octave s-> sharp l-> low octave
    case"f"
        note=-4;
    case"fs"
        note=-3;
    case"g"
        note=-2;
    case"gs"
        note=-1;
    case"a"
        note=0;
    case"as"
        note=1;
    case"b"
        note=2;
    case"c"
        note=3;
    case"cs"
        note=4;
    case"d"
        note=5;
    case"ds"
        note=6;
    case "eh"
        note=7;
    case"fh"
        note=9;
    case"gh"
        note=10;
    case"r"
        rest=0;
    case "dsl"
        note=-6;
end

%y=cos(2*pi*t.*(220*2^(note/12)));                                  %this is the original sin function 
y=(cos(2.*pi.*(220*2^(note/12).*t)).*(2.^(-2.*t)+.06.*cos(20.*t))); %this is the developed function to model a piano 
temp=y;
y=y.*ADSRPiano(temp);                                               %apply ADSR to the signal
y=y+.3*SympatheticRes(note,dur);                                    %apply sympathetic resonance to the signal
y=y+.4.*Harmonics(note,dur);                                        %apply harmonics to the signal
y=y+ .4.*Echo(temp);                                                %apply echo to the signal 
                                             %ensure magnitude is less than 1    
y=y.*ADSRPiano(temp);  
y=rest*(y*1/max(y));                                                %re-apply ADSR

end