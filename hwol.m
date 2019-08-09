%hwol (hattrick win or lose) try to predict the result of the match given features about home and away team

X = dlmread('Datos_HT.csv',';');

%remove header and first column
Xdq = dataquality(X);





%create y:

% 1 draw
% 2 home
% 3 away




ydq = ylogisticcreator(Xdq);

lambda = 0.0;
num_labels = 3;

ydq = ydq';
%remove useless features
Xdq = Xdq(:,1:18);

[Xdqtrain, ydqtrain, Xdqcv, ydqcv, Xdqtest, ydqtest] = datasetExtractor(Xdq, ydq);


homemeaningfulcol = [1 3 5 7 9 11 13 15 17];
awaymeaningfulcol = [2 4 6 8 10 12 14 16 18];

[homeaway] = featureVisualizationExtractor(Xdqtrain, homemeaningfulcol, awaymeaningfulcol);

figure(1)
subplot(1,2,1);


hist(homeaway(:,1));


title('Histogram of the sum of the home team meaningful features');

subplot(1,2,2);

hist(homeaway(:,2));
title('Histogram of the sum of the away team meaningful features');

figure(2)


homedefencemeaningfulcol = [3 5 7 15];
awaydefencemeaningfulcol = [4 6 8 16];

[homeawaydefence] = featureVisualizationExtractor(Xdqtrain, homedefencemeaningfulcol, awaydefencemeaningfulcol);

subplot(2,2,1);
plot2Ddata(homeawaydefence, ydqtrain);

title('2D visualization: sum of meaningful defence features');
xlabel('Sum of meaningful home team defence features');
ylabel('Sum of meaningful away team defence features');
legend('home team win', 'draw', 'away team win', "location", "northeastoutside")


homemidfieldmeaningfulcol = [1];
awaymidfieldmeaningfulcol = [2];

[homeawaymidfield] = featureVisualizationExtractor(Xdqtrain, homemidfieldmeaningfulcol, awaymidfieldmeaningfulcol);

subplot(2,2,2);
plot2Ddata(homeawaymidfield, ydqtrain);

title('2D visualization: sum of meaningful midfield features');
xlabel('Sum of meaningful home team midfield features');
ylabel('Sum of meaningful away team midfield features');
legend('home team win', 'draw', 'away team win', "location", "northeastoutside")

homeattackmeaningfulcol = [9 11 13 17];
awayattackmeaningfulcol = [10 12 14 18];

[homeawayattack] = featureVisualizationExtractor(Xdqtrain, homeattackmeaningfulcol, awayattackmeaningfulcol);

subplot(2,2,3);
plot2Ddata(homeawayattack, ydqtrain);

title('2D visualization: sum of meaningful attack features');
xlabel('Sum of meaningful home team attack features');
ylabel('Sum of meaningful away team attack features');
legend('home team win', 'draw', 'away team win', "location", "northeastoutside")

subplot(2,2,4);

plot2Ddata(homeaway, ydqtrain);

title('2D visualization: sum of meaningful features');
xlabel('Sum of meaningful home team features');
ylabel('Sum of meaningful away team features');
legend('home team win', 'draw', 'away team win', "location", "northeastoutside")

%Train set 2D visualization.
%X axis: the sum of the features of home team
%Y axis: the sum of the features of away team

[all_theta] = oneVsAll(Xdqtrain, ydqtrain, num_labels, lambda);

fprintf('Program paused. Press enter to continue.\n');
pause;


predtrain = predictOneVsAll(all_theta, Xdqtrain);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(predtrain == ydqtrain)) * 100);


predcv = predictOneVsAll(all_theta, Xdqcv);

fprintf('\nCross Validation Set Accuracy: %f\n', mean(double(predcv == ydqcv)) * 100);

predtest = predictOneVsAll(all_theta, Xdqtest);

fprintf('\nTest Set Accuracy: %f\n', mean(double(predtest == ydqtest)) * 100);

prova = [1 16 4 17 8 17 7 15 7 8 5 9 6 9 5 9 4 10]

pred = predictOneVsAll(all_theta, prova)


%trying neural network

inputlayerdim = size(Xdq, 2);
%three class: win, draw, lose
hiddenlayerdim = 9;
outputlayerdim = 3;

initial_Theta1 = randInitializeWeights(inputlayerdim, hiddenlayerdim);
initial_Theta2 = randInitializeWeights(hiddenlayerdim, outputlayerdim);

initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];


lambda = 1;

% Create "short hand" for the cost function to be minimized
costFunction = @(p) nnCostFunction(p, ...
                                   inputlayerdim, ...
                                   hiddenlayerdim, ...
                                   outputlayerdim, Xdqtrain, ydqtrain, lambda);
options = optimset('MaxIter', 50);

[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

% Obtain Theta1 and Theta2 back from nn_params
Theta1 = reshape(nn_params(1:hiddenlayerdim * (inputlayerdim + 1)), ...
                 hiddenlayerdim, (inputlayerdim + 1));

Theta2 = reshape(nn_params((1 + (hiddenlayerdim * (inputlayerdim + 1))):end), ...
                 num_labels, (hiddenlayerdim + 1));

pred = predict(Theta1, Theta2, Xdqtrain);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == ydqtrain)) * 100);


pred = predict(Theta1, Theta2, Xdqcv);

fprintf('Cross validation Set Accuracy: %f\n', mean(double(pred == ydqcv)) * 100);

pred = predict(Theta1, Theta2, Xdqtest)

xfail = Xdqtest(find(pred != ydqtest), :);
ybat = ydqtest(find(pred != ydqtest), :);
ypred = pred(find(pred != ydqtest), :);

esito = [xfail ybat ypred]

fprintf('Test Set Accuracy: %f\n', mean(double(pred == ydqtest)) * 100);


prova = [22 19 24 34 27 36 22 32 22 30 39 50 25 21 20 22 20 24]

pred = predict(Theta1, Theta2, prova)

