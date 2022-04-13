function [c, pt] = kmeans(d, k, iterations)
    [N, d] = size(d);
    centroid_indices = randperm(N, k);
    c = data(centroid_indices, :);
    pt = pt(d, c);
    errors = [];
    prev_error = -1;
    for i = 1:iterations
        c = centroids(d, pt);
        pt = pt(d, c);
        err = sse(d, c, pt);
        if prev_error == err
            break
        end
        prev_error = err;
        errors(end + 1) = err;
    end
    savefig clusters
end

function error = sse(data, centroids, membership)
    [N, d] = size(data);
    [k, d] = size(centroids);
    dists = zeros(N, k);
    for group = 1:k
        dists(:, group) = vecnorm(data - c(group, :), 1, 2);
    end

    error = sum(membership .* dists, 'all');
end

function c = centroids(d, pt)
    [x,y] = size(d);
    c = ((pt' * d)' ./ sum(pt))';
end

function p = pt(data, centroids)
    [N, d] = size(data);
    [k, d] = size(centroids);
    dists = zeros(N, k);
    for group = 1:k
        dists(:, group) = vecnorm(data - c(group, :), 1, 2);
    end
    [values, idxs] = min(dists');
    p = zeros(N, k);
    for i = 1:N
        membership(i, idxs(i)) = 1;
    end
end
