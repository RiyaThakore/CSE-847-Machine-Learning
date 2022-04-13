function [c, pt] = kmeans(d, k, iterations)
    [N, d] = size(d);
    centroid_indices = randperm(N, k);
    c = data(centroid_indices, :);
    pt = get_membership(d, c);
    errors = [];
    prev_error = -1;
    for i = 1:iterations
        c = get_centroids(d, pt);
        pt = get_membership(d, c);
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
        dists(:, group) = vecnorm(data - centroids(group, :), 1, 2);
    end

    error = sum(membership .* dists, 'all');
end

function centroids = get_centroids(data, membership)
    [N, d] = size(data);

    centroids = ((membership' * data)' ./ sum(membership))';
end

function membership = get_membership(data, centroids)
    [N, d] = size(data);
    [k, d] = size(centroids);
    dists = zeros(N, k);
    for group = 1:k
        dists(:, group) = vecnorm(data - centroids(group, :), 1, 2);
    end
    [values, idxs] = min(dists');
    membership = zeros(N, k);
    for i = 1:N
        membership(i, idxs(i)) = 1;
    end
end
