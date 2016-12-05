function Whann=hanning_window(what,M)
    Whann=0.5*(rect_window(what,M)+0.5*(rect_window(what- ...
        (pi/M),M)+rect_window(what+(pi/M),M)));
end