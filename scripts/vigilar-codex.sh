#!/usr/bin/env bash
# Espera a que una terminal de Codex en Orca escriba la marca de fin.
# Uso: vigilar-codex.sh <terminal> [marca] [espera_max_s]
# Se corre con run_in_background: cuando sale, Claude recibe el aviso.
term="$1"; marca="${2:-Worked for|CODEX_TERMINADO}"; max="${3:-7200}"
inicio=$(date +%s)
base=$(orca terminal read --terminal "$term" 2>/dev/null | grep -Ec "$marca")
while :; do
  sleep 30
  n=$(orca terminal read --terminal "$term" 2>/dev/null | grep -Ec "$marca")
  if [ "$n" -gt "$base" ]; then
    echo "TERMINO $term"
    orca terminal read --terminal "$term" 2>/dev/null | tail -c 3000
    exit 0
  fi
  if [ $(( $(date +%s) - inicio )) -ge "$max" ]; then
    echo "TIEMPO_AGOTADO $term"; exit 1
  fi
done
