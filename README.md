# 📊 Loan Approval Prediction — EDA & Modeling

This project performs **Exploratory Data Analysis (EDA)** and **predictive modeling** on a loan application dataset in order to understand applicant characteristics and identify patterns associated with **loan approval decisions**.
The dataset includes demographic, financial, and credit-related variables for applicants, along with the final loan approval status.

---

## 📁 **Project Overview**

The goal of this project is to:

1. **Load and inspect the loan dataset**
2. **Perform comprehensive EDA** to understand:

   * Data types
   * Missing values
   * Distribution of numerical and categorical features
   * Relationships between variables
3. **Clean and preprocess the dataset**
4. **Prepare the data for future machine-learning models** (e.g., logistic regression, random forest).
5. Document the insights and structure for reproducibility.

---

## 📂 **Dataset Description**

The dataset contains **614 loan applications** with **13 features**, including:

### 🔢 Numerical Features

* **ApplicantIncome**
* **CoapplicantIncome**
* **LoanAmount**
* **Loan_Amount_Term**

### 🔠 Categorical Features

* Gender
* Married
* Dependents
* Education
* Self_Employed
* Credit_History
* Property_Area
* Loan_Status (target)

### ⚠️ Missing Values Identified

Several columns contain missing entries:

| Column           | Missing Count |
| ---------------- | ------------- |
| Gender           | 13            |
| Married          | 3             |
| Dependents       | 15            |
| Self_Employed    | 32            |
| LoanAmount       | 22            |
| Loan_Amount_Term | 14            |
| Credit_History   | 50            |

---

## 🔍 **Exploratory Data Analysis Summary**

### ✔️ Basic Summary

* Dataset shape: **(614, 13)**
* Most columns are categorical (object type)
* Loan approval (`Loan_Status = Y`) makes up **~69%** of the data

### ✔️ Numerical Summary

Basic statistics (mean, median, std, quartiles) were generated for all numeric fields, revealing:

* Wide income variability
* Loan amounts centered around **128–168** (likely thousands)
* Loan terms centered around **360** (months)

### ✔️ Value Counts

Each categorical feature was evaluated with `value_counts()` to understand the distribution of applicants across gender, marital status, education, dependents, and credit history.

---

## 🧹 **Data Cleaning Steps Performed**

* Identified missing values
* Inspected data types
* Reviewed basic statistics
* Checked for categorical levels
* Prepared dataset for imputation and encoding

(*If you want, I can generate and include the imputation and encoding steps as well.*)

---

## 🛠️ **Technologies Used**

* **Python**
* **Pandas** — data handling
* **NumPy** — numerical operations
* **Matplotlib / Seaborn** (optional) — visualizations
* **Scikit-learn** — for modeling (future step)

---

## 📈 **Next Steps (Optional Enhancements)**

You can extend this project by:

### 🔹 Data Cleaning

* Impute missing values (e.g., median for numeric, mode for categorical)
* Encode categories (Label Encoding / One-Hot Encoding)

### 🔹 Feature Engineering

* Total income
* Income-to-loan ratio
* Bin continuous features

### 🔹 Modeling

* Logistic Regression
* Decision Tree / Random Forest
* XGBoost / Gradient Boosting
* Hyperparameter tuning

### 🔹 Evaluation

* Accuracy
* Confusion Matrix
* ROC–AUC Score

---

## 📘 Conclusion

This README provides a clear structure for the loan approval dataset, the exploration steps, and the analytical direction of the project. You can expand the repository with data cleaning scripts, visualization notebooks, and machine-learning models.

---
