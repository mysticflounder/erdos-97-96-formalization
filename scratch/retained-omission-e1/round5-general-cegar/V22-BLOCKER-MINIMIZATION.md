# V22 blocker-minimization pilot

This bounded pilot compares two authenticated routes against the saved v19
terminal assignment blockers. It launches no production wave and does not edit
v19--v21.

The selector route is discovery-only: it checks all 825 semantic fixes as v16
assumptions with Z3's SMT core-minimization option enabled. A selector core is
never admitted without a separate raw-formula replay.

The deletion route starts from an authenticated v19 journal assignment,
retains a deterministic subset, reparses and hash-checks
`full_frozen_v19.smt2.gz`, substitutes exactly those fixes and `trackers=true`,
then applies `simplify`, `pb-preprocess`, and `card2bv`. Admission requires both
the primary check and an independent fresh raw-blob parse/replay to return
`unsat`. SAT, UNKNOWN, preprocessing failure, or replay disagreement retains
the original 825-bit blocker.

The generated `v22-blocker-minimization-pilot.json` is the exact run report.
This remains external Z3 exact-`n=15` evidence, not a Lean theorem or
kernel-checked closure.

## Bounded result

For saved assignment ordinal 0, deterministic retained suffixes of 103, 90,
75, 60, and 55 fixes all replayed `unsat` twice from independent parses of the
authenticated raw blob. The final admitted pilot blocker therefore has 55
fixes, removing 770 of the original 825. Both admitted 55-fix checks produced
199,168 assertions after preprocessing. At 52 fixes, the primary replay timed
out after 60 seconds while the independent replay returned `unsat`; replay
disagreement therefore failed closed and retained the original 825-bit
blocker. This is the observed solver/resource boundary, not evidence of SAT or
minimality.

The selector-assumption route, with `smt.core.minimize` and a 30,000 ms budget,
returned `unknown` / `canceled` and no core. Thus v22's positive result comes
only from authenticated semantic-fix deletion, not selector-core extraction.
