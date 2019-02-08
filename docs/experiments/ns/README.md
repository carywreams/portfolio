# Nested Sets Implementation

## Acknowledgments

+ [Celko Book]()
+ [Hillyer Website]()

## Motivation

The need originated to save organization charts for multiple clients.
We expanded the concept of a nested set to permit many such organization charts to be managed by the same table.
Each such org chart, referred to as a _nest,_ has a unique nest_id.
The group within the org chart, has a unique set_id.

In practice, both the nest_id and set_id are likely to be foreign keys to other tables that associate the nested sets with relevant data.
Attaching the nested set to other entities is an exercise left for the reader, _for the moment._

The expected query frequency is relatively high.
The expected update frequency is relatively low - like adding a new corporate client.
If the anticipated update usage is relatively high, more consideration might be given to implementation of the stored procedures.

## Definitions

```
 nest_id:   a unique identifier for a set of nested sets
            we track multiple nested sets with this table
            no way to predict how many, ultimately
            at time of introduction, we will create 1700 such nests

 set_id:    in my application, this shall be a foreign key
            to the entity managed with nested sets
            no way to predict how many, ultimately
            at time of introduction, we will create 11,000 such sets

 lsv,rsv    left-side-value, right-side-value
            typical definitions for nested sets           

```

## Operations

As a design objective, operations shall reference (nest_id, set_id) to achieve their purposes.
An earlier version used left-side-values and right-side-values to specify changes.
This proved unwise.

All stored procedures and functions are prefixed with 'ns\_'.

### Primary

Forms the primary interface between database and implementation.

Procedure        | Explanation
-----------------|-------------------------------------------------------------
ns_create_nest   | establishes a new nest in nested_sets
ns_insert_after  | places a new set after the indicated set
ns_insert_within | places a new set in the first spot within the indicated set
ns_unwrap_set    | TBD
ns_wrap_set      | wraps a new set around the range of indicated sets

### Support

Procedure/Function      | Explanation
------------------------|-------------------------------------------------------------
ns_bump_sets_downstream | increments side-values to create space for a single set
ns_get_lsv              | pulls left-side-value from nest,set
ns_get_rsv              | pulls right-side-value from nest,set
ns_show_set_outline     | simple audit script
ns_show_set             | simple audit script


## Testing

There are three test scripts right now: one sanity test and two more detailed, tests which build the same structure.
The tests are written to exercise different paths to the same endpoint.
The set_ids have been purposely contrived to form a validation test when their final lsv,rsv values are combined.
If the combination of the final lsv,rsv values matches the provided set_id, then the set _meets expectations_ and passes the test.

The scoring procedure counts passes and failures.
A separate procedure lists the failures, if present.
 
Procedure               | Explanation
------------------------|-------------------------------------------------------------
ns_score_tests          | scores tests constructed with set_ids that match lsv,rsv
ns_list_failed_tests    | list sets that did not meet expectations for final lsv,rsv values


