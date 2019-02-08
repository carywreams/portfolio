# use ns_demo_db;

# not friendly
truncate table nested_set;

call ns_create_nest(180);
set @nest_id=LAST_INSERT_ID();
call ns_insert_set_within(@nest_id,180,7475);
call ns_insert_set_within(@nest_id,180,7273);
call ns_insert_set_within(@nest_id,180,7071);
call ns_insert_set_within(@nest_id,180,6869);
call ns_insert_set_within(@nest_id,180,6465);
call ns_insert_set_within(@nest_id,180,6263);
call ns_insert_set_within(@nest_id,180,5657);
call ns_insert_set_within(@nest_id,180,5455);
call ns_insert_set_within(@nest_id,180,5051);
call ns_insert_set_within(@nest_id,180,4849);
call ns_insert_set_within(@nest_id,180,4647);
call ns_insert_set_within(@nest_id,180,4243);
call ns_insert_set_within(@nest_id,180,4041); 
call ns_insert_set_within(@nest_id,180,3637);
call ns_insert_set_within(@nest_id,180,3435); 
call ns_insert_set_within(@nest_id,180,2829);
call ns_insert_set_within(@nest_id,180,2627); 
call ns_insert_set_within(@nest_id,180,2324);
call ns_insert_set_within(@nest_id,180,1819);
call ns_insert_set_within(@nest_id,180,1617);
call ns_insert_set_within(@nest_id,180,1415);
call ns_insert_set_within(@nest_id,180,1112);
call ns_insert_set_within(@nest_id,180,89);
call ns_insert_set_within(@nest_id,180,67);

call ns_wrap_set(@nest_id,6869,7475,6776);
call ns_wrap_set(@nest_id,6263,6465,6166);
call ns_wrap_set(@nest_id,5455,5657,5358);
call ns_wrap_set(@nest_id,4647,5051,4552);
call ns_wrap_set(@nest_id,4041,4243,3944);
call ns_wrap_set(@nest_id,3435,3637,3338);
call ns_wrap_set(@nest_id,2627,2829,2530);
call ns_wrap_set(@nest_id,1415,1819,1320);
call ns_wrap_set(@nest_id,67,89,510);


call ns_wrap_set(@nest_id,6166,6776,6077);
call ns_wrap_set(@nest_id,3338,5358,3259);
call ns_wrap_set(@nest_id,2324,2530,2231);
call ns_wrap_set(@nest_id, 510,1320,421);

call ns_wrap_set(@nest_id,421,6077,378);
call ns_wrap_set(@nest_id,378,378,279);

call ns_score_tests();
call ns_list_failed_tests();

