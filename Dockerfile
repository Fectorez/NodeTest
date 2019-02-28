FROM node:8

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# \
#&& wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch |  apt-key add - \
#&& apt-get update  \
#&& apt install -y openjdk-8-jdk  \
#&& apt-get -y install apt-transport-https \
#&& echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" |  tee -a /etc/apt/sources.list.d/elastic-6.x.list \
#&& apt-get update && apt-get install -y logstash \
#&& curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.6.1-amd64.deb \
#&& dpkg -i filebeat-6.6.1-amd64.deb \
#&& systemctl start logstash.service \
#&& cd logstash-6.6.1 \
#&& bin/logstash --version


# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 80
#ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
#RUN export JAVA_HOME
CMD [ "sh", "node app/server.js" ] 