# 🕹️ Setup Umbrel Legacy v0.5.4

Script automatizado para instalar a versão **antiga e leve** do [Umbrel](https://getumbrel.com), ideal para dispositivos com poucos recursos ou para projetos auto-hospedados personalizados.

> ⚠️ Este script instala a versão **v0.5.4**, anterior à grande reformulação do Umbrel v1.0+. Não é compatível com versões atuais ou com o Umbrel OS.

---

## 🚀 Recursos incluídos

- Instalação automática do Umbrel v0.5.4
- Instalação de dependências (`docker`, `docker-compose`, `yq`, `jq`, `curl`, etc.)
- Fix de atualizações automáticas
- Serviço systemd para iniciar o Umbrel após cada reboot
- Suporte a apps legados como Watch Your LAN, Pi-hole, etc.

---

## ✅ Requisitos

- Ubuntu / Debian (recomendado mínimo: 1 vCPU, 1 GB RAM)
- Acesso root ou via `sudo`
- Docker instalado (se não tiver, o script instala)

---

## 📦 Como instalar

```bash
curl -sSL https://raw.githubusercontent.com/testlablogin/setup-umbrel-legacy.sh/main/setup-umbrel-legacy.sh | bash

