# syntax=docker/dockerfile:1
FROM alpine
COPY <<-"EOT" /app/script.sh
	echo hello ${FOO}
EOT
RUN FOO=abc ash /app/script.sh