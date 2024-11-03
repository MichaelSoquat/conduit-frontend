FROM node:18 AS angular

WORKDIR /app
COPY . $WORKDIR
RUN npm install -g @angular/cli && npm install
RUN ng build

FROM nginx:alpine
COPY --from=angular /app/dist/angular-conduit /usr/share/nginx/html
EXPOSE 80
