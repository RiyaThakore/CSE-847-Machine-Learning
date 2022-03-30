function output = generate(data)
    shape = size(data);
    output = [data, ones(shape(1), 1)];
end