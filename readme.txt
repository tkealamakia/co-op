Setup info

1. Create 'ROLE_USER' entry in the table 'authority'
2. Create entries in requestmap to protect urls
3. Create an entry in the 'ward' table with the name 'Default'
4. Modify the ~/.grails/1.1.1/projects/wardcoop/plugins/acegi-0.5.1/grails-app/conf/DefaultSecurityConfig.groovy 
   to change "username = 'username'" to "username = 'email'"
5. Add values to 'category' table
6. Modify the image table to type longblob
