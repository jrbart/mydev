FROM elixir:alpine

RUN apk add pkgconfig openssl-dev
RUN apk add pkgconfig openssl
RUN apk add rustup curl
RUN apk add cargo perl make git
WORKDIR usr/src/
RUN git clone https://github.com/chipsenkbeil/distant.git
WORKDIR distant/
RUN OPENSSL_NO_VENDOR=1 cargo build --release

WORKDIR usr/src/
RUN git clone https://github.com/elixir-lsp/elixir-ls
WORKDIR elixir-ls
RUN mix deps.get
RUN MIX_ENV=prod mix compile
RUN MIX_ENV=prod mix elixir_ls.release2 -o /usr/local/elixirls

WORKDIR /app
CMD sh ./listen

# target/release/distant

