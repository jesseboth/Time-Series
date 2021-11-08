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
 *          Euclidean distance between vectors/points
 * 
 * Sources: Lecture
 * 
 %}
function d = euclidean(s,r)
    sumD = 0;
    for i = 1:length(s)
        d =(s(i)-r(i))^2;
        sumD=sumD + d;
    end
    d=sqrt(sumD);
end
