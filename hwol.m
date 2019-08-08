%hwol (hattrick win or lose) try to predict the result of the match given features about home and away team

X = dlmread('Datos_HT.csv',';');

%remove header and first column
Xdq = dataquality(X);





%create y:

% 0 draw
% 1 home
% 2 away




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

subplot(1,3,1);

homeaway(:,1)


hist(homeaway(:,1));


title('Histogram of the sum of the home team meaningful features');

subplot(1,3,2);

hist(homeaway(:,2));
title('Histogram of the sum of the away team meaningful features');


subplot(1,3,3);

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