FROM tomcat:10-jdk17 

RUN rm -rf /usr/local/tomcat/webapps/* 

COPY dist/SkillHub_Management_Portal.war /usr/local/tomcat/webapps/ROOT.war 

EXPOSE 8080