length=[25
22.5
20
17.5
15
12.5
10
7.5];
Resistance=[0.048481
0.058247
0.067112
0.091265
0.091622
0.090666
0.09696
0.095067];


boxchart(Resistance, length);
xlabel('Length (cm)');
ylabel('Resistance (ohms)');
title('Resistance Measurements for Each Length');




% hold on;
% medianValue = median(len7_5);
% quartiles = quantile(len7_5, [0.25, 0.75]);
% lowerQuartile = quartiles(1);
% upperQuartile = quartiles(2);
% outliers = len7_5 < lowerQuartile - 1.5 * iqr(len7_5) | len7_5 > upperQuartile + 1.5 * iqr(len7_5);
% minValue = min(len7_5);
% maxValue = max(len7_5);
% 
% text(1, medianValue, sprintf('Median: %.2f', medianValue), ...
%     'HorizontalAlignment', 'right', 'VerticalAlignment', 'middle', 'FontWeight', 'bold');
% text(1, lowerQuartile, sprintf('Q1: %.2f', lowerQuartile), ...
%     'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom', 'FontWeight', 'bold');
% text(1, upperQuartile, sprintf('Q3: %.2f', upperQuartile), ...
%     'HorizontalAlignment', 'right', 'VerticalAlignment', 'top', 'FontWeight', 'bold');
% % text(1.2, outliers * (max(len7_5) + 0.1), num2str(len7_5(outliers)'), ...
% %     'HorizontalAlignment', 'left', 'VerticalAlignment', 'middle', 'FontWeight', 'bold');
% % text(1, minValue, sprintf('Min: %.2f', minValue), ...
% %     'HorizontalAlignment', 'right', 'VerticalAlignment', 'top', 'FontWeight', 'bold');
% % text(1, maxValue, sprintf('Max: %.2f', maxValue), ...
% %     'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom', 'FontWeight', 'bold');
% hold off;
