# Copia skills y agentes a ~/.claude sin pisar lo existente.
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$dest = Join-Path $env:USERPROFILE ".claude"
New-Item -ItemType Directory -Force (Join-Path $dest "skills"), (Join-Path $dest "agents") | Out-Null
Get-ChildItem (Join-Path $here "skills") -Directory | ForEach-Object {
  $t = Join-Path $dest "skills\$($_.Name)"
  if (Test-Path $t) { "salto skill (ya existe): $($_.Name)" } else { Copy-Item $_.FullName $t -Recurse; "skill: $($_.Name)" }
}
Get-ChildItem (Join-Path $here "agents") -Filter *.md | ForEach-Object {
  $t = Join-Path $dest "agents\$($_.Name)"
  if (Test-Path $t) { "salto agente (ya existe): $($_.Name)" } else { Copy-Item $_.FullName $t; "agente: $($_.Name)" }
}
"Listo. Falta: copiar templates\CLAUDE.md a ~\.claude\CLAUDE.md y revisar docs\."
