<#
.SYNOPSIS
    GameReady PC Doctor - Otimizador, Verificador e Consultor de Upgrades para Jogos
    Compatível com Windows 10 e Windows 11 (PowerShell 5.1 e 7+)
    Autor: Gabriel Lopes (https://github.com/gabs-1198)
#>

Add-Type -AssemblyName PresentationFramework, PresentationCore, WindowsBase, System.Drawing

[xml]$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="GameReady PC Doctor - Diagnóstico, Otimização e Consultor de Upgrades" 
        Height="860" Width="1040" 
        WindowStartupLocation="CenterScreen" 
        Background="#0F111A" 
        Foreground="#ECEFF4"
        FontFamily="Segoe UI"
        ResizeMode="CanResize">
    
    <Window.Resources>
        <Style TargetType="Button">
            <Setter Property="Background" Value="#4F46E5"/>
            <Setter Property="Foreground" Value="White"/>
            <Setter Property="FontWeight" Value="SemiBold"/>
            <Setter Property="FontSize" Value="13"/>
            <Setter Property="Padding" Value="14,8"/>
            <Setter Property="BorderThickness" Value="0"/>
            <Setter Property="Cursor" Value="Hand"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="Button">
                        <Border Background="{TemplateBinding Background}" CornerRadius="8" Padding="{TemplateBinding Padding}">
                            <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
                        </Border>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
            <Style.Triggers>
                <Trigger Property="IsMouseOver" Value="True">
                    <Setter Property="Background" Value="#6366F1"/>
                </Trigger>
            </Style.Triggers>
        </Style>

        <Style TargetType="TabItem">
            <Setter Property="Background" Value="Transparent"/>
            <Setter Property="Foreground" Value="#94A3B8"/>
            <Setter Property="FontSize" Value="15"/>
            <Setter Property="FontWeight" Value="SemiBold"/>
            <Setter Property="Padding" Value="18,10"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="TabItem">
                        <Border Name="Border" Background="{TemplateBinding Background}" BorderThickness="0,0,0,3" BorderBrush="Transparent" Margin="0,0,15,0">
                            <ContentPresenter ContentSource="Header" Margin="{TemplateBinding Padding}"/>
                        </Border>
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsSelected" Value="True">
                                <Setter Property="Foreground" Value="#38BDF8"/>
                                <Setter TargetName="Border" Property="BorderBrush" Value="#38BDF8"/>
                            </Trigger>
                            <Trigger Property="IsMouseOver" Value="True">
                                <Setter Property="Foreground" Value="#F8FAFC"/>
                            </Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>
    </Window.Resources>

    <Grid Margin="24">
        <Grid.RowDefinitions>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="*"/>
        </Grid.RowDefinitions>

        <!-- Top Header Banner -->
        <Border Grid.Row="0" Background="#1E2235" CornerRadius="12" Padding="20" Margin="0,0,0,18">
            <Grid>
                <Grid.ColumnDefinitions>
                    <ColumnDefinition Width="*"/>
                    <ColumnDefinition Width="Auto"/>
                </Grid.ColumnDefinitions>
                <StackPanel Grid.Column="0">
                    <StackPanel Orientation="Horizontal" Margin="0,0,0,6">
                        <TextBlock Text="⚡ GameReady PC Doctor" FontSize="24" FontWeight="Bold" Foreground="#38BDF8"/>
                        <Border Background="#10B981" CornerRadius="6" Padding="8,2" Margin="14,2,0,2">
                            <TextBlock Text="AI HARDWARE ADVISOR" FontSize="11" FontWeight="Bold" Foreground="#042F2E"/>
                        </Border>
                    </StackPanel>
                    <TextBlock Name="TxtSpecs" Text="Detectando componentes do hardware..." FontSize="13" Foreground="#94A3B8"/>
                </StackPanel>
                <Button Grid.Column="1" Name="BtnReescanear" Content="🔄 Reexaminar PC" Background="#2A3048" Width="150" Height="40"/>
            </Grid>
        </Border>

        <!-- Navigation Tabs -->
        <TabControl Grid.Row="2" Background="Transparent" BorderThickness="0">
            <!-- TAB 1: OTIMIZADOR DE GARGALOS -->
            <TabItem Header="🚀 Diagnóstico &amp; Otimização">
                <ScrollViewer VerticalScrollBarVisibility="Auto" Margin="0,15,0,0">
                    <Grid>
                        <Grid.RowDefinitions>
                            <RowDefinition Height="Auto"/>
                            <RowDefinition Height="Auto"/>
                            <RowDefinition Height="Auto"/>
                            <RowDefinition Height="Auto"/>
                        </Grid.RowDefinitions>
                        <Grid.ColumnDefinitions>
                            <ColumnDefinition Width="*"/>
                            <ColumnDefinition Width="*"/>
                        </Grid.ColumnDefinitions>

                        <!-- Card 1: Resizable BAR -->
                        <Border Grid.Row="0" Grid.Column="0" Background="#1E2235" CornerRadius="12" Padding="18" Margin="0,0,10,14">
                            <StackPanel>
                                <Grid Margin="0,0,0,10">
                                    <TextBlock Text="🎮 Resizable BAR (GPU / ReBAR)" FontSize="16" FontWeight="Bold" Foreground="White"/>
                                    <Border Name="BadgeRebar" HorizontalAlignment="Right" Background="#334155" CornerRadius="6" Padding="8,3">
                                        <TextBlock Name="TxtBadgeRebar" Text="Checando..." FontSize="12" FontWeight="Bold" Foreground="White"/>
                                    </Border>
                                </Grid>
                                <TextBlock Name="TxtDescRebar" Text="Verificando se a CPU acessa toda a VRAM da GPU de uma só vez..." TextWrapping="Wrap" Foreground="#94A3B8" FontSize="12" Margin="0,0,0,14" Height="42"/>
                                <Button Name="BtnGuiaRebar" Content="📘 Como Ativar na BIOS" Background="#334155"/>
                            </StackPanel>
                        </Border>

                        <!-- Card 2: VBS / Isolamento de Núcleo -->
                        <Border Grid.Row="0" Grid.Column="1" Background="#1E2235" CornerRadius="12" Padding="18" Margin="10,0,0,14">
                            <StackPanel>
                                <Grid Margin="0,0,0,10">
                                    <TextBlock Text="🛡️ Isolamento do Núcleo (VBS)" FontSize="16" FontWeight="Bold" Foreground="White"/>
                                    <Border Name="BadgeVbs" HorizontalAlignment="Right" Background="#334155" CornerRadius="6" Padding="8,3">
                                        <TextBlock Name="TxtBadgeVbs" Text="Checando..." FontSize="12" FontWeight="Bold" Foreground="White"/>
                                    </Border>
                                </Grid>
                                <TextBlock Name="TxtDescVbs" Text="Verificando se o hipervisor do Windows está reduzindo a taxa de quadros (1% lows)..." TextWrapping="Wrap" Foreground="#94A3B8" FontSize="12" Margin="0,0,0,14" Height="42"/>
                                <Button Name="BtnAbrirVbs" Content="⚙️ Abrir Configuração do Windows" Background="#334155"/>
                            </StackPanel>
                        </Border>

                        <!-- Card 3: Memória RAM (XMP / DOCP) -->
                        <Border Grid.Row="1" Grid.Column="0" Background="#1E2235" CornerRadius="12" Padding="18" Margin="0,0,10,14">
                            <StackPanel>
                                <Grid Margin="0,0,0,10">
                                    <TextBlock Text="⚡ Frequência da RAM (XMP/EXPO)" FontSize="16" FontWeight="Bold" Foreground="White"/>
                                    <Border Name="BadgeRam" HorizontalAlignment="Right" Background="#334155" CornerRadius="6" Padding="8,3">
                                        <TextBlock Name="TxtBadgeRam" Text="Checando..." FontSize="12" FontWeight="Bold" Foreground="White"/>
                                    </Border>
                                </Grid>
                                <TextBlock Name="TxtDescRam" Text="Verificando velocidade dos pentes e modo Dual-Channel..." TextWrapping="Wrap" Foreground="#94A3B8" FontSize="12" Margin="0,0,0,14" Height="42"/>
                                <Button Name="BtnInfoRam" Content="🔍 Detalhes dos Módulos" Background="#334155"/>
                            </StackPanel>
                        </Border>

                        <!-- Card 4: Plano de Energia -->
                        <Border Grid.Row="1" Grid.Column="1" Background="#1E2235" CornerRadius="12" Padding="18" Margin="10,0,0,14">
                            <StackPanel>
                                <Grid Margin="0,0,0,10">
                                    <TextBlock Text="🔋 Plano de Energia do Sistema" FontSize="16" FontWeight="Bold" Foreground="White"/>
                                    <Border Name="BadgePower" HorizontalAlignment="Right" Background="#334155" CornerRadius="6" Padding="8,3">
                                        <TextBlock Name="TxtBadgePower" Text="Checando..." FontSize="12" FontWeight="Bold" Foreground="White"/>
                                    </Border>
                                </Grid>
                                <TextBlock Name="TxtDescPower" Text="Verificando se os núcleos do processador operam sem atraso de transição..." TextWrapping="Wrap" Foreground="#94A3B8" FontSize="12" Margin="0,0,0,14" Height="42"/>
                                <Button Name="BtnAtivarPower" Content="⚡ Ativar Desempenho Máximo" Background="#10B981"/>
                            </StackPanel>
                        </Border>

                        <!-- Card 5: Limpeza de Shaders e Lixo -->
                        <Border Grid.Row="2" Grid.Column="0" Background="#1E2235" CornerRadius="12" Padding="18" Margin="0,0,10,14">
                            <StackPanel>
                                <Grid Margin="0,0,0,10">
                                    <TextBlock Text="🧹 Limpeza de Shaders &amp; Caches" FontSize="16" FontWeight="Bold" Foreground="White"/>
                                    <Border Name="BadgeLixo" HorizontalAlignment="Right" Background="#334155" CornerRadius="6" Padding="8,3">
                                        <TextBlock Name="TxtBadgeLixo" Text="Calculando..." FontSize="12" FontWeight="Bold" Foreground="White"/>
                                    </Border>
                                </Grid>
                                <TextBlock Name="TxtDescLixo" Text="Analisando shaders obsoletos (DXCache), sobras de apps e relatórios mortos..." TextWrapping="Wrap" Foreground="#94A3B8" FontSize="12" Margin="0,0,0,14" Height="42"/>
                                <Button Name="BtnLimparTudo" Content="🧹 Limpar Caches com Segurança" Background="#4F46E5"/>
                            </StackPanel>
                        </Border>

                        <!-- Card 6: Inicialização Automática -->
                        <Border Grid.Row="2" Grid.Column="1" Background="#1E2235" CornerRadius="12" Padding="18" Margin="10,0,0,14">
                            <StackPanel>
                                <Grid Margin="0,0,0,10">
                                    <TextBlock Text="🚀 Inicialização &amp; Segundo Plano" FontSize="16" FontWeight="Bold" Foreground="White"/>
                                    <Border Name="BadgeStartup" HorizontalAlignment="Right" Background="#334155" CornerRadius="6" Padding="8,3">
                                        <TextBlock Name="TxtBadgeStartup" Text="Checando..." FontSize="12" FontWeight="Bold" Foreground="White"/>
                                    </Border>
                                </Grid>
                                <TextBlock Name="TxtDescStartup" Text="Verificando se há lançadores e overlays pesando no boot..." TextWrapping="Wrap" Foreground="#94A3B8" FontSize="12" Margin="0,0,0,14" Height="42"/>
                                <Button Name="BtnGerenciadorTarefas" Content="⚡ Abrir Inicialização do Windows" Background="#334155"/>
                            </StackPanel>
                        </Border>

                        <!-- Card 7: Monitor & Taxa de Atualização -->
                        <Border Grid.Row="3" Grid.Column="0" Background="#1E2235" CornerRadius="12" Padding="18" Margin="0,0,10,0">
                            <StackPanel>
                                <Grid Margin="0,0,0,10">
                                    <TextBlock Text="🖥️ Taxa de Atualização do Monitor" FontSize="16" FontWeight="Bold" Foreground="White"/>
                                    <Border Name="BadgeMonitor" HorizontalAlignment="Right" Background="#334155" CornerRadius="6" Padding="8,3">
                                        <TextBlock Name="TxtBadgeMonitor" Text="Checando..." FontSize="12" FontWeight="Bold" Foreground="White"/>
                                    </Border>
                                </Grid>
                                <TextBlock Name="TxtDescMonitor" Text="Verificando se o monitor gamer está travado em 60 Hz no Windows..." TextWrapping="Wrap" Foreground="#94A3B8" FontSize="12" Margin="0,0,0,14" Height="42"/>
                                <Button Name="BtnAjustarMonitor" Content="⚙️ Abrir Configurações de Tela" Background="#334155"/>
                            </StackPanel>
                        </Border>

                        <!-- Card 8: Modo de Jogo e Otimizações de Latência -->
                        <Border Grid.Row="3" Grid.Column="1" Background="#1E2235" CornerRadius="12" Padding="18" Margin="10,0,0,0">
                            <StackPanel>
                                <Grid Margin="0,0,0,10">
                                    <TextBlock Text="🎮 Modo de Jogo &amp; Latência" FontSize="16" FontWeight="Bold" Foreground="White"/>
                                    <Border Name="BadgeGameMode" HorizontalAlignment="Right" Background="#334155" CornerRadius="6" Padding="8,3">
                                        <TextBlock Name="TxtBadgeGameMode" Text="Checando..." FontSize="12" FontWeight="Bold" Foreground="White"/>
                                    </Border>
                                </Grid>
                                <TextBlock Name="TxtDescGameMode" Text="Verificando se o Modo de Jogo do Windows prioriza os núcleos da CPU..." TextWrapping="Wrap" Foreground="#94A3B8" FontSize="12" Margin="0,0,0,14" Height="42"/>
                                <Button Name="BtnConfigGameMode" Content="🎮 Configurar Modo de Jogo" Background="#334155"/>
                            </StackPanel>
                        </Border>
                    </Grid>
                </ScrollViewer>
            </TabItem>

            <!-- TAB 2: CONSULTOR DE UPGRADES E AVALIAÇÃO INDIVIDUAL -->
            <TabItem Header="💡 Avaliação &amp; Upgrades">
                <ScrollViewer VerticalScrollBarVisibility="Auto" Margin="0,15,0,0">
                    <StackPanel>
                        <!-- Perfil e Nível de Hardware -->
                        <Border Background="#1E2235" CornerRadius="12" Padding="20" Margin="0,0,0,18">
                            <Grid>
                                <Grid.ColumnDefinitions>
                                    <ColumnDefinition Width="*"/>
                                    <ColumnDefinition Width="Auto"/>
                                </Grid.ColumnDefinitions>
                                <StackPanel Grid.Column="0">
                                    <TextBlock Text="Perfil Individual deste Computador" FontSize="18" FontWeight="Bold" Foreground="White" Margin="0,0,0,6"/>
                                    <TextBlock Name="TxtNivelHardware" Text="Avaliando equilíbrio entre CPU, GPU, Memória e Armazenamento..." FontSize="13" Foreground="#94A3B8"/>
                                </StackPanel>
                                <Border Grid.Column="1" Name="BadgeTierHardware" Background="#6366F1" CornerRadius="8" Padding="16,8">
                                    <TextBlock Name="TxtTierHardware" Text="ANALISANDO..." FontSize="13" FontWeight="Bold" Foreground="White"/>
                                </Border>
                            </Grid>
                        </Border>

                        <TextBlock Text="🎯 O que este computador precisa para atingir a melhor performance possível:" FontSize="15" FontWeight="Bold" Foreground="#38BDF8" Margin="0,0,0,14"/>
                        <StackPanel Name="ContainerRecomendacoes"/>
                    </StackPanel>
                </ScrollViewer>
            </TabItem>

            <!-- TAB 3: VERIFICADOR DE SUCESSO -->
            <TabItem Header="✅ Verificador de Sucesso">
                <ScrollViewer VerticalScrollBarVisibility="Auto" Margin="0,15,0,0">
                    <StackPanel>
                        <!-- Score Header Card -->
                        <Border Background="#1E2235" CornerRadius="12" Padding="24" Margin="0,0,0,18">
                            <Grid>
                                <Grid.ColumnDefinitions>
                                    <ColumnDefinition Width="*"/>
                                    <ColumnDefinition Width="Auto"/>
                                </Grid.ColumnDefinitions>
                                <StackPanel Grid.Column="0">
                                    <TextBlock Text="Status Geral de Otimização" FontSize="20" FontWeight="Bold" Foreground="White" Margin="0,0,0,6"/>
                                    <TextBlock Name="TxtScoreGeral" Text="Calculando pontuação do seu computador..." FontSize="14" Foreground="#94A3B8"/>
                                </StackPanel>
                                <Border Grid.Column="1" Name="BadgeScoreGeral" Background="#10B981" CornerRadius="8" Padding="16,8">
                                    <TextBlock Name="TxtScoreNumero" Text="100%" FontSize="20" FontWeight="Bold" Foreground="#042F2E"/>
                                </Border>
                            </Grid>
                        </Border>

                        <!-- Checklist Items Container -->
                        <StackPanel Name="ContainerChecklist"/>
                    </StackPanel>
                </ScrollViewer>
            </TabItem>
        </TabControl>
    </Grid>
</Window>
"@

$reader = New-Object System.Xml.XmlNodeReader $xaml
$window = [Windows.Markup.XamlReader]::Load($reader)

# Element References
$TxtSpecs = $window.FindName("TxtSpecs")
$BtnReescanear = $window.FindName("BtnReescanear")

# Card 1 Rebar
$BadgeRebar = $window.FindName("BadgeRebar")
$TxtBadgeRebar = $window.FindName("TxtBadgeRebar")
$TxtDescRebar = $window.FindName("TxtDescRebar")
$BtnGuiaRebar = $window.FindName("BtnGuiaRebar")

# Card 2 VBS
$BadgeVbs = $window.FindName("BadgeVbs")
$TxtBadgeVbs = $window.FindName("TxtBadgeVbs")
$TxtDescVbs = $window.FindName("TxtDescVbs")
$BtnAbrirVbs = $window.FindName("BtnAbrirVbs")

# Card 3 RAM
$BadgeRam = $window.FindName("BadgeRam")
$TxtBadgeRam = $window.FindName("TxtBadgeRam")
$TxtDescRam = $window.FindName("TxtDescRam")
$BtnInfoRam = $window.FindName("BtnInfoRam")

# Card 4 Power
$BadgePower = $window.FindName("BadgePower")
$TxtBadgePower = $window.FindName("TxtBadgePower")
$TxtDescPower = $window.FindName("TxtDescPower")
$BtnAtivarPower = $window.FindName("BtnAtivarPower")

# Card 5 Clean
$BadgeLixo = $window.FindName("BadgeLixo")
$TxtBadgeLixo = $window.FindName("TxtBadgeLixo")
$TxtDescLixo = $window.FindName("TxtDescLixo")
$BtnLimparTudo = $window.FindName("BtnLimparTudo")

# Card 6 Startup
$BadgeStartup = $window.FindName("BadgeStartup")
$TxtBadgeStartup = $window.FindName("TxtBadgeStartup")
$TxtDescStartup = $window.FindName("TxtDescStartup")
$BtnGerenciadorTarefas = $window.FindName("BtnGerenciadorTarefas")

# Card 7 Monitor
$BadgeMonitor = $window.FindName("BadgeMonitor")
$TxtBadgeMonitor = $window.FindName("TxtBadgeMonitor")
$TxtDescMonitor = $window.FindName("TxtDescMonitor")
$BtnAjustarMonitor = $window.FindName("BtnAjustarMonitor")

# Card 8 Game Mode
$BadgeGameMode = $window.FindName("BadgeGameMode")
$TxtBadgeGameMode = $window.FindName("TxtBadgeGameMode")
$TxtDescGameMode = $window.FindName("TxtDescGameMode")
$BtnConfigGameMode = $window.FindName("BtnConfigGameMode")

# Tab 2 Upgrade Advisor
$TxtNivelHardware = $window.FindName("TxtNivelHardware")
$BadgeTierHardware = $window.FindName("BadgeTierHardware")
$TxtTierHardware = $window.FindName("TxtTierHardware")
$ContainerRecomendacoes = $window.FindName("ContainerRecomendacoes")

# Tab 3 Checklist
$TxtScoreGeral = $window.FindName("TxtScoreGeral")
$BadgeScoreGeral = $window.FindName("BadgeScoreGeral")
$TxtScoreNumero = $window.FindName("TxtScoreNumero")
$ContainerChecklist = $window.FindName("ContainerChecklist")

# Helper function to set badge colors
function Set-BadgeColor($badge, $textBlock, $text, $type) {
    $textBlock.Text = $text
    switch ($type) {
        "success" {
            $badge.Background = [Windows.Media.BrushConverter]::new().ConvertFromString("#065F46")
            $textBlock.Foreground = [Windows.Media.BrushConverter]::new().ConvertFromString("#34D399")
        }
        "warning" {
            $badge.Background = [Windows.Media.BrushConverter]::new().ConvertFromString("#78350F")
            $textBlock.Foreground = [Windows.Media.BrushConverter]::new().ConvertFromString("#FBBF24")
        }
        "danger" {
            $badge.Background = [Windows.Media.BrushConverter]::new().ConvertFromString("#7F1D1D")
            $textBlock.Foreground = [Windows.Media.BrushConverter]::new().ConvertFromString("#F87171")
        }
        default {
            $badge.Background = [Windows.Media.BrushConverter]::new().ConvertFromString("#334155")
            $textBlock.Foreground = [Windows.Media.BrushConverter]::new().ConvertFromString("#94A3B8")
        }
    }
}

# Global state to hold scan results
$global:DiagnosticState = @{}

# Function: Run Complete Audit Scan
function Run-AuditScan {
    $TxtSpecs.Text = "Analisando hardware e configurações do sistema..."

    # 1. CPU
    $cpuObj = Get-CimInstance Win32_Processor | Select-Object -First 1 Name, NumberOfCores, NumberOfLogicalProcessors
    $cpuName = $cpuObj.Name.Trim()
    $cpuCores = $cpuObj.NumberOfCores
    $cpuThreads = $cpuObj.NumberOfLogicalProcessors

    # 2. GPU
    $gpuObj = Get-CimInstance Win32_VideoController | Select-Object -First 1 Name, DriverVersion, AdapterRAM
    $gpuName = $gpuObj.Name
    $isIntegratedGpu = ($gpuName -match "Intel\(R\) HD|Intel\(R\) UHD|Iris|Radeon\(TM\) Graphics|Vega" -and $gpuName -notmatch "RTX|GTX|Radeon RX")

    # 3. Motherboard
    $boardObj = Get-CimInstance Win32_BaseBoard | Select-Object -First 1 Manufacturer, Product
    $boardInfo = "$($boardObj.Manufacturer) $($boardObj.Product)"

    $TxtSpecs.Text = "$cpuName | $gpuName | Placa-Mãe: $boardInfo"

    # 4. Universal Resizable BAR / AMD SAM Check
    $gpuVendor = "NVIDIA"
    $rebarTechName = "Resizable BAR"
    if ($gpuName -match "AMD|Radeon|RX\s*\d") {
        $gpuVendor = "AMD"
        $rebarTechName = "AMD Smart Access Memory (SAM)"
    } elseif ($gpuName -match "Intel.*Arc") {
        $gpuVendor = "Intel"
        $rebarTechName = "Intel Arc Resizable BAR"
    }

    $rebarActive = $false
    $barTotal = 0
    $pcieGen = 3
    $pcieWidth = 16

    # Method A: NVIDIA via nvidia-smi
    if ($gpuVendor -eq "NVIDIA") {
        try {
            $nvidiaQuery = nvidia-smi -q 2>$null | Select-String -Pattern "BAR1 Memory Usage" -Context 0,2
            if ($nvidiaQuery) {
                foreach ($line in $nvidiaQuery.Context.PostContext) {
                    if ($line -match "Total\s*:\s*(\d+)\s*MiB") {
                        $barTotal = [int]$matches[1]
                        if ($barTotal -ge 2048) { $rebarActive = $true }
                    }
                }
            }
            $pcieRaw = nvidia-smi --query-gpu=pcie.link.gen.current,pcie.link.width.current --format=csv,noheader,nounits 2>$null
            if ($pcieRaw) {
                $parts = $pcieRaw.Trim().Split(',')
                if ($parts.Count -ge 2) {
                    $pcieGen = [int]$parts[0].Trim()
                    $pcieWidth = [int]$parts[1].Trim()
                }
            }
        } catch {}
    }

    # Method B: AMD Radeon SAM / Intel Arc via Registry Class check
    if (-not $rebarActive) {
        try {
            $gpuKeys = Get-ChildItem -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}' -ErrorAction SilentlyContinue
            foreach ($k in $gpuKeys) {
                $prop = Get-ItemProperty -Path $k.PSPath -ErrorAction SilentlyContinue
                if ($prop.DriverDesc -and $prop.DriverDesc -match $gpuName) {
                    if ($prop.KMD_EnableSAM -eq 1 -or $prop.SAMStatus -eq 1 -or $prop.EnableLargePageSupport -eq 1) {
                        $rebarActive = $true
                        $barTotal = [math]::Round(($gpuObj.AdapterRAM / 1MB), 0)
                    }
                }
            }
        } catch {}
    }

    $global:DiagnosticState.Rebar = $rebarActive
    $global:DiagnosticState.BarTotal = $barTotal
    $global:DiagnosticState.PcieGen = $pcieGen
    $global:DiagnosticState.PcieWidth = $pcieWidth
    $global:DiagnosticState.Cpu = @{ Name = $cpuName; Cores = $cpuCores; Threads = $cpuThreads }
    $global:DiagnosticState.Gpu = @{ Name = $gpuName; Vendor = $gpuVendor; TechName = $rebarTechName; IsIntegrated = $isIntegratedGpu }
    $global:DiagnosticState.Motherboard = $boardInfo

    if ($rebarActive) {
        $badgeText = if ($gpuVendor -eq "AMD") { "SAM ATIVADO" } else { "ATIVADO ($barTotal MiB)" }
        Set-BadgeColor $BadgeRebar $TxtBadgeRebar $badgeText "success"
        if ($gpuVendor -eq "AMD") {
            $TxtDescRebar.Text = "Excelente! O AMD Smart Access Memory (SAM) está ativo, permitindo acesso total à VRAM da Radeon."
        } else {
            $TxtDescRebar.Text = "Excelente! A CPU acessa toda a VRAM da sua GPU sem gargalo de barramento."
        }
        $BtnGuiaRebar.IsEnabled = $false
        $BtnGuiaRebar.Content = "✅ Ativo e Funcional"
    } else {
        $badgeText = if ($gpuVendor -eq "AMD") { "SAM DESATIVADO" } else { "DESATIVADO" }
        Set-BadgeColor $BadgeRebar $TxtBadgeRebar $badgeText "danger"
        if ($gpuVendor -eq "AMD") {
            $TxtDescRebar.Text = "O AMD Smart Access Memory (SAM) está desativado na BIOS. Ative para ganhar até 15% de FPS na sua Radeon."
        } else {
            $TxtDescRebar.Text = "Sua placa de vídeo está transferindo dados em blocos pequenos de 256MB. Ative na BIOS para ganho imediato de FPS."
        }
        $BtnGuiaRebar.IsEnabled = $true
        $BtnGuiaRebar.Content = "📘 Como Ativar na BIOS"
    }

    # 5. VBS / Core Isolation Check
    $vbsActive = $false
    try {
        $dg = Get-CimInstance -ClassName Win32_DeviceGuard -Namespace root\Microsoft\Windows\DeviceGuard -ErrorAction SilentlyContinue
        if ($dg -and $dg.VirtualizationBasedSecurityStatus -eq 2) {
            $vbsActive = $true
        }
    } catch {}

    $global:DiagnosticState.VBS = $vbsActive
    if (-not $vbsActive) {
        Set-BadgeColor $BadgeVbs $TxtBadgeVbs "DESATIVADO (IDEAL)" "success"
        $TxtDescVbs.Text = "Perfeito para jogos! Seus núcleos de CPU rodam com acesso direto ao hardware sem camada de virtualização."
    } else {
        Set-BadgeColor $BadgeVbs $TxtBadgeVbs "ATIVADO (GARGALO)" "warning"
        $TxtDescVbs.Text = "O Windows está rodando com isolamento de memória de segurança. Isso custa de 3% a 8% de FPS no seu processador."
    }

    # 6. RAM Check (Speed, Modules, Channels, Capacity)
    $ramModules = Get-CimInstance Win32_PhysicalMemory -ErrorAction SilentlyContinue
    $ramCount = $ramModules.Count
    $ramSpeed = ($ramModules | Select-Object -First 1).ConfiguredClockSpeed
    $ramCapGB = [math]::Round((($ramModules | Measure-Object -Property Capacity -Sum).Sum / 1GB), 0)
    $ramDual = ($ramCount -ge 2)

    $global:DiagnosticState.RAM = @{ 
        Speed = $ramSpeed; 
        Dual = $ramDual; 
        Cap = $ramCapGB; 
        Count = $ramCount 
    }

    if ($ramDual -and $ramSpeed -ge 3200) {
        Set-BadgeColor $BadgeRam $TxtBadgeRam "OTIMIZADA ($ramCapGB GB @ $ramSpeed MHz)" "success"
        $TxtDescRam.Text = "Dual Channel ativo e frequência XMP/DOCP configurada em alta velocidade ($ramSpeed MHz)."
    } elseif ($ramDual) {
        Set-BadgeColor $BadgeRam $TxtBadgeRam "DUAL-CHANNEL ($ramSpeed MHz)" "warning"
        $TxtDescRam.Text = "Dual Channel ativo, mas confira na BIOS se o perfil XMP/DOCP para frequências maiores está disponível."
    } else {
        Set-BadgeColor $BadgeRam $TxtBadgeRam "SINGLE CHANNEL ($ramCapGB GB)" "danger"
        $TxtDescRam.Text = "Apenas 1 canal de memória detectado. Adicionar outro pente dobra a largura de banda da CPU."
    }

    # 7. Power Plan Check
    $powerScheme = powercfg /getactivescheme
    $isMaxPerf = ($powerScheme -match "Desempenho M|Ultimate|High")
    $global:DiagnosticState.Power = $isMaxPerf

    if ($isMaxPerf) {
        Set-BadgeColor $BadgePower $TxtBadgePower "DESEMPENHO MÁXIMO" "success"
        $TxtDescPower.Text = "Excelente! O gerenciador de energia do Windows mantém os clocks de resposta imediata sem economia de clock."
        $BtnAtivarPower.IsEnabled = $false
        $BtnAtivarPower.Content = "✅ Já Configurado"
        $BtnAtivarPower.Background = [Windows.Media.BrushConverter]::new().ConvertFromString("#334155")
    } else {
        Set-BadgeColor $BadgePower $TxtBadgePower "EQUILIBRADO / COMUM" "warning"
        $TxtDescPower.Text = "O Windows pode reduzir clocks dinamicamente para poupar energia, gerando pequenos micro-stutters."
        $BtnAtivarPower.IsEnabled = $true
        $BtnAtivarPower.Content = "⚡ Ativar Desempenho Máximo (1 Clique)"
        $BtnAtivarPower.Background = [Windows.Media.BrushConverter]::new().ConvertFromString("#10B981")
    }

    # 8. Disk Space & Storage Type Check (SSD vs HDD vs NVMe for the EXACT C: Drive)
    $cDrive = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'" -ErrorAction SilentlyContinue
    $diskFreeGB = [math]::Round(($cDrive.FreeSpace / 1GB), 1)
    $diskTotalGB = [math]::Round(($cDrive.Size / 1GB), 1)
    $diskPercentFree = [math]::Round((($cDrive.FreeSpace / $cDrive.Size) * 100), 1)

    # Associate C: partition directly to its physical drive (prevents picking secondary SATA drive)
    $cDisk = $null
    try {
        $cPart = Get-CimInstance Win32_LogicalDiskToPartition | Where-Object { $_.Dependent.DeviceID -eq 'C:' }
        if ($cPart) {
            $diskPart = Get-CimInstance Win32_DiskDriveToDiskPartition | Where-Object { $_.Dependent.DeviceID -eq $cPart.Antecedent.DeviceID }
            if ($diskPart) {
                $cDisk = Get-CimInstance Win32_DiskDrive | Where-Object { $_.DeviceID -eq $diskPart.Antecedent.DeviceID }
            }
        }
    } catch {}

    if (-not $cDisk) {
        $cDisk = Get-CimInstance Win32_DiskDrive | Select-Object -First 1
    }

    # Advanced Multi-Layer NVMe / SSD / HDD Detection
    $modelStr = "$($cDisk.Model)"
    $pnpStr = "$($cDisk.PNPDeviceID)"
    $interfaceStr = "$($cDisk.InterfaceType)"

    $isNVMe = ($pnpStr -match "NVME|VEN_NVME|DEV_NVME|PCI\\VEN" -or 
               $modelStr -match "NVMe|M\.2|PCIe|SN5\d\d|SN7\d\d|SN8\d\d|970\s*(?:EVO|PRO)|980|990|KC2500|KC3000|NM620|NM790|P3|P5|A2000|SX8200|S70|FireCuda|MP600|CS3030|VMD|Optane" -or
               $interfaceStr -match "NVMe")

    $isSSD = $isNVMe -or 
             ($modelStr -match "SSD|SATA SSD|EVO|BX500|MX500|A400|SU650|QVO|870|860|SanDisk|Solid State" -or
              $pnpStr -match "SSD|SOLID")

    if ($isNVMe) { $isSSD = $true }

    # Fallback to PhysicalDisk query if available
    if (-not $isSSD) {
        try {
            $phys = Get-PhysicalDisk | Where-Object { $_.FriendlyName -eq $cDisk.Model }
            if ($phys -and ($phys.MediaType -eq 'SSD' -or $phys.BusType -eq 'NVMe')) {
                $isSSD = $true
                if ($phys.BusType -eq 'NVMe') { $isNVMe = $true }
            }
        } catch {}
    }

    $driveTypeLabel = if ($isNVMe) { "NVMe M.2 SSD" } elseif ($isSSD) { "SATA SSD" } else { "HDD Mecânico" }

    $global:DiagnosticState.Storage = @{
        FreeGB = $diskFreeGB;
        TotalGB = $diskTotalGB;
        PercentFree = $diskPercentFree;
        IsSSD = $isSSD;
        IsNVMe = $isNVMe;
        DriveType = $driveTypeLabel;
        Model = $cDisk.Model
    }

    # 9. Universal Multi-GPU Shader Cache & Junk Scan (NVIDIA, AMD Radeon, Intel Arc & Windows)
    $junkBytes = 0
    $junkPaths = @(
        # NVIDIA Shader Caches
        (Join-Path $env:LOCALAPPDATA "NVIDIA\DXCache"),
        (Join-Path $env:LOCALAPPDATA "NVIDIA\GLCache"),
        (Join-Path $env:LOCALAPPDATA "D3DSCache"),
        # AMD Radeon Shader Caches
        (Join-Path $env:LOCALAPPDATA "AMD\DxCache"),
        (Join-Path $env:LOCALAPPDATA "AMD\GLCache"),
        (Join-Path $env:LOCALAPPDATA "AMD\D3DCache"),
        (Join-Path $env:LOCALAPPDATA "AMD\OglCache"),
        # Intel Arc Shader Caches
        (Join-Path $env:LOCALAPPDATA "Intel\ShaderCache"),
        (Join-Path $env:LOCALAPPDATA "Intel\DXCache"),
        # General & CrashDumps
        $env:TEMP,
        (Join-Path $env:LOCALAPPDATA "CrashDumps")
    )
    foreach ($p in $junkPaths) {
        if (Test-Path $p) {
            $junkBytes += (Get-ChildItem -Path $p -Recurse -File -Force -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum
        }
    }
    $junkMB = [math]::Round(($junkBytes / 1MB), 0)
    $global:DiagnosticState.JunkMB = $junkMB

    if ($junkMB -gt 5000) {
        $junkGB = [math]::Round(($junkMB / 1024), 1)
        Set-BadgeColor $BadgeLixo $TxtBadgeLixo "$junkGB GB ACUMULADOS" "danger"
        $TxtDescLixo.Text = "Muito lixo acumulado em caches de shaders antigos (NVIDIA/AMD/Intel) e temporários. Recomendado limpar para evitar stuttering."
    } elseif ($junkMB -gt 1000) {
        $junkGB = [math]::Round(($junkMB / 1024), 1)
        Set-BadgeColor $BadgeLixo $TxtBadgeLixo "$junkGB GB ENCONTRADOS" "warning"
        $TxtDescLixo.Text = "Caches de shaders de GPU e arquivos temporários podem ser esvaziados para liberar espaço no SSD."
    } else {
        Set-BadgeColor $BadgeLixo $TxtBadgeLixo "SISTEMA LIMPO ($junkMB MB)" "success"
        $TxtDescLixo.Text = "Seu SSD está livre de acúmulos pesados de shaders ou temporários."
    }

    # 10. Startup Bloat Check
    $startupApps = Get-CimInstance Win32_StartupCommand -ErrorAction SilentlyContinue
    $startupCount = $startupApps.Count
    $global:DiagnosticState.StartupCount = $startupCount

    if ($startupCount -gt 10) {
        Set-BadgeColor $BadgeStartup $TxtBadgeStartup "$startupCount APPS NO BOOT" "warning"
        $TxtDescStartup.Text = "Muitos programas iniciando com o Windows. Desative lançadores e utilitários que não usa diariamente."
    } else {
        Set-BadgeColor $BadgeStartup $TxtBadgeStartup "$startupCount APPS (LEVE)" "success"
        $TxtDescStartup.Text = "Poucos aplicativos iniciando com o sistema. O boot e os recursos em repouso estão preservados."
    }

    # 11. Monitor Refresh Rate (Hz) & Resolution Check
    $currentHz = 60
    $resX = 1920
    $resY = 1080
    try {
        $video = Get-CimInstance Win32_VideoController | Where-Object { $_.CurrentRefreshRate -gt 0 } | Select-Object -First 1
        if ($video) {
            $currentHz = [int]$video.CurrentRefreshRate
            if ($currentHz -eq 143) { $currentHz = 144 }
            if ($currentHz -eq 164) { $currentHz = 165 }
            if ($currentHz -eq 239) { $currentHz = 240 }
            $resX = [int]$video.CurrentHorizontalResolution
            $resY = [int]$video.CurrentVerticalResolution
        }
    } catch {}

    # Detect Max Supported Hz from EDID
    $maxHz = $currentHz
    try {
        $modes = Get-CimInstance -Namespace root\wmi -ClassName WmiMonitorListedSupportedSourceModes -ErrorAction SilentlyContinue
        if ($modes) {
            foreach ($m in $modes.MonitorSourceModes) {
                if ($m.VerticalRefreshRateDenominator -gt 0) {
                    $val = [math]::Round($m.VerticalRefreshRateNumerator / $m.VerticalRefreshRateDenominator)
                    if ($val -gt $maxHz) { $maxHz = $val }
                }
            }
        }
    } catch {}

    $isMonitorThrottled = ($maxHz -gt $currentHz -and ($maxHz - $currentHz) -ge 15)
    $global:DiagnosticState.Monitor = @{
        CurrentHz = $currentHz;
        MaxHz = $maxHz;
        ResX = $resX;
        ResY = $resY;
        IsThrottled = $isMonitorThrottled
    }

    if ($isMonitorThrottled) {
        Set-BadgeColor $BadgeMonitor $TxtBadgeMonitor "TRAVADO ($currentHz Hz)" "danger"
        $TxtDescMonitor.Text = "ALERTA: Seu monitor suporta até $maxHz Hz, mas o Windows está travado em $currentHz Hz! Clique abaixo para liberar a fluidez total."
    } elseif ($currentHz -ge 120) {
        Set-BadgeColor $BadgeMonitor $TxtBadgeMonitor "ALTA TAXA ($currentHz Hz)" "success"
        $TxtDescMonitor.Text = "Excelente! Monitor operando em alta fluidez ($currentHz Hz em ${resX}x${resY}) para menor latência."
    } else {
        Set-BadgeColor $BadgeMonitor $TxtBadgeMonitor "PADRÃO ($currentHz Hz)" "success"
        $TxtDescMonitor.Text = "Monitor operando na taxa nativa de $currentHz Hz em ${resX}x${resY}."
    }

    # 12. Windows Game Mode & Latency
    $gameModeActive = $true
    try {
        $gmVal = (Get-ItemProperty -Path 'HKCU:\Software\Microsoft\GameBar' -Name 'AutoGameModeEnabled' -ErrorAction SilentlyContinue).AutoGameModeEnabled
        if ($null -ne $gmVal -and $gmVal -eq 0) { $gameModeActive = $false }
    } catch {}

    $global:DiagnosticState.GameMode = $gameModeActive
    if ($gameModeActive) {
        Set-BadgeColor $BadgeGameMode $TxtBadgeGameMode "ATIVADO" "success"
        $TxtDescGameMode.Text = "O Windows prioriza processos de jogos e desativa tarefas secundárias durante a gameplay."
    } else {
        Set-BadgeColor $BadgeGameMode $TxtBadgeGameMode "DESATIVADO" "warning"
        $TxtDescGameMode.Text = "O Modo de Jogo está desligado. Recomenda-se ativar para garantir prioridade de CPU para os jogos."
    }

    # Update Tab 2: Individual Upgrade Advisor
    Update-UpgradeAdvisorTab

    # Update Tab 3: Success Checklist
    Update-ChecklistTab
}

# Function: Populate Tab 2 (Consultor de Upgrades & Avaliação Individual)
function Update-UpgradeAdvisorTab {
    $ContainerRecomendacoes.Children.Clear()

    # 1. Evaluate System Tier
    $cpuCores = $global:DiagnosticState.Cpu.Cores
    $ramGB = $global:DiagnosticState.RAM.Cap
    $isGpuIntegrated = $global:DiagnosticState.Gpu.IsIntegrated
    $gpuName = $global:DiagnosticState.Gpu.Name

    if ($isGpuIntegrated) {
        $TxtTierHardware.Text = "PC BÁSICO / ESPORTS"
        $BadgeTierHardware.Background = [Windows.Media.BrushConverter]::new().ConvertFromString("#D97706")
        $TxtNivelHardware.Text = "Hardware configurado para tarefas gerais e jogos leves/competitivos de entrada."
    } elseif ($cpuCores -ge 8 -and $ramGB -ge 32 -and ($gpuName -match "4070|4080|4090|4060|3080|7800|7900")) {
        $TxtTierHardware.Text = "ALTA PERFORMANCE GAMER"
        $BadgeTierHardware.Background = [Windows.Media.BrushConverter]::new().ConvertFromString("#065F46")
        $TxtNivelHardware.Text = "Configuração de alto nível para jogos em 1080p, 1440p e 4K competitivo."
    } elseif ($cpuCores -ge 6 -and $ramGB -ge 16) {
        $TxtTierHardware.Text = "INTERMEDIÁRIO GAMER"
        $BadgeTierHardware.Background = [Windows.Media.BrushConverter]::new().ConvertFromString("#4F46E5")
        $TxtNivelHardware.Text = "Configuração sólida e equilibrada para rodar a maioria dos jogos modernos em 1080p."
    } else {
        $TxtTierHardware.Text = "SETUP DE ENTRADA"
        $BadgeTierHardware.Background = [Windows.Media.BrushConverter]::new().ConvertFromString("#7C3AED")
        $TxtNivelHardware.Text = "Configuração funcional, mas que se beneficiará muito dos upgrades recomendados abaixo."
    }

    # 2. Build Dynamic Personalized Recommendations for THIS Specific PC
    $recs = [System.Collections.Generic.List[PSObject]]::new()

    # Dynamic Rule: RAM Capacity & Channel
    if ($ramGB -lt 16) {
        $recs.Add([PSCustomObject]@{
            Titulo = "UPGRADE DE MEMÓRIA: Aumentar para 16 GB ou mais"
            Categoria = "UPGRADE DE HARDWARE RECOMENDADO"
            Nivel = "danger"
            Desc = "Seu computador possui apenas $ramGB GB de RAM instalada. Jogos modernos exigem pelo menos 16 GB; menos que isso causa travamentos severos por falta de memória."
        })
    } elseif (-not $global:DiagnosticState.RAM.Dual) {
        $recs.Add([PSCustomObject]@{
            Titulo = "UPGRADE DE HARDWARE: Instalar um 2º pente de RAM (Dual Channel)"
            Categoria = "GANHO DE ATÉ 20-30% DE FPS EM JOGOS"
            Nivel = "danger"
            Desc = "Sua memória está operando em Canal Único (Single Channel). Adicionar um segundo módulo idêntico dobra a taxa de transferência com a CPU e elimina quedas bruscas de FPS."
        })
    } elseif ($global:DiagnosticState.RAM.Speed -lt 2933 -and $ramGB -ge 16) {
        $recs.Add([PSCustomObject]@{
            Titulo = "CONFIGURAÇÃO NA BIOS: Ativar perfil XMP/DOCP/EXPO da Memória"
            Categoria = "AJUSTE GRATUITO DE CONFIGURAÇÃO"
            Nivel = "warning"
            Desc = "Sua RAM está rodando a apenas $($global:DiagnosticState.RAM.Speed) MHz. Provavelmente seus módulos suportam velocidades maiores que podem ser ativadas ligando o XMP na BIOS."
        })
    } else {
        $recs.Add([PSCustomObject]@{
            Titulo = "MEMÓRIA RAM: Configuração Excelente ($ramGB GB @ $($global:DiagnosticState.RAM.Speed) MHz)"
            Categoria = "PONTO FORTE DO COMPUTADOR"
            Nivel = "success"
            Desc = "Seus módulos estão em Dual Channel de alta velocidade. Nenhuma necessidade de gastar com memória RAM neste computador."
        })
    }

    # Dynamic Rule: Resizable BAR / AMD SAM
    $gpuVen = $global:DiagnosticState.Gpu.Vendor
    if (-not $global:DiagnosticState.Rebar) {
        $rebarTitle = if ($gpuVen -eq "AMD") { "CONFIGURAÇÃO NA BIOS: Ativar o AMD Smart Access Memory (SAM)" } elseif ($gpuVen -eq "Intel") { "CONFIGURAÇÃO NA BIOS: Ativar o Resizable BAR da Intel Arc" } else { "CONFIGURAÇÃO NA BIOS: Ativar o Resizable BAR (ReBAR)" }
        $rebarDesc = if ($gpuVen -eq "AMD") { "Sua placa Radeon suporta AMD Smart Access Memory (SAM), mas está desligado na BIOS. Ativá-lo traz ganho imediato de 5% a 15% nos FPS mínimos." } elseif ($gpuVen -eq "Intel") { "Sua placa Intel Arc exige Resizable BAR para funcionar na velocidade máxima. Sem ele, a perda de FPS pode passar de 30%." } else { "Sua placa de vídeo suporta Resizable BAR, mas ele está desligado na BIOS. Ativá-lo permite que o processador envie texturas diretamente para a VRAM, estabilizando os FPS mínimos." }
        
        $recs.Add([PSCustomObject]@{
            Titulo = $rebarTitle
            Categoria = "AJUSTE DE ALTO IMPACTO (SEM CUSTO)"
            Nivel = "danger"
            Desc = $rebarDesc
        })
    } else {
        $rebarSuccessTitle = if ($gpuVen -eq "AMD") { "AMD SMART ACCESS MEMORY: SAM Ativado e Funcional" } else { "RESIZABLE BAR: Ativado e Operando em Capacidade Total" }
        $recs.Add([PSCustomObject]@{
            Titulo = $rebarSuccessTitle
            Categoria = "PONTO FORTE DO COMPUTADOR"
            Nivel = "success"
            Desc = "A CPU tem acesso direto e irrestrito à VRAM da sua placa de vídeo ($($global:DiagnosticState.BarTotal) MiB mapeados)."
        })
    }

    # Dynamic Rule: VBS / Core Isolation
    if ($global:DiagnosticState.VBS) {
        $recs.Add([PSCustomObject]@{
            Titulo = "SISTEMA: Desativar Isolamento do Núcleo (VBS) no Windows 11"
            Categoria = "RECUPERAÇÃO DE LATÊNCIA DA CPU"
            Nivel = "warning"
            Desc = "A camada de virtualização de segurança do Windows 11 está ativa, consumindo cerca de 3% a 8% do processamento em jogos. Pode ser desativada na aba Diagnóstico."
        })
    } else {
        $recs.Add([PSCustomObject]@{
            Titulo = "LATÊNCIA DE CPU: Isolamento de Núcleo Desativado"
            Categoria = "PONTO FORTE DO COMPUTADOR"
            Nivel = "success"
            Desc = "O processador opera com acesso direto ao hardware sem sobrecarga de máquina virtual do Windows."
        })
    }

    # Dynamic Rule: Storage (SSD vs HDD vs NVMe & Free Space)
    $storageInfo = $global:DiagnosticState.Storage
    if (-not $storageInfo.IsSSD) {
        $recs.Add([PSCustomObject]@{
            Titulo = "UPGRADE CRÍTICO: Migrar o Windows e Jogos para um SSD NVMe"
            Categoria = "O UPGRADE MAIS IMPORTANTE DESTE PC"
            Nivel = "danger"
            Desc = "Seu sistema está instalado em um disco mecânico ($($storageInfo.Model)). A troca por um SSD NVMe M.2 ou SATA reduzirá os tempos de carregamento em mais de 10x e acabará com travamentos de streaming de texturas."
        })
    } elseif ($storageInfo.PercentFree -lt 15) {
        $recs.Add([PSCustomObject]@{
            Titulo = "ALERTA DE ESPAÇO: Liberar Espaço no Drive C: ($($storageInfo.PercentFree)% livre)"
            Categoria = "PREVENÇÃO DE QUEDA DE DESEMPENHO NO SSD"
            Nivel = "danger"
            Desc = "Seu $($storageInfo.DriveType) possui menos de 15% de espaço livre. SSDs muito cheios sofrem com esgotamento de cache SLC, aumentando drasticamente o tempo de leitura e gravação."
        })
    } else {
        $nvmeLabel = if ($storageInfo.IsNVMe) { "SSD NVMe M.2 de Alta Velocidade" } else { "SSD SATA Rápido" }
        $recs.Add([PSCustomObject]@{
            Titulo = "ARMAZENAMENTO: $nvmeLabel ($($storageInfo.FreeGB) GB Livres)"
            Categoria = "PONTO FORTE DO COMPUTADOR"
            Nivel = "success"
            Desc = "Disco do sistema ($($storageInfo.Model) - $($storageInfo.DriveType)) operando com $($storageInfo.PercentFree)% de espaço livre. Carregamentos instantâneos e cache em estado ideal."
        })
    }

    # Dynamic Rule: PCIe 3.0 vs 8-Lane GPU
    if ($global:DiagnosticState.PcieWidth -le 8 -and $global:DiagnosticState.PcieGen -le 3 -and -not $isGpuIntegrated) {
        $recs.Add([PSCustomObject]@{
            Titulo = "UPGRADE FUTURO (OPCIONAL): Placa-Mãe com suporte a PCIe 4.0"
            Categoria = "DICA TÉCNICA DE LONGO PRAZO"
            Nivel = "info"
            Desc = "Sua placa de vídeo opera em PCIe 3.0 x8 devido ao chipset da placa-mãe. No futuro, migrar para uma placa-mãe PCIe 4.0 liberará o dobro de largura de banda para a GPU. Manter o Resizable BAR ativo compensa boa parte dessa diferença."
        })
    }

    # Dynamic Rule: Integrated GPU Alert
    if ($isGpuIntegrated) {
        $recs.Add([PSCustomObject]@{
            Titulo = "UPGRADE DE GPU: Adicionar Placa de Vídeo Dedicada"
            Categoria = "TRANSFORMAÇÃO COMPLETA PARA JOGOS"
            Nivel = "danger"
            Desc = "O computador está usando a GPU integrada do processador. Para jogar lançamentos com gráficos no alto a 60+ FPS, instalar uma placa dedicada (ex: RTX 4060 ou Radeon RX 6600) multiplicará o poder gráfico."
        })
    }

    # Dynamic Rule: Monitor Refresh Rate & High Hz Check
    $mon = $global:DiagnosticState.Monitor
    if ($mon.IsThrottled) {
        $recs.Add([PSCustomObject]@{
            Titulo = "MONITOR GAMER TRAVADO: Mudança de $($mon.CurrentHz) Hz para $($mon.MaxHz) Hz"
            Categoria = "CONFIGURAÇÃO GRATUITA DE ALTO IMPACTO"
            Nivel = "danger"
            Desc = "Seu monitor suporta $($mon.MaxHz) Hz, mas o Windows está configurado em apenas $($mon.CurrentHz) Hz! Você está recebendo menos da metade dos quadros reais que a sua tela consegue exibir. Clique no botão da aba Diagnóstico para mudar para $($mon.MaxHz) Hz imediatamente."
        })
    } elseif ($mon.CurrentHz -ge 120) {
        $recs.Add([PSCustomObject]@{
            Titulo = "MONITOR GAMER: Alta Taxa de Fluidez ($($mon.CurrentHz) Hz @ $($mon.ResX)x$($mon.ResY))"
            Categoria = "PONTO FORTE DO COMPUTADOR"
            Nivel = "success"
            Desc = "Sua tela está operando em alta taxa de atualização ($($mon.CurrentHz) Hz), entregando o menor tempo de resposta e fluidez máxima nos jogos."
        })
    } else {
        $recs.Add([PSCustomObject]@{
            Titulo = "MONITOR: Upgrade Futuro para Monitor Gamer 144Hz+"
            Categoria = "DICA DE UPGRADE VISUAL"
            Nivel = "info"
            Desc = "Seu monitor atual opera em $($mon.CurrentHz) Hz. Para jogos competitivos rápidos (FPS, tiro, corrida), a transição para um monitor de 144Hz ou superior é um dos upgrades visuais mais perceptíveis em fluidez."
        })
    }

    # Render Recommendations Cards
    foreach ($r in $recs) {
        $card = New-Object Windows.Controls.Border
        $card.Background = [Windows.Media.BrushConverter]::new().ConvertFromString("#1E2235")
        $card.CornerRadius = New-Object Windows.CornerRadius(10)
        $card.Padding = New-Object Windows.Thickness(18)
        $card.Margin = New-Object Windows.Thickness(0, 0, 0, 12)

        $grid = New-Object Windows.Controls.Grid
        $col0 = New-Object Windows.Controls.ColumnDefinition
        $col0.Width = New-Object Windows.GridLength(1, [Windows.GridUnitType]::Star)
        $col1 = New-Object Windows.Controls.ColumnDefinition
        $col1.Width = [Windows.GridLength]::Auto
        $grid.ColumnDefinitions.Add($col0)
        $grid.ColumnDefinitions.Add($col1)

        $stack = New-Object Windows.Controls.StackPanel
        $catTxt = New-Object Windows.Controls.TextBlock
        $catTxt.Text = $r.Categoria
        $catTxt.FontSize = 11
        $catTxt.FontWeight = "Bold"
        $catTxt.Margin = New-Object Windows.Thickness(0, 0, 0, 4)

        $titleTxt = New-Object Windows.Controls.TextBlock
        $titleTxt.Text = $r.Titulo
        $titleTxt.FontSize = 15
        $titleTxt.FontWeight = "Bold"
        $titleTxt.Foreground = [Windows.Media.BrushConverter]::new().ConvertFromString("#F8FAFC")
        $titleTxt.Margin = New-Object Windows.Thickness(0, 0, 0, 6)

        $descTxt = New-Object Windows.Controls.TextBlock
        $descTxt.Text = $r.Desc
        $descTxt.FontSize = 13
        $descTxt.Foreground = [Windows.Media.BrushConverter]::new().ConvertFromString("#94A3B8")
        $descTxt.TextWrapping = [Windows.TextWrapping]::Wrap

        $stack.Children.Add($catTxt)
        $stack.Children.Add($titleTxt)
        $stack.Children.Add($descTxt)
        [Windows.Controls.Grid]::SetColumn($stack, 0)
        $grid.Children.Add($stack)

        $badge = New-Object Windows.Controls.Border
        $badge.CornerRadius = New-Object Windows.CornerRadius(6)
        $badge.Padding = New-Object Windows.Thickness(12, 6)
        $badge.VerticalAlignment = [Windows.VerticalAlignment]::Top

        $badgeTxt = New-Object Windows.Controls.TextBlock
        $badgeTxt.FontWeight = "Bold"
        $badgeTxt.FontSize = 12

        switch ($r.Nivel) {
            "danger" {
                $badge.Background = [Windows.Media.BrushConverter]::new().ConvertFromString("#7F1D1D")
                $badgeTxt.Text = "🔴 PRIORIDADE ALTA"
                $badgeTxt.Foreground = [Windows.Media.BrushConverter]::new().ConvertFromString("#FCA5A5")
                $catTxt.Foreground = [Windows.Media.BrushConverter]::new().ConvertFromString("#F87171")
            }
            "warning" {
                $badge.Background = [Windows.Media.BrushConverter]::new().ConvertFromString("#78350F")
                $badgeTxt.Text = "🟡 AJUSTE RECOMENDADO"
                $badgeTxt.Foreground = [Windows.Media.BrushConverter]::new().ConvertFromString("#FCD34D")
                $catTxt.Foreground = [Windows.Media.BrushConverter]::new().ConvertFromString("#FBBF24")
            }
            "info" {
                $badge.Background = [Windows.Media.BrushConverter]::new().ConvertFromString("#1E3A8A")
                $badgeTxt.Text = "🔵 LONGO PRAZO"
                $badgeTxt.Foreground = [Windows.Media.BrushConverter]::new().ConvertFromString("#93C5FD")
                $catTxt.Foreground = [Windows.Media.BrushConverter]::new().ConvertFromString("#60A5FA")
            }
            default {
                $badge.Background = [Windows.Media.BrushConverter]::new().ConvertFromString("#065F46")
                $badgeTxt.Text = "🟢 PONTO FORTE"
                $badgeTxt.Foreground = [Windows.Media.BrushConverter]::new().ConvertFromString("#34D399")
                $catTxt.Foreground = [Windows.Media.BrushConverter]::new().ConvertFromString("#34D399")
            }
        }

        $badge.Child = $badgeTxt
        [Windows.Controls.Grid]::SetColumn($badge, 1)
        $grid.Children.Add($badge)

        $card.Child = $grid
        $ContainerRecomendacoes.Children.Add($card)
    }
}

# Function: Populate Tab 3 (Checklist de Sucesso)
function Update-ChecklistTab {
    $ContainerChecklist.Children.Clear()
    $totalChecks = 6
    $scoreCount = 0

    $items = @(
        @{
            Name = "Resizable BAR (Acesso Direto à Memória da GPU)"
            Success = $global:DiagnosticState.Rebar
            SuccessDesc = "ATIVADO - A CPU se comunica na velocidade máxima com a VRAM da placa de vídeo."
            FailDesc = "DESATIVADO - A placa está limitada a blocos de 256MB. Ative na BIOS (Above 4G Decoding + Re-Size BAR)."
        },
        @{
            Name = "Isolamento do Núcleo / VBS (Virtualização da CPU)"
            Success = (-not $global:DiagnosticState.VBS)
            SuccessDesc = "DESATIVADO - O processador opera sem sobrecarga de virtualização de segurança nos jogos."
            FailDesc = "ATIVADO - A camada de virtualização do Windows 11 pode estar custando 3% a 8% de FPS."
        },
        @{
            Name = "Frequência e Dual-Channel da Memória RAM"
            Success = ($global:DiagnosticState.RAM.Dual -and $global:DiagnosticState.RAM.Speed -ge 3000)
            SuccessDesc = "PERFEITO - 2 ou mais canais ativos com alta frequência ($($global:DiagnosticState.RAM.Speed) MHz)."
            FailDesc = "ATENÇÃO - Memória operando em baixa frequência ou em canal único."
        },
        @{
            Name = "Plano de Energia do Windows"
            Success = $global:DiagnosticState.Power
            SuccessDesc = "DESEMPENHO MÁXIMO - O Windows não reduz o clock do processador entre os frames."
            FailDesc = "EQUILIBRADO - Ative o plano de Desempenho Máximo para evitar micro-travamentos."
        },
        @{
            Name = "Caches e Shaders do SSD"
            Success = ($global:DiagnosticState.JunkMB -lt 5000)
            SuccessDesc = "LIMPO - Menos de 5GB de arquivos temporários e shaders acumulados."
            FailDesc = "ACÚMULO ELEVADO - Caches antigos de drivers de vídeo estão ocupando espaço precioso."
        },
        @{
            Name = "Taxa de Atualização do Monitor (Hz)"
            Success = (-not $global:DiagnosticState.Monitor.IsThrottled)
            SuccessDesc = "OTIMIZADO - Monitor operando na taxa máxima ($($global:DiagnosticState.Monitor.CurrentHz) Hz)."
            FailDesc = "TRAVADO - Monitor suporta $($global:DiagnosticState.Monitor.MaxHz) Hz mas está em $($global:DiagnosticState.Monitor.CurrentHz) Hz."
        }
    )

    foreach ($it in $items) {
        if ($it.Success) { $scoreCount++ }

        $card = New-Object Windows.Controls.Border
        $card.Background = [Windows.Media.BrushConverter]::new().ConvertFromString("#1E2235")
        $card.CornerRadius = New-Object Windows.CornerRadius(10)
        $card.Padding = New-Object Windows.Thickness(18)
        $card.Margin = New-Object Windows.Thickness(0, 0, 0, 12)

        $grid = New-Object Windows.Controls.Grid
        $col0 = New-Object Windows.Controls.ColumnDefinition
        $col0.Width = New-Object Windows.GridLength(1, [Windows.GridUnitType]::Star)
        $col1 = New-Object Windows.Controls.ColumnDefinition
        $col1.Width = [Windows.GridLength]::Auto
        $grid.ColumnDefinitions.Add($col0)
        $grid.ColumnDefinitions.Add($col1)

        $stack = New-Object Windows.Controls.StackPanel
        $title = New-Object Windows.Controls.TextBlock
        $title.Text = $it.Name
        $title.FontSize = 15
        $title.FontWeight = "Bold"
        $title.Foreground = [Windows.Media.BrushConverter]::new().ConvertFromString("#F8FAFC")
        $title.Margin = New-Object Windows.Thickness(0, 0, 0, 4)

        $desc = New-Object Windows.Controls.TextBlock
        if ($it.Success) {
            $desc.Text = $it.SuccessDesc
            $desc.Foreground = [Windows.Media.BrushConverter]::new().ConvertFromString("#10B981")
        } else {
            $desc.Text = $it.FailDesc
            $desc.Foreground = [Windows.Media.BrushConverter]::new().ConvertFromString("#F87171")
        }
        $desc.FontSize = 13

        $stack.Children.Add($title)
        $stack.Children.Add($desc)
        [Windows.Controls.Grid]::SetColumn($stack, 0)
        $grid.Children.Add($stack)

        $badge = New-Object Windows.Controls.Border
        $badge.CornerRadius = New-Object Windows.CornerRadius(6)
        $badge.Padding = New-Object Windows.Thickness(12, 6)

        $badgeTxt = New-Object Windows.Controls.TextBlock
        if ($it.Success) {
            $badge.Background = [Windows.Media.BrushConverter]::new().ConvertFromString("#065F46")
            $badgeTxt.Text = "✅ CONCLUÍDO"
            $badgeTxt.Foreground = [Windows.Media.BrushConverter]::new().ConvertFromString("#34D399")
        } else {
            $badge.Background = [Windows.Media.BrushConverter]::new().ConvertFromString("#7F1D1D")
            $badgeTxt.Text = "⚠️ PENDENTE"
            $badgeTxt.Foreground = [Windows.Media.BrushConverter]::new().ConvertFromString("#FCA5A5")
        }
        $badgeTxt.FontWeight = "Bold"
        $badgeTxt.FontSize = 12

        $badge.Child = $badgeTxt
        [Windows.Controls.Grid]::SetColumn($badge, 1)
        $grid.Children.Add($badge)

        $card.Child = $grid
        $ContainerChecklist.Children.Add($card)
    }

    $pct = [math]::Round(($scoreCount / $totalChecks) * 100, 0)
    $TxtScoreNumero.Text = "$pct%"
    if ($pct -eq 100) {
        $TxtScoreGeral.Text = "Sensacional! Seu computador está 100% otimizado e rodando no limite máximo do hardware."
        $BadgeScoreGeral.Background = [Windows.Media.BrushConverter]::new().ConvertFromString("#065F46")
        $TxtScoreNumero.Foreground = [Windows.Media.BrushConverter]::new().ConvertFromString("#34D399")
    } elseif ($pct -ge 70) {
        $TxtScoreGeral.Text = "O PC está muito bom, mas ainda há $($totalChecks - $scoreCount) otimizações que podem liberar mais FPS."
        $BadgeScoreGeral.Background = [Windows.Media.BrushConverter]::new().ConvertFromString("#78350F")
        $TxtScoreNumero.Foreground = [Windows.Media.BrushConverter]::new().ConvertFromString("#FBBF24")
    } else {
        $TxtScoreGeral.Text = "Atenção: Seu hardware está sofrendo gargalos de configuração que reduzem o desempenho em jogos."
        $BadgeScoreGeral.Background = [Windows.Media.BrushConverter]::new().ConvertFromString("#7F1D1D")
        $TxtScoreNumero.Foreground = [Windows.Media.BrushConverter]::new().ConvertFromString("#F87171")
    }
}

# EVENT HANDLERS

# Button: Reexaminar PC
$BtnReescanear.Add_Click({
    Run-AuditScan
})

# Button: Guia Resizable BAR
$BtnGuiaRebar.Add_Click({
    [System.Windows.MessageBox]::Show(
@"
=== GUIA PARA ATIVAR O RESIZABLE BAR / AMD SAM NA BIOS ===

• NVIDIA: Resizable BAR (ReBAR)
• AMD Radeon: Smart Access Memory (SAM)
• Intel: Intel Arc Resizable BAR

PASSO A PASSO NA BIOS:
1. Reinicie o computador e fique pressionando 'Del' ou 'F2' para entrar na BIOS.
2. Certifique-se de que o CSM está DESATIVADO (Boot -> CSM -> Disabled).
3. Localize as opções da GPU:
   • ASUS: Advanced -> PCI Subsystem Settings
     - Above 4G Decoding: Enabled
     - Re-Size BAR Support: Auto ou Enabled
   • GIGABYTE: Settings -> IO Ports
     - Above 4G Decoding: Enabled
     - Re-Size BAR: Auto
   • MSI: Settings -> Advanced -> PCIe Subsystem Settings
     - Above 4G Decoding: Enabled
     - Re-Size BAR: Enabled
   • ASROCK: Advanced -> Chipset Configuration
     - Above 4G Decoding: Enabled
     - Re-Size BAR: Enabled
4. Pressione F10 para salvar e reiniciar.

Ao voltar para o Windows, abra este programa e clique em 'Reexaminar PC'!
"@, "Como Ativar Resizable BAR / AMD SAM", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Information)
})

# Button: Abrir VBS / Isolamento do Núcleo
$BtnAbrirVbs.Add_Click({
    Start-Process "windowsdefender://coreisolation"
})

# Button: Informações da RAM
$BtnInfoRam.Add_Click({
    $ramInfo = Get-CimInstance Win32_PhysicalMemory | Select-Object DeviceLocator, Manufacturer, PartNumber, Speed, ConfiguredClockSpeed | Out-String
    [System.Windows.MessageBox]::Show("=== DETALHES DOS MÓDULOS DE MEMÓRIA RAM ===`n`n$ramInfo", "Memória RAM", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Information)
})

# Button: Ativar Desempenho Máximo
$BtnAtivarPower.Add_Click({
    try {
        # Duplicates ultimate performance scheme if not present
        powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 2>$null
        $schemes = powercfg /list
        $guid = $null
        foreach ($line in $schemes) {
            if ($line -match "([a-f0-9\-]{36})\s+\((?:Desempenho M|Ultimate)") {
                $guid = $matches[1]
                break
            }
        }
        if ($guid) {
            powercfg /setactive $guid
            [System.Windows.MessageBox]::Show("Plano de Desempenho Máximo ativado com sucesso!", "Sucesso", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Information)
        } else {
            powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
            [System.Windows.MessageBox]::Show("Plano de Alto Desempenho ativado com sucesso!", "Sucesso", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Information)
        }
        Run-AuditScan
    } catch {
        [System.Windows.MessageBox]::Show("Erro ao alterar plano de energia: $_", "Erro", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Error)
    }
})

# Button: Limpar Caches com Segurança
$BtnLimparTudo.Add_Click({
    $confirm = [System.Windows.MessageBox]::Show(
        "Deseja limpar os arquivos temporários e caches de shaders acumulados (NVIDIA, AMD Radeon e Intel Arc)?`n`nIsso liberará espaço no SSD e garantirá que apenas shaders limpos sejam compilados pelos jogos.",
        "Confirmar Limpeza Universal de Caches",
        [System.Windows.MessageBoxButton]::YesNo,
        [System.Windows.MessageBoxImage]::Question
    )
    if ($confirm -eq [System.Windows.MessageBoxResult]::Yes) {
        $freed = 0
        $pathsToClean = @(
            # NVIDIA
            (Join-Path $env:LOCALAPPDATA "NVIDIA\DXCache"),
            (Join-Path $env:LOCALAPPDATA "NVIDIA\GLCache"),
            (Join-Path $env:LOCALAPPDATA "D3DSCache"),
            # AMD Radeon
            (Join-Path $env:LOCALAPPDATA "AMD\DxCache"),
            (Join-Path $env:LOCALAPPDATA "AMD\GLCache"),
            (Join-Path $env:LOCALAPPDATA "AMD\D3DCache"),
            (Join-Path $env:LOCALAPPDATA "AMD\OglCache"),
            # Intel Arc
            (Join-Path $env:LOCALAPPDATA "Intel\ShaderCache"),
            (Join-Path $env:LOCALAPPDATA "Intel\DXCache"),
            # Windows & CrashDumps
            $env:TEMP,
            (Join-Path $env:LOCALAPPDATA "CrashDumps")
        )
        foreach ($p in $pathsToClean) {
            if (Test-Path $p) {
                Get-ChildItem -Path $p -Recurse -File -ErrorAction SilentlyContinue | ForEach-Object {
                    try {
                        $len = $_.Length
                        Remove-Item $_.FullName -Force -ErrorAction Stop
                        $freed += $len
                    } catch {}
                }
            }
        }
        $freedGB = [math]::Round(($freed / 1GB), 2)
        [System.Windows.MessageBox]::Show("Limpeza concluída! Foram liberados $freedGB GB de espaço no seu SSD.", "Limpeza Concluída", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Information)
        Run-AuditScan
    }
})

# Button: Abrir Inicialização do Windows
$BtnGerenciadorTarefas.Add_Click({
    Start-Process "taskmgr.exe"
})

# Button: Abrir Configurações de Tela (Taxa de Hz)
$BtnAjustarMonitor.Add_Click({
    Start-Process "ms-settings:display-advanced"
})

# Button: Abrir Configurações de Modo de Jogo
$BtnConfigGameMode.Add_Click({
    Start-Process "ms-settings:gaming-gamemode"
})

# Initial Scan on launch
$window.Add_Loaded({
    Run-AuditScan
})

# Display Window
$window.ShowDialog() | Out-Null
