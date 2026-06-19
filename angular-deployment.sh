#!/bin/bash
aws s3 cp s3://bizmerlin-packages/hcm-angular/deployment/ /opt/tomcat9/webapps/hcm/ --recursive
chown -R tomcat:tomcat /opt/tomcat9/webapps
