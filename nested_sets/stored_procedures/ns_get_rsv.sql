delimiter ;;

drop function if exists ns_get_rsv ;;

create function ns_get_rsv ( ref_nest_id INT, ref_set_id INT) 
returns INT(10) UNSIGNED
BEGIN
    return (select rsv 
        from nested_set
        where nest_id = ref_nest_id
        and set_id = ref_set_id);
END ;;

delimiter ;

