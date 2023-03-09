**README: Stock Price Prediction Using Adaplet and Support Vector Regression in MATLAB**

**Introduction:**

This repository contains MATLAB code for predicting the stock prices using Adaplet and Support Vector Regression (SVR) techniques. The code can predict the stock prices for 1 to 10 days and includes two functions: pred_adaplet for predicting using only Adaplet technique and AdapletSVR for predicting using the combination of Adaplet and SVR techniques. Additionally, there is a hitung_error function for checking the accuracy and error of the predictions. To run the complete prediction, open and run the Adaplet-SVR for Time Series Prediction.m file and edit the stock input.

**Installation:**

To use the code in this repository, you will need to have MATLAB installed on your machine.

**Usage:**

To use the code, follow these steps:
- Clone the repository to your local machine.
- Open MATLAB and navigate to the project directory.
- Open the Adaplet-SVR for Time Series Prediction.m file.
- Edit the input parameters in the file, such as the stock name and the number of days to predict.
- Run the file.
- The predicted stock prices will be displayed on the screen.

**Methodology:**

Adaplet is a time series prediction algorithm that is based on adaptive learning. It adjusts its parameters based on the historical data to improve the accuracy of its predictions. Adaplet uses a neural network with a single hidden layer to learn the patterns in the data. The algorithm uses a gradient descent method to optimize its parameters.

Support Vector Regression (SVR) is a machine learning technique that uses support vector machines (SVMs) to predict the stock prices. SVR is a type of regression analysis that works by mapping the input data to a high-dimensional feature space and finding the optimal hyperplane that separates the data. SVR uses a kernel function to map the input data to the high-dimensional feature space.

In this methodology, we first read the historical stock price data from a CSV file and preprocess it by removing any missing values. We then split the data into training and testing sets. We use Adaplet and SVR techniques to predict the stock prices for the specified number of days. The Adaplet algorithm is used to learn the patterns in the data and make short-term predictions, while the SVR algorithm is used to capture the long-term trends in the data.

After predicting the stock prices, we use the hitung_error function to check the accuracy and error of the predictions. The hitung_error function calculates the root mean square error (RMSE) and the mean absolute percentage error (MAPE) of the predictions. The RMSE measures the average difference between the predicted and actual values, while the MAPE measures the average percentage difference between the predicted and actual values.

Overall, the Adaplet and SVR techniques are effective methods for predicting stock prices. The Adaplet algorithm is particularly useful for short-term predictions, while the SVR algorithm is useful for capturing long-term trends. The hitung_error function helps to evaluate the accuracy and error of the predictions.

**Conclusion:**

The code in this repository provides a simple and effective way to predict the stock prices using Adaplet and SVR techniques in MATLAB. Users can modify the code to use different stocks and tweak the parameters to improve the accuracy of the predictions. The hitung_error function helps to check the accuracy and error of the predictions, and the Adaplet-SVR for Time Series Prediction.m file provides a complete workflow for predicting the stock prices.
