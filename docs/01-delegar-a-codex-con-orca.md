# Delegar a Codex con Orca

Orca es el IDE/terminal que maneja worktrees y terminales de agentes. Claude lo controla con la
CLI `orca`. Instalá Orca y cargá las skills `orca-cli` y `orchestration` (están en `skills/`).
**Esas skills son un índice**: la guía completa sale de `orca skills get orca-cli` y
`orca skills get orchestration`. Leéla antes de correr comandos; no adivines flags.

## Flujo (una tarea de código)
1. **Escribí la orden** (ver contrato en `templates/AGENTS.md`). Si tiene varios pasos: `TAREA_<tema>.md`.
2. **Worktree propio** del repo: nunca dos agentes escribiendo el mismo checkout.
3. **Terminal nueva por tarea** (sólo se reusa si es el mismo tema):
   ```bash
   orca terminal create --json --title "<tema>" --command "codex --yolo -m gpt-5.6-luna"
   ```
   `terminal create` abre un shell; **confirmá con `orca terminal read` que Codex arrancó**
   (tiene que verse `Ask Codex...`, sin `Starting MCP`) antes de mandar nada.
4. **Mandá la orden** con `orca terminal send`, empezando con "Ignorá cualquier tarea previa".
   Pedí que la última línea del informe sea el marcador `CODEX_` + `TERMINADO` (partido, para que el eco del prompt no dispare el vigilante).
5. **Vigilá en segundo plano** (así no tenés que avisar "ya terminó"):
   ```bash
   bash scripts/vigilar-codex.sh <terminal>     # con run_in_background: true
   ```
6. **Verificá vos** antes de dar por terminado: `git status`, diff, tests, fuente real. El informe de Codex no es evidencia.

## Trampas aprendidas
- `orca terminal wait --for tui-idle` a veces dice "idle" con Codex trabajando. Usá el vigilante.
- Una terminal que "parece libre" puede ser de otra sesión. Mirá el preview antes de reusarla.
- Una sola sesión de Claude activa por proyecto; si algo cambia solo en disco, revisá si hay otra viva.
- Dividí el trabajo en **dos carriles** por estado compartido (repos o carpetas distintos), nunca dos carriles mergeando al mismo `main`. En un solo repo: servidor en una rama, pantalla en otra, con el contrato de API escrito en la orden.
- Push, deploy, migraciones destructivas y mensajes a terceros: siempre con OK humano, aunque Codex tenga todos los permisos.

## Flags de permisos
`codex --yolo` y `claude --dangerously-skip-permissions` evitan que el agente frene a pedir permiso.
Son cómodos y peligrosos: usalos sólo en worktrees descartables o si ya entendés qué pueden romper.
Las plantillas de este repo **no** los activan por defecto.
