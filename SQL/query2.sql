SELECT merchant_name FROM
(
SELECT merchant_id, COUNT(merchant_id)
FROM (SELECT transaction_amount, card_holder_id, merchant_id
	FROM credit_card as cc
		INNER JOIN
		transactions as t
		ON cc.card = t.card
		WHERE transaction_amount <= 2
	 ) as tc
GROUP BY tc.merchant_id
ORDER BY tc.count DESC
LIMIT 5) as mc
INNER JOIN
merchant as m
ON mc.merchant_id = m.merchant_id;