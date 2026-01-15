# Installer script for AWF on Windows

$RepoUrl = "https://raw.githubusercontent.com/TUAN130294/awf/main/workflows"
$TargetDir = ".agent/workflows"
$Workflows = @(
    "plan.md", "code.md", "visualize.md", "deploy.md", 
    "debug.md", "refactor.md", "test.md", "run.md", 
    "init.md", "recap.md", "rollback.md", "save_brain.md", 
    "audit.md", "cloudflare-tunnel.md"
)

Write-Host "🚀 Đang cài đặt Antigravity Workflow Framework (AWF)..." -ForegroundColor Cyan

if (-not (Test-Path $TargetDir)) {
    New-Item -ItemType Directory -Force -Path $TargetDir | Out-Null
    Write-Host "📂 Đã tạo thư mục $TargetDir" -ForegroundColor Green
}

foreach ($wf in $Workflows) {
    try {
        Invoke-WebRequest -Uri "$RepoUrl/$wf" -OutFile "$TargetDir/$wf"
        Write-Host "✅ Đã tải: $wf" -ForegroundColor Green
    } catch {
        Write-Host "❌ Lỗi tải: $wf" -ForegroundColor Red
    }
}

Write-Host "`n🎉 Cài đặt hoàn tất! Gõ '/' để bắt đầu." -ForegroundColor Yellow
