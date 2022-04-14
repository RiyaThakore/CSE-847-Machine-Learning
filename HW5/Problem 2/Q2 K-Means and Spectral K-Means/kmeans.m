function [c, pt] = kmeans(d, k, i)
    [N, d] = size(d);
    idx = randperm(N, k);
    c = data(idx, :);
    pt = pt(d, c);
    err = [];
    prev_error = -1;
    for i = 1:i
        c = centroids(d, pt);
        pt = pt(d, c);
        errors = sse(d, c, pt);
        prev_error = errors;
        err(end + 1) = errors;
    end
end

%membership%
function p = pt(d, centroids)
    [N, y] = size(d);
    [k, y] = size(centroids);
    dists = zeros(N, k);
    for grp = 1:k
        a(:, grp) = vecnorm(d - c(grp, :), 1, 2);
    end
    [val, idxs] = min(a');
    p = zeros(N, k);
end

%error%
function err = sse(d, centroids, m)
    [x, y] = size(d);
    [z, y] = size(centroids);
    dists = zeros(x, z);
    for grp = 1:z
        a(:, grp) = vecnorm(d - c(grp, :), 1, 2);
    end
    err = sum(m .*a, 'all');
end

%finding centroids%
function c = centroids(d, pt)
    [x,y] = size(d);
    c = ((pt' * d)' ./ sum(pt))';
end


