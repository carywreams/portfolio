delimiter ;;

drop procedure if exists ns_insert_set_after;;

-- 
-- insert_set_after
--      @@ref_nest_id   the nest in which the set is to be added
--      @@ref_set_id    the set after which the new set is to be added
--      @@in_set_id     the new set being added to the nest
-- 
-- create room after ref set by bumping downstream sets
-- insert new set into nest using vacated lsv,rsv values
--


create procedure ns_insert_set_after(
    in ref_nest_id INT,
    in ref_set_id INT,
    in in_set_id INT
)
begin

    set @ref_lsv = ns_get_lsv(ref_nest_id,ref_set_id);
    set @ref_rsv = ns_get_rsv(ref_nest_id,ref_set_id);
    set @noop    = ns_bump_sets_downstream(ref_nest_id,@ref_rsv);

    insert 
        into nested_set (nest_id,lsv,rsv,set_id)
        values (ref_nest_id,@ref_rsv+1,@ref_rsv+2,in_set_id);

end ;;

delimiter ;

