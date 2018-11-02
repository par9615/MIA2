function [X] = normalize(data)
	cols = size(data, 2);
	rows = size(data, 1);
	X = zeros(rows, cols);
	for i=1:cols
		meanCol = mean(data(:,i));
		sigma = std(data(:,i));
        X(:,i) = (data(:,i) - meanCol) / sigma;
    end
end