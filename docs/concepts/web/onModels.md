# on Models
Simplified as much as possible to r/w data to/from the database. In many cases, each kind of a
transaction with the database is its own model, though some terms may be reused across very 
similar models.

For instance. Instead of having a single model for a user and running all requests through the
one model, we construct a transaction-based-model on the type of RESTful action is underway with
the database.

User Transaction Models | Purpose
---                     | ---
userGet                 | retrieves information on a single user
usersGet                | retrieves information on a set of users
userDelete              | removes a single user 
userPost                | creates a new user 
userPatch               | updates information about a single user

This leads to a geometric explosion of small files. However, previously these files had all been 
separate methods in a single user model. And variation on methods to account for role-based 
privileges - an admin-privilege user might have access to a different set of information resulting
from the admin's userGet request. 

This approach resolved a number of issues which caused problems over the years.
+ routing was now resolved with a "convention over configuration" approach which I first hears during my time looking into Ruby on Rails
+ supported RESTful requests are now easily visible from the directory, rather than diving into code
+ eliminated routing code which added no value
+ allowed for separate implementation of both role-based (admin) and privilege-based (sharing) gates

For example, model variances based on role are satisfied by creating a new model, with the role prefix: adminUserDelete.
Further, lets say that _only_ admins are permitted to delete users. Our new list of models looks like this:

User Transaction Models | Purpose
---                     | ---
adminUserDelete         | removes a single user 
userGet                 | retrieves information on a single user
usersGet                | retrieves information on a set of users
userPost                | creates a new user 
userPatch               | updates information about a single user
