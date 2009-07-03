Setup info

1. Modify the ~/.grails/1.1.1/projects/wardcoop/plugins/acegi-0.5.1/grails-app/conf/DefaultSecurityConfig.groovy 
   a. Change "username = 'username'" to "username = 'email'"
   b. Change the section in that file where the smtp server is configured to:
      1. mailHost: mail.xmission.com
      2. mailUsername: tkealamakia
      3. mailPassword: c00pftw
2. Setup mysql with root's password as 'asdfg'
3. Run the scripts/setup.ddl into mysql
