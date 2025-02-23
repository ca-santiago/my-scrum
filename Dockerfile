# Build stage
FROM node:20-alpine AS build

WORKDIR /app

ARG PORT=3001
ENV PORT=$PORT

COPY ./package*.json ./

RUN npm ci

COPY . .

RUN npm run build

EXPOSE 3000

CMD ["npm", "start", "--", "-p", "3000"]
