FROM node:latest

WORKDIR /usr/src/app
RUN apt-get update && apt-get upgrade -y
COPY package*.json ./
COPY .env ./
COPY tsconfig.json ./
RUN npm install
COPY . .
RUN npm run build
EXPOSE 3000
RUN chown -R node /usr/src/app/dist
USER node

CMD ["npm", "run", "start:prod"]

