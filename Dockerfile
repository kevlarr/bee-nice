FROM rust:1.54 as builder
WORKDIR /usr/src/bee-nice
COPY . .
RUN cargo install --path .

FROM debian:stable-slim
WORKDIR /app
COPY --from=builder /usr/local/cargo/bin/bee-nice /usr/local/bin/bee-nice
COPY --from=builder /usr/src/bee-nice/web ./web
EXPOSE 8080
CMD ["bee-nice"]
