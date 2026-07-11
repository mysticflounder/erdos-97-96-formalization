#!/bin/sh
# Launch a census-554 queue worker on this machine, detached.
#
#   ./run_worker.sh [--workers N] [--queue-root PATH] [...]
#
# All arguments pass through to census554_worker.py. Defaults:
#   --workers    cpu_count - 2
#   --queue-root $CENSUS554_QUEUE_ROOT or /opt/nfs/erdos9796-flux-bridge
#
# Logs to worker.log, pid to worker.pid, in this directory.
# Stop with:  kill "$(cat worker.pid)"   (SIGTERM drains in-flight jobs)
set -eu
cd "$(dirname "$0")"

for dep in python3 msolve Singular; do
    command -v "$dep" >/dev/null 2>&1 || {
        echo "ERROR: $dep not found on PATH" >&2
        exit 1
    }
done

if [ -f worker.pid ] && kill -0 "$(cat worker.pid)" 2>/dev/null; then
    echo "ERROR: worker already running (pid $(cat worker.pid))" >&2
    exit 1
fi

nohup python3 census554_worker.py "$@" > worker.log 2>&1 < /dev/null &
echo $! > worker.pid
echo "worker started: pid $(cat worker.pid), log $(pwd)/worker.log"
