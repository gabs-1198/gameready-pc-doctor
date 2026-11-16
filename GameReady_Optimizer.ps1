<#
.SYNOPSIS
    GameReady PC Doctor - Otimizador e Verificador de Performance para Jogos
    Compatível com Windows 10 e Windows 11 (PowerShell 5.1 e 7+)
    Autor: Gabriel Lopes (https://github.com/gabs-1198)
#>

Add-Type -AssemblyName PresentationFramework, PresentationCore, WindowsBase, System.Drawing

[xml]$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="GameReady PC Doctor - Otimizador e Verificador Gamer" 
        Height="820" Width="1020" 
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
            <Setter Property="Padding" Value="20,10"/>
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
                            <TextBlock Text="OPEN SOURCE" FontSize="11" FontWeight="Bold" Foreground="#042F2E"/>
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
                        <Border Grid.Row="2" Grid.Column="0" Background="#1E2235" CornerRadius="12" Padding="18" Margin="0,0,10,0">
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
                        <Border Grid.Row="2" Grid.Column="1" Background="#1E2235" CornerRadius="12" Padding="18" Margin="10,0,0,0">
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
                    </Grid>
                </ScrollViewer>
            </TabItem>

            <!-- TAB 2: VERIFICADOR DE SUCESSO -->
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

# Tab 2 Checklist
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

# Function: Run Audit Scan
function Run-AuditScan {
    $TxtSpecs.Text = "Analisando hardware e configurações do sistema..."

    # 1. CPU & GPU & Motherboard
    $cpu = Get-CimInstance Win32_Processor | Select-Object -First 1 Name
    $gpu = Get-CimInstance Win32_VideoController | Select-Object -First 1 Name
    $board = Get-CimInstance Win32_BaseBoard | Select-Object -First 1 Manufacturer, Product
    $TxtSpecs.Text = "$($cpu.Name.Trim()) | $($gpu.Name) | Motherboard: $($board.Manufacturer) $($board.Product)"

    # 2. Resizable BAR Check
    $rebarActive = $false
    $barTotal = 0
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
    } catch {}

    $global:DiagnosticState.Rebar = $rebarActive
    if ($rebarActive) {
        Set-BadgeColor $BadgeRebar $TxtBadgeRebar "ATIVADO ($barTotal MiB)" "success"
        $TxtDescRebar.Text = "Excelente! A CPU acessa toda a VRAM da sua GPU sem gargalo de barramento."
        $BtnGuiaRebar.IsEnabled = $false
        $BtnGuiaRebar.Content = "✅ ReBAR Ativo e Funcional"
    } else {
        Set-BadgeColor $BadgeRebar $TxtBadgeRebar "DESATIVADO" "danger"
        $TxtDescRebar.Text = "Sua placa de vídeo está transferindo dados em blocos pequenos de 256MB. Ative na BIOS para ganho imediato de FPS."
        $BtnGuiaRebar.IsEnabled = $true
        $BtnGuiaRebar.Content = "📘 Como Ativar na BIOS"
    }

    # 3. VBS / Core Isolation Check
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

    # 4. RAM Check (Speed and Dual Channel)
    $ramModules = Get-CimInstance Win32_PhysicalMemory -ErrorAction SilentlyContinue
    $ramCount = $ramModules.Count
    $ramSpeed = ($ramModules | Select-Object -First 1).ConfiguredClockSpeed
    $ramCapGB = [math]::Round((($ramModules | Measure-Object -Property Capacity -Sum).Sum / 1GB), 0)

    $ramDual = ($ramCount -ge 2)
    $global:DiagnosticState.RAM = @{ Speed = $ramSpeed; Dual = $ramDual; Cap = $ramCapGB }

    if ($ramDual -and $ramSpeed -ge 3200) {
        Set-BadgeColor $BadgeRam $TxtBadgeRam "OTIMIZADA ($ramCapGB GB @ $ramSpeed MHz)" "success"
        $TxtDescRam.Text = "Dual Channel ativo e frequência XMP/DOCP configurada em alta velocidade ($ramSpeed MHz)."
    } elseif ($ramDual) {
        Set-BadgeColor $BadgeRam $TxtBadgeRam "DUAL-CHANNEL ($ramSpeed MHz)" "warning"
        $TxtDescRam.Text = "Dual Channel ativo, mas confira na BIOS se o perfil XMP/DOCP para frequências maiores está disponível."
    } else {
        Set-BadgeColor $BadgeRam $TxtBadgeRam "SINGLE CHANNEL" "danger"
        $TxtDescRam.Text = "Apenas 1 canal de memória detectado. Adicionar outro pente dobra a largura de banda da CPU."
    }

    # 5. Power Plan Check
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

    # 6. Disk Junk & Shaders Scan (Using 100% Dynamic Portable Paths)
    $junkBytes = 0
    $junkPaths = @(
        (Join-Path $env:LOCALAPPDATA "NVIDIA\DXCache"),
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
        $TxtDescLixo.Text = "Muito lixo acumulado em caches antigos da NVIDIA e temporários. Recomendado limpar para evitar travamentos de shaders."
    } elseif ($junkMB -gt 1000) {
        $junkGB = [math]::Round(($junkMB / 1024), 1)
        Set-BadgeColor $BadgeLixo $TxtBadgeLixo "$junkGB GB ENCONTRADOS" "warning"
        $TxtDescLixo.Text = "Caches e arquivos temporários podem ser esvaziados para liberar espaço no SSD."
    } else {
        Set-BadgeColor $BadgeLixo $TxtBadgeLixo "SISTEMA LIMPO ($junkMB MB)" "success"
        $TxtDescLixo.Text = "Seu SSD está livre de acúmulos pesados de shaders ou temporários."
    }

    # 7. Startup Bloat Check
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

    # Update Tab 2 Checklist
    Update-ChecklistTab
}

