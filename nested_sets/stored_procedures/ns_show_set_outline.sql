delimiter ;;

drop procedure if exists ns_ns_show_set_outline ;;

create procedure ns_ns_show_set_outline ( in nsid INT )
begin

    select 
        concat(LPAD('+',x.depth,'-'),' ',n.token_id) as `outline`,
        concat('[',n.lsv,',',n.rsv,']') as `range`
    from nested_set n
    left join  
        ( SELECT 
            node.lsv, 
            (count(parent.lsv)-1) AS depth
        FROM nested_set AS node
        CROSS JOIN nested_set AS parent 
                    on parent.nested_set_id = nsid
        WHERE 
            node.nested_set_id = nsid
            and (node.lsv BETWEEN parent.lsv 
                            AND parent.rsv)
        group by node.lsv ) x
    on x.lsv = n.lsv
    where n.nested_set_id = nsid
    order by n.lsv asc;

end ;;

delimiter ;

