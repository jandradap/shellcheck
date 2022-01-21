FROM koalaman/shellcheck AS build
LABEL maintainer="Vidar Holen <vidar@vidarholen.net>"

# ShellCheck image
FROM alpine:3.15

LABEL org.label-schema.build-date=$BUILD_DATE \
			org.label-schema.name="shellcheck" \
			org.label-schema.description="koalaman/shellcheck with bash" \
			org.label-schema.url="http://andradaprieto.es" \
			org.label-schema.vcs-ref=$VCS_REF \
			org.label-schema.vcs-url="https://github.com/jandradap/shellcheck" \
			org.label-schema.vendor="Jorge Andrada Prieto" \
			org.label-schema.version=$VERSION \
			org.label-schema.schema-version="1.0" \
			maintainer="Jorge Andrada Prieto <jandradap@gmail.com>" \
			org.label-schema.docker.cmd=""

RUN apk --update --clean-protected --no-cache add \
  bash
  
WORKDIR /mnt

COPY --from=build /bin/shellcheck /bin/

ENTRYPOINT ["/bin/shellcheck"]
