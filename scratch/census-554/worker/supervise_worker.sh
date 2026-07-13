#!/bin/bash
# Supervision loop for census554_worker: records every exit (code or signal)
# and restarts after a short delay. Kills the mystery of silent worker deaths:
# whatever kills the daemon, the exit status lands in worker-exits.log.
cd "$(dirname "$0")"
QUEUE_ROOT="${1:?usage: supervise_worker.sh <queue-root> <workers> [extra worker args...]}"
WORKERS="${2:?usage: supervise_worker.sh <queue-root> <workers> [extra worker args...]}"
shift 2
echo $$ > supervisor.pid
while true; do
  start_ts=$(date -Is)
  python3 census554_worker.py --queue-root "$QUEUE_ROOT" \
    --workers "$WORKERS" "$@" >> worker.log 2>&1
  code=$?
  msg="[supervisor] worker exited code=$code (started $start_ts, died $(date -Is))"
  if [ "$code" -gt 128 ]; then
    msg="$msg signal=$((code - 128))"
  fi
  echo "$msg" | tee -a worker-exits.log >> worker.log
  # SIGTERM drain (143) means an operator stopped it deliberately: stop too.
  if [ "$code" -eq 143 ] || [ "$code" -eq 0 ]; then
    echo "[supervisor] clean stop; not restarting" >> worker-exits.log
    break
  fi
  sleep 10
done
