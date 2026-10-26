# Orquestar modelos más chicos (ahorrar cuota)

**Regla:** el modelo barato es el default; el caro hay que justificarlo.

| Barato | Caro |
|---|---|
| `codex --yolo -m gpt-5.6-luna` / subagente `haiku` | `codex --yolo` (default) / subagente `sonnet` u `opus` |
| La orden ya tiene pasos numerados, decisiones tomadas, archivos y líneas señalados, tests enumerados y evidencia pedida. **Eso es ejecución.** | Falta cerrar el diseño, hay que decidir arquitectura, toca plata o impuestos, o un error se arrastra. |

- Si el barato entrega mal, se reenvía al caro con lo que hizo. Al revés no.
- Una orden bien escrita es justamente la señal de que alcanza el modelo barato.
- Lo creativo o complejo (3D, ideas por toma): modelo fuerte en otra terminal con un archivo de contrato,
  ```bash
  orca terminal create --json --title "<tema>" --command "claude --model claude-opus-5-5"
  ```
  o un subagente con `model: opus`.

## Subagentes de Claude
- Default global: `"env": {"CLAUDE_CODE_SUBAGENT_MODEL": "sonnet"}` en `~/.claude/settings.json` (ver `templates/settings.example.json`). Bajalo a `haiku` por subagente cuando la tarea es mecánica.
- Un agente que llama a otro modelo (p. ej. un agente que invoca `claude-code`): modelo `haiku`, **una** llamada, sin reintentos.
- No lances subagentes por costumbre: cada uno arranca en frío y re-lee todo el contexto.

## Medir quién gasta
Si se acaba el límite sin saber por qué: sumá los tokens por sesión desde los logs en `~/.claude/projects/**/*.jsonl` (una sesión larga en el modelo caro es lo que más pesa).
Antes de lanzar algo que consuma modelo, avisá qué lanzás y dónde. Skill `context-budget` para auditar qué ocupa tu contexto.

## Un paso, y /clear
Cerrá cada paso con algo terminado, dejá el siguiente escrito en el plan (con todo para retomarlo en frío), commit, `/clear`. Cada paso arranca liviano.
