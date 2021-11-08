%{
 * Author: Jesse Both
 * Date: 11/8/2021
 * 
 * Assignment: Time Series Exploration
 * 
 * Purpose: Create a PAA and SAX representaion to 
 *          reduce the number of samples needed to 
 *          represent the data.
 * 
 * Inputs: 
 *          c
 *              - indicate the number of requestion windows for PAA and SAX
 *                generation.
 * Outputs: 
 *          Terminal
 *                  - Data accuracy (Euclidean and Manhattan)
 *                  - PAA accuracy  (Euclidean and Manhattan
 *          Figure 1:
 *                  - Confusion Matrix based on original data
 *          Figure 2:
 *                  - PAA representation from each class
 *          Figure 3:
 *                  - Confusion Matrix based on PAA generation
 *          Figure 4: 
 *                  - Comparison between SAX and PAA (cyclic class used)
 *          Figure 5: 
 *                  - SAX representation from each class
 * 
 * Constraints:
 *              Use synthetic_control.data
 *              Compare classification techniques
 *                  - Euclidean
 *                  - Manhattan
 * 
 * Subroutines:
 *              confuse(label dataTest, dataTrain, distance)
 *              euclidean(s, r)
 *              getlabel(num)
 *              manhattan(s, r)
 *              meanfind(data)
 *              new_paagen(c, data)
 *              paaplot(paa,data, class, c,i)
 *              saxplot(paa,data, class, c,i)
 * 
 * Sources:
 *         https://www.mathworks.com/help/matlab/
 * 
%}

clc
clear
close all

% load data and normalize it %
data = normalize(load("synthetic_control.data"));
[x,y] = size(data);                     % get dimensions

% Data stored in 6 classes
%   |Class|             |rows|
% 1. Normal             1-100
% 2. Cyclic             101-200
% 3. Increasing trend   201-300
% 4. Decreasing trend   301-400
% 5. Upward shift       401-500
% 6. Downward shift     501-600

% create a 600x1 vector for defined classes %
classLabels = zeros(x, 1);
classLabels(  1:100,1) = 1;
classLabels(101:200,1) = 2;
classLabels(201:300,1) = 3;
classLabels(301:400,1) = 4;
classLabels(401:500,1) = 5;
classLabels(501:600,1) = 6;

% extract class data %
normal_data = data(1:100,:);  
cyclic_data = data(101:200,:);
inc_trend_data = data(201:300,:);
dec_trend_data = data(301:400,:);  
up_shift_data = data(401:500,:);
down_shift_data = data(501:600,:);

% try to train with mean of classes %
data_train = zeros(6, y);
data_train(1,:) = meanfind(normal_data);
data_train(2,:) = meanfind(cyclic_data);
data_train(3,:) = meanfind(inc_trend_data);
data_train(4,:) = meanfind(dec_trend_data);
data_train(5,:) = meanfind(up_shift_data);
data_train(6,:) = meanfind(down_shift_data);


% ----------------------   Prompt    ----------------------- %
prompt1 = 'Input the requested number of windows (c)';
prompt2 = 'Recommended (15), value must be less than 60';
disp(prompt1);
c = 0;
while c>60 || c == 0
    c = input(prompt2);
end
% ----------------------   Prompt    ----------------------- %

% ---------------------   Data K-NN    --------------------- %

figure(1);
subplot(1,2,1);
acc = confuse(classLabels, data, data_train, @euclidean);
title('Euclidean');

disp(['Data Accuracy - Euclidean: ', num2str(round(acc*100,1))]);         % display accuracy

subplot(1,2,2);
acc = confuse(classLabels, data, data_train, @manhattan);
title('Manhattan');
sgtitle('Data Confusion Matrix');

disp(['Data Accuracy - Manhattan: ', num2str(round(acc*100,1))]);         % display accuracy

% ---------------------   Data K-NN    --------------------- %

% store an i value for each class %
random = [randi([  1,100]), randi([101,200]), randi([201,300]), ...
          randi([301,400]), randi([401,500]), randi([501,600])];

% -----------------------    PAA     ----------------------- %
paa = new_paagen(c, data);                  % generate paa with all data
paa_train = new_paagen(c, data_train);      % generate paa with training data

% plot PAA with each class %
figure(2);
subplot(3,2,1);
paaplot(paa, data, classLabels, c, random(1));
subplot(3,2,2);
paaplot(paa, data, classLabels, c, random(2));
subplot(3,2,3);
paaplot(paa, data, classLabels, c, random(3));
subplot(3,2,4);
paaplot(paa, data, classLabels, c, random(4));
subplot(3,2,5);
paaplot(paa, data, classLabels, c, random(5));
subplot(3,2,6);
paaplot(paa, data, classLabels, c, random(6));
hold off

% -----------------------    PAA     ----------------------- %

% -----------------------    K-NN    ----------------------- %

figure(3);
subplot(1,2,1);
acc = confuse(classLabels, paa, paa_train, @euclidean);
title('Euclidean');

disp([' PAA Accuracy - Euclidean: ', num2str(round(acc*100,1))]);         % display accuracy

subplot(1,2,2);
acc = confuse(classLabels, paa, paa_train, @manhattan);
title('Manhattan');
sgtitle('PAA Confusion Matrix');

disp([' PAA Accuracy - Manhattan: ', num2str(round(acc*100,1))]);         % display accuracy

% -----------------------    K-NN    ----------------------- %

% -----------------------    SAX     ----------------------- %


% plot PAA/SAX comparison  using class #2 cyclic %
figure(4)
subplot(1,2,1);
paaplot(paa, data, classLabels, c, random(2));

subplot(1,2,2);
saxplot(paa, data, classLabels, c, random(2));


% plot each class with SAX %
figure(5)
subplot(3,2,1);
saxplot(paa, data, classLabels, c, random(1));
subplot(3,2,2);
saxplot(paa, data, classLabels, c, random(2));
subplot(3,2,3);
saxplot(paa, data, classLabels, c, random(3));
subplot(3,2,4);
saxplot(paa, data, classLabels, c, random(4));
subplot(3,2,5);
saxplot(paa, data, classLabels, c, random(5));
subplot(3,2,6);
saxplot(paa, data, classLabels, c, random(6));
hold off

% -----------------------    SAX     ----------------------- %