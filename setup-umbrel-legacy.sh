#!/bin/bash
set -e

echo "🚀 Iniciando instalação do Umbrel Legacy (v0.5.4)..."

# Diretório de destino
INSTALL_DIR="/home/umbrel"

# Criar diretório e ir para ele
mkdir -p $INSTALL_DIR && cd $INSTALL_DIR

# Instalar dependências
echo "📦 Instalando dependências..."
apt update
apt install -y curl jq rsync docker.io docker-compose fswatch

# Instalar yq v4.40.5 (versão em Go)
echo "⬇️ Instalando yq v4.40.5..."
wget -q https://github.com/mikefarah/yq/releases/download/v4.40.5/yq_linux_amd64 -O /usr/local/bin/yq
chmod +x /usr/local/bin/yq

# Clonar Umbrel v0.5.4
echo "🔁 Clonando Umbrel v0.5.4..."
git clone --branch v0.5.4 https://github.com/getumbrel/umbrel.git umbrel

# Impedir atualizações automáticas
echo "🔒 Desativando atualizações automáticas..."
chattr +i $INSTALL_DIR/umbrel/scripts/update

# Rodar o Umbrel pela primeira vez
echo "⚙️ Iniciando o Umbrel pela primeira vez..."
cd $INSTALL_DIR/umbrel
./scripts/start

# Criar serviço systemd
echo "🛠️ Criando serviço systemd para inicializar no boot..."

cat <<EOF > /etc/systemd/system/umbrel.service
[Unit]
Description=Umbrel Node
After=network.target docker.service
Requires=docker.service

[Service]
WorkingDirectory=$INSTALL_DIR/umbrel
ExecStart=$INSTALL_DIR/umbrel/scripts/start
Restart=always
User=root

[Install]
WantedBy=multi-user.target
EOF

# Ativar e iniciar o serviço
systemctl daemon-reexec
systemctl daemon-reload
systemctl enable umbrel
systemctl start umbrel

echo "✅ Instalação completa! Acesse via http://<IP-DA-MAQUINA>"

Line endings: Convert to Unix (LF)
