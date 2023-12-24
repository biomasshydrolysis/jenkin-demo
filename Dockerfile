FROM node
WORKDIR /react-docker-example/
COPY public/ /react-docker-example/public
COPY src/ /react-docker-example/src
COPY package.json /react-docker-example/
COPY Jenkinsfile /react-docker-example/
COPY README.md /react-docker-example/
RUN npm build
RUN npm install
COPY build /react-docker-example/
CMD ["npm", "start"]
