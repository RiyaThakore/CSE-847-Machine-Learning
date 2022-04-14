function [c, pt] = spectralKmeans(d, k, i)
    [n1, d] = size(d);
    d = d';
    A = d' * d;
    [n2, D] = eig(A);
    vectors = n2(:, (end-(k-1)):end);
    [c, pt] = kmeans(vectors, k, i);
end
