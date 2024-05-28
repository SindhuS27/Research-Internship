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
    vout = (vin / 1023) * value;
    buffer = (vin / vout) - 1;
    resistor2 = resistor1 / buffer;
    
    if(resistor2 > 0 && resistor2 < 50)
        res2 = vertcat(res2,resistor2);
        smoothing_factor = 1;
        % Apply the smoothing factor to the data
        smoothed_data = zeros(size(resistor2));
        for i = 1:length(resistor2)
            smoothed_data(i) = resistor2(i);
            if i > 1
                smoothed_data(i) = (1 - smoothing_factor) * resistor1(i) + smoothing_factor * smoothed_data(i - 1);
            end
        end

        scatter(smoothed_data, 0, 'filled', 'o');
        xlim([20, 27]);
        ylim([-10,10]);
        drawnow;
        pause(0.5);
    end
end