-- Drop table if exists
DROP TABLE IF EXISTS card_holder;
DROP TABLE IF EXISTS merchant;
DROP TABLE IF EXISTS merchant_category;
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS credit_card;

-- Create new table
CREATE TABLE credit_card (
	card VARCHAR(50),
	card_holder_id smallint NOT NULL
);

CREATE TABLE card_holder (
	card_holder_id smallint NOT NULL,
	card_holder_name VARCHAR(50)
);

CREATE TABLE merchant (
    merchant_id smallint NOT NULL,
    merchant_name VARCHAR(50),
    merchant_category_id smallint NOT NULL
);

CREATE TABLE merchant_category (
    merchant_category_id smallint NOT NULL,
    category_name VARCHAR(50)
);

CREATE TABLE transactions (
    transaction_id smallint NOT NULL,
    transaction_date timestamp without time zone NOT NULL,
	transaction_amount smallint NOT NULL,
	card VARCHAR(50),
	merchant_id smallint NOT NULL
);