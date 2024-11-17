FROM ubuntu
RUN apt update && apt upgrade -y && apt install curl git xz-utils -y
WORKDIR /root
COPY ./shell.example.nix ./shell.nix
RUN curl -L https://nixos.org/nix/install | sh -s -- --daemon
RUN /root/.nix-profile/bin/nix-shell
RUN git config --global user.email dev@in.container
RUN git config --global user.name "Dev Container"
RUN git init
RUN git add -A
RUN git commit -m "dev: init $(date)"
