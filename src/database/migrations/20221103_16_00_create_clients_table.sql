CREATE TABLE clients (
	id bigserial NOT NULL,
	name varchar(200) NOT NULL,
    company varchar(200) NULL,
	email varchar(200) NOT NULL,
	phone varchar(200) NULL,
	client bool NULL DEFAULT false,
	supplier bool NULL DEFAULT false,
    created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT clients_email UNIQUE (email),
	CONSTRAINT clients_pkey PRIMARY KEY (id)
);

CREATE SEQUENCE clients_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;

ALTER TABLE clients ALTER COLUMN id SET DEFAULT nextval('clients_id_seq'::regclass);