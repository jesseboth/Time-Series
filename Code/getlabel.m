 %{
 * Author: Jesse Both
 * Date: 11/8/2021
 * 
 * Assignment: Time Series Exploration
 * 
 * Inputs:
 *          num
 *              - num is a y-axis coordinate based on the paa generation
 * Outputs:
 *          Color and label
 * 
 * Subroutines:
 *              indexof(arr, val)
 *              - finds where val is located within arr (1xX array)
 *              - outputs an index
 * Sources: Lecture
 * 
 %}
function [c, label] = getlabel(num)
    % outputs a color and label that corresponds to the defined, arbirary
    % sections.
    sections = [-3, -2.5, -2, -1.5, -1, -.5, 0, .5, 1, 1.5, 2, 2.5, 3];
    labels = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M"];    
    colors = ['b', 'g', 'c', 'm', 'y', 'r', 'b', 'g', 'c', 'm', 'y', 'r', 'b'];    
    
    r = round(num*2)/2;         % round to the nearest .5
    
    i = indexof(sections, r);   % find corresponding index
    c = colors(i);              % get color
    label = labels(i);          % get label
end


function i = indexof(arr, val)
    % finds where val is located within arr (1xX array)
    i = 0;
    [x, len] = size(arr);       % get length, x should be 1

    % iterate through array %
    for x=1:len        
        if arr(x) == val        % value found
            i = x;              % store loop
            break               % exit loop
        end
    end
    % if value not found, this will return 0 and probably fault.
end