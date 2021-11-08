 %{
 * Author: Jesse Both
 * Date: 11/8/2021
 * 
 * Assignment: Time Series Exploration
 * 
 * Inputs:
 *          data
 *              - data set
 * Outputs:
 *          A row vector of the mean of each column
 * 
 * 
 * Sources: N/A
 * 
 %}
function norm = meanfind(data)
    % finds the mean of each column to create a single row
    [x,y] = size(data);         % get size of data
    norm = zeros(1,y);          % initialize output
    temp = [];                  % initialize temp

    % loop through each column %
    for i = 1:y
        temp = data(:,i); 
        norm(i) = mean(temp);  % find the mean of the column
    end
end