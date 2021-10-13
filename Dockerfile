FROM public.ecr.aws/w4a9j2y8/risken-gateway/doc-build:7.2.6 as builder
COPY docs       /mkdocs/docs
COPY mkdocs.yml /mkdocs
WORKDIR /mkdocs
RUN mkdocs build --clean --strict

FROM nginx:stable-alpine
COPY nginx/default.conf /etc/nginx/conf.d
COPY --from=builder /mkdocs/site /usr/share/nginx/html
