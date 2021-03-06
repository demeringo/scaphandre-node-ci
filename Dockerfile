FROM rust:1.48 as builder
WORKDIR app
RUN git clone https://github.com/hubblo-org/scaphandre.git \
    && cd scaphandre \
    && cargo build --release

FROM rust:1.59 as scaph2cc_builder
WORKDIR app
RUN git clone https://github.com/demeringo/scaph2cc \
    && cd scaph2cc \
    && cargo build --release

FROM node:lts-bullseye as runtime
WORKDIR app

RUN apt-get update \
    && DEBIAN_FRONTEND="noninteractive" apt-get install -y ca-certificates tzdata curl jq stress-ng\
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /app/scaphandre/target/release/scaphandre /usr/local/bin
COPY --from=scaph2cc_builder /app/scaph2cc/target/release/scaph2cc /usr/local/bin

# Override entry point to get the opportunity to start scaphandre before node
ENTRYPOINT [""]
