FROM node:16-alpine

WORKDIR /app

COPY package.json .

RUN apk add --no-cache stress-ng && npm i

COPY index.js .

EXPOSE 3000

CMD ["node", "index.js"]