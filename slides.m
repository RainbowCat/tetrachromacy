lambdas = [380:10:720]';

lambdaMax = 500;
lamb = LambNomogram(lambdas,lambdaMax);

self_screen = @(lamb) 1-10.^(-0.5.*lamb);
macTrans = MacularTransmittance(lambdas, 'Human', 'CIE');
lensTrans = LensTransmittance(lambdas, 'Human', 'CIE');

S_cone = self_screen(LambNomogram(lambdas,430));
M_cone = self_screen(LambNomogram(lambdas,535));
L_cone = self_screen(LambNomogram(lambdas,570));
Q_cone = self_screen(LambNomogram(lambdas,552.5));

% S_cone = self_screen(LambNomogram(lambdas,430)) .* macTrans .* lensTrans;
% M_cone = self_screen(LambNomogram(lambdas,535)) .* macTrans .* lensTrans;
% L_cone = self_screen(LambNomogram(lambdas,570)) .* macTrans .* lensTrans;
% Q_cone = self_screen(LambNomogram(lambdas,552.5)) .* macTrans .* lensTrans;

x = 380:10:720;
fig1 = figure;
plot(x, S_cone, 'blue', x, M_cone, 'green', x, L_cone, 'red', x, Q_cone, 'black');
saveas(fig1, "screen.png")
ylim([0.0 1.0]);
xlim([380 720]);