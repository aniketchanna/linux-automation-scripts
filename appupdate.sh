#!/bin/bash
app='v20210413_21.5.A_E3'
sed -i "s/app_version=.*/app_version=$app/" /opt/tomcat9/conf/catalina.properties
