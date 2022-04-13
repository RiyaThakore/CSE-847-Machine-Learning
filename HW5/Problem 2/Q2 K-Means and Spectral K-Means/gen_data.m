function data = random_data(n)
    mu = [1 2;-3 -5; -4 3; 4 -4; 10 10; -10 10];
    sigma = [3 3];
    gm = gmdistribution(mu,sigma);
    data = random(gm, n);
end
