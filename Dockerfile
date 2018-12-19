FROM ubuntu:16.04
RUN apt-get update && apt-get -y install gcc curl file sudo libssl-dev openssl
RUN curl -sf -L https://static.rust-lang.org/rustup.sh | sh

COPY ./ ./

RUN cargo clean

#ENV DISCORD_TOKEN=[redacted for dokku]

RUN openssl version && cargo build --release

CMD ["./target/release/rotting13-bot"]
