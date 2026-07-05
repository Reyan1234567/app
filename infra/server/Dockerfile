FROM node:22-alpine AS builder

WORKDIR /app

COPY package.json .
RUN npm i

COPY prisma ./prisma
RUN npx prisma generate

COPY . .

EXPOSE 8080

CMD ["sh", "-c", "npx prisma migrate deploy && npm run server"]
