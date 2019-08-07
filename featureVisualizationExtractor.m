function [homeaway] = featureVisualizationExtractor(Xdqtrain)
homecol = [1 3 5 7 9 11 13 15 17 19 21 23];
awaycol = [2 4 6 8 10 12 14 16 18 20 22 24];

homematrix = Xdqtrain(:, homecol);
awaymatrix = Xdqtrain(:, awaycol);

home = sum(homematrix, 2);
away = sum(awaymatrix, 2);

homeaway = [home away];



