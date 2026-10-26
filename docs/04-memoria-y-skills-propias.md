# Memoria y skills propias

## Memoria (archivos, no cabeza)
Cada sesión arranca de cero. Estructura recomendada, en `~/.claude/projects/<proyecto>/memory/`:

- `MEMORY.md`: índice de una línea por memoria (`- [Título](archivo.md) — gancho`). Se carga siempre. Sin contenido adentro.
- Un archivo por hecho, con frontmatter:
  ```markdown
  ---
  name: feedback-corregirme-si-me-equivoco
  description: una línea para decidir si es relevante
  metadata:
    type: user | feedback | project | reference
  ---
  La regla. **Why:** el incidente que la originó. **How to apply:** cuándo y cómo.
  ```
- Cada vez que me corrijas ("no hagas X", "así sí"), pedime que lo guarde como `feedback` con su *Why*.
  Así dejás de repetirte. Revisá la memoria cada tanto y borrá lo que quedó viejo.

## Skills propias
Una skill es una carpeta con `SKILL.md` (frontmatter `name` + `description` que dice **cuándo** usarla).
Se crean en `~/.claude/skills/<nombre>/`. Ejemplos de lo que conviene convertir en skill: un procedimiento
que repetís, un checklist de deploy, la receta para armar un informe. Pedile a Claude: "convertí lo que
acabamos de hacer en una skill" y revisá el resultado.

## Proponer skills con motivo
Regla útil: Claude propone en una línea "para este caso sumaría la skill X porque Y" y vos decís sí o no.
Nunca instalar sin tu OK.

## Skills incluidas, de un vistazo
- `find-skills`: descubre/instala skills. `grilling` / `grill-me`: te entrevistan hasta estresar un plan antes de construir.
- `orca-cli` / `orchestration`: manejar Orca, terminales y agentes (ver `01-...`).
- `context-budget`: auditar consumo de contexto. `canary-watch`, `click-path-audit`, `postgres-patterns`: calidad y seguridad.
- Recomendado además: plugin **superpowers** (`/plugin install superpowers@claude-plugins-official`): brainstorming, planes, TDD, debugging sistemático, verificación antes de cerrar.
