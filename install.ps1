# ==============================================================================
# Anime Character Sheet Architect - Windows 一鍵安裝腳本 (PowerShell)
# 適用環境: Antigravity / Gemini CLI / Claude Code / Cursor
# ==============================================================================

param(
    [string]$TargetDir = "",
    [switch]$Workspace,
    [switch]$Claude
)

$ErrorActionPreference = "Stop"
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "  🎨 Anime Character Sheet Architect Installer           " -ForegroundColor Yellow
Write-Host "==========================================================" -ForegroundColor Cyan

# 判斷目標安裝目錄
if ($TargetDir -ne "") {
    $destBase = $TargetDir
} elseif ($Workspace) {
    $destBase = Join-Path (Get-Location) ".agents\skills"
} elseif ($Claude) {
    $destBase = Join-Path $HOME ".claude\skills"
} else {
    # 預設 Antigravity / Gemini 全域技能目錄
    $destBase = Join-Path $HOME ".gemini\config\skills"
}

Write-Host "[1/3] 目標安裝位置: $destBase" -ForegroundColor Gray

if (-not (Test-Path $destBase)) {
    New-Item -ItemType Directory -Path $destBase -Force | Out-Null
}

$skillName = "anime-character-sheet-architect"
$targetPath = Join-Path $destBase $skillName

if (Test-Path $targetPath) {
    Write-Host "  -> 偵測到既有版本，進行覆蓋更新: $skillName" -ForegroundColor DarkYellow
    Remove-Item -Recurse -Force $targetPath
}
New-Item -ItemType Directory -Path $targetPath -Force | Out-Null

Write-Host "[2/3] 正在安裝技能模組..." -ForegroundColor Gray

# 檢查是否為本機執行或遠端一鍵執行 (irm | iex)
$rawSkillUrl = "https://raw.githubusercontent.com/JeffreyHo0520/anime-character-sheet-architect/main/SKILL.md"
$installed = $false

$scriptRoot = $PSScriptRoot
if ($scriptRoot) {
    $localSkillPath = Join-Path $scriptRoot "SKILL.md"
    $subSkillPath = Join-Path $scriptRoot (Join-Path $skillName "SKILL.md")
    
    if (Test-Path $localSkillPath) {
        Copy-Item $localSkillPath -Destination (Join-Path $targetPath "SKILL.md") -Force
        $installed = $true
        Write-Host "  + 從本機來源安裝: $localSkillPath" -ForegroundColor Green
    } elseif (Test-Path $subSkillPath) {
        Copy-Item $subSkillPath -Destination (Join-Path $targetPath "SKILL.md") -Force
        $installed = $true
        Write-Host "  + 從本機來源安裝: $subSkillPath" -ForegroundColor Green
    }
}

if (-not $installed) {
    Write-Host "  -> 正在從 GitHub 遠端下載最新技能定義: $rawSkillUrl" -ForegroundColor Cyan
    Invoke-RestMethod -Uri $rawSkillUrl -OutFile (Join-Path $targetPath "SKILL.md")
    Write-Host "  + 下載並安裝成功！" -ForegroundColor Green
}

# 驗證
Write-Host "[3/3] 驗證安裝結果..." -ForegroundColor Gray
$skillMd = Join-Path $targetPath "SKILL.md"
if (Test-Path $skillMd) {
    Write-Host "  + 驗證成功: $skillMd" -ForegroundColor Green
    Write-Host "==========================================================" -ForegroundColor Cyan
    Write-Host "SUCCESS: anime-character-sheet-architect 技能安裝成功！" -ForegroundColor Green
    Write-Host ""
    Write-Host "💡 如何使用 (在 Antigravity / Claude Code 對話中)：" -ForegroundColor Yellow
    Write-Host "  1. 斜線指令：" -ForegroundColor White
    Write-Host "     /anime-character-sheet-architect" -ForegroundColor Cyan
    Write-Host "  2. 自然語言觸發：" -ForegroundColor White
    Write-Host "     '我要創造一個虛擬角色，是《七龍珠Z》布馬，請給我這個角色的角色設定圖'" -ForegroundColor Cyan
    Write-Host "     '幫我製作 [角色名稱] 的角色三視圖與表情矩陣設定集'" -ForegroundColor Cyan
    Write-Host "==========================================================" -ForegroundColor Cyan
} else {
    Write-Host "WARNING: 驗證失敗，找不到 $skillMd" -ForegroundColor Red
}
