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
                <StackPanel Grid.Column="1" Orientation="Horizontal">
                    <Button Name="BtnRestauracao" Content="🛡️ Ponto de Restauração" Background="#334155" Margin="0,0,10,0" Height="40" Padding="12,8"/>
                    <Button Name="BtnLaudo" Content="📄 Gerar Laudo Técnico" Background="#065F46" Margin="0,0,10,0" Height="40" Padding="12,8"/>
                    <Button Name="BtnReescanear" Content="🔄 Reexaminar PC" Background="#2A3048" Width="135" Height="40"/>
                </StackPanel>
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
                                    <TextBlock Text="🎮 Modo de Jogo &amp; Precisão 1:1" FontSize="16" FontWeight="Bold" Foreground="White"/>
                                    <Border Name="BadgeGameMode" HorizontalAlignment="Right" Background="#334155" CornerRadius="6" Padding="8,3">
                                        <TextBlock Name="TxtBadgeGameMode" Text="Checando..." FontSize="12" FontWeight="Bold" Foreground="White"/>
                                    </Border>
                                </Grid>
                                <TextBlock Name="TxtDescGameMode" Text="Verificando se o Modo de Jogo está ativo e aceleração do mouse desativada..." TextWrapping="Wrap" Foreground="#94A3B8" FontSize="12" Margin="0,0,0,14" Height="42"/>
                                <Grid>
                                    <Grid.ColumnDefinitions>
                                        <ColumnDefinition Width="*"/>
                                        <ColumnDefinition Width="*"/>
                                    </Grid.ColumnDefinitions>
                                    <Button Grid.Column="0" Name="BtnConfigGameMode" Content="🎮 Modo de Jogo" Background="#334155" Margin="0,0,5,0"/>
                                    <Button Grid.Column="1" Name="BtnMouseFix" Content="🎯 Mira 1:1 (Mouse)" Background="#334155" Margin="5,0,0,0"/>
                                </Grid>
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

            <!-- TAB 4: RIOT VANGUARD & VALORANT DOCTOR -->
            <TabItem Header="🛡️ Riot Vanguard">
                <ScrollViewer VerticalScrollBarVisibility="Auto" Margin="0,15,0,0">
                    <StackPanel>
                        <!-- Top Header Banner for Vanguard -->
                        <Border Background="#1E2235" CornerRadius="12" Padding="20" Margin="0,0,0,18">
                            <Grid>
                                <Grid.ColumnDefinitions>
                                    <ColumnDefinition Width="*"/>
                                    <ColumnDefinition Width="Auto"/>
                                </Grid.ColumnDefinitions>
                                <StackPanel Grid.Column="0">
                                    <StackPanel Orientation="Horizontal" Margin="0,0,0,6">
                                        <TextBlock Text="🛡️ Auditoria de Compatibilidade Riot Vanguard" FontSize="18" FontWeight="Bold" Foreground="#38BDF8"/>
                                        <Border Background="#EF4444" CornerRadius="6" Padding="8,2" Margin="10,2,0,2">
                                            <TextBlock Text="VALORANT &amp; LOL" FontSize="11" FontWeight="Bold" Foreground="White"/>
                                        </Border>
                                    </StackPanel>
                                    <TextBlock Name="TxtVanguardOverall" Text="Analisando requisitos do anti-cheat de kernel da Riot Games..." FontSize="13" Foreground="#94A3B8"/>
                                </StackPanel>
                                <Border Grid.Column="1" Name="BadgeVanguardOverall" Background="#10B981" CornerRadius="8" Padding="16,8">
                                    <TextBlock Name="TxtBadgeVanguardOverall" Text="COMPATÍVEL" FontSize="13" FontWeight="Bold" Foreground="#042F2E"/>
                                </Border>
                            </Grid>
                        </Border>

                        <!-- Vanguard Grid Cards -->
                        <Grid>
                            <Grid.RowDefinitions>
                                <RowDefinition Height="Auto"/>
                                <RowDefinition Height="Auto"/>
                            </Grid.RowDefinitions>
                            <Grid.ColumnDefinitions>
                                <ColumnDefinition Width="*"/>
                                <ColumnDefinition Width="*"/>
                            </Grid.ColumnDefinitions>

                            <!-- Card 1: TPM 2.0 -->
                            <Border Grid.Row="0" Grid.Column="0" Background="#1E2235" CornerRadius="12" Padding="18" Margin="0,0,10,14">
                                <StackPanel>
                                    <Grid Margin="0,0,0,10">
                                        <TextBlock Text="🔒 TPM 2.0 (Erro VAN 9001)" FontSize="15" FontWeight="Bold" Foreground="White"/>
                                        <Border Name="BadgeTpm" HorizontalAlignment="Right" Background="#334155" CornerRadius="6" Padding="8,3">
                                            <TextBlock Name="TxtBadgeTpm" Text="Checando..." FontSize="12" FontWeight="Bold" Foreground="White"/>
                                        </Border>
                                    </Grid>
                                    <TextBlock Name="TxtDescTpm" Text="O Valorant e o LoL no Windows 11 exigem o chip de segurança TPM 2.0 ativo na BIOS." TextWrapping="Wrap" Foreground="#94A3B8" FontSize="12" Margin="0,0,0,14" Height="42"/>
                                    <Button Name="BtnGuiaTpm" Content="📘 Como Ativar TPM na BIOS" Background="#334155"/>
                                </StackPanel>
                            </Border>

                            <!-- Card 2: Secure Boot -->
                            <Border Grid.Row="0" Grid.Column="1" Background="#1E2235" CornerRadius="12" Padding="18" Margin="10,0,0,14">
                                <StackPanel>
                                    <Grid Margin="0,0,0,10">
                                        <TextBlock Text="🛡️ Secure Boot (Erro VAN 9003)" FontSize="15" FontWeight="Bold" Foreground="White"/>
                                        <Border Name="BadgeSecureBoot" HorizontalAlignment="Right" Background="#334155" CornerRadius="6" Padding="8,3">
                                            <TextBlock Name="TxtBadgeSecureBoot" Text="Checando..." FontSize="12" FontWeight="Bold" Foreground="White"/>
                                        </Border>
                                    </Grid>
                                    <TextBlock Name="TxtDescSecureBoot" Text="A Inicialização Segura impede que cheats se instalem antes do Windows iniciar." TextWrapping="Wrap" Foreground="#94A3B8" FontSize="12" Margin="0,0,0,14" Height="42"/>
                                    <Button Name="BtnGuiaSecureBoot" Content="📘 Como Ativar Secure Boot" Background="#334155"/>
                                </StackPanel>
                            </Border>

                            <!-- Card 3: Serviço VGC -->
                            <Border Grid.Row="1" Grid.Column="0" Background="#1E2235" CornerRadius="12" Padding="18" Margin="0,0,10,0">
                                <StackPanel>
                                    <Grid Margin="0,0,0,10">
                                        <TextBlock Text="⚙️ Serviço VGC (Erro VAN 1067 / 84)" FontSize="15" FontWeight="Bold" Foreground="White"/>
                                        <Border Name="BadgeVgc" HorizontalAlignment="Right" Background="#334155" CornerRadius="6" Padding="8,3">
                                            <TextBlock Name="TxtBadgeVgc" Text="Checando..." FontSize="12" FontWeight="Bold" Foreground="White"/>
                                        </Border>
                                    </Grid>
                                    <TextBlock Name="TxtDescVgc" Text="O serviço de sistema do Vanguard deve iniciar automaticamente com o Windows." TextWrapping="Wrap" Foreground="#94A3B8" FontSize="12" Margin="0,0,0,14" Height="42"/>
                                    <Button Name="BtnFixVgc" Content="⚡ Configurar VGC como Automático" Background="#10B981"/>
                                </StackPanel>
                            </Border>

                            <!-- Card 4: Integridade do Windows (Testsigning) -->
                            <Border Grid.Row="1" Grid.Column="1" Background="#1E2235" CornerRadius="12" Padding="18" Margin="10,0,0,0">
                                <StackPanel>
                                    <Grid Margin="0,0,0,10">
                                        <TextBlock Text="📜 Assinatura de Drivers (Erro VAN 128)" FontSize="15" FontWeight="Bold" Foreground="White"/>
                                        <Border Name="BadgeTestSigning" HorizontalAlignment="Right" Background="#334155" CornerRadius="6" Padding="8,3">
                                            <TextBlock Name="TxtBadgeTestSigning" Text="Checando..." FontSize="12" FontWeight="Bold" Foreground="White"/>
                                        </Border>
                                    </Grid>
                                    <TextBlock Name="TxtDescTestSigning" Text="Verificando se o modo de testes de drivers não assinados está desligado." TextWrapping="Wrap" Foreground="#94A3B8" FontSize="12" Margin="0,0,0,14" Height="42"/>
                                    <Button Name="BtnFixIntegrity" Content="⚡ Reparar Integridade do Boot" Background="#334155"/>
                                </StackPanel>
                            </Border>
                        </Grid>
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
$BtnRestauracao = $window.FindName("BtnRestauracao")
$BtnLaudo = $window.FindName("BtnLaudo")

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
$BtnMouseFix = $window.FindName("BtnMouseFix")

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

