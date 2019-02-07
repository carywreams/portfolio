drop table if exists nested_set;

-- 
-- Manages multiple nested sets in same table
-- 
-- All sets of the same nested set share the same nested_set_id; it is not unique
-- Each set within a nested set may only appear once; this is the token_id
-- the primary key is a combination of these two; the pair is unique
-- lsv,rsv are typicaly entries for a nested set
--

create table nested_set( 
    nested_set_id   int unsigned not null auto_increment comment 'id for the entire nested set', 
    token_id        int unsigned not NULL comment 'not unique, simply paired with nested_set_id',
    lsv             int unsigned not null default 1 comment 'left side value', 
    rsv             int unsigned not null default 2 comment 'right side value', 
    primary key     (`nested_set_id`,`token_id`) 
);

