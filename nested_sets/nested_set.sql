drop table if exists nested_set;

-- 
-- Manages multiple nests of sets in same table
-- 
-- All sets of the same nested set share the same nested_set_id; it is not unique
-- Each set within a nested set may only appear once; this is the token_id
-- the primary key is a combination of these two; the pair is unique
-- lsv,rsv are typicaly entries for a nested set
--
--  nest_id:    a unique identifier for a set of nested sets
--              we track multiple nested sets with this table
--              no way to predict how many, ultimately
--              at time of introduction, we will create 1700 such nests
--
--  set_id:
--              in my application, this shall be a foreign key
--              to the entity managed with nested sets
--              no way to predict how many, ultimately
--              at time of introduction, we will create 11,000 such sets
--
-- If its only necessary to manage a single, global nested set, the
-- implementation may be simplified.
--
-- The expected query frequency is relatively high.
-- The expected update frequency is relatively low - like adding a new corporate client.
-- The mental model is that of an organization chart for multiple clients.
--

create table nested_set( 
    nest_id     int unsigned not null auto_increment comment 'group id for a set of sets', 
    set_id      int unsigned not NULL                comment 'unique within a nest, not seqn',
    lsv         int unsigned not null default 1      comment 'left side value', 
    rsv         int unsigned not null default 2      comment 'right side value', 
    primary key (`nest_id`,`set_id`) 
);

