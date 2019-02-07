# use ns_demo_db;

# not friendly
# truncate table nested_set;

call ns_create_set(180);
set @set_id=LAST_INSERT_ID();
-- to avoid needing intermediate lsv,rsv for inserts, work RTL
call ns_insert_set_within(@set_id,1,7475);
call ns_insert_set_within(@set_id,1,7273);
call ns_insert_set_within(@set_id,1,7071);
call ns_insert_set_within(@set_id,1,6869);

call ns_insert_set_within(@set_id,1,6465);
call ns_insert_set_within(@set_id,1,6263);


call ns_insert_set_within(@set_id,1,5657);
call ns_insert_set_within(@set_id,1,5455);

call ns_insert_set_within(@set_id,1,5051);
call ns_insert_set_within(@set_id,1,4849);
call ns_insert_set_within(@set_id,1,4647);

call ns_insert_set_within(@set_id,1,4243);
call ns_insert_set_within(@set_id,1,4041); 

call ns_insert_set_within(@set_id,1,3637);
call ns_insert_set_within(@set_id,1,3435); 



call ns_insert_set_within(@set_id,1,2829);
call ns_insert_set_within(@set_id,1,2627); 

call ns_insert_set_within(@set_id,1,2324);



call ns_insert_set_within(@set_id,1,1819);
call ns_insert_set_within(@set_id,1,1617);
call ns_insert_set_within(@set_id,1,1415);

call ns_insert_set_within(@set_id,1,1112);

call ns_insert_set_within(@set_id,1,89);
call ns_insert_set_within(@set_id,1,67);

call ns_wrap_set(@set_id,42,49,6776);
call ns_wrap_set(@set_id,38,41,6166);
call ns_wrap_set(@set_id,34,37,5358);
call ns_wrap_set(@set_id,28,33,4552);
call ns_wrap_set(@set_id,24,27,3944);
call ns_wrap_set(@set_id,20,23,3338);
call ns_wrap_set(@set_id,16,19,2530);
call ns_wrap_set(@set_id,8,13,1320);
call ns_wrap_set(@set_id,2,5,510);


call ns_wrap_set(@set_id,52,67,6077);
call ns_wrap_set(@set_id,26,51,3259);
call ns_wrap_set(@set_id,18,25,2231);
call ns_wrap_set(@set_id,2,17,421);


call ns_wrap_set(@set_id,2,75,378);
call ns_wrap_set(@set_id,2,77,279);

call ns_score_tests();
call ns_list_failed_tests();

