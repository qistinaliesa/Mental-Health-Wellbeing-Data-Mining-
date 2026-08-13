# 🧠 Mental-Health-Wellbeing-Data-Mining

Data Mining project using **R** to predict mental health risks among university students using **Naïve Bayes, Decision Trees, Neural Networks, and k-Nearest Neighbors (kNN)**.

---

## 📌 Project Overview

**MindMatters** is a data mining project focused on exploring and predicting mental health risks among university students.

The project uses survey data to investigate how factors such as **academic workload, stress levels, sleep patterns, social engagement, lifestyle, and access to mental health resources** relate to students' mental well-being.

Multiple machine learning techniques were applied and compared to identify patterns and evaluate their effectiveness in predicting mental health-related outcomes.

---

## 🎯 Objectives

- Identify factors associated with **student mental health and stress**.
- Analyze patterns related to **academic workload, sleep, social engagement, and lifestyle**.
- Clean and preprocess the collected survey data.
- Apply different **data mining and machine learning techniques**.
- Compare model performance using **accuracy, precision, recall, and F1-score**.
- Identify important predictors associated with student stress.
- Explore how data-driven insights can support **student well-being initiatives**.

---

## 🔑 Key Features

### 📊 Survey-Based Dataset

The dataset was collected through a university student mental health survey covering:

- **Demographic information**
- **Academic workload**
- **Stress levels and coping mechanisms**
- **Sleep patterns**
- **Social engagement and loneliness**
- **Academic performance**
- **Access to mental health resources**
- **Lifestyle factors**
- **Overall mental health status**

### 🧹 Data Preprocessing

The dataset was cleaned and prepared before applying the machine learning models.

Preprocessing included:

- Handling missing values
- Correcting inaccurate or invalid data
- **Min-Max normalization**
- **Standardization of numerical data**
- Splitting the dataset into **60% training data and 40% testing data**

### 🤖 Machine Learning Models

The project compares four supervised classification techniques:

1. **Decision Tree**
2. **Naïve Bayes**
3. **Neural Network**
4. **k-Nearest Neighbors (kNN)**

---

## 📈 Results

The models demonstrated different strengths and limitations.

| Model | Result |
|---|---|
| **Decision Tree** | 47.06% accuracy |
| **Naïve Bayes** | 47% accuracy |
| **Neural Network** | Performed relatively well for moderate stress levels |
| **kNN** | Limited overall classification performance |

The models generally performed better when predicting **moderate stress categories**, while they struggled with underrepresented low- and high-stress categories.

A major challenge identified during the analysis was **class imbalance**, which affected the models' ability to generalize across all categories.

---

## 🔍 Key Findings

The analysis identified several important patterns:

- **Academic workload** was one of the major reported sources of stress.
- **Study hours** were associated with increased stress levels.
- **Sleep patterns** were an important indicator of elevated stress.
- **Lower social engagement** was associated with higher reported stress.
- **Smartphone and social media usage** was reported by many respondents as contributing to stress or anxiety.
- Many students had limited awareness of available **university mental health resources**.

---

## 🌱 Impact

This project demonstrates how **data mining and machine learning can be applied to student well-being research**.

The findings could potentially support universities in developing:

- 📚 **Stress management programs**
- 😴 **Sleep and wellness initiatives**
- 🤝 **Student social engagement activities**
- 🧠 **Mental health awareness campaigns**
- 📢 **Improved communication about mental health resources**
- 🎯 **More targeted student support programs**

The project also highlights the importance of **data quality, class balance, feature selection, and model evaluation** when applying machine learning to sensitive datasets.

---

## 🛠️ Technologies & Tools

- **R**
- **RStudio**
- **Data Mining**
- **Machine Learning**
- **Statistical Analysis**
- **Data Cleaning & Preprocessing**
- **Classification Algorithms**

---

