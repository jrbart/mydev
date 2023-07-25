FROM alpine

RUN apk add neovim
RUN apk add openssl-dev
RUN apk add rustup curl
RUN apk add cargo perl make git
WORKDIR usr/src/
RUN git clone https://github.com/chipsenkbeil/distant.git
WORKDIR distant/
RUN OPENSSL_NO_VENDOR=1 cargo build --release

cmd /usr/src/distant/target/release/distant manager listen

