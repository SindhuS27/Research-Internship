clear a;

% Create an Arduino object
a = arduino("COM5", "Uno");

% Define the pin and other parameters
rubberCordPin = 'A1';
vin = 5;
resistor1 = 10e3;
res2=[];

while true
    % Read the analog value
    value = readVoltage(a, rubberCordPin);

    % Calculate the resistor2 value
    vout = (vin / 1023) * value; % Calculate the voltage at the sensor
    buffer = (vin / vout) - 1; % Calculate an intermediate value
    resistor2 = resistor1 / buffer; % Calculate the resistance of the rubber cord sensor
    
    if(resistor2 > 0 && resistor2 < 50)
        res2 = vertcat(res2,resistor2);
        window_size = 100;% Choose the window size for the moving average filter
        scatter(resistor2, 0, 'filled', 'o');
        xlim([0, 30]);
        ylim([-10,10]);
        xlabel("Resistance (ohm)");
        ylabel("index");
        drawnow;
        pause(0.5);
    end
end