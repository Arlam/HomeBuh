HomeBuh
=======
Used:
Maven, Hibernate 4, Spring 3.1, Apache Tiles.

Rename 
/HomeBuh/src/main/webapp/WEB-INF/database.properties.example 
to
/HomeBuh/src/main/webapp/WEB-INF/database.properties
And change DB parameters.

For running application:
1. create mysql DB using 
	/db/homebuh.sql
2. run:
  mvn tomcat7:run
  mvn jetty:run