# Tab 4 Riot Vanguard & Valorant Doctor
$TxtVanguardOverall = $window.FindName("TxtVanguardOverall")
$BadgeVanguardOverall = $window.FindName("BadgeVanguardOverall")
$TxtBadgeVanguardOverall = $window.FindName("TxtBadgeVanguardOverall")
$BadgeTpm = $window.FindName("BadgeTpm")
$TxtBadgeTpm = $window.FindName("TxtBadgeTpm")
$TxtDescTpm = $window.FindName("TxtDescTpm")
$BtnGuiaTpm = $window.FindName("BtnGuiaTpm")
$BadgeSecureBoot = $window.FindName("BadgeSecureBoot")
$TxtBadgeSecureBoot = $window.FindName("TxtBadgeSecureBoot")
$TxtDescSecureBoot = $window.FindName("TxtDescSecureBoot")
$BtnGuiaSecureBoot = $window.FindName("BtnGuiaSecureBoot")
$BadgeVgc = $window.FindName("BadgeVgc")
$TxtBadgeVgc = $window.FindName("TxtBadgeVgc")
$TxtDescVgc = $window.FindName("TxtDescVgc")
$BtnFixVgc = $window.FindName("BtnFixVgc")
$BadgeTestSigning = $window.FindName("BadgeTestSigning")
$TxtBadgeTestSigning = $window.FindName("TxtBadgeTestSigning")
$TxtDescTestSigning = $window.FindName("TxtDescTestSigning")
$BtnFixIntegrity = $window.FindName("BtnFixIntegrity")

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
    $gpuTemp = $null
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
            $tRaw = nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits 2>$null
            if ($tRaw) { $gpuTemp = [math]::Round([double]$tRaw.Trim(), 0) }
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
    $global:DiagnosticState.Gpu = @{ Name = $gpuName; Vendor = $gpuVendor; TechName = $rebarTechName; IsIntegrated = $isIntegratedGpu; Temp = $gpuTemp }
    $global:DiagnosticState.Motherboard = $boardInfo

    $tempStr = if ($gpuTemp) { " | Temp GPU: $gpuTemp °C" } else { "" }
    $TxtSpecs.Text = "$cpuName | $gpuName$tempStr | Placa-Mãe: $boardInfo"

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

    # Mouse Acceleration & Input Lag Check
    $mouseAccelOff = $true
    try {
        $mSpeed = (Get-ItemProperty -Path 'HKCU:\Control Panel\Mouse' -Name 'MouseSpeed' -ErrorAction SilentlyContinue).MouseSpeed
        if ($mSpeed -and $mSpeed -ne "0") { $mouseAccelOff = $false }
    } catch {}

    $hagsActive = $false
    try {
        $hVal = (Get-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers' -Name 'HwSchMode' -ErrorAction SilentlyContinue).HwSchMode
        if ($hVal -eq 2) { $hagsActive = $true }
    } catch {}

    $global:DiagnosticState.GameMode = $gameModeActive
    $global:DiagnosticState.MouseAccelOff = $mouseAccelOff
    $global:DiagnosticState.HAGS = $hagsActive

    if ($gameModeActive -and $mouseAccelOff) {
        Set-BadgeColor $BadgeGameMode $TxtBadgeGameMode "OTIMIZADO" "success"
        $TxtDescGameMode.Text = "Modo de Jogo ativo e mira 1:1 calibrada sem aceleração artificial no ponteiro."
    } elseif ($gameModeActive) {
        Set-BadgeColor $BadgeGameMode $TxtBadgeGameMode "MIRA ACELERADA" "warning"
        $TxtDescGameMode.Text = "Modo de Jogo ativo, mas a aceleração do mouse está ligada. Clique em 'Mira 1:1' para desligar."
    } else {
        Set-BadgeColor $BadgeGameMode $TxtBadgeGameMode "DESATIVADO" "warning"
        $TxtDescGameMode.Text = "O Modo de Jogo está desligado. Recomenda-se ativar para garantir prioridade de CPU para os jogos."
    }

    # Update Tab 2: Individual Upgrade Advisor
    Update-UpgradeAdvisorTab

    # Update Tab 3: Success Checklist
    Update-ChecklistTab

    # Update Tab 4: Riot Vanguard & Valorant Doctor
    Update-VanguardTab
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

    # Dynamic Rule: GPU Thermal Health
    $gTemp = $global:DiagnosticState.Gpu.Temp
    if ($gTemp -and $gTemp -ge 75) {
        $recs.Add([PSCustomObject]@{
            Titulo = "ALERTA TÉRMICO CRÍTICO: GPU Operando a $gTemp °C"
            Categoria = "MANUTENÇÃO FÍSICA URGENTE"
            Nivel = "danger"
            Desc = "Sua placa de vídeo está a $gTemp °C em repouso/carga leve. Superaquecimento causa Thermal Throttling severo (queda abrupta de FPS). Realize limpeza física de poeira e substituição da pasta térmica."
        })
    } elseif ($gTemp -and $gTemp -ge 60) {
        $recs.Add([PSCustomObject]@{
            Titulo = "AVISO TÉRMICO: Temperatura da GPU Elevada ($gTemp °C em Repouso)"
            Categoria = "MANUTENÇÃO RECOMENDADA"
            Nivel = "warning"
            Desc = "A placa de vídeo está com temperatura moderadamente alta em repouso ($gTemp °C). Verifique o fluxo de ar do gabinete e a rotação dos coolers."
        })
    } elseif ($gTemp) {
        $recs.Add([PSCustomObject]@{
            Titulo = "SAÚDE TÉRMICA: Temperatura Normal da GPU ($gTemp °C)"
            Categoria = "PONTO FORTE DO COMPUTADOR"
            Nivel = "success"
            Desc = "A placa de vídeo opera em faixa térmica segura e refrigerada, sem risco de thermal throttling."
        })
    }

    # Dynamic Rule: Mouse Acceleration (Input Lag)
    if (-not $global:DiagnosticState.MouseAccelOff) {
        $recs.Add([PSCustomObject]@{
            Titulo = "PRECISÃO DE MIRA: Aceleração do Mouse Ativada"
            Categoria = "CONFIGURAÇÃO COMPETITIVA RECOMENDADA"
            Nivel = "warning"
            Desc = "O recurso 'Aprimorar precisão do ponteiro' do Windows altera a distância percorrida pelo cursor com base na velocidade do movimento. Em jogos competitivos (CS2, Valorant), desligá-lo garante mira 1:1 consistente."
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
        $null = $grid.ColumnDefinitions.Add($col0)
        $null = $grid.ColumnDefinitions.Add($col1)

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

        $null = $stack.Children.Add($catTxt)
        $null = $stack.Children.Add($titleTxt)
        $null = $stack.Children.Add($descTxt)
        [Windows.Controls.Grid]::SetColumn($stack, 0)
        $null = $grid.Children.Add($stack)

        $badge = New-Object Windows.Controls.Border
        $badge.CornerRadius = New-Object Windows.CornerRadius(6)
        $badge.Padding = New-Object Windows.Thickness(12, 6, 12, 6)
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
        $null = $grid.Children.Add($badge)

        $card.Child = $grid
        $null = $ContainerRecomendacoes.Children.Add($card)
    }
}

# Function: Populate Tab 3 (Checklist de Sucesso)
function Update-ChecklistTab {
    $ContainerChecklist.Children.Clear()
    $totalChecks = 7
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
        },
        @{
            Name = "Modo de Jogo & Precisão de Entrada (Latência)"
            Success = ($global:DiagnosticState.GameMode -and $global:DiagnosticState.MouseAccelOff)
            SuccessDesc = "OTIMIZADO - Modo de Jogo ativo e aceleração de ponteiro desligada (mira 1:1)."
            FailDesc = "AJUSTAR - Modo de Jogo desligado ou aceleração do mouse distorcendo a mira."
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
        $null = $grid.ColumnDefinitions.Add($col0)
        $null = $grid.ColumnDefinitions.Add($col1)

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

        $null = $stack.Children.Add($title)
        $null = $stack.Children.Add($desc)
        [Windows.Controls.Grid]::SetColumn($stack, 0)
        $null = $grid.Children.Add($stack)

        $badge = New-Object Windows.Controls.Border
        $badge.CornerRadius = New-Object Windows.CornerRadius(6)
        $badge.Padding = New-Object Windows.Thickness(12, 6, 12, 6)

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
        $null = $grid.Children.Add($badge)

        $card.Child = $grid
        $null = $ContainerChecklist.Children.Add($card)
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

# Function: Populate Tab 4 (Riot Vanguard & Valorant Doctor)
function Update-VanguardTab {
    # 1. TPM 2.0 Check (VAN 9001)
    $hasTpm2 = $false
    try {
        $tpm = Get-CimInstance Win32_PnPEntity -ErrorAction SilentlyContinue | Where-Object { $_.HardwareID -match 'MSFT0101|TPM' -or $_.Name -match 'Trusted Platform|TPM 2\.0' }
        if ($tpm) { $hasTpm2 = $true }
    } catch {}
    if (-not $hasTpm2) {
        try {
            $tpmWmi = Get-CimInstance -Namespace root\cimv2\Security\MicrosoftTpm -ClassName Win32_Tpm -ErrorAction SilentlyContinue
            if ($tpmWmi -and ($tpmWmi.SpecVersion -match "2\.0" -or $tpmWmi.IsEnabled_InitialValue)) {
                $hasTpm2 = $true
            }
        } catch {}
    }

    # 2. Secure Boot Check (VAN 9003)
    $isSecureBoot = $false
    try {
        $sbVal = (Get-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecureBoot\State' -Name 'UEFISecureBootEnabled' -ErrorAction SilentlyContinue).UEFISecureBootEnabled
        if ($sbVal -eq 1) { $isSecureBoot = $true }
    } catch {}
    if (-not $isSecureBoot) {
        try {
            $isSecureBoot = Confirm-SecureBootUEFI -ErrorAction SilentlyContinue
        } catch {}
    }

    # 3. Riot Vanguard Service 'vgc' Check (VAN 1067 / VAN 84)
    $vgcInstalled = $false
    $vgcRunning = $false
    $vgcAuto = $false
    $vgcObj = Get-Service -Name "vgc" -ErrorAction SilentlyContinue
    if ($vgcObj) {
        $vgcInstalled = $true
        if ($vgcObj.Status -eq "Running") { $vgcRunning = $true }
        if ($vgcObj.StartType -eq "Automatic") { $vgcAuto = $true }
    }

    # 4. Driver Integrity & Testsigning Check (VAN 128 / VAN 57)
    $testSigningOn = $false
    $noIntegrityOn = $false
    try {
        $startOpts = (Get-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control' -Name 'SystemStartOptions' -ErrorAction SilentlyContinue).SystemStartOptions
        if ($startOpts -match "TESTSIGNING|DISABLE_INTEGRITY_CHECKS") {
            $testSigningOn = $true
        }
    } catch {}
    try {
        $bcd = bcdedit 2>$null
        if ($bcd -match 'testsigning\s+(?:Yes|Sim|True|1)') { $testSigningOn = $true }
        if ($bcd -match 'nointegritychecks\s+(?:Yes|Sim|True|1)') { $noIntegrityOn = $true }
    } catch {}

    $global:DiagnosticState.Vanguard = @{
        Tpm = $hasTpm2
        SecureBoot = $isSecureBoot
        VgcInstalled = $vgcInstalled
        VgcRunning = $vgcRunning
        VgcAuto = $vgcAuto
        TestSigning = $testSigningOn
        NoIntegrity = $noIntegrityOn
    }

    # Update TPM UI
    if ($hasTpm2) {
        Set-BadgeColor $BadgeTpm $TxtBadgeTpm "ATIVO (TPM 2.0)" "success"
        $TxtDescTpm.Text = "Excelente! Módulo TPM 2.0 detectado e ativo na BIOS. Requisito VAN 9001 atendido com sucesso."
        $BtnGuiaTpm.IsEnabled = $true
        $BtnGuiaTpm.Content = "✅ TPM 2.0 Ativo (Ver Instruções)"
        $BtnGuiaTpm.Background = [Windows.Media.BrushConverter]::new().ConvertFromString("#334155")
    } else {
        Set-BadgeColor $BadgeTpm $TxtBadgeTpm "DESATIVADO / AUSENTE" "danger"
        $TxtDescTpm.Text = "ALERTA: TPM 2.0 não detectado! O Valorant/LoL não iniciará (Erro VAN 9001). Ative o fTPM (AMD) ou PTT (Intel) na BIOS."
        $BtnGuiaTpm.IsEnabled = $true
        $BtnGuiaTpm.Content = "📘 Como Ativar TPM 2.0 na BIOS"
        $BtnGuiaTpm.Background = [Windows.Media.BrushConverter]::new().ConvertFromString("#EF4444")
    }

    # Update Secure Boot UI
    if ($isSecureBoot) {
        Set-BadgeColor $BadgeSecureBoot $TxtBadgeSecureBoot "ATIVADO (UEFI)" "success"
        $TxtDescSecureBoot.Text = "Excelente! A Inicialização Segura está ativa em modo UEFI. Requisito VAN 9003 atendido com sucesso."
        $BtnGuiaSecureBoot.IsEnabled = $true
        $BtnGuiaSecureBoot.Content = "✅ Secure Boot Ativo (Ver Instruções)"
        $BtnGuiaSecureBoot.Background = [Windows.Media.BrushConverter]::new().ConvertFromString("#334155")
    } else {
        Set-BadgeColor $BadgeSecureBoot $TxtBadgeSecureBoot "DESATIVADO" "danger"
        $TxtDescSecureBoot.Text = "ALERTA: Secure Boot desativado! Causa o erro VAN 9003 no Windows 11. Ative o Secure Boot em modo UEFI na BIOS."
        $BtnGuiaSecureBoot.IsEnabled = $true
        $BtnGuiaSecureBoot.Content = "📘 Como Ativar Secure Boot na BIOS"
        $BtnGuiaSecureBoot.Background = [Windows.Media.BrushConverter]::new().ConvertFromString("#EF4444")
    }

    # Update VGC UI
    if (-not $vgcInstalled) {
        Set-BadgeColor $BadgeVgc $TxtBadgeVgc "NÃO INSTALADO" "warning"
        $TxtDescVgc.Text = "Riot Vanguard não está instalado neste PC. Será configurado automaticamente ao instalar o Valorant ou League of Legends."
        $BtnFixVgc.IsEnabled = $false
        $BtnFixVgc.Content = "Riot Vanguard não instalado"
        $BtnFixVgc.Background = [Windows.Media.BrushConverter]::new().ConvertFromString("#334155")
    } elseif ($vgcAuto -and $vgcRunning) {
        Set-BadgeColor $BadgeVgc $TxtBadgeVgc "OPERACIONAL (Auto)" "success"
        $TxtDescVgc.Text = "Excelente! O serviço VGC está em Inicialização Automática e Em Execução. Sem risco de erro VAN 1067 / VAN 84."
        $BtnFixVgc.IsEnabled = $false
        $BtnFixVgc.Content = "✅ Serviço VGC Perfeito"
        $BtnFixVgc.Background = [Windows.Media.BrushConverter]::new().ConvertFromString("#334155")
    } else {
        $statusStr = if ($vgcObj.StartType -ne "Automatic") { "Modo $($vgcObj.StartType)" } else { "Parado" }
        Set-BadgeColor $BadgeVgc $TxtBadgeVgc "INCORRETO ($statusStr)" "danger"
        $TxtDescVgc.Text = "ALERTA: O serviço VGC está como $($vgcObj.StartType)! Isso causa o erro VAN 1067 / 84 e fecha o jogo no meio da partida. Clique abaixo para reparar."
        $BtnFixVgc.IsEnabled = $true
        $BtnFixVgc.Content = "⚡ Configurar VGC como Automático (1 Clique)"
        $BtnFixVgc.Background = [Windows.Media.BrushConverter]::new().ConvertFromString("#10B981")
    }

    # Update Testsigning / Driver Integrity UI
    if ($testSigningOn -or $noIntegrityOn) {
        Set-BadgeColor $BadgeTestSigning $TxtBadgeTestSigning "TESTSIGNING ATIVO" "danger"
        $TxtDescTestSigning.Text = "ALERTA: O Windows está em modo de testes de drivers não assinados. O Vanguard bloqueará a inicialização (Erro VAN 128 / VAN 57)."
        $BtnFixIntegrity.IsEnabled = $true
        $BtnFixIntegrity.Content = "⚡ Reparar Integridade do Boot (1 Clique)"
        $BtnFixIntegrity.Background = [Windows.Media.BrushConverter]::new().ConvertFromString("#EF4444")
    } else {
        Set-BadgeColor $BadgeTestSigning $TxtBadgeTestSigning "INTEGRIDADE 100%" "success"
        $TxtDescTestSigning.Text = "Excelente! Drivers não assinados estão bloqueados e a integridade de boot do Windows está 100% segura para o Vanguard."
        $BtnFixIntegrity.IsEnabled = $false
        $BtnFixIntegrity.Content = "✅ Integridade 100% OK"
        $BtnFixIntegrity.Background = [Windows.Media.BrushConverter]::new().ConvertFromString("#334155")
    }

    # Vanguard Overall Status
    $vanguardReady = $hasTpm2 -and $isSecureBoot -and (-not $testSigningOn) -and (-not $noIntegrityOn)
    if ($vgcInstalled -and (-not $vgcAuto -or -not $vgcRunning)) {
        # If Vanguard is installed, VGC must also be automatic
        $vanguardReady = $false
    }

    if ($vanguardReady) {
        $TxtVanguardOverall.Text = "Este computador atende a todos os requisitos de segurança e integridade do Riot Vanguard. Pronto para jogar Valorant e LoL sem erros!"
        $BadgeVanguardOverall.Background = [Windows.Media.BrushConverter]::new().ConvertFromString("#065F46")
        $TxtBadgeVanguardOverall.Text = "100% COMPATÍVEL"
        $TxtBadgeVanguardOverall.Foreground = [Windows.Media.BrushConverter]::new().ConvertFromString("#34D399")
    } else {
        $TxtVanguardOverall.Text = "Atenção: Identificamos configurações que vão causar erros no Riot Vanguard (VAN 9001, 9003, 1067 ou 128). Use as correções abaixo!"
        $BadgeVanguardOverall.Background = [Windows.Media.BrushConverter]::new().ConvertFromString("#7F1D1D")
        $TxtBadgeVanguardOverall.Text = "AJUSTES NECESSÁRIOS"
        $TxtBadgeVanguardOverall.Foreground = [Windows.Media.BrushConverter]::new().ConvertFromString("#FCA5A5")
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

# Button: Desativar Aceleração do Mouse (Mira 1:1)
$BtnMouseFix.Add_Click({
    try {
        Set-ItemProperty -Path 'HKCU:\Control Panel\Mouse' -Name 'MouseSpeed' -Value "0"
        Set-ItemProperty -Path 'HKCU:\Control Panel\Mouse' -Name 'MouseThreshold1' -Value "0"
        Set-ItemProperty -Path 'HKCU:\Control Panel\Mouse' -Name 'MouseThreshold2' -Value "0"
        [System.Windows.MessageBox]::Show(
            "Aceleração do mouse ('Aprimorar precisão do ponteiro') desativada com sucesso!`n`nSua mira agora está em escala 1:1 nativa (raw input).`nNota: Pode ser necessário reiniciar ou fazer logoff para alguns jogos lerem a nova sensibilidade.",
            "Mira 1:1 Calibrada",
            [System.Windows.MessageBoxButton]::OK,
            [System.Windows.MessageBoxImage]::Information
        )
        Run-AuditScan
    } catch {
        [System.Windows.MessageBox]::Show("Erro ao alterar configurações do mouse: $_", "Erro", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Error)
    }
})

# Button: Reparar Inicialização do VGC (Riot Vanguard)
$BtnFixVgc.Add_Click({
    try {
        & sc.exe config vgc start= auto | Out-Null
        Start-Service -Name "vgc" -ErrorAction SilentlyContinue
        [System.Windows.MessageBox]::Show(
            "O serviço Riot Vanguard (vgc) foi configurado para Inicialização Automática com sucesso!`n`nIsso corrige e previne desconexões e os erros VAN 1067 e VAN 84 no Valorant e LoL.",
            "Riot Vanguard Configurado",
            [System.Windows.MessageBoxButton]::OK,
            [System.Windows.MessageBoxImage]::Information
        )
        Run-AuditScan
    } catch {
        [System.Windows.MessageBox]::Show("Erro ao configurar serviço vgc: $_", "Erro", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Error)
    }
})

# Button: Reparar Integridade de Drivers e Testsigning
$BtnFixIntegrity.Add_Click({
    try {
        & bcdedit /set testsigning off | Out-Null
        & bcdedit /set nointegritychecks off | Out-Null
        [System.Windows.MessageBox]::Show(
            "O modo de testes de drivers não assinados (Testsigning) e verificações de integridade foram corrigidos com sucesso!`n`nSerá necessário REINICIAR o computador para que o Windows aplique as alterações do boot e o Vanguard inicialize sem o erro VAN 128 / VAN 57.",
            "Integridade do Boot Corrigida",
            [System.Windows.MessageBoxButton]::OK,
            [System.Windows.MessageBoxImage]::Information
        )
        Run-AuditScan
    } catch {
        [System.Windows.MessageBox]::Show("Erro ao alterar configurações do BCD: $_", "Erro", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Error)
    }
})

# Button: Guia BIOS TPM 2.0
$BtnGuiaTpm.Add_Click({
    [System.Windows.MessageBox]::Show(
@"
=== GUIA DEFINITIVO: COMO ATIVAR O TPM 2.0 NA BIOS (ERRO VAN 9001) ===

O Riot Vanguard exige o TPM 2.0 ativo no Windows 11 para impedir a injeção de trapaças a nível de hardware.

COMO ATIVAR:
1. Reinicie o computador e fique pressionando 'Del' ou 'F2' para entrar na BIOS.
2. Dependendo do seu processador e placa-mãe, ative a opção correspondente:

• PROCESSADOR AMD RYZEN (Todas as marcas):
  - ASUS: Advanced -> AMD fTPM configuration -> Firmware TPM: [Enable / Firmware TPM]
  - GIGABYTE: Settings -> Miscellaneous -> AMD CPU fTPM: [Enabled]
  - MSI: Security -> Trusted Computing -> AMD fTPM switch: [AMD CPU fTPM]
  - ASROCK: Advanced -> CPU Configuration -> AMD fTPM Switch: [AMD CPU fTPM]

• PROCESSADOR INTEL CORE (Todas as marcas):
  - ASUS: Advanced -> PCH-FW Configuration -> Intel Platform Trust Technology (PTT): [Enabled]
  - GIGABYTE: Settings -> Miscellaneous -> Intel Platform Trust Technology (PTT): [Enabled]
  - MSI: Security -> Trusted Computing -> Security Device Support: [Enabled] -> TPM Device: [PTT]
  - ASROCK: Security -> Intel PTT: [Enabled]

3. Pressione F10 para salvar e reiniciar.
Ao voltar para o Windows, o erro VAN 9001 estará resolvido!
"@, "Guia de Ativação do TPM 2.0", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Information)
})

# Button: Guia BIOS Secure Boot
$BtnGuiaSecureBoot.Add_Click({
    [System.Windows.MessageBox]::Show(
@"
=== GUIA DEFINITIVO: COMO ATIVAR O SECURE BOOT NA BIOS (ERRO VAN 9003) ===

O erro VAN 9003 acontece quando o Windows 11 está instalado mas a Inicialização Segura (Secure Boot) está desativada na BIOS.

PASSO A PASSO NA BIOS:
1. Reinicie o PC e pressione 'Del' ou 'F2' repetidamente até abrir a BIOS.
2. PASSO OBRIGATÓRIO: Desative o CSM (Modo de Compatibilidade Legado):
   - Procure a aba 'Boot' -> 'CSM Support' (ou Launch CSM) -> Mude para [Disabled].
   - (Nota: O Secure Boot só pode ser ativado com o CSM desligado).
3. ATIVAR O SECURE BOOT:
   - Vá na aba 'Boot' ou 'Security' -> 'Secure Boot'.
   - Mude 'Secure Boot' para [Enabled].
   - 'Secure Boot Mode' deve estar como [Standard].
   - Se o status disser 'Not Active' mesmo com Enabled: clique na opção 'Restore Factory Keys' ou 'Install Default Secure Boot Keys' na mesma tela.
4. Pressione F10 para salvar e reiniciar.

Ao reiniciar no Windows, o Secure Boot estará ativo e o Valorant abrirá normalmente!
"@, "Guia de Ativação do Secure Boot", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Information)
})

# Button: Criar Ponto de Restauração do Windows
$BtnRestauracao.Add_Click({
    try {
        $confirm = [System.Windows.MessageBox]::Show(
            "Deseja criar um Ponto de Restauração do Windows agora?`n`nIsso cria uma imagem segura do sistema para você poder reverter qualquer alteração com total segurança.",
            "Ponto de Restauração",
            [System.Windows.MessageBoxButton]::YesNo,
            [System.Windows.MessageBoxImage]::Question
        )
        if ($confirm -eq [System.Windows.MessageBoxResult]::Yes) {
            Enable-ComputerRestore -Drive "C:\" -ErrorAction SilentlyContinue
            Checkpoint-Computer -Description "GameReady Doctor Backup" -RestorePointType "MODIFY_SETTINGS" -ErrorAction Stop
            [System.Windows.MessageBox]::Show("Ponto de Restauração criado com sucesso no Windows!", "Backup Seguro", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Information)
        }
    } catch {
        [System.Windows.MessageBox]::Show("Não foi possível criar o Ponto de Restauração: $_`n`nVerifique se a 'Proteção do Sistema' está ativada nas propriedades do Windows.", "Aviso", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Warning)
    }
})

# Button: Gerar Laudo Técnico do PC (HTML / PDF)
$BtnLaudo.Add_Click({
    try {
        $diag = $global:DiagnosticState
        $dateStr = Get-Date -Format 'dd/MM/yyyy HH:mm:ss'
        $compName = $env:COMPUTERNAME
        $userName = $env:USERNAME
        $osCaption = (Get-CimInstance Win32_OperatingSystem -ErrorAction SilentlyContinue).Caption

        $rebarStatus = if ($diag.Rebar) { "ATIVADO ($($diag.BarTotal) MiB)" } else { "DESATIVADO" }
        $vbsStatus = if (-not $diag.VBS) { "DESATIVADO (Otimizado)" } else { "ATIVADO (Penalidade CPU)" }
        $ramStatus = "$($diag.RAM.Cap) GB @ $($diag.RAM.Speed) MHz " + (if ($diag.RAM.Dual) { "(Dual Channel)" } else { "(Single Channel)" })
        $powerStatus = if ($diag.Power) { "Desempenho Máximo" } else { "Equilibrado / Padrão" }
        $storageStatus = "$($diag.Storage.Model) ($($diag.Storage.DriveType)) - $($diag.Storage.FreeGB) GB livres ($($diag.Storage.PercentFree)%)"
        $monitorStatus = "$($diag.Monitor.CurrentHz) Hz ($($diag.Monitor.ResX)x$($diag.Monitor.ResY))" + (if ($diag.Monitor.IsThrottled) { " [Gargalo: suporta $($diag.Monitor.MaxHz) Hz]" } else { " [Taxa Máxima]" })
        $gameModeStatus = if ($diag.GameMode) { "Ativado" } else { "Desativado" }
        $mouseStatus = if ($diag.MouseAccelOff) { "Desativada (Mira 1:1)" } else { "Ativada (Ponteiro Acelerado)" }
        $tempStatus = if ($diag.Gpu.Temp) { "$($diag.Gpu.Temp) °C" } else { "N/A" }
        $tpmStatus = if ($diag.Vanguard.Tpm) { "Ativo (TPM 2.0)" } else { "Desativado / Não Detectado" }
        $secBootStatus = if ($diag.Vanguard.SecureBoot) { "Ativado (UEFI)" } else { "Desativado" }
        $vgcStatus = if (-not $diag.Vanguard.VgcInstalled) { "Não Instalado" } elseif ($diag.Vanguard.VgcAuto) { "Automático (Correto)" } else { "Manual / Parado (Incorreto)" }
        $integStatus = if (-not $diag.Vanguard.TestSigning -and -not $diag.Vanguard.NoIntegrity) { "100% Conforme" } else { "Testsigning Ativo (Risco de VAN 128)" }

        $html = @"
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Laudo Técnico de Hardware &amp; Auditoria Gamer - $compName</title>
    <style>
        body { font-family: 'Segoe UI', Arial, sans-serif; background-color: #0F111A; color: #ECEFF4; margin: 0; padding: 30px; }
        .container { max-width: 900px; margin: 0 auto; background: #1E2235; padding: 35px; border-radius: 14px; box-shadow: 0 8px 24px rgba(0,0,0,0.5); }
        .header { display: flex; justify-content: space-between; align-items: center; border-bottom: 2px solid #334155; padding-bottom: 20px; margin-bottom: 25px; }
        h1 { margin: 0; font-size: 24px; color: #38BDF8; }
        .sub { color: #94A3B8; font-size: 13px; margin-top: 5px; }
        .print-btn { background: #10B981; color: #042F2E; border: none; padding: 10px 20px; font-weight: bold; font-size: 14px; border-radius: 8px; cursor: pointer; }
        .section-title { font-size: 17px; font-weight: bold; color: #38BDF8; margin-top: 25px; margin-bottom: 12px; border-left: 4px solid #38BDF8; padding-left: 10px; }
        table { width: 100%; border-collapse: collapse; margin-bottom: 20px; }
        th, td { padding: 12px 14px; text-align: left; border-bottom: 1px solid #334155; font-size: 13px; }
        th { background: #2A3048; color: #F8FAFC; }
        .badge { display: inline-block; padding: 4px 10px; border-radius: 6px; font-weight: bold; font-size: 11px; }
        .badge-success { background: #065F46; color: #34D399; }
        .badge-warning { background: #78350F; color: #FCD34D; }
        .badge-danger { background: #7F1D1D; color: #FCA5A5; }
        .footer { margin-top: 35px; padding-top: 20px; border-top: 1px solid #334155; text-align: center; color: #64748B; font-size: 12px; }
        @media print {
            body { background: white; color: #1E293B; padding: 0; }
            .container { background: white; box-shadow: none; padding: 15px; max-width: 100%; }
            .print-btn { display: none; }
            h1 { color: #0284C7; }
            th { background: #F1F5F9; color: #0F172A; }
            th, td { border-bottom: 1px solid #E2E8F0; }
            .badge-success { background: #DCFCE7; color: #166534; }
            .badge-warning { background: #FEF3C7; color: #92400E; }
            .badge-danger { background: #FEE2E2; color: #991B1B; }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <div>
                <h1>⚡ Laudo Técnico de Otimização e Hardware</h1>
                <div class="sub">Auditoria Profissional GameReady PC Doctor | Técnico: Gabriel Lopes</div>
            </div>
            <button class="print-btn" onclick="window.print()">🖨️ Imprimir / Salvar em PDF</button>
        </div>

        <div class="section-title">💻 Identificação do Equipamento</div>
        <table>
            <tr><th width="30%">Computador / Host</th><td>$compName</td></tr>
            <tr><th>Usuário</th><td>$userName</td></tr>
            <tr><th>Sistema Operacional</th><td>$osCaption</td></tr>
            <tr><th>Data da Auditoria</th><td>$dateStr</td></tr>
        </table>

        <div class="section-title">⚙️ Inventário de Hardware</div>
        <table>
            <tr><th width="30%">Processador (CPU)</th><td>$($diag.Cpu.Name) ($($diag.Cpu.Cores) Núcleos / $($diag.Cpu.Threads) Threads)</td></tr>
            <tr><th>Placa de Vídeo (GPU)</th><td>$($diag.Gpu.Name) (Temp em Repouso: $tempStatus)</td></tr>
            <tr><th>Placa-Mãe</th><td>$($diag.Motherboard)</td></tr>
            <tr><th>Memória RAM</th><td>$ramStatus</td></tr>
            <tr><th>Disco do Sistema (C:)</th><td>$storageStatus</td></tr>
            <tr><th>Monitor &amp; Resolução</th><td>$monitorStatus</td></tr>
        </table>

        <div class="section-title">📊 Auditoria dos 7 Pilares de Performance</div>
        <table>
            <tr>
                <th width="35%">Item Auditado</th>
                <th width="25%">Status</th>
                <th>Diagnóstico Técnico</th>
            </tr>
            <tr>
                <td><b>Resizable BAR / AMD SAM</b></td>
                <td><span class="badge $(if ($diag.Rebar) { 'badge-success' } else { 'badge-danger' })">$rebarStatus</span></td>
                <td>$(if ($diag.Rebar) { 'Acesso direto à VRAM liberado sem gargalo.' } else { 'VRAM limitada a blocos de 256MB. Ativar na BIOS.' })</td>
            </tr>
            <tr>
                <td><b>Isolamento de Núcleo (VBS)</b></td>
                <td><span class="badge $(if (-not $diag.VBS) { 'badge-success' } else { 'badge-warning' })">$vbsStatus</span></td>
                <td>$(if (-not $diag.VBS) { 'Sem sobrecarga de virtualização na CPU.' } else { 'Camada de virtualização consumindo de 3% a 8% da CPU.' })</td>
            </tr>
            <tr>
                <td><b>Memória RAM (Canais &amp; Velocidade)</b></td>
                <td><span class="badge $(if ($diag.RAM.Dual -and $diag.RAM.Speed -ge 3000) { 'badge-success' } else { 'badge-warning' })">$(if ($diag.RAM.Dual) { 'Dual Channel' } else { 'Single Channel' })</span></td>
                <td>$ramStatus</td>
            </tr>
            <tr>
                <td><b>Plano de Energia</b></td>
                <td><span class="badge $(if ($diag.Power) { 'badge-success' } else { 'badge-warning' })">$powerStatus</span></td>
                <td>$(if ($diag.Power) { 'Clocks sem atraso de transição.' } else { 'Plano com economia de energia ativa.' })</td>
            </tr>
            <tr>
                <td><b>Caches de Shaders do SSD</b></td>
                <td><span class="badge $(if ($diag.JunkMB -lt 5000) { 'badge-success' } else { 'badge-danger' })">$($diag.JunkMB) MB</span></td>
                <td>$(if ($diag.JunkMB -lt 5000) { 'SSD limpo sem acúmulo excessivo.' } else { 'Recomendada limpeza de shaders obsoletos.' })</td>
            </tr>
            <tr>
                <td><b>Taxa de Atualização do Monitor</b></td>
                <td><span class="badge $(if (-not $diag.Monitor.IsThrottled) { 'badge-success' } else { 'badge-danger' })">$($diag.Monitor.CurrentHz) Hz</span></td>
                <td>$(if (-not $diag.Monitor.IsThrottled) { 'Taxa máxima configurada.' } else { 'Monitor de ' + $diag.Monitor.MaxHz + ' Hz travado em 60 Hz.' })</td>
            </tr>
            <tr>
                <td><b>Modo de Jogo &amp; Precisão do Mouse</b></td>
                <td><span class="badge $(if ($diag.GameMode -and $diag.MouseAccelOff) { 'badge-success' } else { 'badge-warning' })">$(if ($diag.GameMode -and $diag.MouseAccelOff) { 'Otimizado' } else { 'Pendente' })</span></td>
                <td>Modo de Jogo: $gameModeStatus | Aceleração: $mouseStatus</td>
            </tr>
        </table>

        <div class="section-title">🛡️ Auditoria Riot Vanguard &amp; Anti-Cheat (Valorant / LoL)</div>
        <table>
            <tr>
                <th width="35%">Requisito Vanguard</th>
                <th width="25%">Status</th>
                <th>Diagnóstico Técnico</th>
            </tr>
            <tr>
                <td><b>Módulo TPM 2.0 (Erro VAN 9001)</b></td>
                <td><span class="badge $(if ($diag.Vanguard.Tpm) { 'badge-success' } else { 'badge-danger' })">$tpmStatus</span></td>
                <td>$(if ($diag.Vanguard.Tpm) { 'Módulo de segurança fTPM/PTT ativo na BIOS.' } else { 'Requer ativação do fTPM (AMD) ou PTT (Intel) na BIOS.' })</td>
            </tr>
            <tr>
                <td><b>Secure Boot UEFI (Erro VAN 9003)</b></td>
                <td><span class="badge $(if ($diag.Vanguard.SecureBoot) { 'badge-success' } else { 'badge-danger' })">$secBootStatus</span></td>
                <td>$(if ($diag.Vanguard.SecureBoot) { 'Inicialização Segura ativa em modo UEFI.' } else { 'Requer desativar CSM e ativar Secure Boot na BIOS.' })</td>
            </tr>
            <tr>
                <td><b>Serviço VGC (Erro VAN 1067 / 84)</b></td>
                <td><span class="badge $(if ($diag.Vanguard.VgcAuto) { 'badge-success' } elseif (-not $diag.Vanguard.VgcInstalled) { 'badge-warning' } else { 'badge-danger' })">$vgcStatus</span></td>
                <td>$(if ($diag.Vanguard.VgcAuto) { 'Serviço configurado para iniciar automaticamente.' } elseif (-not $diag.Vanguard.VgcInstalled) { 'Riot Vanguard não instalado no sistema.' } else { 'Serviço em modo Manual causa desconexões VAN 1067.' })</td>
            </tr>
            <tr>
                <td><b>Integridade de Drivers (Erro VAN 128)</b></td>
                <td><span class="badge $(if (-not $diag.Vanguard.TestSigning -and -not $diag.Vanguard.NoIntegrity) { 'badge-success' } else { 'badge-danger' })">$integStatus</span></td>
                <td>$(if (-not $diag.Vanguard.TestSigning -and -not $diag.Vanguard.NoIntegrity) { 'Modo de testes desligado e assinatura de drivers ativa.' } else { 'Modo Testsigning ativo impede a inicialização do anti-cheat.' })</td>
            </tr>
        </table>

        <div class="footer">
            Laudo gerado automaticamente pelo GameReady PC Doctor. Desenvolvido por Gabriel Lopes.
        </div>
    </div>
</body>
</html>
"@

        $reportPath = Join-Path $env:TEMP "Laudo_Tecnico_PC_$($compName)_$((Get-Date).ToString('yyyyMMdd_HHmmss')).html"
        $html | Out-File -FilePath $reportPath -Encoding utf8
        Start-Process $reportPath
        [System.Windows.MessageBox]::Show(
            "Laudo Técnico gerado com sucesso e aberto no seu navegador!`n`nArquivo salvo em:`n$reportPath`n`nVocê pode imprimi-lo ou salvá-lo em PDF diretamente pelo navegador.",
            "Laudo Técnico Gerado",
            [System.Windows.MessageBoxButton]::OK,
            [System.Windows.MessageBoxImage]::Information
        )
    } catch {
        [System.Windows.MessageBox]::Show("Erro ao gerar o laudo técnico: $_", "Erro", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Error)
    }
})

# Initial Scan on launch
$window.Add_Loaded({
    Run-AuditScan
})

# Display Window
$window.ShowDialog() | Out-Null
