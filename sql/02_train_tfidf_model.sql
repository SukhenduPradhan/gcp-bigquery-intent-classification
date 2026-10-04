--training model 
CREATE OR REPLACE MODEL `banking_nlp.intent_classifier_classic`
TRANSFORM(
  ML.TF_IDF(ML.NGRAMS(SPLIT(LOWER(text), ' '), [1, 2])) OVER() AS text_features,
  category
)
OPTIONS(
  model_type = 'logistic_reg',
  input_label_cols = ['category']
) AS
SELECT
  text,
  category
FROM `banking_nlp.model_features`;
