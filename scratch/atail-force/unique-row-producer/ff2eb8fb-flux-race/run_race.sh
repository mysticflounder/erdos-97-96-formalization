#!/usr/bin/env bash
# Singular strategy race for witness ff2eb8fb Rabinowitsch pair-(7,8) system (654 iter-68).
# Smoke-gates the encoding, launches all job *.sing in parallel with
# per-job timeout + memory cap, kills losers on first parsed verdict.
set -u
cd "$(dirname "$0")"

BUDGET=21600          # 6h per job
MEMCAP_KB=3145728     # 3 GiB virtual per job
POLL=20

parse_verdict() {
  # echoes UNIT / NONUNIT / nothing, for a job output file
  awk '/SINGULAR_VERDICT_BEGIN/{f=1;next} /SINGULAR_VERDICT_END/{f=0} f&&NF' "$1" 2>/dev/null | tr -d ' \t' | {
    read -r line || exit 0
    if [ "$line" = "0" ]; then echo UNIT; elif [ "$line" = "1" ]; then echo NONUNIT; fi
  }
}

echo "=== smoke gates ==="
for algo in std slimgb groebner; do
  Singular -q < "smoke_unit_${algo}.sing" > "smoke_unit_${algo}.out" 2>&1
  v=$(parse_verdict "smoke_unit_${algo}.out")
  if [ "$v" != "UNIT" ]; then echo "SMOKE FAIL unit/${algo}: got '$v'"; exit 2; fi
  Singular -q < "smoke_nonunit_${algo}.sing" > "smoke_nonunit_${algo}.out" 2>&1
  v=$(parse_verdict "smoke_nonunit_${algo}.out")
  if [ "$v" != "NONUNIT" ]; then echo "SMOKE FAIL nonunit/${algo}: got '$v'"; exit 2; fi
  echo "smoke ${algo}: PASS"
done

echo "=== launching race ==="
declare -A PIDS
for f in std_fwd std_rev std_perm1 std_perm2 std_perm3 std_perm4 \
         slimgb_rev slimgb_perm1 slimgb_perm2 slimgb_perm3 slimgb_perm4 \
         groebner_fwd; do
  ( ulimit -v "$MEMCAP_KB"; exec timeout "$BUDGET" Singular -q < "${f}.sing" > "${f}.out" 2> "${f}.err" ) &
  PIDS[$f]=$!
  echo "launched $f pid=${PIDS[$f]}"
done

START=$(date +%s)
while :; do
  sleep "$POLL"
  for f in "${!PIDS[@]}"; do
    v=$(parse_verdict "${f}.out")
    if [ -n "$v" ]; then
      NOW=$(date +%s)
      echo "{\"winner\": \"$f\", \"verdict\": \"$v\", \"elapsed_s\": $((NOW-START))}" > WINNER.json
      echo "WINNER: $f -> $v after $((NOW-START))s; killing remaining jobs"
      for g in "${!PIDS[@]}"; do
        [ "$g" != "$f" ] && kill "${PIDS[$g]}" 2>/dev/null
      done
      pkill -P $$ 2>/dev/null
      exit 0
    fi
  done
  alive=0
  for f in "${!PIDS[@]}"; do
    kill -0 "${PIDS[$f]}" 2>/dev/null && alive=$((alive+1))
  done
  if [ "$alive" -eq 0 ]; then
    echo '{"winner": null, "verdict": "ALL_TIMEOUT_OR_ERROR"}' > WINNER.json
    echo "all jobs finished with no parsed verdict (timeout/error everywhere)"
    exit 1
  fi
done
