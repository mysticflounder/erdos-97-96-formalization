# Exact-11 v7 certificate ingress

`prepare_verified_case.py` is a solver-free DRAT-to-LRAT materializer for the
four frozen `card11_exact5_common_fullradius.v7` cases.  It refuses production
materialization unless the case has a hash-bound `verification.json` containing
an exact independent `drat-trim` `s VERIFIED` result.

The two expensive certificate passes are:

1. `drat-trim input.cnf proof.drat -c core.cnf -l core.drat`
2. `drat-trim core.cnf core.drat -L core.raw.lrat`

The first pass emits the strict input core and a core-relative DRAT together.
This avoids materializing an original-numbering LRAT that cannot replay against
the strict core.  The input CNF is streamed during occurrence authentication;
only the much smaller core remains in memory.

Audit without running a certificate tool:

```bash
uv run python \
  scratch/card11-exact5-common-fullradius-v7-ingress/prepare_verified_case.py \
  scratch/card11-exact5-common-fullradius-v7/runs/s2_o0 \
  --audit-only
```

If the serial probe stopped after writing an UNSAT DRAT, finish the existing
artifact without rerunning CaDiCaL:

```bash
uv run python \
  scratch/card11-exact5-common-fullradius-v7/verify_artifact.py \
  scratch/card11-exact5-common-fullradius-v7/runs/s2_o9 \
  --timeout 1200
uv run python \
  scratch/card11-exact5-common-fullradius-v7-ingress/prepare_verified_case.py \
  scratch/card11-exact5-common-fullradius-v7/runs/s2_o9 \
  --finalize-existing-verification
```

The finalization step adds the same `independent_verification` and hash-bound
source/artifact provenance records that the uninterrupted serial probe writes.

Materialize after independent DRAT verification:

```bash
uv run python \
  scratch/card11-exact5-common-fullradius-v7-ingress/prepare_verified_case.py \
  scratch/card11-exact5-common-fullradius-v7/runs/s2_o0 \
  --output-dir \
  scratch/card11-exact5-common-fullradius-v7-ingress/s2_o0-ingress \
  --timeout-seconds 3600
```

Then run the exact `lean_replay_command` recorded in `ingress-report.json`.
The generated theorem proves only the frozen trimmed-core CNF unsatisfiable.
It does not provide either the geometric source-to-valuation adapter or the
kernel case split covering the four shell cases.

The checked two-clause LRAT/Lean smoke fixture is under `smoke/`.
