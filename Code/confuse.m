 %{
 * Author: Jesse Both
 * Date: 11/8/2021
 * 
 * Assignment: Time Series Exploration
 * 
 * Inputs:
 *          label
 *              - column of class labels
 *          dataTest
 *              - data that is used to create the matrix
 *          dataTrain
 *              - data that the matrix uses to train on.
 *          distance
 *              - function (use @ operator) has 2 parameters (s, r)
 * Outputs:
 *          Confusion Matrix
 *          accuracy
 * 
 * Sources:
 *          https://www.mathworks.com/help/matlab/math/parameterizing-functions.html
 %}

function acc = confuse(label, dataTest, dataTrain, distance)

    % loop through each sample
    for i=1:size(dataTest,1)
        % compare each sample to the training set
        for j=1:size(dataTrain,1)
            % compare using the input distance function
            orgD(i,j)=distance(dataTest(i,:),dataTrain(j,:));         
        end
    end

    % extract the class data
    for i=1:size(orgD,1)
        [throwAway,orgClass(i)]=min(orgD(i,:));      
    end
    
    % determine accuracy
    cnt=0;
    for i=1:length(orgClass)
        d = orgClass(i) -  label(i);
        if d == 0
            cnt = cnt + 1;
        end
    end
    acc=cnt/length(orgClass);           % calculate accuracy
    c=confusionmat(label, orgClass);    % create matrix
    confusionchart(c);                  % show matrix
end