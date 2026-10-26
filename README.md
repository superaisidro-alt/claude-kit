# claude-kit

Kit de arranque para trabajar con **Claude Code + Codex + Orca**: skills, reglas de trabajo y
documentación de cómo delegar y ahorrar cuota. Extraído de un setup real en uso diario.

## Qué trae
```
skills/      find-skills, grilling, grill-me, orca-cli, orchestration,
             context-budget, canary-watch, click-path-audit, postgres-patterns
agents/      security-reviewer (subagente de seguridad)
templates/   CLAUDE.md (cómo trabajar conmigo), AGENTS.md (contrato Claude↔Codex),
             settings.example.json, codex-config.example.toml
scripts/     vigilar-codex.sh (avisa cuando Codex termina)
docs/        01 delegar a Codex con Orca · 02 modelos chicos · 03 ciberseguridad · 04 memoria y skills
install.ps1 / install.sh
```

## Instalar
1. Instalá [Claude Code](https://claude.com/claude-code), [Codex CLI](https://github.com/openai/codex) y [Orca](https://github.com/stablyai/orca).
2. Clonar y correr:
   - Windows: `powershell -ExecutionPolicy Bypass -File install.ps1`
   - macOS/Linux/Git Bash: `bash install.sh`
   Copia skills y agentes a `~/.claude/` **sin pisar** lo que ya tengas.
3. Copiá `templates/CLAUDE.md` a `~/.claude/CLAUDE.md` y editalo (secciones tuyas, tu idioma).
   Copiá `templates/AGENTS.md` a la raíz de cada proyecto.
4. Plugins recomendados dentro de Claude Code:
   `/plugin install superpowers@claude-plugins-official` y `/plugin install code-modernization@claude-plugins-official`.
5. Probá: *"usá find-skills y buscame una skill para revisar seguridad de una API"*.

## Orden de lectura
`docs/01` → `docs/02` → `templates/CLAUDE.md` → `docs/03` → `docs/04`.

## Antes de usarlo
- **Permisos:** las plantillas arrancan en modo normal (pide permiso). Los modos `--yolo` / `--dangerously-skip-permissions` son opcionales y riesgosos.
- **Skills de terceros:** leé cada `SKILL.md` antes de confiar; corren con tus permisos.
- `orca-cli` y `orchestration` son índices: la guía real sale de `orca skills get ...`.
- Licencias: `agents/security-reviewer.md` es de ECC (MIT, `LICENSE-ECC`). El resto de las skills conserva su fuente original.
