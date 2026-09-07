## TASK 3
# Question: 
the deck says the logical execution order is `FROM → WHERE → SELECT`. Use that fact to explain, in 2–3 sentences, why `SELECT ticket_price * 0.9 AS sale_price ... WHERE sale_price < 10` fails in Postgres.

# Answer:
Since WHERE is executed before the SELECT clause so sale_price is alias is not accessible in the WHERE clause, so the column_name sales_price does not exist.


## TASK 5
# Question:
why must the "cancelled" filter live in `WHERE` here rather than `HAVING`?
# Answer:
Because HAVING is used with AGGREGATE functions. `WHERE` filter the rows (i.e. cancelled bookings) before the aggregation which is required to exclude filter out the cancelled bookings.


## TASK 6
# Question:
when would you reach for a CTE over a nested subquery?
# Answer:
We use CTEs over next subquery when in a single query the same subquery is being used at multiple places, so in otder to make the query more readable and maintainable we use CTEs.

## TASk 7
# Question:
map each incident from the story to the constraint that now prevents it, and state which constraint type from the deck (PK / FK / NOT NULL / UNIQUE / CHECK) each one is.
# Answer:
In task 2, double entring a showtime.
In task 7, 0 seats were booked, a show was priced at -4.00 and there were multiple bookings at same screen for same date and time.

*error messages*
```
psql:C:/Users/Windows/Desktop/INDUCTION/SQL_BASICS/SQL_Assignment-Shivam-Rao-UID00627/task07.sql:35: ERROR:  new row for relation "bookings" violates check constraint "chk_seats"
DETAIL:  Failing row contains (34, 11, 9, 0, 10:15:00, confirmed).
psql:C:/Users/Windows/Desktop/INDUCTION/SQL_BASICS/SQL_Assignment-Shivam-Rao-UID00627/task07.sql:39: ERROR:  duplicate key value violates unique constraint "unique_id_date_time"
DETAIL:  Key (screen_id, show_date, start_time)=(3, 2026-08-16, 18:00:00) already exists.
psql:C:/Users/Windows/Desktop/INDUCTION/SQL_BASICS/SQL_Assignment-Shivam-Rao-UID00627/task07.sql:43: ERROR:  new row for relation "movies" violates check constraint "chk_rating"
DETAIL:  Failing row contains (15, Avengers: Endgame, Sci-FI, NC-99, 181, 2019).

```

## TASK 8

# 8.1 
Using the deck's table (1NF = atomicity, 2NF = partial dependency, 3NF = transitive dependency), identify **one concrete violation of each** in `legacy_bookings`, naming the offending column(s). 

# Answer:
1 NF - Each value should be atomic
Violated by seats column

2 NF - Removing partial dependencies
No partial dependency present as not a composite key

3NF - No Non Prime/Key attribute should be derived by any Non Prime/Key attribute
The movie_genre attribute violates 3NF because it is functionally dependent on movie_title that is a non-key attribute, creating a a transitive dependency.

# Question:
row 7 of the ledger says *"Ava Thomson"* while every other row says *"Ava Thompson"*. In one paragraph: which normalization principle makes this class of bug **structurally impossible** in your new schema, and why?
# Answer:
The 3NF Normal Form makes this bus structurally impossible beacuse we cannot store the same name multiple times in the customer table as it is associcated with a customer_id and an email.


## TASK 9

# Question:
why couldn't 9.4 be done with plain `GROUP BY` in a single query?
# Answer:
Because when we use GROUP BY it collapses the rows where as partition keeps them intact.