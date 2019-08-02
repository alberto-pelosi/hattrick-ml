%hwol (hattrick win or lose) try to predict the result of the match given features about home and away team

X = dlmread('Datos_HT.csv',';');

%remove header and first column
X =  X(2:end, 2:end);

rs = rows(X);
%remove invalid rows
toRemove = [];
for i=1: rs
	if (X(i,1)==0 && X(i,2)==0 && X(i,3)==0 && X(i,4)==0 && X(i,5)==0 && X(i,6)==0 && X(i,7)==0 && X(i,8)==0 && X(i,9)==0 && X(i,10)==0 && X(i,11)==0 && X(i,12)==0 && X(i,13)==0 && X(i,14)==0 && X(i,15)==0 && X(i,16)==0 && X(i,17)==0 && X(i,18)==0 && X(i,19)==0 && X(i,20)==0 && X(i,21)==0 && X(i,22)==0 && X(i,23)==0 && X(i,24)==0 && X(i,25)==0 && X(i,26)==0)
		toRemove = [toRemove, i];
	endif
end


X(toRemove,:)=[];


%create y:

% 0 draw
% 1 home
% 2 away

rs = rows(X);


y = [];
for i = 1: rs
	if(X(i,25) == X(i, 26))
		y = [y, 0];
	elseif (X(i,25) > X(i, 26))
		y = [y, 1];
	else 
		y = [y, 2];
	endif
end

lambda = 0.1;
num_labels = 3;

y = y';
%remove goals
X = X(:,1:24)
[all_theta] = oneVsAll(X, y, num_labels, lambda);

fprintf('Program paused. Press enter to continue.\n');
pause;


%% ================ Part 3: Predict for One-Vs-All ================
%  After ...
pred = predictOneVsAll(all_theta, X);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);
