## 💻 Laptop Price Prediction

This project focuses on predicting laptop prices using a dataset of various laptop specifications. The goal is to build accurate regression models that can estimate the price of a laptop based on its features.

### 🔍 Project Overview
The dataset contains specifications such as:
- Company, Type, and Operating System  
- RAM, CPU, GPU, Storage (Primary & Secondary)  
- Screen details (Resolution, Touchscreen, IPS panel, Retina display)  
- Physical attributes like screen size and weight  

### ✅ Key Steps:
- 📊 **Exploratory Data Analysis**: Visualized distributions, outliers, and feature relationships using boxplots, countplots, scatter plots, and violin plots.
- 🔧 **Feature Engineering**: Created new features like `PPI`, Is_Gaming_Laptop, Total_Storage, and encoded categorical variables.
- 🧹 **Outlier Handling**: Used IQR method and transformations (Box-Cox, log) for skewed features.
- 🔁 **Data Scaling**: Standardized features using `StandardScaler` and `MinMaxScaler`.
- 🧠 **Model Building**: Trained and evaluated multiple models:  
  - Linear Regression  
  - Random Forest Regressor  
  - XGBoost Regressor  
- 📈 **Model Evaluation**: Compared models using metrics like RMSE, MSE, and R² Score.
- 🧪 **Hyperparameter Tuning**: Optimized models using `GridSearchCV` and `RandomizedSearchCV`.

### 📌 Results
Achieved a robust price prediction model with good generalization on unseen data. Visualized model performance comparison for clear understanding.

### 📂 Tech Stack
- Python, Pandas, NumPy
- Seaborn, Matplotlib
- Scikit-learn
- XGBoost
