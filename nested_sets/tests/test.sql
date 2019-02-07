# use ns_demo_db;

# not friendly
# truncate table nested_set;

call ns_create_set(12);
set @set_id=LAST_INSERT_ID();
call ns_insert_set_after(@set_id,1,45);
call ns_insert_set_after(@set_id,3,67);
call ns_wrap_set(@set_id,3,6,38);
call ns_insert_set_after(@set_id,3,910);
call ns_insert_set_after(@set_id,9,1116);
call ns_insert_set_within(@set_id,11,1213);
call ns_insert_set_after(@set_id,12,1415);
call ns_insert_set_after(@set_id,11,1718);

call ns_score_tests();
call ns_list_failed_tests();
