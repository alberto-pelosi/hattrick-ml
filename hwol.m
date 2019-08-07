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
%remove goals
Xdq = Xdq(:,1:24);

[Xdqtrain, ydqtrain, Xdqcv, ydqcv, Xdqtest, ydqtest] = datasetExtractor(Xdq, ydq);

[all_theta] = oneVsAll(Xdqtrain, ydqtrain, num_labels, lambda);

fprintf('Program paused. Press enter to continue.\n');
pause;




%% ================ Part 3: Predict for One-Vs-All ================
%  After ...

predtrain = predictOneVsAll(all_theta, Xdqtrain);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(predtrain == ydqtrain)) * 100);


predcv = predictOneVsAll(all_theta, Xdqcv);

fprintf('\nCross Validation Set Accuracy: %f\n', mean(double(predcv == ydqcv)) * 100);

predtest = predictOneVsAll(all_theta, Xdqtest);

fprintf('\nTest Set Accuracy: %f\n', mean(double(predtest == ydqtest)) * 100);

prova = [1 16 4 17 8 17 7 15 7 8 5 9 6 9 5 9 4 10 0 0 0 0 0 0]

pred = predictOneVsAll(all_theta, prova)