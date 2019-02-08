delimiter ;;

drop procedure if exists ns_create_nest;;

-- call with the set_id to be used to create the first set within the nest
--

create procedure ns_create_nest(
    in initial_set_id INT
)
begin

    insert into nested_set (set_id)
    values (initial_set_id);

end ;;

delimiter ;

