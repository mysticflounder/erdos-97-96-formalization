# P97 bounded compute lane takeover

This directory is the non-overlapping staging area for the compute-lane
handoff begun on 2026-07-28.  It does not claim completeness of the
`census/p97_search` enumeration.

The first gate is `fixed_n11_pilot.py`.  It freezes the card-11 cube from
`scratch/census-554/separation_probe_runs/
run-20260713T054559Z-oracle13-from-iter813/combined_frontier.json` and asks a
strictly weaker realization question:

- impose the 33 selected equidistance equalities;
- impose pairwise distinctness through Rabinowitsch generators;
- omit convexity, order, and "no additional member of this distance class"
  constraints.

An exact Nullstellensatz certificate for this weaker system is a sound
non-realizability result for the frozen cube.  A timeout, a failed screen, or
failure to obtain a certificate remains `UNKNOWN`; it is never reported as a
realization.

Run from the repository root:

```text
uv run python scratch/compute-lane-takeover/fixed_n11_pilot.py
```

The script first checks one known-dead and one known-satisfiable control.  It
then runs a 30-second msolve screen and, only on a deadness signal, gives the
Singular certificate path a cumulative 240 CPU-second budget.  Any retained
certificate is re-parsed and independently checked in exact `Fraction`
arithmetic by `scratch/census-554/verify_certs.py`.
