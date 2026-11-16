# ⚡ GameReady PC Doctor

<p align="center">
  <img src="https://img.shields.io/badge/Platform-Windows%2010%20%7C%2011-0078D6?style=for-the-badge&logo=windows&logoColor=white" alt="Windows"/>
  <img src="https://img.shields.io/badge/PowerShell-5.1%20%7C%207%2B-5391FE?style=for-the-badge&logo=powershell&logoColor=white" alt="PowerShell"/>
  <img src="https://img.shields.io/badge/License-MIT-10B981?style=for-the-badge" alt="MIT License"/>
  <img src="https://img.shields.io/badge/UI-Native%20WPF%20XAML-6366F1?style=for-the-badge" alt="WPF UI"/>
</p>

O **GameReady PC Doctor** é um utilitário portátil de código aberto para Windows projetado para auditar gargalos de hardware e configurações em computadores para jogos. Ele ajuda tanto usuários avançados quanto leigos a extraírem o desempenho máximo de seus computadores em poucos cliques, sem necessidade de instalar dependências externas.

---

## 🎯 Funcionalidades Principais

### 1. 🚀 Diagnóstico & Otimização de Gargalos
* **🎮 Resizable BAR (ReBAR):** Detecta se a placa de vídeo está transferindo dados em blocos reduzidos de 256 MB ou com acesso total à VRAM (8 GB+). Inclui guia passo a passo para ativar na BIOS de qualquer fabricante (**ASUS, MSI, Gigabyte, ASRock**).
* **🛡️ Isolamento do Núcleo (VBS):** Identifica se o hipervisor de segurança do Windows 11 está ativo (o que causa uma perda de 3% a 8% de FPS em processadores modernos). Fornece atalho direto para desativar com facilidade.
* **⚡ Memória RAM (XMP / DOCP):** Verifica se as memórias estão operando em **Dual Channel** e se o perfil de alta frequência está ativado.
* **🔋 Plano de Energia:** Analisa o esquema de energia do sistema e permite ativar o modo **Desempenho Máximo** (*Ultimate Performance*) com 1 clique.
* **🧹 Limpeza de Shaders & Lixo:** Localiza acúmulos gigantescos no cache de shaders DirectX da NVIDIA (`DXCache`) e arquivos temporários, permitindo limpeza segura com 1 clique para evitar travamentos de shaders.
* **🚀 Inicialização Automática:** Alerta sobre lançadores múltiplos e sobreposições desnecessárias rodando no boot do Windows.

### 2. ✅ Verificador de Sucesso (Checklist Visual)
* **Pontuação Geral (0% a 100%):** Placar que avalia a saúde e o preparo do computador para jogos.
* **Checklist Inteligente:** Badges coloridas (`✅ CONCLUÍDO` / `⚠️ PENDENTE`) para cada um dos 5 pilares de otimização, garantindo certeza de que todas as melhorias foram aplicadas com sucesso.

---

## 🚀 Como Executar

Não é necessário instalar Python, Node.js ou compilar nada:

1. Baixe ou clone este repositório.
2. Dê um **duplo clique** no arquivo:
   👉 **`Iniciar_Otimizador.bat`**
3. Confirme a permissão de Administrador (UAC).
4. A interface gráfica moderna em modo escuro abrirá automaticamente!

---

## 🛠️ Tecnologias Utilizadas
* **Windows Presentation Foundation (WPF / XAML):** Interface gráfica nativa de alta performance e baixo consumo de memória.
* **PowerShell 5.1 / 7+:** Scripts de leitura segura e chamadas ao WMI/CIM do Windows.
* **NVIDIA System Management Interface (`nvidia-smi`):** Telemetria direta da GPU e barramento PCIe.

---

## 📄 Licença
Distribuído sob a licença **MIT**. Consulte `LICENSE` para mais informações.

Desenvolvido por [Gabriel Lopes](https://github.com/gabs-1198).
