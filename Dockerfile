FROM elixir:1.17-alpine AS dev
RUN apk add build-base git bash chromium chromium-chromedriver
WORKDIR /app
ENV MIX_HOME=/mix
RUN mix local.hex --force
RUN mix archive.install hex phx_new --force
