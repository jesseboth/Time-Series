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
function saxplot(paa,data, class, c,i)
    % This function plots the data based on the input PAA generation.
    % The visualization can be seen in figure 5.  
    % % The SAX provides additional symbolic information compared to PAA
    % A comparison between SAX and PAA can be seen in figure 4.
    s=size(data);               % get size of matrix
    dt=s(2);                    
    ln=dt/c;                    % length of segment
    ln=ceil(ln);                % round up
    paax=[];                    % initialize vector
    paay=[];                    % initialize vector

    z=1;                        % initialize index values
    n=1;
    
    % store first line
    paax(z)=0;
    paay(z)=paa(i,n);
    s=size(data);
    z=z+1;
    for n=2:c
        paax(z)=paax(z-1)+ln;   % store x value
        paay(z)=paa(i,n-1);     % store y value
        z=z+1;
        paax(z)=paax(z-1);      % store next x value
        paay(z)=paa(i,n);       % store next y value
        z=z+1;

    end

    % plot initial data and PAA.
    t=linspace(0,s(2),s(2));
    hold on
    scatter(t,data(i,:),"filled");
    classes = ["Normal", "Cyclic", "Increasing Trend", "Decreasing Trend", "Upward Shift", "Downward Shift"];
    str = strcat("Class: ", classes(class(i)));
    title({"SAX", str});
    plot(paax,paay, 'k');

    % Show the symbolic data %
    for n = 2:2:(2*c-1)
        [color label] = getlabel(paay(n));          % determine what lables the index requires
        plot(paax((n-1:n)),paay((n-1:n)), color);   % plot the line

        % give the line a name %
        text(paax((n-1))+2,paay((n-1)),label,'VerticalAlignment','top','HorizontalAlignment','center')
    end
end