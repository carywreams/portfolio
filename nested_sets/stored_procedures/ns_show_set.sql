delimiter ;;

drop procedure if exists ns_show_set;;

create procedure ns_show_set ( in ref_set_id INT )
BEGIN
    select ((rsv-lsv)-1)>>1 as `nested_sets`,
        token_id,lsv,rsv
    from nested_set 
    where nested_set_id = ref_set_id
    order by lsv ASC, rsv ASC;
END ;;
delimiter ;

