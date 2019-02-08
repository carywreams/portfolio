delimiter ;;

drop procedure if exists ns_insert_set_within;;

-- 
-- Insert set WITHIN another set case
--
-- if inserting within a set that already has members, this 
-- op will make the new set the first set within the set,
-- pushing all others down the line.
--
-- create room within ref set by bumping all current sets downstream
-- insert new set
--



create procedure ns_insert_set_within(
    in ref_nest_id INT,
    in ref_set_id INT,
    in in_set_id INT
)
begin

    set @ref_lsv = ns_get_lsv(ref_nest_id,ref_set_id);
    set @noop    = ns_bump_sets_downstream(ref_nest_id,@ref_lsv);

    insert 
        into nested_set (nest_id,lsv,rsv,set_id)
        values (ref_nest_id,@ref_lsv+1,@ref_lsv+2,in_set_id);

end ;;

delimiter ;
