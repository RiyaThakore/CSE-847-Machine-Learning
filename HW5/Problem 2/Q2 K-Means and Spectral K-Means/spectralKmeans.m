function [c, pt] = spectral_kmeans(d, k, i)
    [n1, d] = size(d);
    d = d';
    gram_matrix = d' * d;
    [n2, D] = eig(gram_matrix);
    vectors = n2(:, (end-(k-1)):end);
    [c, pt] = kmeans(vectors, k, i);
end
