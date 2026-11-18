# ⚡ GameReady PC Doctor

<p align="center">
  <img src="https://img.shields.io/badge/Platform-Windows%2010%20%7C%2011-0078D6?style=for-the-badge&logo=windows&logoColor=white" alt="Windows"/>
  <img src="https://img.shields.io/badge/GPU%20Support-NVIDIA%20%7C%20AMD%20%7C%20Intel-76B900?style=for-the-badge" alt="Universal GPU"/>
  <img src="https://img.shields.io/badge/PowerShell-5.1%20%7C%207%2B-5391FE?style=for-the-badge&logo=powershell&logoColor=white" alt="PowerShell"/>
  <img src="https://img.shields.io/badge/License-MIT-10B981?style=for-the-badge" alt="MIT License"/>
  <img src="https://img.shields.io/badge/UI-Native%20WPF%20XAML-6366F1?style=for-the-badge" alt="WPF UI"/>
</p>

O **GameReady PC Doctor** é um utilitário portátil de código aberto para Windows que audita gargalos, otimiza o sistema e **avalia cada computador isoladamente**, fornecendo um diagnóstico personalizado e recomendações práticas de upgrades para extrair o máximo de cada configuração.

---

## 🎯 Abas e Recursos

### 1. 🚀 Diagnóstico & Otimizações em 1 Clique
* **🎮 Suporte Universal Multi-GPU (NVIDIA, AMD e Intel):**
  * **NVIDIA:** Resizable BAR (ReBAR) via telemetria `nvidia-smi`.
  * **AMD Radeon:** Detecção de **Smart Access Memory (SAM)**.
  * **Intel Arc:** Detecção de Resizable BAR nativo (vital para arquitetura Alchemist/Battlemage).
* **🧹 Limpeza Universal de Caches de Shaders:** Varredura e esvaziamento seguro de caches de compiladores gráficos para **NVIDIA (`DXCache`/`GLCache`), AMD Radeon (`DxCache`/`D3DCache`) e Intel Arc (`ShaderCache`)**, além de arquivos temporários e crash dumps mortos.
* **🖥️ Taxa de Atualização do Monitor (Hz):** Identifica a taxa atual e a capacidade máxima do monitor via EDID. Alerta imediatamente se o cliente possui um monitor gamer (144Hz/165Hz/240Hz) travado em 60 Hz no Windows e oferece atalho direto para desbloquear a fluidez total.
* **🎮 Modo de Jogo (Windows Game Mode):** Garante que o agendador do Windows priorize núcleos e recursos da CPU para os jogos em execução.
* **🛡️ Isolamento do Núcleo (VBS):** Atalho direto para desativar a virtualização de segurança do Windows 11 e reduzir a latência da CPU.
* **⚡ Memória RAM:** Verificação de canais (Single vs Dual Channel) e frequências nominais (XMP/DOCP).
* **🔋 Plano de Energia:** Ativação instantânea do plano *Desempenho Máximo* (*Ultimate Performance*).
* **🚀 Inicialização Automática:** Atalho rápido para gerenciar os programas do boot.

### 2. 💡 Avaliação Individual & Consultor de Upgrades
* **Classificação de Tier do PC:** Avalia o equilíbrio entre CPU, GPU, RAM e Armazenamento (ex: *Alta Performance Gamer*, *Intermediário Gamer*, *PC Básico / Esports*).
* **Diagnóstico Personalizado para o Hardware Detectado:**
  * 🔴 **Prioridade Alta:** Alerta sobre gargalos críticos (ex: AMD SAM / NVIDIA ReBAR desligado, monitor gamer travado em 60Hz, RAM em Single-Channel cortando 20-30% de FPS, sistema rodando em HD mecânico, SSD com menos de 15% de espaço livre, ou menos de 16 GB de RAM).
  * 🟡 **Ajustes Recomendados (Gratuitos):** Orienta a ativação do ReBAR/SAM na BIOS, perfis XMP/DOCP/EXPO para memórias e desativação do Isolamento de Núcleo (VBS).
  * 🟢 **Pontos Fortes do Computador:** Destaca os componentes que já estão em estado perfeito.
  * 🔵 **Dicas Técnicas de Longo Prazo:** Alertas sobre largura de banda PCIe e upgrades visuais.

### 3. ✅ Verificador de Sucesso (Validação Pós-Ajustes)
* **Placar Geral de Otimização (0% a 100%):** Avalia se as principais áreas de performance foram otimizadas.
* **Checklist Inteligente:** Crachás visuais verdes (`✅ CONCLUÍDO`) e vermelhos (`⚠️ PENDENTE`).

---

## 🚀 Como Executar

Não requer instalação de Python, Node.js ou bibliotecas extras:

1. Baixe ou clone o repositório.
2. Dê um **duplo clique** no arquivo:
   👉 **`Iniciar_Otimizador.bat`**
3. Confirme a permissão de Administrador (UAC).
4. O aplicativo abrirá com interface moderna nativa em Dark Mode.

---

Desenvolvido por [Gabriel Lopes](https://github.com/gabs-1198).
