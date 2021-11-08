 %{
 * Author: Jesse Both
 * Date: 11/8/2021
 * 
 * Assignment: Time Series Exploration
 * 
 * Inputs:
 *          paa
 *          - paa generated from new_paagen() 
 *          data
 *          - data set
 *          class
 *          - vector of class data
 *          c
 *          - number of windows (must correspond to c used for paa
 *          i 
 *          - row index to display 
 * Outputs:
 *          PAA plot based on inputs
 * 
 * Sources: Lecture
 * 
 %}
function  paaplot(paa,data, class, c,i)
    % This function plots the data based on the input PAA generation.
    % The visualization can be seen in figure 1.
    s=size(data);               % get size of matrix
    dt=s(2);                    
    ln=dt/c;                    % length of segment
    ln=ceil(ln);                % round up
    paax=[];                    % initialize vector
    paay=[];                    % initialize vector

    z=1;                        % initialize index values
    n=1;
    
    % get first line
    paax(z)=0;
    paay(z)=paa(i,n);
    s=size(data);
    z=z+1;

    for n=2:c
        paax(z)=paax(z-1)+ln;   % store x value
        paay(z)=paa(i,n-1);     % store y value
        z=z+1;  
        paax(z)=paax(z-1);      % store next x value
        paay(z)=paa(i,n);       % sore next y value
        z=z+1;
    end
    t=linspace(0,s(2),s(2));    % plot bounds
    hold on
    
    % plot the data %
    scatter(t,data(i,:),"filled");
    classes = ["Normal", "Cyclic", "Increasing Trend", "Decreasing Trend", "Upward Shift", "Downward Shift"];
    str = strcat("Class: ", classes(class(i)));
    title({"PAA", str});

    % plot the PAA %
    plot(paax,paay);
end