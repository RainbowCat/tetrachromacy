load("L_data.mat");
load("M_data.mat");
load("S_data.mat");
load("Q_data.mat");

L_log = log10(L) - mean(log10(L));
M_log = log10(M) - mean(log10(M));
S_log = log10(S) - mean(log10(S));
Q_log = log10(Q) - mean(log10(Q));

coeff = pca([L_log(:), M_log(:), S_log(:), Q_log(:)]);