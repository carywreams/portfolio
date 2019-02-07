delimiter ;;


drop procedure if exists ns_score_tests;;
drop procedure if exists ns_score_tests;;
drop procedure if exists ns_list_failed_tests;;
drop procedure if exists ns_list_failed_tests;;

create procedure ns_score_tests()
begin

    select x.result,count(x.result) 
        from (select IF(token_id=IF(rsv<10,lsv*10+rsv,lsv*100+rsv),"PASS","FAIL") as `result` 
                    from nested_set) x  
    group by result;

end ;;

create procedure ns_list_failed_tests()
begin

    select x.*
        from (select nested_set.*,IF(token_id=IF(rsv<10,lsv*10+rsv,lsv*100+rsv),"PASS","FAIL") as `result` 
                    from nested_set) x  
    where x.result = "FAIL";

end ;;
delimiter ;

