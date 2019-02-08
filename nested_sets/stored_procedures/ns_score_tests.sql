delimiter ;;

drop procedure if exists ns_score_tests;;

create procedure ns_score_tests()
begin

    select x.result,count(x.result) as `cases`
       from (select IF(set_id=IF(rsv<10,lsv*10+rsv,lsv*100+rsv),"PASS","FAIL") as `result` 
                    from nested_set) x  
    group by result;

end ;;

delimiter ;

