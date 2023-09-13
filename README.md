# matlab-basic
Matlab SDK for communicating with the Sniff Controller Basic of Sniff Logic

# Usage
Clone this repo to your computer. Add the folder to your Matlab Path using `addpath("c:\path\to\MyFolder")`.

- `Basic.m`  - a class representing the Basic device. 
- `BasicExampleScript.m` - a script demonstrating how to use the Basic class
- `parseBasicData` parses the raw data received from the Basic and returns the pressure value in Pascal.
- `displayData` is an example function to use with the `subscribe` callback, see example in `BasicExampleScript.m`

# Acquiring data
There are three ways to get data:
1. Get only one value. This is useful mostly for debug.
2. Subscribe to data and call a callback function at every value. The Basic works at 200Hz, and if your function takes time it might delay the rest of the data. Use this if your function is quick and the computer you are using is fast.
3. Subscribe to data and call a callback function every N bytes. As the function is not called on every value, you have more options in the callback function, however you might get less data.

It's best to play with the various options and see what works best for your system. Also, we have noticed that sometimes Matlab will 'optimize' the communication and give some points closer together. The timing of the device is exact; you can reinterpolate the data to the correct timing if you wish.

# Troubleshooting
 - Classes in Matlab need to be returned. Therefore the below code will not work:
 ```
 %% create Basic object
 b = Basic();
 %% connect
 b.connect("COM3");
 %% read one value
 disp(b.readData());
 ```
 but this code will:
 ```
 %% create Basic object
 b = Basic();
 %% connect
 b = b.connect("COM3");%<---Note the 'b = '
 %% read one value
 disp(b.readData());
 ```

# Bugs
If you've discovered a bug, please open an issue. Write what is your device and operating system and what version of 
Matlab you're using.

# Contribute
Done something cool that will help others? Please feel free to submit a pull request.
