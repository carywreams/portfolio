delimiter ;;

drop procedure if exists ns_insert_set_within;;

-- 
-- Insert set WITHIN another set case
--
-- if inserting within a set that already has members, this 
-- op will make the new set the first set within the set,
-- pushing all others down the line.
-- use ns_insert_set_after to position new set anywhere else but first
--
-- ref.set_id
-- ref.lsv
-- in token_id
--
-- get ref.rsv from table
--
-- create room within ref set by bumping downstream lsvs and rsvs
-- update nested_set set lsv = lsv+2 
--      where nested_set_id = ref.set_id and lsv >= ref.rsv;
-- update nested_set set rsv = rsv+2 
--      where nested_set_id = ref.set_id and rsv >= ref.rsv;
-- 
-- insert new set
-- insert into nested_set (nested_set_id,lsv,rsv,token_id) 
--      values (ref.set_id,ref.rsv+1,ref.rsv+2,in_token_id);
--


create procedure ns_insert_set_within(
    in ref_set_id INT,
    in ref_lsv INT,
    in in_token_id INT
)
begin

    update nested_set
        set lsv = lsv + 2
        where nested_set_id = ref_set_id
            and lsv > ref_lsv;

    update nested_set
        set rsv = rsv + 2
        where nested_set_id = ref_set_id
            and rsv > ref_lsv;

    insert into nested_set (nested_set_id,lsv,rsv,token_id)
    values (ref_set_id,ref_lsv+1,ref_lsv+2,in_token_id);

end ;;

delimiter ;
