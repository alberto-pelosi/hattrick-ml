function [homeaway] = featureVisualizationExtractor(Xdqtrain, homecol, awaycol)


homematrix = Xdqtrain(:, homecol);
awaymatrix = Xdqtrain(:, awaycol);

home = sum(homematrix, 2);
away = sum(awaymatrix, 2);

homeaway = [home away];



