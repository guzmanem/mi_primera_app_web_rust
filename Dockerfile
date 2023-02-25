FROM rust:1.67.1-alpine3.17

RUN apk add --no-cache musl-dev postgresql-dev
RUN rustup default nightly
RUN rustup override set nightly

WORKDIR /Users/guzmanem/development_projects/mi_primera_app_web_rust/src
COPY . .
RUN cargo install cargo-watch

ENV DATABASE_URL=postgres://postgres:password@db/postgres

EXPOSE 8000

CMD ["cargo", "watch", "-x", "run", "-w", "src"]
