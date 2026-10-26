# Ciberseguridad: qué hay y qué falta

Honestidad primero: **no hay un pack de skills ofensivas/defensivas instalado**. Lo que sí hay es revisión
de seguridad de código. Para lo demás, se buscan con `find-skills` (y se instalan sólo con tu OK).

## Incluido
| Pieza | Para qué | Dónde |
|---|---|---|
| `/security-review` | Revisión de seguridad de los cambios pendientes de la rama | Viene con Claude Code |
| `agents/security-reviewer.md` | Subagente: secretos, SSRF, inyección, cripto insegura, OWASP Top 10. Úsalo tras tocar login, APIs o datos sensibles | este repo (MIT, de ECC, ver `LICENSE-ECC`) |
| Plugin `code-modernization` → `security-auditor`, `/modernize-harden` | Auditoría adversarial (OWASP, CWE, CVEs, secretos) con parche revisable | `/plugin install code-modernization@claude-plugins-official` |
| `skills/canary-watch` | Chequeo post-deploy de una URL (HTTP, assets, errores de consola) | este repo |
| `skills/click-path-audit` | Bugs de estado: botones que se pisan entre sí | este repo |
| `skills/postgres-patterns` | Esquemas, índices y políticas RLS seguras | este repo |

## Cómo buscar más (la skill que encuentra skills)
`skills/find-skills`: pedile "buscá una skill para pentesting web / revisión de dependencias / secretos".
Corre `npx skills find <tema>` y mira https://skills.sh. **Antes de instalar:** leé el `SKILL.md` completo y
verificá el autor. Una skill corre con todos tus permisos. Instalación: `npx skills add <repo> --skill <nombre> -g -y`.

## Reglas de uso
- Sólo sobre sistemas **tuyos o con autorización escrita** (CTF, pentest contratado, tu propio código).
- Los hallazgos son hipótesis hasta que los reproducís. Verificá antes de reportar.
- Nunca pegues secretos reales en el chat ni los guardes en archivos versionados.
