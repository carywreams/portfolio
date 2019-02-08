# use ns_demo_db;

# not friendly
truncate table nested_set;

call ns_create_nest(12);
set @nest_id=LAST_INSERT_ID();
call ns_insert_set_after(@nest_id,12,45);
call ns_insert_set_after(@nest_id,45,67);
call ns_wrap_set(@nest_id,45,67,38);
call ns_insert_set_after(@nest_id,38,910);
call ns_insert_set_after(@nest_id,910,1116);
call ns_insert_set_within(@nest_id,1116,1213);
call ns_insert_set_after(@nest_id,1213,1415);
call ns_insert_set_after(@nest_id,1116,1718);

call ns_score_tests();
call ns_list_failed_tests();
