delimiter ;;

drop procedure if exists ns_wrap_set;;

-- 
-- create encompassing set
--
-- PRECONDITION: from_set_id,to_set_id represent an eligible configuration
--
-- SEQUENCE MATTERS 
-- bump everyone downstream to create space for the encompassing set
-- renumber interior sets to place them within the encompassing set
--      set lsv = lsv+1 where ( (lsv <= to_rsv  ) and (lsv >= from_lsv) ) 
--      set rsv = rsv+1 where ( (rsv <= to_rsv  ) and (rsv >= from_lsv) )
-- insert new set
--

create procedure ns_wrap_set(
    in ref_nest_id INT,
    in ref_from_set_id INT,
    in ref_to_set_id INT,
    in in_set_id INT
)
begin
    
    set @from_lsv = ns_get_lsv(ref_nest_id,ref_from_set_id);
    set @to_rsv   = ns_get_rsv(ref_nest_id,ref_to_set_id);
    set @noop     = ns_bump_sets_downstream(ref_nest_id,@to_rsv);

    update nested_set
        set lsv = lsv + 1
        where nest_id = ref_nest_id
            and ((lsv < @to_rsv) and (lsv >= @from_lsv));

    update nested_set
        set rsv = rsv + 1
        where nest_id = ref_nest_id
            and ((rsv <= @to_rsv) and (rsv > @from_lsv));
    
    insert into nested_set (nest_id,lsv,rsv,set_id)
    values (ref_nest_id,@from_lsv,@to_rsv+2,in_set_id);

end ;;

delimiter ;
