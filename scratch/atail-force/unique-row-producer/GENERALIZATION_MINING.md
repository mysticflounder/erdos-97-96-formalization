# Generalization mining over the banked infeasible row cores

Adam-authorized lane (2026-07-16). Harness:
`generalization_mining.py`; raw records in the session scratchpad
(`genmine_run1.jsonl`, `genmine_smoke*.jsonl`, `genmine_escalate.jsonl`).

## Principle

A banked core certifies its full row set: UNIT ideal for unit cores,
Rabinowitsch radical membership of the banked forced pair for
forced-pair cores. A subset of generators generates a subset ideal in
the same ring, so a certificate for a shared row subset covers every
banked core containing that subset — promoting instance certificates
toward family certificates.

Candidates are kin-pair shared row subsets within one family bank
(floors: 5 rows for unit banks, 6 for forced-pair banks), deduplicated
by subset, coverage recomputed across the whole family bank.

## Smoke gate

Three banked certificates reproduced through the harness before any
mining claim (600 s per oracle): `unit-core-555-65` CROSSCHECKED_UNIT
×3; `forced-pair-core-654-47` Rabinowitsch (7,8) UNIT ×3;
`forced-pair-core-555-01` Rabinowitsch (6,7) UNIT ×3. Gate: PASS.
(A first 120 s attempt failed only on `forced-pair-core-555-01`
Singular TIMEOUT; msolve returned UNIT ×2 there.)

## Run 1 — 44 candidates, 120 s per oracle: no subset wins

Enumeration produced 44 candidates (count unchanged by the
`unit-core-555-68`/`-69` admissions — their kin sharing stays below
the floors). Oracle patterns (msolve forward / msolve reverse /
Singular):

| pattern | count | reading |
|---|---|---|
| NONUNIT / NONUNIT / NONUNIT | 11 | definitive negative |
| NONUNIT / NONUNIT / TIMEOUT | 21 | near-certain negative |
| NONUNIT / TIMEOUT / TIMEOUT | 2 | likely negative |
| TIMEOUT / NONUNIT / TIMEOUT | 1 | likely negative |
| TIMEOUT / TIMEOUT / TIMEOUT | 9 | open at 120 s |

Zero candidates reached CROSSCHECKED_UNIT or
CROSSCHECKED_FORCED_ZERO_PAIR_SUBSET.

Reading of the definitive negatives: the kin-shared 5–6 row subsets
are proper ideals — the rows the kin cores do NOT share are
load-bearing for every one of those contradictions. The banked
certificates do not collapse to their common parts.

## Pair bug found and fixed in this pass

Run 1 tested every forced-pair candidate against Rabinowitsch pair
(7,8). The bank stores per-core forced pairs, and twelve of the
thirteen fp-555 cores force **(6,7)** (only `forced-pair-core-555-09`
forces (7,8)). The two fp-555 candidates in run 1
(`fp-555-02/-03`, `fp-555-10/-13`) therefore tested the wrong
statement and their run-1 records are **void**.

Fix (committed with this report): the harness derives the Rabinowitsch
pair from the parent cores' banked
`forced_zero_squared_distance_pair` (parents with differing pairs are
skipped), restricts forced-pair coverage to same-pair cores, records
the tested pair in each output record, and the smoke gate gained the
(6,7) certificate above.

## Escalation — 12 targets, 600 s per oracle

Selected: the two void fp-555 candidates (re-run with the correct
(6,7) pair), the nine TIMEOUT ×3 candidates, and
`fp-654-45/-46` (TIMEOUT/NONUNIT/TIMEOUT). Driver:
scratchpad `genmine_escalate.py`.

Excluded from escalation: all candidates where at least one msolve
order already returned NONUNIT (near-certain negatives — Singular
confirmation would not change the mining outcome).

### Escalation results (2026-07-16): zero wins at 600 s

All 12 targets completed. Verdict triples
(msolve fwd / msolve rev / Singular):

| triple | count | reading |
|---|---|---|
| TIMEOUT / TIMEOUT / TIMEOUT | 8 | open at 600 s |
| NONUNIT / NONUNIT / TIMEOUT | 2 | near-certain negative |
| NONUNIT / TIMEOUT / TIMEOUT | 1 | likely negative |
| NONUNIT / NONUNIT / NONUNIT | 1 | definitive negative |

Zero targets reached CROSSCHECKED_UNIT or
CROSSCHECKED_FORCED_ZERO_PAIR_SUBSET — a 5× budget increase decided
nothing positively.

Per family: all six unit-family intersections (`555-42∩53`,
`555-51∩55`, `555-54∩55`, `555-08∩09`, `555-10∩13`, `555-64∩65`,
5–6 shared rows each) stayed TIMEOUT ×3 — the UNIT test on these
subsystems is beyond every oracle at 600 s. The six forced-pair
intersections all returned NOT_CROSSCHECKED: the two re-run
(previously void) fp-555 candidates now have valid records under
the correct (6,7) pair — `fp-555-10∩13` is the definitive negative
(NONUNIT ×3) and `fp-555-02∩03` a near-certain negative
(NONUNIT ×2 + Singular TIMEOUT); `fp-654-45∩46` likewise
NONUNIT ×2 + TIMEOUT; `fp-654-35∩36` NONUNIT fwd only;
`fp-654-05∩06` and `fp-654-26∩27` stayed TIMEOUT ×3.

Mining conclusion unchanged from run 1: the banked certificates do
not collapse to their kin-shared common parts — every decided
intersection is a proper ideal, and the rows kin cores do not share
remain load-bearing. Raw records: `genmine_escalate_600s.jsonl`
(this directory; 13 lines: header + 12 targets).
