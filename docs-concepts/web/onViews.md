# on Views
Today's options are allowing a lot of the work for rendering views to be offloaded to the client. The basic value 
proposition argues that instead of sending completely formatted html across a network, send only the data and some 
brief instructions for interpreting and displaying the data. So the data - or some form of it - must be transmitted 
regardless of which approach you take: full HTML or HTML instructions. 

For relatively large data sets, sending the data and merely the instructions for torturing the data into an HTML 
view for the user is pretty appealing. So how does this affect my interpretation of a VIEW ?

Formerly, my expectation for a view was a complete HTML page for presentation to a user. Now its some combination of
data and instructions for presenting that data. Sounds like we're getting close to having a separation of concerns there,
doesn't it ? That's a good thing. I'll take it.

So now that I'm only sending instructions for creating views, and those instructions also include how to request data,
I don't really have a _view_ per se, but rather a _recipe for a view_.

