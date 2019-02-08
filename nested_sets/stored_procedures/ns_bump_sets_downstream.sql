delimiter ;;

-- called using a right-side-value, will create space "after" a set
-- called using a left-side-value, will create space "before" a set

drop function if exists ns_bump_sets_downstream ;;

create function ns_bump_sets_downstream( ref_nest_id INT, ref_sv INT )
returns bool
begin
    update nested_set
        set rsv = rsv + 2
        where nest_id = ref_nest_id
            and rsv > ref_sv;

    update nested_set
        set lsv = lsv + 2
        where nest_id = ref_nest_id
            and lsv > ref_sv;
    return 1;
end ;;

delimiter ;

