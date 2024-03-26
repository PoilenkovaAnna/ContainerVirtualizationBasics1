FROM node:18-alpine
LABEL maintainer="Anna Poilenkova"
WORKDIR /app
COPY . .
RUN yarn install --production
CMD ["node", "src/index.js"]