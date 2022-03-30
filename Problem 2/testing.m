par = [0.00000001, 0.01, 0.1, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5, 0.55, 0.6, 0.65, 0.7, 0.75, 0.8, 0.85 0.9, 0.95, 1];

load ad_data/ad_data.mat;
[train, d] = size(X_train);
[test, d] = size(X_test);

y_test_new = y_test;
y_train_new = y_train;
y_test(y_test==0) = -1;
y_train(y_train==0) = -1;

aucs_val = [];
for i = 1:length(par)
    [w, c] = logistic_train(X_train, y_train, par(i))
    probs = 1 ./ (1+ exp(- (X_test * w + c)));
    [x,y,t, AUC] = perfcurve(y_test_new, probs, 1);
    aucs_val(end+1) = AUC;
end

plot(par, aucs_val);
ylabel('AUC values')
xlabel('Reg Term')