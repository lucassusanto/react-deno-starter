FROM denoland/deno:2.1.9 AS build
WORKDIR /app
COPY deno.json deno.lock ./
RUN deno install
COPY . .
RUN deno task build

FROM nginx:1.25.3
WORKDIR /app
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /app/dist ./
COPY entrypoint.sh ./
ENTRYPOINT ["/app/entrypoint.sh"]
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
