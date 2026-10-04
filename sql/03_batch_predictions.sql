-- testing how trained model categorized incoming customer queries 
WITH test_messages AS (
  SELECT 'I cannot find my debit card anywhere, think I left it at an ATM' AS text
  UNION ALL
  SELECT 'Why was I charged an extra fee on my monthly statement?' AS text
  UNION ALL
  SELECT 'How long does an international bank transfer usually take?' AS text
  UNION ALL
  SELECT 'I forgot my 4-digit code for paying at stores' AS text
)

SELECT
  text AS customer_message,
  predicted_category AS predicted_intent,
  ROUND(prob, 4) AS confidence_score
FROM ML.PREDICT(
  MODEL `banking_nlp.intent_classifier_classic`,
  (SELECT * FROM test_messages)
),
UNNEST(predicted_category_probs)
WHERE label = predicted_category
ORDER BY confidence_score DESC;
