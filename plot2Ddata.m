function plot2Ddata(homeaway, ydqtrain)

% Find Indices of Positive and Negative Examples
draw = find(ydqtrain == 0); homewin = find(ydqtrain == 1); homelose = find(ydqtrain == 2);

% Plot Examples
plot(homeaway(homewin, 1), homeaway(homewin, 2), 'ko', 'MarkerFaceColor', 'g', 'MarkerSize', 7)
hold on;
plot(homeaway(draw, 1), homeaway(draw, 2), 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7)
hold on;
plot(homeaway(homelose, 1), homeaway(homelose, 2), 'ko', 'MarkerFaceColor', 'r', 'MarkerSize', 7)

hold off;