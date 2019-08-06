%hwol (hattrick win or lose) try to predict the result of the match given features about home and away team

X = dlmread('Datos_HT.csv',';');

%remove header and first column
Xdq = dataquality(X);


%create y:

% 0 draw
% 1 home
% 2 away




y = ylogisticcreator(Xdq);

lambda = 0.1;
num_labels = 3;

y = y';
%remove goals
Xdq = Xdq(:,1:24);
[all_theta] = oneVsAll(Xdq, y, num_labels, lambda);

fprintf('Program paused. Press enter to continue.\n');
pause;


%% ================ Part 3: Predict for One-Vs-All ================
%  After ...
pred = predictOneVsAll(all_theta, Xdq);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);

prova = [1 16 4 17 8 17 7 15 7 8 5 9 6 9 5 9 4 10 0 0 0 0 0 0]

pred = predictOneVsAll(all_theta, prova)