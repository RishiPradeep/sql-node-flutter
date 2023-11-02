Steps

1: (YOU ALREADY NEED TO HAVE A DATABASE WITH A TABLE CALLED NAMES WHICH HAS ONE ATTRIBUTE CALLED NAME IN IT WHICH IS VARCHAR 255) Enable the MYSQL server service and make sure the database is hosted on your localhost.

2: Run the server.js file using command 'node server.js'

  - This initialises a connection to the database and gives us 2 endpoints
  - localhost:3000/getme -> This will return all the values in the database.
  - localhost:3000/sendme/:name -> This will insert the value in the url that is in place of name in the database. 3: Keep this server.js file running
  
3: In the app file is the flutter for a simple application with 2 buttons and one text field.

  - You can put in the name and click send to add the name to the database
  - This is done with http module
  - You can click the get results to see all the values that are currentl in the database
  - This is also done with the http module
  
4: Thats It :)
