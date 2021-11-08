 %{
 * Author: Jesse Both
 * Date: 11/8/2021
 * 
 * Assignment: Time Series Exploration
 * 
 * Inputs:
 *          c
 *          - number of windows 
 *          data
 *          - data set
 * Outputs:
 *          PAA generated based on inputs
 * 
 * Sources: Lecture
 * 
 %}

function paa = new_paagen(c,data)
    % generate the PAA to reduce the number of edges within the set
    % this allows a computer to require less processing power to be
    % able to process the data in a meaningful way.
    [x, y] = size(data);

    seg_length = floor(y/c);                                            % length of segment
    paa = zeros(x, c);                                                  % initialize output
    
    for i =1:x                                                          % iterate through each sample
        for N = 1:c                                                     % check each window
            sample = [];                                                % initialize sample vector
            sample_count = 1;                                           % sample vector size
            
            lower = (N-1) * seg_length;                                 % set lower bound                
            if lower < y                                                % check if end of sample
                upper = (N) * seg_length;                               % set upper bound
                for j = 1:y                                             % check location within boundary
                    if j > lower                                        % check if within lower bound
                        if j <= upper                                   % check if within upper bound
                            sample(sample_count) = data(i,j);           % store data
                            sample_count=sample_count+1;                % increment sample count                         
                        end
                    end
                end
            end      
            % use median value %
            paa(i,N)=median(sample);                                    % get window size       
        end
    end
end