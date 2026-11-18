# ⚡ GameReady PC Doctor

<p align="center">
  <img src="https://img.shields.io/badge/Platform-Windows%2010%20%7C%2011-0078D6?style=for-the-badge&logo=windows&logoColor=white" alt="Windows"/>
  <img src="https://img.shields.io/badge/GPU%20Support-NVIDIA%20%7C%20AMD%20%7C%20Intel-76B900?style=for-the-badge" alt="Universal GPU"/>
  <img src="https://img.shields.io/badge/PowerShell-5.1%20%7C%207%2B-5391FE?style=for-the-badge&logo=powershell&logoColor=white" alt="PowerShell"/>
  <img src="https://img.shields.io/badge/Reports-HTML%20%7C%20PDF%20Export-38BDF8?style=for-the-badge" alt="PDF Reports"/>
  <img src="https://img.shields.io/badge/License-MIT-10B981?style=for-the-badge" alt="MIT License"/>
  <img src="https://img.shields.io/badge/UI-Native%20WPF%20XAML-6366F1?style=for-the-badge" alt="WPF UI"/>
</p>

O **GameReady PC Doctor** é um utilitário portátil profissional de código aberto para Windows que audita gargalos de hardware, otimiza o sistema e **avalia cada computador isoladamente**, fornecendo um diagnóstico personalizado, recomendações práticas de upgrades e a geração instantânea de um **Laudo Técnico (HTML/PDF)** para clientes e técnicos de informática.

---

## 🎯 Funcionalidades Principais

### 1. 📄 Gerador de Laudo Técnico Profissional (Exportar HTML / PDF)
* Gera com 1 clique um laudo executivo e formatado do computador contendo:
  * Identificação completa do host, usuário, sistema operacional e data/hora.
  * Inventário técnico de hardware detalhado (CPU, GPU, RAM em Dual Channel, SSD NVMe/SATA, Monitor e Temperatura).
  * Auditoria visual dos 7 pilares de performance com selos coloridos.
  * Botão embutido de **Imprimir / Salvar em PDF** formatado para folha A4. Ideal para técnicos entregarem a clientes após serviços de formatação ou montagem!

### 2. 🛡️ Segurança: Ponto de Restauração Automático
* Permite criar um **Ponto de Restauração do Windows** em 1 clique antes de qualquer alteração, garantindo 100% de segurança e capacidade de reversão.

### 3. 🎯 Latência & Mira 1:1 Competitiva
* **Modo de Jogo do Windows:** Garante que os processos de jogos tenham prioridade máxima de CPU.
* **Mira 1:1 (Calibração do Mouse):** Detecta e desativa o recurso *"Aprimorar precisão do ponteiro"* (aceleração do mouse do Windows), garantindo mira consistente em escala 1:1 em jogos competitivos (CS2, Valorant, Warzone).

### 4. 🎮 Suporte Universal Multi-GPU & Shaders
* **NVIDIA:** Leitura direta de VRAM com Resizable BAR (ReBAR) e monitoramento de temperatura.
* **AMD Radeon:** Detecção de **Smart Access Memory (SAM)**.
* **Intel Arc:** Detecção de Resizable BAR nativo.
* **Limpeza Universal de Shaders:** Esvaziamento seguro de caches gráficos para **NVIDIA (`DXCache`/`GLCache`), AMD Radeon (`DxCache`/`D3DCache`) e Intel Arc (`ShaderCache`)**, além de arquivos temporários e crash dumps.

### 5. 🖥️ Taxa de Atualização do Monitor (Hz)
* Lê a taxa atual e a capacidade máxima suportada via EDID. Emite alerta vermelho imediato caso um monitor gamer (144Hz/165Hz/240Hz) esteja travado em 60 Hz no Windows e oferece atalho direto para desbloquear a fluidez total.

### 6. 💡 Consultor de Hardware & Upgrades Personalizados
* Classifica o PC em níveis (*Alta Performance Gamer*, *Intermediário*, *PC Básico*).
* Gera recomendações dinâmicas de acordo com a máquina inspecionada (alertas de Single-Channel de RAM, saúde térmica da GPU, sistema em HD mecânico, SSD lotado ou falta de placa de vídeo dedicada).

### 7. ✅ Verificador de Sucesso (Validação Automática)
* Checklist de **7 pilares essenciais de performance**, pontuando o computador de 0% a 100% com selos de confirmação.

---

## 🚀 Como Executar

Não requer instalação de Python, Node.js ou bibliotecas extras:

1. Baixe ou clone o repositório.
2. Dê um **duplo clique** no arquivo:
   👉 **`Iniciar_Otimizador.bat`**
3. Confirme a permissão de Administrador (UAC).
4. O aplicativo abrirá com interface moderna nativa em Dark Mode.

---

## 🛠️ Tecnologias Utilizadas
* **Windows Presentation Foundation (WPF / XAML):** Interface gráfica nativa fluida em Dark Mode.
* **PowerShell 5.1 / 7+:** Scripts de leitura e automação profunda do Windows.
* **NVIDIA System Management Interface (`nvidia-smi`):** Telemetria em tempo real de barramento, VRAM e sensores térmicos.
* **WMI / CIM & Plug and Play Subsystem:** Rastreamento universal de hardware, monitores EDID e barramentos de armazenamento.

---

Desenvolvido por [Gabriel Lopes](https://github.com/gabs-1198).
Distribuído sob licença MIT.
