# Build stage
FROM node:20 AS build

WORKDIR /app

COPY ./package*.json ./

RUN npm ci

COPY . .

RUN npm run build

EXPOSE 3001

# Correct way to start Next.js with a specific port
CMD ["npm", "start", "--", "-p", "3001"]
