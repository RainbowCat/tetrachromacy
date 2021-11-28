lambdas = [400:10:720]';

lambdaMax = 500;
lamb = LambNomogram(lambdas,lambdaMax);

self_screen = @(lamb) 1-10.^(-0.5.*lamb);
macTrans = MacularTransmittance(lambdas, 'Human', 'CIE');
lensTrans = LensTransmittance(lambdas, 'Human', 'CIE');

S_cone = self_screen(LambNomogram(lambdas,426)) .* macTrans .* lensTrans;
M_cone = self_screen(LambNomogram(lambdas,530)) .* macTrans .* lensTrans;
L_cone = self_screen(LambNomogram(lambdas,555)) .* macTrans .* lensTrans;
Q_cone1 = self_screen(LambNomogram(lambdas,538)) .* macTrans .* lensTrans;
Q_cone2 = self_screen(LambNomogram(lambdas,542.5)) .* macTrans .* lensTrans;
Q_cone3 = self_screen(LambNomogram(lambdas,547)) .* macTrans .* lensTrans;

% x = 400:10:720;
% fig1 = figure;
% plot(x, S_cone, 'blue', x, M_cone, 'green', x, L_cone, 'red', x, Q_cone1, 'yellow');
% saveas(fig1,'LMSQ1.png');
% ylim([0.0 1.0]);
% xlim([380 720]);
% 
% fig2 = figure;
% plot(x, S_cone, 'blue', x, M_cone, 'green', x, L_cone, 'red', x, Q_cone2, 'yellow');
% saveas(fig2,'LMSQ2.png');
% ylim([0.0 1.0]);
% xlim([380 720]);
% 
% fig3 = figure;
% plot(x, S_cone, 'blue', x, M_cone, 'green', x, L_cone, 'red', x, Q_cone3, 'yellow');
% saveas(fig3,'LMSQ3.png');
% ylim([0.0 1.0]);
% xlim([380 720]);

load("scene3/ref_mosteiro4bb_reg1.mat")
reflectances = reflectances .* 1000; % normalize
data_points = zeros(1018, 1267, 4);

% for i = 1:33
%     data_points(i, i, 1) = sum(squeeze(reflectances(i, i, :))' .* S_cone) 
% end
    