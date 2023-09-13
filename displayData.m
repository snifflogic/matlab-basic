function displayData(src,event)
    % DISPLAYDATA example function to use with subscribe callback
    % receives the data, parses it, and displays it.
     sig = readline(src);
     data = parseBasicData(sig);
     flush(src,"input"); % this is important, otherwise there will be latency
     fprintf("%s %.2f\n",  datestr(now, 'HH:MM:SS.FFF'), data)
end