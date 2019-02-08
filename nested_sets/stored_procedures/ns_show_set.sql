delimiter ;;

drop procedure if exists ns_show_set;;

create procedure ns_show_set ( in ref_nest_id INT )
BEGIN
    select ((rsv-lsv)-1)>>1 as `nested_sets`,
        set_id,lsv,rsv
    from nested_set 
    where nest_id = ref_nest_id
    order by lsv ASC, rsv ASC;
END ;;
delimiter ;

