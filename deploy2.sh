if [ $ENVIRONMENT = "QA" ];then
      docker start tomcat-server-qa
      docker exec -i tomcat-server-qa /etc/init.d/ssh start
   sshpass -p "lion" scp target/gamutgurus.war lion@172.17.0.2:/home/lion/distros/apache-tomcat-9.0.86/webapps
   sshpass -p "lion" ssh lion@172.17.0.2 "/home/lion/distros/apache-tomcat-9.0.86/bin/startup.sh"
elif [ $ENVIRONMENT = "SIT" ];then
    docker start tomcat-server-sit
    docker exec -i tomcat-server-sit /etc/init.d/ssh start
   sshpass -p "lion" scp target/gamutgurus.war lion@172.17.0.3:/home/lion/distros/apache-tomcat-9.0.86/webapps
   sshpass -p "lion" ssh lion@172.17.0.3 "/home/lion/distros/apache-tomcat-9.0.86/bin/startup.sh"
 fi

