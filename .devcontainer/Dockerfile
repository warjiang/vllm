FROM fronted-cn-beijing.cr.volces.com/container/vllm/vllm-openai:v0.7.3

# If you have custom registry, change registry mirror here.
# add essential build tools.
RUN sed -i s/archive.ubuntu.com/mirrors.ivolces.com/g /etc/apt/sources.list && \
    sed -i s/security.ubuntu.com/mirrors.ivolces.com/g /etc/apt/sources.list && \
    apt update && \
    apt install zsh -y

# Create non-root user with specified UID and GID
# NOTE: Replace with your own UID and GID. This is a workaround from https://github.com/microsoft/vscode-remote-release/issues/49#issuecomment-489060908.
ARG HOST_UID=1000
ARG HOST_GID=1000
RUN groupadd -g $HOST_GID devuser && \
    useradd -m -u $HOST_UID -g $HOST_GID -s /bin/zsh devuser

COPY setup.sh /setup.sh