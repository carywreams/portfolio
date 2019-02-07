delimiter ;;

drop procedure if exists ns_create_set;;

-- 
-- Create Brand New Set
--
-- in token_id
--


create procedure ns_create_set(
    in in_token_id INT
)
begin

    insert into nested_set (lsv,rsv,token_id)
    values (1,2,in_token_id);

end ;;

delimiter ;

