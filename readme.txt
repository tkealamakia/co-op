Setup info

1. Modify the ~/.grails/1.1.1/projects/wardcoop/plugins/acegi-0.5.1/grails-app/conf/DefaultSecurityConfig.groovy 
   a. Change "username = 'username'" to "username = 'email'"
   b. Change the section in that file where the smtp server is configured to:
      1. mailHost: mail.xmission.com
      2. mailUsername: tkealamakia
      3. mailPassword: c00pftw
2. Setup mysql with root's password as 'asdfg'
3. Run the scripts/setup.sql into mysql
4. Copy a my.cnf file to /etc and increase the max packet size
5. Run: grails install-plugin http://www.arquetipos.co.cr/blog/files/grails-image-tools-1.0.4.zip
6. Move the ~/.grails/1.1.1/projects/wardcoop/plugins/image-tools-1.0.4/src/groovy/ImageTool.groovy
   to
   ~/.grails/1.1.1/projects/wardcoop/plugins/image-tools-1.0.4/src/groovy/imagetool/ImageTool.groovy
7. Modify ~/.grails/1.1.1/projects/wardcoop/plugins/image-tools-1.0.4/src/groovy/imagetool/ImageTool.groovy
   and add: 'package imagetool' to the top line of the file.
