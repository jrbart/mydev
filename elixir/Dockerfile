FROM rust:alpine AS builder
RUN apk add pkgconfig openssl-dev
RUN apk add pkgconfig openssl
RUN apk add rustup curl
RUN apk add cargo perl make git
WORKDIR usr/src/
RUN git clone https://github.com/chipsenkbeil/distant.git
WORKDIR /usr/src/distant
RUN OPENSSL_NO_VENDOR=1 cargo build --release

FROM elixir:alpine
COPY --from=builder /usr/src/distant/target/release/distant /usr/local/bin/distant

WORKDIR usr/src/
RUN apk add make git
RUN git clone https://github.com/elixir-lsp/elixir-ls
WORKDIR elixir-ls
RUN mix deps.get
RUN MIX_ENV=prod mix compile
RUN MIX_ENV=prod mix elixir_ls.release2 -o /usr/local/elixirls

WORKDIR /app
CMD sh ./listen
