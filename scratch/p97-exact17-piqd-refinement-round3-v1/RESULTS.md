# Exact-17 Rank-Four PIQD refinement round 3

Date: 2026-08-09

Classification: finite normalized-case CEGAR progress only. Exact-17 remains
open. This run does not establish aggregate coverage, a universal lift, an
UNSAT certificate, or closure of a Lean `sorry`.

## Authenticated ingress

The live PIQD session
`667fd23e-3588-4e02-b555-44f806c8c6ac` was seeded from the frozen Rank-Four
aggregate:

- variables: 74,813;
- clauses: 4,254,176;
- SHA-256:
  `2aa85c2368c3f271caebe47c4a6b861cc7e64d177cd349e58697a724c4b43605`.

The two previously banked, ordered cut batches were replayed with 120 and 86
clauses. The resulting pre-round formula was exported byte-for-byte as
`pre-round3.cnf`:

- clauses: 4,254,382;
- SHA-256:
  `cf1787a45bb8d0e7b434cf2f733581b08b8a83baebbba22d7efae3aad8cf74bd`.

The large CNF exports are intentionally ignored by Git. The frozen aggregate
and the four ordered cut receipts are sufficient to reconstruct the final
formula.

## Refinement results

PIQD produced three total SAT assignments. Every captured assignment contains
exactly 74,813 literals. `analysis-{1,2,3}.json` independently checks the
complete formula chain, all source predicates, the static theorem bank, and
the first reported bank witness.

| solve | clauses | time | model SHA-256 | source result |
|---:|---:|---:|---|---|
| 1 | 4,254,382 | 6,502 ms | `8c99713f7df2e1ab7d054977c6290ad3feb066740e4f23e39ffe0123054fc6d2` | bank hit |
| 2 | 4,254,500 | 1,194 ms | `f77af1d3cdde3978ce6f22e8c74454467a428cc851da2ed961810d9be68ae7c9` | bank hit |
| 3 | 4,255,358 | 6,778 ms | `0bb5dcf1622134883a6d2fe46ab8b5bf59ee77b48497c2cf7177101be3aff875` | bank hit |

The admitted batches are instances of the already source-clean consumer
`Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate.false_of_twoKalmansonLabelCancellationData`.

The first batch contains 118 clauses, all violated by model 1 and novel against
the 4,254,382-clause base. Its ordered clause digest is
`ff0b9a82deeb337b541a91ecf2d5db10d8e8a02285e96644819d3552bd5f3772`.

The second batch contains 858 clauses, all violated by model 2 and novel
against the base plus the first batch. Its ordered clause digest is
`99cb62b517d16e98d555e25a82ae8c8fcb741d6c484d681300e8d473bd01d7f5`.

Thus this round admitted 976 new source-backed clauses without adding a new
mathematical axiom or theorem schema.

## Frozen endpoint

The final PIQD export has:

- variables: 74,813;
- clauses: 4,255,358;
- bytes: 196,319,709;
- SHA-256:
  `8bf247e1cf12283aca6e4e5f520cd90eccecd146ba295781da743308322e04ab`.

The session was then closed. `session-live-final.json` and
`session-closed.json` agree on the dimensions, three solves, and final `SAT`
status. The third model still has a replayed theorem-bank hit, so the next
mathematical action is another checked refinement after PIQD is restarted, not
an exact-17 closure claim.

Closing this session also released the live daemon for deployment of PIQD's
new submitted-to-certificate clause-map endpoint. That endpoint is required
for a future proof-producing UNSAT handoff but is not needed for the soundness
of these SAT-side refinements.

## Mandatory post-wave general-theorem search

The wave-boundary search was run after the session closed. Direct scans for
the existing shared-middle-pair, five-CCW/three-row, and six-CCW/two-K2/
three-row consumers found no occurrence in any of the three source-faithful
models, including all rotations and reflections. The ordinary two-Kalmanson
primitive scan also found no single motif common to all three models.

Forced exact linear replay was more productive. Each model is linearly
infeasible after its selected-row equalities are combined with strict
Kalmanson inequalities. Minimizing those contradictions produced three new
dihedral support signatures:

| model | points | equalities | inequalities | cancellation weights | support SHA-256 |
|---:|---:|---:|---:|---|---|
| 1 | 10 | 9 | 16 (`4 K1`, `12 K2`) | fifteen `1`, one `2` | `67fbb49c5aee37245193fc9def77e9411c20a9da08814609e2dc2c0554eea1b0` |
| 2 | 9 | 6 | 6 (`1 K1`, `5 K2`) | six `1` | `631f1c6cdf679c8eeb87a41d69aed8f17217e33985a40de2a0e35885c86d96ad` |
| 3 | 9 | 7 | 5 (`2 K1`, `3 K2`) | five `1` | `3a8ae6aa7384b639bf77946b0e3e4ecf1ba3812c9a880774faa3e9a4d2d868d4` |

None matches any of the 24,256 canonical support records in the 80 historical
tracked-support files. All three nevertheless certify through the existing
cardinality-generic Lean consumer
`Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate.false_of_weightedKalmansonCancellationData_of_check`.
Thus this search banked three reusable theorem instances without requiring a
new Lean theorem.

`postwave_weighted_search.py` reproduces the evidence gate, exact support
minimization, historical novelty scan, positive-weight classification, and
generic-consumer certification. Its authenticated aggregate output is
`postwave-theorem-search.json`; the three complete instance payloads are
`postwave-weighted-certificate-{1,2,3}.json`.

These instances are cardinality-generic mathematical cuts, but this artifact
does not yet compile their exact-17 dihedral clause orbits into a new PIQD
receipt. It is therefore theorem-bank expansion, not exact-17 coverage,
universal closure, or closure of a Lean `sorry`.
