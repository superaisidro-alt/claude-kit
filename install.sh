#!/usr/bin/env bash
# Copia skills y agentes a ~/.claude sin pisar lo existente.
set -e
HERE="$(cd "$(dirname "$0")" && pwd)"
DEST="$HOME/.claude"
mkdir -p "$DEST/skills" "$DEST/agents"
for d in "$HERE"/skills/*/; do
  n="$(basename "$d")"
  if [ -e "$DEST/skills/$n" ]; then echo "salto skill (ya existe): $n"; else cp -r "$d" "$DEST/skills/$n"; echo "skill: $n"; fi
done
for f in "$HERE"/agents/*.md; do
  n="$(basename "$f")"
  if [ -e "$DEST/agents/$n" ]; then echo "salto agente (ya existe): $n"; else cp "$f" "$DEST/agents/$n"; echo "agente: $n"; fi
done
echo "Listo. Falta: copiar templates/CLAUDE.md a ~/.claude/CLAUDE.md y revisar docs/."
