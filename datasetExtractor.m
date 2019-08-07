function[Xdqtrain, ydqtrain, Xdqcv, ydqcv, Xdqtest, ydqtest] = datasetExtractor(Xdq, ydq)

total = size(Xdq,1);

trainingIndex = floor(60 * total  / 100);

cvIndex = floor((total - trainingIndex) / 2);

Xdqtrain = Xdq(1: trainingIndex, :);

ydqtrain = ydq(1: trainingIndex, :);

Xdqcv = Xdq(trainingIndex + 1 : trainingIndex + cvIndex, :);

ydqcv = ydq(trainingIndex + 1 : trainingIndex + cvIndex, :);

Xdqtest = Xdq(trainingIndex + cvIndex + 1:end, :);

ydqtest = ydq(trainingIndex + cvIndex + 1:end, :);

end