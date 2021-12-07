% load("L_data.mat");
% load("M_data.mat");
% load("S_data.mat");
% load("Q_data.mat");
% 
% L_log = log10(L) - mean(log10(L));
% M_log = log10(M) - mean(log10(M));
% S_log = log10(S) - mean(log10(S));
% Q_log = log10(Q) - mean(log10(Q));
% 
% coeff = pca([L_log(:), M_log(:), S_log(:), Q_log(:)]);

coeff_mean = zeros(4, 4);

for lambda = 400:30:700
    for i = [1,2,3,4,6,7,8]
        name = strcat("scene", int2str(i), "_coeff_", int2str(lambda), ".mat");
        load(name); 
        coeff_mean = coeff_mean + coeff;
    end
    
    coeff_mean = coeff_mean / 7.0;
    save(strcat('coeff_mean_', int2str(lambda), '.mat'), "coeff_mean");
end
