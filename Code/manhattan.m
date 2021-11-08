 %{
 * Author: Jesse Both
 * Date: 11/8/2021
 * 
 * Assignment: Time Series Exploration
 * 
 * Inputs:
 *          s
 *          - first vector
 *          r
 *          - second vector
 * Outputs:
 *          Manhattan distance between vectors/points
 * 
 * Sources: Lecture
 * 
 %}
function d = manhattan(s,r)
     sumD=0;     
     % d = sum(abs(s(i)-r(i)))      
     for i=1:length(s)
         d = abs(s(i)-r(i));
         sumD=sumD+d;
     end
     d = sumD;
end
