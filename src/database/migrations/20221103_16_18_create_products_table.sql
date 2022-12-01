CREATE TABLE products (
    id bigserial NOT NULL,
    name varchar(255) NOT NULL,
    type varchar(25) NOT NULL DEFAULT 'Mensal',
    monthly_price decimal(6,2) DEFAULT 0.0,
    created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

CREATE SEQUENCE products_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;

ALTER TABLE products ALTER COLUMN id SET DEFAULT nextval('products_id_seq'::regclass);