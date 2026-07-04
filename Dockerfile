FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Dependências básicas do sistema + Python
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    vim \
    nano \
    unzip \
    zip \
    jq \
    ca-certificates \
    build-essential \
    software-properties-common \
    gnupg \
    python3 \
    python3-pip \
    python3-venv \
    ffmpeg \
    portaudio19-dev \
    && rm -rf /var/lib/apt/lists/*

# Node.js 20
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs

# Verificação opcional
RUN node -v && npm -v

# OpenCode AI CLI
RUN npm install -g opencode-ai || true

# Atualiza pip + uv (para uvx) + MCPs Python fixos
RUN pip3 install --no-cache-dir --upgrade pip && \
    pip3 install --no-cache-dir uv && \
    pip3 install --no-cache-dir \
        sqlite-mcp-server \
        jupyter-mcp-server

# OpenCode CLI config — modelo DeepSeek V4 Flash Free via Zen API
COPY .opencode /root/.opencode
ENV OPENCODE_CONFIG_PATH=/root/.opencode
ENV OPENCODE_MODEL="opencode/deepseek-v4-flash-free"

# Diretório de trabalho
WORKDIR /workspace

# Shell padrão
CMD ["/bin/bash"]