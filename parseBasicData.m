function data = parseBasicData(line)
 s=split(line,' ');
 data=-str2double(s{1})/1000;
