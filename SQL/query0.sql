SELECT COUNT(tc.card_holder_id)
FROM (SELECT transaction_amount, card_holder_id
	FROM credit_card as cc
		INNER JOIN
		transactions as t
		ON cc.card = t.card
		WHERE transaction_amount <= 2
	 ) as tc
GROUP by tc.card_holder_id;

SELECT COUNT(tc.card_holder_id)
FROM (SELECT transaction_amount, card_holder_id
	FROM credit_card as cc
		INNER JOIN
		transactions as t
		ON cc.card = t.card
		WHERE transaction_amount > 2
	 ) as tc
GROUP by tc.card_holder_id;