create index first on film(title);

create index second on customer(first_name,last_name);

create unique index third on film(rental_duration,length);

create index fourth on customer(substring(first_name from 1 for 3));

create index fifth on rental(rental_date);

select tablename, indexname from dvdrental.pg_catalog.pg_indexes;