CREATE TABLE contracts (
	id bigserial NOT NULL,
	client_id int NOT NULL,
	product_id int NOT NULL,
	domain varchar(200) NOT NULL,
	expire_day int NULL,
	start_at date NOT NULL DEFAULT CURRENT_DATE,
	finish_at date NULL,
	created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id)
);

CREATE SEQUENCE contracts_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;

ALTER TABLE contracts ALTER COLUMN id SET DEFAULT nextval('contracts_id_seq'::regclass);