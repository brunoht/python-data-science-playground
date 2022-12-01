ALTER TABLE products ADD last_update date NOT NULL DEFAULT CURRENT_DATE;
ALTER TABLE products ADD next_update date NULL;
ALTER TABLE products ADD repeat_every varchar(25) NULL;
