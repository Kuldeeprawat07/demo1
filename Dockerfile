# Stage 1
FROM node:8.11.4-alpine as build
RUN mkdir -p /app
WORKDIR /app
COPY package.json /app/
RUN npm install
COPY . .
RUN npm run build --prod

# Stage 2
# nginx state for serving content
FROM nginx:alpine
WORKDIR /usr/share/nginx/html/
RUN rm -rf ./*
COPY --from=build /app/dist/betternight .
COPY --from=build /app/nginx.conf  /etc/nginx/conf.d/default.conf
