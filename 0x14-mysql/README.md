The following sql script are for ALX 0x14-mysql project inside the alx-system_engineering-devops curriculum, inside it contains the following scripts:

* MySQL installed on both of my web-01 and web-02 servers
* Task two requirements:

         -> Create a MySQL user named holberton_user on both web-01 and web-02 with the host name set to localhost and the password projec             tcorrection280hbtn. This will allow us to access the replication status on both servers.
         -> Make sure that holberton_user has permission to check the primary/replica status of your databases.
* Create a database for MySQL server(web-01) to replicate, requirements:

         -> Create a database named tyrell_corp.
         -> Within the tyrell_corp database create a table named nexus6 and add at least one entry to it.
         -> Make sure that holberton_user has SELECT permissions on your table so that we can check that the table exists and is not empty
* Create a new user on the primary server(web-01) for the replica server, requirements:

         -> The name of the new user should be replica_user, with the host name set to %, and can have whatever password you’d like.
         -> replica_user must have the appropriate permissions to replicate your primary MySQL server.
         -> holberton_user will need SELECT privileges on the mysql.user table in order to check that replica_user was created with the 
            correct permissions.
* Setting up a primary replica infrastructure for using MySQL, requirements:

         -> MySQL primary must be hosted on web-01 - do not use the bind-address, just comment out this parameter
         -> MySQL replica must be hosted on web-02
         -> Setup replication for the MySQL database named tyrell_corp
         -> Provide your MySQL primary configuration as answer file(my.cnf or mysqld.cnf) with the name 4-mysql_configuration_primary
* Bash script that generates a MySQL dump and creates a compressed archive out of it, requirements:

         -> The MySQL dump must contain all your MySQL databases
         -> The MySQL dump must be named backup.sql
         -> The MySQL dump file has to be compressed to a tar.gz archive
         -> This archive must have the following name format: day-month-year.tar.gz
         -> The user to connect to the MySQL database must be root
         -> The Bash script accepts one argument that is the password used to connect to the MySQL database
