classdef Basic
    % AIR class that handles connection to Sniff Controller Air by Sniff
    % Logic Ltd. Communication is via Bluetooth Low Energy (BLE) supported
    % in Matlab R2019b and up, Windows 10 and up, Bluetoth 4.2 and up.
    properties
        ser %ble device
        subscribed = false; % are we subscribed?
    end
    methods
        function obj = connect(obj,identifier)
            % CONNECT connect to an Air device via BLE.
            % connect("device name") will connect to the Air with the the
            % given name. If it could not find a device with the given
            % name, will throw an error.
            % connect("address") will connect to the Air with the given
            % address. If it could not find a device witht he given
            % address, will throw an error.
            % 
            % This is supported in Matlab R2019b and up. Please ensure your
            % computer supports BLE and that the BLE is on.
             obj.ser = serialport(identifier,9600);
        end
        
        function data = readData(obj)
            % READDATA reads one value of data from Air, parses it and
            % returns it.
            sig = readline(obj.ser);
            s=split(sig,' ');
            data=-str2double(s{1})/1000;
            flush(obj.ser,"input");
        end
            
        
        function obj = subscribe(obj,numBytes,func)
            % SUBSCRIBE subscribes to updates in data. When new data
            % arrives it will be sent to the given function.
            configureCallback(obj.ser,"byte",numBytes,func)
            obj.subscribed = true;
        end
        
        function obj = subscribeAll(obj,func)
            % SUBSCRIBE subscribes to updates in data. When new data
            % arrives it will be sent to the given function.
            configureCallback(obj.ser,"terminator",func)
            obj.subscribed = true;
        end
        
        function obj = unsubscribe(obj)
            % UNSUBSCRIBE stops subscribing to changes in data.
            configureCallback(obj.ser,"off");
            obj.subscribed = false;
        end
        
        function obj = disconnect(obj)
            % DISCONNECT disconnects to the Air device
            delete(obj.ser);
            obj.ser = '';
           
        end
    end
end