FROM node:8

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

COPY . .

RUN npm install \
&& apt update \
&& apt install -y default-jre \
&& curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.6.1-amd64.deb \
&& dpkg -i filebeat-6.6.1-amd64.deb \
&& wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch |  apt-key add - \
&& apt-get install -y apt-transport-https \
&& echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" |  tee -a /etc/apt/sources.list.d/elastic-6.x.list \
&& apt-get update && apt-get install logstash \
&& mkdir /usr/share/logstash/patterns \
&& cp extra /usr/share/logstash/patterns/extra 


# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source


EXPOSE 80
CMD [ "sh", "node app/server.js && filebeat -e -c filebeat.yml -d \"publish\" && /usr/share/logstash/bin/logstash -f pipeline.conf   " ]