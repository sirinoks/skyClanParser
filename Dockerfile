FROM node:20-alpine3.18

USER root

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

USER node

WORKDIR /app

COPY --chown=app:node package*.json ./

USER root

RUN chmod -R 755 /app && chown -R node:node /app
    
USER node

RUN npm install --unsafe-perm=true --allow-root

COPY --chown=node:node . .

EXPOSE 8080

CMD [ "node", "app.js" ]