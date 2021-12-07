load("scene4_L_data.mat");
load("scene4_M_data.mat");
load("scene4_S_data.mat");
load("scene4_Q_data.mat");

L_log = log10(L) - mean(log10(L));
M_log = log10(M) - mean(log10(M));
S_log = log10(S) - mean(log10(S));
Q_log = log10(Q) - mean(log10(Q));


L = L_log;
M = M_log;
S = S_log;
Q = Q_log;

    fig1 = figure();
    hold on;
    scatter(L(1:500), M(1:500));
    xlabel("L");
    ylabel("M");
    saveas(fig1, 'log_L-M.png');
    hold off;
    
    fig2 = figure();
    hold on;
    scatter(L(1:500), Q(1:500));
    xlabel("L");
    ylabel("Q");
    saveas(fig2, 'log_L-Q.png');
    hold off;
    
    fig3 = figure();
    hold on;
    scatter(L(1:500), S(1:500));
    xlabel("L");
    ylabel("S");
    saveas(fig3, 'log_L-S.png');
    hold off;
    
    fig4 = figure();
    hold on;
    scatter(M(1:500), Q(1:500));
    xlabel("M");
    ylabel("Q");
    saveas(fig4, 'log_M-Q.png');
    hold off;