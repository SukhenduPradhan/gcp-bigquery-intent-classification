-- Query to isolate top 20 intent classes

CREATE OR REPLACE TABLE `banking_nlp.model_features` AS
WITH top_intents AS (
  SELECT category
  FROM `banking_nlp.raw_intents`
  GROUP BY category
  ORDER BY COUNT(*) DESC
  LIMIT 20
)
SELECT
  text,
  category
FROM `banking_nlp.raw_intents`
WHERE category IN (SELECT category FROM top_intents);
