CREATE TABLE receivables (
	id bigserial NOT NULL,
	client_id int NOT NULL,
	product_id int NOT NULL,
	contract_id int NULL,
	domain varchar(200) NOT NULL,
	price decimal(6,2) DEFAULT 0.0,
	expire_at date NOT NULL DEFAULT CURRENT_DATE,
	parcel_actual int NULL,
	parcel_total int NULL,
	created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id)
);

CREATE SEQUENCE receivables_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;

ALTER TABLE receivables ALTER COLUMN id SET DEFAULT nextval('receivables_id_seq'::regclass);