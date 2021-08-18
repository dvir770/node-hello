From node
MAINTAINER Dvir

WORKDIR /var/app 
COPY . .
RUN npm install


EXPOSE 3000 

CMD ["n ode", "index.js"]
