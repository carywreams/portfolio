delimiter ;;

drop procedure if exists ns_insert_set_after;;

-- 
-- Insert AFTER case
-- 
-- also supports Insert BEFORE first set, use lsv = 0;
--
-- ref.set_id
-- ref.lsv
-- in token_id
--
--
-- get ref.rsv from table
--
-- create room after ref set by bumping downstream lsvs and rsvs
-- update nested_set set lsv = lsv+2 
--      where nested_set_id = ref.set_id and lsv > ref.rsv;
-- update nested_set set rsv = rsv+2 
--      where nested_set_id = ref.set_id and rsv > ref.rsv;
-- 
-- insert new set
-- insert into nested_set (nested_set_id,lsv,rsv,token_id) 
--      values (ref.set_id,ref.rsv+1,ref.rsv+2,in_token_id);
--


create procedure ns_insert_set_after(
    in ref_set_id INT,
    in ref_lsv INT,
    in in_token_id INT
)
begin

    set @ref_rsv = (
        select rsv from nested_set 
        where nested_set_id = ref_set_id
            and lsv = ref_lsv);

    update nested_set
        set lsv = lsv + 2
        where nested_set_id = ref_set_id
            and lsv > @ref_rsv;

    update nested_set
        set rsv = rsv + 2
        where nested_set_id = ref_set_id
            and rsv > @ref_rsv;

    insert into nested_set (nested_set_id,lsv,rsv,token_id)
    values (ref_set_id,@ref_rsv+1,@ref_rsv+2,in_token_id);

end ;;

delimiter ;

