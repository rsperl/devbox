from devboxbase:latest

run mkdir -p /src
add cpanfile /src/
run for i in `cat /src/cpanfile`; do cpanm --notest $i; done

