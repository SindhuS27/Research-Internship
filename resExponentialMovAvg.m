clear a;
function combinedCode()


% Arduino setup
a = arduino("COM5", "Uno");
rubberCordPin = 'A1';
vin = 5;
resistor1 = 10e3;

% Define a smoothing factor (1 for no smoothing)
smoothing_factor = 1;

% Initialize data arrays
data = zeros(1, 1000);  % Change the size based on your data length

% Acquire data from Arduino and apply smoothing
for i = 1:length(data)
    value = readVoltage(a, rubberCordPin);
    vout = (vin / 1023) * value;
    resistor2 = resistor1 / ((vin / vout) - 1);
    
    % Store data
    data(i) = resistor2;

    % Apply smoothing factor
    if i > 1
        data(i) = (1 - smoothing_factor) * data(i) + smoothing_factor * data(i - 1);
    end
    
    % Pause for a short time if needed
    pause(0.1);
end

% Close Arduino connection
clear a;

% Create a vector for the x-axis (index numbers)
x_axis = 1:length(data);

% Plot the original data as a continuous signal
figure;
plot(x_axis, data, '-o', 'DisplayName', 'Original Data (Continuous)');
hold on;

% Plot the smoothed data
smoothed_data = smoothdata(data, 'movmean', smoothing_factor);
plot(x_axis, smoothed_data, '-r', 'DisplayName', 'Smoothed Data');
xlabel('Index');
ylabel('Resistance2 Value');
title('Data Plot with Smoothing Factor 1 (Moving Average)');
legend('Location', 'Best');
grid on;

% Adjust the figure appearance if needed

end
