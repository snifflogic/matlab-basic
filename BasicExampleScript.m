% Example script demonstrating usage of the Basic class to communicate with
% Sniff Controller Basic device.

%% create Basic object
b = Basic();

%% connect
b = b.connect("COM3");

%% read one value
disp(b.readData());


%% subscribe to data with function displayData
b = b.subscribe(100,@displayData);


%% unsubscribe
b = b.unsubscribe();

%% subscribe to data with function displayData
b = b.subscribeAll(@displayData);


%% unsubscribe
b = b.unsubscribe();

%% disconnect
b = b.disconnect();

