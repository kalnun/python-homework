SELECT transaction_amount, transaction_date 
FROM transactions
WHERE CAST(transaction_date AS TIME) BETWEEN '07:00' and '09:00'
ORDER BY transaction_amount DESC
LIMIT 100;

SELECT transaction_amount, transaction_date 
FROM transactions
WHERE NOT CAST(transaction_date AS TIME) BETWEEN '07:00' and '09:00'
ORDER BY transaction_amount DESC
LIMIT 100;