# Customer Intent Classification using BigQuery ML (TF-IDF & Logistic Regression)

## Project Overview
This project builds an automated NLP intent classification pipeline in Google BigQuery to route retail banking customer messages into 20 distinct operational intent categories.

## Tech Stack
* **Cloud Platform:** Google Cloud Platform (GCP)
* **Data Warehouse:** Google BigQuery
* **Machine Learning:** BigQuery ML (Multi-Class Logistic Regression)
* **Feature Engineering:** TF-IDF, N-grams (1, 2) and Text Normalization
* **Dataset:** PolyAI Banking77 Intent Dataset

## Methodology & Feature Pipeline
Raw text messages were transformed inside BQML using an in-model feature engineering clause:
1. Lowers text casing and splits sentences into words.
2. Generates unigrams and bigrams.
3. Computes Term Frequency-Inverse Document Frequency (TF-IDF) weights across all documents.
4. Trains a multi-class logistic regression model on generated numeric n-gram features.

## Results & Performance
* **Baseline Categorical Accuracy:** 6.7% (Raw text treated as string tokens)
* **TF-IDF Pipeline Accuracy:** 81.0%
* **Log Loss:** Reduced significantly, demonstrating strong model confidence in intent separation.

## Repository Structure
* `sql/01_filter_top_intents.sql` : Data cleaning & class reduction
* `sql/02_train_tfidf_model.sql` : BQML TRANSFORM & model definition
* `sql/03_batch_predictions.sql` : Prediction and scoring queries
