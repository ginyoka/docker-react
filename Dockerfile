FROM node:16-alpine as builder
WORKDIR /app
COPY --chown=nginx:nginx package.json .
RUN npm install
COPY --chown=nginx:nginx . .
RUN npm run build

FROM nginx
COPY --chown=nginx:nginx --from=builder /app/build /usr/share/nginx/html