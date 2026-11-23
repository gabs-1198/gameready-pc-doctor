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

### 2. 🛡️ Segurança: Ponto de Restauração & Reinício Seguro
* **Ponto de Restauração do Windows:** Cria com 1 clique uma imagem segura do sistema antes de qualquer alteração, garantindo capacidade total de reversão.
* **Confirmação Automática de Reinício:** Sempre que qualquer mudança no sistema for aplicada (Plano de Energia, Caches de Shaders, Mira 1:1, Vanguard VGC, Testsigning, Nagle ou DNS), o aplicativo pergunta se você deseja reiniciar o computador imediatamente para que os novos parâmetros entrem em vigor no Windows e nos jogos.

### 3. 🎯 Latência & Mira 1:1 Competitiva
* **Modo de Jogo do Windows:** Garante que os processos de jogos tenham prioridade máxima de CPU.
* **Mira 1:1 (Calibração do Mouse):** Detecta e desativa o recurso *"Aprimorar precisão do ponteiro"* (aceleração do mouse do Windows), garantindo mira consistente em escala 1:1 em jogos competitivos (CS2, Valorant, Warzone).
* **Auditoria de Inicialização (Habilitados vs Desabilitados):** Inspeciona a chave `StartupApproved` do registro informando exatamente quantos aplicativos estão habilitados e quantos estão desabilitados no boot, permitindo visualizar a lista completa e abrir o Gerenciador de Tarefas.

### 4. 🎮 Suporte Universal Multi-GPU & Shaders
* **NVIDIA:** Leitura direta de VRAM com Resizable BAR (ReBAR) e monitoramento de temperatura.
* **AMD Radeon:** Detecção de **Smart Access Memory (SAM)**.
* **Intel Arc:** Detecção de Resizable BAR nativo.
* **Limpeza Universal de Shaders:** Esvaziamento seguro de caches gráficos para **NVIDIA (`DXCache`/`GLCache`), AMD Radeon (`DxCache`/`D3DCache`) e Intel Arc (`ShaderCache`)**, além de arquivos temporários e crash dumps.

### 5. 🖥️ Taxa de Atualização do Monitor (Hz)
* Lê a taxa atual e a capacidade máxima suportada via EDID. Emite alerta vermelho imediato caso um monitor gamer (144Hz/165Hz/240Hz) esteja travado em 60 Hz no Windows e oferece atalho direto para desbloquear a fluidez total.

### 6. 🛡️ Riot Vanguard & Valorant Doctor (Anti-Cheat & Diagnóstico 1-Clique)
* **Auditoria completa de compatibilidade com o Riot Vanguard (Valorant & League of Legends):**
  * **TPM 2.0 (Erro VAN 9001):** Detecta a presença do módulo de segurança e oferece guia detalhado de ativação na BIOS para processadores AMD (fTPM) e Intel (PTT) em placas ASUS, MSI, Gigabyte e ASRock.
  * **Secure Boot UEFI (Erro VAN 9003):** Identifica se a Inicialização Segura está desativada no Windows 11 e guia a desativação do CSM e habilitação do Secure Boot.
  * **Serviço VGC (Erros VAN 1067 / VAN 84):** Detecta se o serviço do Vanguard está travado em "Manual" ou "Parado" e oferece botão de **Reparo em 1 Clique** para torná-lo Automático e ativo.
  * **Integridade de Drivers (Erros VAN 128 / VAN 57):** Detecta se o Windows está em modo de testes (`testsigning`) ou com checagem de assinatura desligada e oferece **Reparo em 1 Clique**.
  * **Inclusão no Laudo Técnico:** Toda a compatibilidade com o Vanguard é documentada no Laudo Técnico (HTML/PDF).

### 7. 🌐 Rede & Ping Gamer (Otimizador de Latência TCP/IP & DNS)
* **Eliminação do Atraso de Nagle (`TcpAckFrequency` & `TCPNoDelay`):** Desativa o agrupamento artificial de pacotes TCP do Windows para envio instantâneo sem delay de tick em jogos de tiro (CS2, Valorant, Fortnite, Warzone).
* **Desativação de Network Throttling:** Remove a limitação padrão de 10 pacotes/ms do Windows (`NetworkThrottlingIndex = 0xFFFFFFFF`) e libera 100% da CPU para jogos (`SystemResponsiveness = 0`).
* **DNS Gamer de 1-Clique:** Aplica servidores de alta performance com rotas otimizadas (**Cloudflare 1.1.1.1** ou **Google 8.8.8.8**) com opção de retorno a DHCP instantâneo.
* **Diagnóstico de Ping em Tempo Real & Flush DNS:** Teste de latência ao vivo nos backbones e limpeza profunda de cache de rotas e pilha Winsock.

### 8. 💡 Consultor de Hardware & Upgrades Personalizados
* Classifica o PC em níveis (*Alta Performance Gamer*, *Intermediário*, *PC Básico*).
* Gera recomendações dinâmicas de acordo com a máquina inspecionada (alertas de Single-Channel de RAM, saúde térmica da GPU, sistema em HD mecânico, SSD lotado ou falta de placa de vídeo dedicada).

### 9. ✅ Verificador de Sucesso (Validação Automática)
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
