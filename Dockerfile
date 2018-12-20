FROM ubuntu:16.04

RUN apt-get update && apt-get -y install gcc curl file sudo libssl-dev openssl

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

COPY ./ ./

#ENV DISCORD_TOKEN=[redacted for dokku]

RUN chmod +x $HOME/.cargo/env && . $HOME/.cargo/env && cargo clean && cargo build --release

CMD ["./target/release/rotting13-bot"]
