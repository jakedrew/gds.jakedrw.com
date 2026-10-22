FROM node:20 AS build
WORKDIR /app
COPY . .
RUN npm ci && npm run build

FROM caddy:2-alpine
COPY Caddyfile /etc/caddy/Caddyfile
COPY --from=build /app/dist /srv/gds
EXPOSE 2491
