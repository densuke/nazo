FROM rust:alpine as builder
WORKDIR /work
COPY . .
RUN cargo build --release

FROM alpine
COPY --from=builder /work/target/release/nazo /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/nazo"]
