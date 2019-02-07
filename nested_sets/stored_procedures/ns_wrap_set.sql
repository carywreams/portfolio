delimiter ;;

drop procedure if exists ns_wrap_set;;

-- 
-- create encompassing set
--
-- PRECONDITION: from_lsv,to_rsv represent an eligible configuration
--
-- input from_lsv, to_rsv, inclusive [from_lsv, to_rsv]
-- 
-- SEQUENCE MATTERS 
-- update downstream sets to create space for encompassing set
-- set lsv = lsv+2 where (  lsv >  to_rsv  )
-- set rsv = rsv+2 where (  rsv >  to_rsv  )
-- renumber interior sets to place them within the encompassing set
-- set lsv = lsv+1 where ( (lsv <= to_rsv  ) and (lsv >= from_lsv) ) 
-- set rsv = rsv+1 where ( (rsv <= to_rsv  ) and (rsv >= from_lsv) )
--
-- insert new set
-- insert ref_set_id,from_lsv,to_rsv,token_id into nested_set
--

create procedure ns_wrap_set(
    in ref_set_id INT,
    in from_lsv INT,
    in to_rsv INT,
    in in_token_id INT
)
begin
-- /* make sure you'll clean up correctly if something goes wrong */
-- DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
-- 
-- /* begin a transaction */
-- START TRANSACTION;
-- 
-- /* lock the row you want to update, or to use to control concurrency */
-- SELECT nested_set_id FROM nested_set WHERE nested_set_id=ref_set_id FOR UPDATE;

    update nested_set
        set rsv = rsv + 2
        where nested_set_id = ref_set_id
            and rsv > to_rsv;

    update nested_set
        set lsv = lsv + 2
        where nested_set_id = ref_set_id
            and lsv > to_rsv;

    update nested_set
        set lsv = lsv + 1
        where nested_set_id = ref_set_id
            and ((lsv < to_rsv) and (lsv >= from_lsv));

    update nested_set
        set rsv = rsv + 1
        where nested_set_id = ref_set_id
            and ((rsv <= to_rsv) and (rsv > from_lsv));
    
    insert into nested_set (nested_set_id,lsv,rsv,token_id)
    values (ref_set_id,from_lsv,to_rsv+2,in_token_id);

-- COMMIT;

end ;;

delimiter ;
