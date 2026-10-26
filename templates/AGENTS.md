# AGENTS.md — contrato Claude ↔ Codex

Reglas para cualquier agente que trabaje en el proyecto. Poné este archivo en la raíz del repo.

## Responsable
- **Claude** es la puerta de entrada, coordinador y responsable por defecto. Decide qué delegar.
- **Codex** es el ejecutor técnico delegado. Si le das un pedido directo a Codex, es responsable de ese pedido de punta a punta.
- El responsable conserva el pedido hasta el cierre. Integra, verifica y da la respuesta final.
- El ejecutor se limita al alcance recibido: no publica, no despliega, no abre otro carril solo.

## Reparto por defecto
- **Claude:** definir el problema, decisiones, prioridades, tareas ambiguas, navegador con sesión, conectores, verificar en sistemas vivos.
- **Codex:** cambios de código, refactors, tests, scripts, procesar archivos, diagnóstico reproducible.
- **Tarea chica:** la hace quien coordina. No se delega si redactar la orden + esperar + verificar cuesta más que hacerla.
- **Tarea mixta:** Claude fija decisiones y criterios de aceptación; Codex implementa; Claude verifica una vez e integra.

## Aislamiento
- Nunca dos agentes con permiso de escritura sobre el mismo checkout/rama/archivos a la vez.
  Dos terminales con títulos distintos **no** aíslan nada.
- Toda tarea delegada que edita un repo corre en **su propio worktree**.
- Máximo dos ejecutores activos y uno por repo, salvo corte explícito sin estado compartido.
- Antes de abrir un carril: `git status`, `git worktree list`, sesiones activas. Los cambios previos tienen dueño: no se incorporan ni se revierten.

## Contrato de una orden
Toda orden dice: **responsable, repo, rama/worktree, objetivo, alcance, archivos permitidos,
qué NO tocar, verificaciones, evidencia esperada y dónde frenar.**
Más de un paso → archivo `TAREA_<tema>.md`. Corrección chica → prompt autocontenido.
Que el ejecutor cierre con un informe: estado, archivos, pruebas, commit si estaba autorizado, riesgos, bloqueos.

## Límites
- Nada destructivo sin preguntar. Papelera antes que borrar.
- Pedir OK antes de todo lo que sale de la máquina: mails, publicaciones, mensajes, deploys.
- Secretos: nunca en archivos versionados.
