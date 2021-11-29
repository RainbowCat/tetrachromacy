load("radiances_25000.mat");
r = radiances_25000;

load("S_cone.mat");
load("M_cone.mat");
load("L_cone.mat");
load("Q_cone.mat");

data_points = zeros(255, 335, 4);

for i = 1:255
    for j = 1:335
         data_points(i, j, 1) = sum(squeeze(r(i, j, :))' .* L_cone);
         data_points(i, j, 2) = sum(squeeze(r(i, j, :))' .* M_cone);
         data_points(i, j, 3) = sum(squeeze(r(i, j, :))' .* S_cone);
         data_points(i, j, 4) = sum(squeeze(r(i, j, :))' .* Q_cone2);
    end
end

save('data_points.mat', 'data_points');

L = reshape(data_points(:, :, 1).', 1, []);
M = reshape(data_points(:, :, 2).', 1, []);
S = reshape(data_points(:, :, 3).', 1, []);
Q = reshape(data_points(:, :, 4).', 1, []);

save('L_data.mat', 'L');
save('M_data.mat', 'M');
save('S_data.mat', 'S');
save('Q_data.mat', 'Q');

fig1 = figure();
hold on;
scatter(L(1:200), M(1:200));
xlabel("L");
ylabel("M");
saveas(fig1, 'L-M.png');
hold off;

fig2 = figure();
hold on;
scatter(L(1:200), Q(1:200));
xlabel("L");
ylabel("Q");
saveas(fig1, 'L-Q.png');
hold off;

fig3 = figure();
hold on;
scatter(L(1:200), S(1:200));
xlabel("L");
ylabel("S");
saveas(fig1, 'L-S.png');
hold off;

fig4 = figure();
hold on;
scatter(M(1:200), Q(1:200));
xlabel("M");
ylabel("Q");
saveas(fig1, 'M-Q.png');
hold off;


