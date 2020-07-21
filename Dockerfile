FROM ubuntu:18.04
#NV WORKDIR /usr/src/app/
RUN apt update && apt install maven openjdk-8-jdk -y jetty9
RUN update-java-alternatives --set /usr/lib/jvm/java-1.8.0-openjdk-amd64

COPY . /var/lib/jetty/webapps
WORKDIR "/var/lib/jetty/webapps"
RUN mvn clean package
#RUN update-rc.d jetty9 defaults
#RUN service jetty9 start
#RUN cd /var/lib/jetty/webapps 
#ENV PATH="/var/lib/jetty/webapps:${mvn}"

#CMD ["cd /var/lib/jetty/webapps && mvn jetty:run"]
EXPOSE 8080
CMD mvn jetty:run