# Function: Populate Tab 2 (Checklist de Sucesso)
function Update-ChecklistTab {
    $ContainerChecklist.Children.Clear()
    $totalChecks = 5
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
            Success = ($global:DiagnosticState.RAM.Dual -and $global:DiagnosticState.RAM.Speed -ge 3200)
            SuccessDesc = "PERFEITO - 2 ou mais canais ativos com perfil XMP/DOCP em alta frequência ($($global:DiagnosticState.RAM.Speed) MHz)."
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
        $TxtScoreGeral.Text = "O PC está muito bom, mas ainda há $totalChecks - $scoreCount otimizações que podem liberar mais FPS."
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
=== GUIA RÁPIDO PARA ATIVAR O RESIZABLE BAR NA BIOS ===

1. Reinicie o computador e fique pressionando 'Del' ou 'F2' para entrar na BIOS.
2. Certifique-se de que o CSM está DESATIVADO (Boot -> CSM -> Disabled).
3. Localize as opções da GPU:
   • ASUS: Advanced -> PCI Subsystem Settings
     - Above 4G Decoding: Enabled
     - Re-Size BAR Support: Auto ou Enabled
   • GIGABYTE: Settings -> IO Ports -> Above 4G Decoding (Enabled) e Re-Size BAR (Auto)
   • MSI: Settings -> Advanced -> PCIe Subsystem Settings -> Re-Size BAR (Enabled)
   • ASROCK: Advanced -> Chipset Configuration -> Re-Size BAR (Enabled)
4. Pressione F10 para salvar e reiniciar.

Ao voltar para o Windows, abra este programa e clique em 'Reexaminar PC'!
"@, "Como Ativar o Resizable BAR", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Information)
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
        "Deseja limpar os arquivos temporários e o cache acumulado de shaders da NVIDIA (DXCache)?`n`nIsso liberará espaço em disco e garantirá que apenas shaders atualizados sejam compilados pelos jogos.",
        "Confirmar Limpeza",
        [System.Windows.MessageBoxButton]::YesNo,
        [System.Windows.MessageBoxImage]::Question
    )
    if ($confirm -eq [System.Windows.MessageBoxResult]::Yes) {
        $freed = 0
        $pathsToClean = @(
            (Join-Path $env:LOCALAPPDATA "NVIDIA\DXCache"),
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

# Initial Scan on launch
$window.Add_Loaded({
    Run-AuditScan
})

# Display Window
$window.ShowDialog() | Out-Null
