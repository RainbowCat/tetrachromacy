load("S_cone.mat");
load("M_cone.mat");
load("L_cone.mat");

for lambda = 400:30:700
    load(strcat("Q_cone_", int2str(lambda), ".mat"));

    for s = [1, 2, 3, 4, 6, 7, 8]
        name = strcat("scene", int2str(s));
        load(strcat("hyperspectral_images/", name, "_radiances.mat"));
        r = radiances;
        
        h = 1000;
        w = 1000;
        data_points = zeros(h, w, 4);
        
        for i = 1:h
            for j = 1:w
                 data_points(i, j, 1) = sum(squeeze(r(i, j, :))' .* L_cone);
                 data_points(i, j, 2) = sum(squeeze(r(i, j, :))' .* M_cone);
                 data_points(i, j, 3) = sum(squeeze(r(i, j, :))' .* S_cone);
                 data_points(i, j, 4) = sum(squeeze(r(i, j, :))' .* Q_cone);
            end
        end
        
%         save(strcat(name, '_data_points', '.mat'), 'data_points');
        
        L = reshape(data_points(:, :, 1).', 1, []);
        M = reshape(data_points(:, :, 2).', 1, []);
        S = reshape(data_points(:, :, 3).', 1, []);
        Q = reshape(data_points(:, :, 4).', 1, []);
        
%         save(strcat(name, '_L_data.mat'), 'L');
%         save(strcat(name, '_M_data.mat'), 'M');
%         save(strcat(name, '_S_data.mat'), 'S');
%         save(strcat(name, '_Q_data_', int2str(lambda),'.mat'), 'Q');
        
%         fig1 = figure();
%         hold on;
%         scatter(L(1:500), M(1:500));
%         xlabel("L");
%         ylabel("M");
%         saveas(fig1, strcat(name, '_L-M.png'));
%         hold off;
%         
%         fig2 = figure();
%         hold on;
%         scatter(L(1:500), Q(1:500));
%         xlabel("L");
%         ylabel("Q");
%         saveas(fig2, strcat(name, '_L-Q.png'));
%         hold off;
%         
%         fig3 = figure();
%         hold on;
%         scatter(L(1:500), S(1:500));
%         xlabel("L");
%         ylabel("S");
%         saveas(fig3, strcat(name, '_L-S.png'));
%         hold off;
%         
%         fig4 = figure();
%         hold on;
%         scatter(M(1:500), Q(1:500));
%         xlabel("M");
%         ylabel("Q");
%         saveas(fig4, strcat(name, '_M-Q.png'));
%         hold off;
        
        L_log = log10(L) - mean(log10(L));
        M_log = log10(M) - mean(log10(M));
        S_log = log10(S) - mean(log10(S));
        Q_log = log10(Q) - mean(log10(Q));
        
        coeff = pca([L_log(:), M_log(:), S_log(:), Q_log(:)]);
        save(strcat(name, '_coeff_', int2str(lambda), '.mat'), 'coeff');
    end
end


