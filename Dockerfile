FROM squidfunk/mkdocs-material as builder
COPY docs       /mkdocs/docs
COPY overrides  /mkdocs/overrides
COPY mkdocs.yml /mkdocs
WORKDIR /mkdocs
RUN mkdocs build --clean --strict

FROM nginx:stable-alpine
COPY --from=builder /mkdocs/site /usr/share/nginx/html
