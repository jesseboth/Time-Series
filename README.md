# Time-Series

-------------------
About
-------------------

Project Description: 

The purpose of this assignment was to explore representation and classification
techniques of a time series.  The data that was used for this assignment was
a [synthetic control data set](https://archive.ics.uci.edu/ml/datasets/Synthetic+Control+Chart+Time+Series).
The representaion techniques that were used for this assigment were PAA - Piecewise
Aggregate Approximation and SAX - Symbolic Aggregate Approximation. The classification
was done by utilizing the Euclidean and Manhattan distance forumulas.

Contribitor List: Jesse Both


--------------------
Features
--------------------

* PAA and SAX Generation.
* Confuison Matrices to show data accuracy.

--------------------
Required Materials
--------------------
- Matlab
- synthetic_control.data

--------------------
Resources and References
--------------------
- [Matlab Documentation](https://www.mathworks.com/help/matlab/)

--------------------
Getting Started
--------------------
1. Load all the the files into matlab
2. Run the main file via the terminal by typing 'main' or pressing the 
play button with the main file as the active editor.
3. Open the terminal and input the window size 'c' value. This value must 
    be less than 60, the recommended value is 15.
4. The output to the terminal shows the accuracy of the data and the accuracy 
    of the PAA generation.
5. There are 5 figures that are displayed
    * Figure 1:
        - Confusion Matrix based on original data
    * Figure 2:
        - PAA representation from each class
    * Figure 3:
        - Confusion Matrix based on PAA generation
    * Figure 4: 
        - Comparison between SAX and PAA (cyclic class used)
    * Figure 5: 
        - SAX representation from each class

<br/>

--------------------
Data Information
--------------------

In this data set, there are 6 classes, 600 rows and 60 columns.  Each row
represents a sample, every 100 rows represents a new class.  The classes are:
1. Normal
2. Cyclic
3. Increasing Trend
4. Decreasing Trend
5. Upward Shift
6. Downward Shift

Before any the confusion matrix was created, a training set needed to be created.  In order to create the best training set, the mean of each column
from each indiviual class was found.  This resulted in a training set that contained 1 row for each class.

Inorder to classify the data, the Euclidean and Manhattan distance formulas
were utilized. 

Euclidean: $d\left( r,s\right)   = \sqrt {\sum _{i=1}^{n}  \left( r_{i}-s_{i}\right)^2 } $

Manhattan: $d\left( r,s\right)   = {\sum _{i=1}^{n}  \lvert r_{i}-s_{i}\rvert} $

The accuracy of this data can be seen below: ![Data](graphics/confuseddata.png)

As you can see, there is no clear benefit in using one distance calculation
over the other.


--------------------
PAA Generation
--------------------

The purpose of the Piecewise Aggregate Approximation is to reduce the number of
edges within a data set so that a computer has an easier time processing its
information.  In order to do this the paa generation function takes in the data
and a c value.  This c value represents the number of windows that will be created across the data set.  The spread of the data along with the generated PAA can be seen below:

![PAA](graphics/paaplot.png)

Inorder to test the accuracy of this data, the training set also needs to be 
run through the paa generation function.  The spread of the data is below:

![PAAConfuse](graphics/confusedpaa.png)

--------------------
SAX Generation
--------------------
![SAX](graphics/saxplot.png)

![PAASAX](graphics/paavssax.png)
