FROM ubuntu:24.10 as build

ARG UNISWAP_WEB_VERSION
ARG IPFS_GATEWAY_URL

RUN apt-get update
RUN apt-get install -y curl jq gawk

WORKDIR /deps
COPY get_cid.sh .
COPY download.sh .

RUN /deps/get_cid.sh
RUN /deps/download.sh $(cat /deps/cid)

FROM nginx:alpine3.19 as runtime

COPY --from=build /app /usr/share/nginx/html



