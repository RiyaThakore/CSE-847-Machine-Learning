function data = gen_data(n)
    x1 = [11 12;-13 -15; -14 13; 4 -4; 10 10; -10 10];
    y1 = [2 2];
    d = gmdistribution(x1,y1);
    data = gen_data(d, n);
end
