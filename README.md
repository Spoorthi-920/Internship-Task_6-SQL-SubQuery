# Task 6: Subqueries and Nested Queries

## Objective

Practice using scalar subqueries, correlated subqueries, `IN`, `EXISTS`, `ALL`, and derived tables to write advanced SQL logic.


## Dataset

### Customers Table

| customer_id | customer_name | city      |
| ----------- | ------------- | --------- |
| 1           | Aarav         | Bengaluru |
| 2           | Diya          | Hyderabad |
| 3           | Kabir         | Mumbai    |
| 4           | Ananya        | Chennai   |
| 5           | Rohan         | Delhi     |

### Orders Table

| order_id | customer_id | order_amount | order_date |
| -------- | ----------- | ------------ | ---------- |
| 101      | 1           | 3500.50      | 2024-05-01 |
| 102      | 1           | 1800.00      | 2024-06-15 |
| 103      | 2           | 2200.75      | 2024-05-20 |
| 104      | 3           | 5000.00      | 2024-07-01 |
| 105      | 3           | 1200.00      | 2024-08-10 |
| 106      | 4           | 4100.25      | 2024-03-05 |
| 107      | 5           | 900.00       | 2024-01-12 |



## Outcome

This task demonstrates:

* Scalar and correlated subqueries
* Filtering with `IN` and `EXISTS`
* Derived tables in `FROM`

## Tools Used
* MySQL Workbench
