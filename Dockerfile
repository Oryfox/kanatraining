FROM node:16 as build

WORKDIR /build
RUN rm -rf node_modules package-lock.json
COPY . .
RUN npm i
RUN npm run build

FROM nginx
COPY --from=build /build/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80