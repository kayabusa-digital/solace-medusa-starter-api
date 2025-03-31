FROM node:20-alpine

WORKDIR /app/medusa

ENV NODE_OPTIONS="--max-old-space-size=8192"

COPY . .

RUN apk add --no-cache python3 py3-pip

RUN npm install

RUN npm run build

CMD npm run db:seed && npm run db:migrate && npm run start
