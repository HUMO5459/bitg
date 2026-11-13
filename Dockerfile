# SPDX-FileCopyrightText: 2026 dtwinuz and bitg contributors
#
# SPDX-License-Identifier: MIT OR Apache-2.0

# ghcr.io/dtwinuz/bitg: `bitg` buyruq qatori (statik musl binar, boshqa hech narsa yo'q).
# Faqat .github/workflows/build.yml yig'adi: binarlar oldindan yig'ilib kontekstga qo'yiladi, bu yerda kompilyatsiya yo'q.
#   echo "o'zbek tili" | docker run --rm -i ghcr.io/dtwinuz/bitg
#   docker run --rm --user "$(id -u):$(id -g)" -v "$PWD:/work" ghcr.io/dtwinuz/bitg file hujjat.docx
FROM scratch
ARG TARGETARCH
ARG VERSION
LABEL org.opencontainers.image.title="bitg" \
      org.opencontainers.image.description="Uzbek text to the 2026 Latin alphabet (o' g' sh ch -> ö ğ ş ç)" \
      org.opencontainers.image.source="https://github.com/dtwinuz/bitg" \
      org.opencontainers.image.url="https://bitg.uz" \
      org.opencontainers.image.licenses="MIT OR Apache-2.0" \
      org.opencontainers.image.version="${VERSION}"
COPY --chmod=0555 bitg-linux-${TARGETARCH} /usr/local/bin/bitg
COPY LICENSE-MIT LICENSE-APACHE /usr/share/doc/bitg/
USER 65532:65532
WORKDIR /work
ENTRYPOINT ["/usr/local/bin/bitg"]
