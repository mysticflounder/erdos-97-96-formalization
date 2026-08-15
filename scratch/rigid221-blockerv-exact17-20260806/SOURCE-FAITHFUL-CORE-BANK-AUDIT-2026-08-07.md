# Exact-17 source-faithful core-bank audit — 2026-08-07

Scope: theorem-discovery evidence for the normalized exact-17, second-cap-nine
Rigid221 BlockerV residual. This is not a Lean coverage theorem, not a full
exact-17 closure, and not a lift to the live `card ≥ 17` theorem.

## Authenticated order-0 wave

- 28 anonymous-position placements;
- 8,280 Boolean models examined;
- 8,259 exact strict-linear contradictions;
- 21 terminal `METRIC_UNKNOWN` witnesses;
- 7 placements reached the 500-model cap;
- no linearly feasible witness was established.

An earlier standalone replay report for the 21 unknown witnesses is withdrawn:
`replay_linear_unknown.py` had inherited one hard-coded cyclic order instead of
binding the order stored in each artifact. The production CEGAR runner did bind
the correct order before every learned contradiction, so this defect does not
invalidate the 8,259 stored strict-linear cores. The standalone replayer now
fails closed unless the artifact contains a valid permutation of `Fin 17` and
binds that order before constructing the Kalmanson system. The 21 witnesses
must be replayed again with the corrected tool.

## Existing theorem-bank coverage

`classify_source_faithful_cores.py` classified all 8,259 learned cores against
the current formalized producer bank, in 24 independently written shards under
`source-faithful-cap9-v1/core-bank-audit-shards/`.

- 5,999 cores (72.6%) match at least one existing formalized theorem;
- 2,260 cores do not match the current bank;
- the dominant existing hit is the generic two-Kalmanson equality-cancellation
  consumer (5,906 hit records; cores may have multiple hits);
- the four-point/two-circle bisector-order consumers each contribute 3,310 hit
  records, again with overlap.

The 83 unbanked cores in shard 0 were minimized with tracked triangle,
positivity, and Kalmanson assumptions. All 83 replayed exact-UNSAT, but they
produced 81 dihedral support signatures. This argues against expecting one
small new named motif to cover the unbanked remainder. The generic checked
weighted-cancellation interface is a better finite-certificate target.

## Continuation method

`exact17_source_faithful_cegar.py` now accepts `--resume-artifact`. Before any
stored clause is used, it verifies schema, placement, cyclic order, and the
three semantic dependency hashes, then replays every strict-linear clause with
exact QF_LRA or rescans every formal-bank clause. Unknown or unrecognized
records fail closed. The resume canary for placement `(0,1)` revalidated all 91
old clauses and certified the next model as another strict-linear
contradiction.

The production continuation wave is running at low priority across all 28
order-0 placements. The second cyclic-order family and the Lean
source-to-finite coverage/lift remain separate obligations.

## Independent direct-CNF translation check

The direct Boolean exporter was cross-checked independently against the
source Z3 construction for order 0 and anonymous placement `(0, 1)`.  This is
an encoder-validation result, not a placement-coverage result.

- the clause-multiset digests agree for all seven static banks, covering
  1,786,428 clauses in total;
- the structural encoding has 285 variables and 145,975 clauses;
- the exact-cardinality gadgets were checked by complete truth tables for
  `4 choose 1` (16 assignments), `13 choose 1` (8,192 assignments), and
  `16 choose 4` (65,536 assignments);
- three source-Z3 models satisfied the independently emitted structural CNF;
- a CaDiCaL model for that CNF was pinned back into the source Z3 formula and
  accepted;
- the report status is `PASS`.

Authenticated artifacts:

- report:
  `source-faithful-cap9-v1/source-cnf-crosscheck-o0-p0-1.json`, SHA-256
  `e7cae4915816b92d28c635499a5f882a3142031ec266a807854d8e1e1e988cd5`;
- structural CNF:
  `source-faithful-cap9-v1/source-cnf-crosscheck-o0-p0-1.cnf`, SHA-256
  `884029ff0a06830273a71c650e70e1fa6530a088fabd04d8d83884c56bcdaf98`.

This check rules out a direct-export mismatch for the tested source formula.
It does not prove that the normalized placement exhausts the Lean leaf, that
all 28 placements or both cyclic-order families are closed, or that exact 17
lifts to the live `card ≥ 17` residual.

## Transitive two-circle equality closure and direct CNF v2

The four-point/two-circle bisector-order theorem applies after taking the
transitive closure of selected-row distance equalities, not only when the two
required equalities are supplied by single rows.  An audit of the 28 order-0
artifacts found 4,095 entries rejected at that theorem stage:

- 3,785 have two direct row-equality paths;
- 310 require a genuinely transitive equality path;
- every entry is recovered with paths of length at most five; and
- the independent detector missed none of the recorded entries.

The v2 direct exporter represents the 136 carrier edges by eight Boolean label
bits.  This is sound because any actual assignment of at most 136 distance
classes injects into the 256 labels; it does not assert that distinct edges
have distinct distances.  Selected-row incidence implies bitwise equality of
the corresponding edge labels.  XOR auxiliaries compare centered distances,
and 9,520 clauses forbid the exact two-circle order obstruction.

For one normalized cap-nine case, this layer has 17,680 variables and 107,440
clauses: 32,640 selected-equality implications, 65,280 XOR definitions, and
9,520 obstruction clauses.  An independent Z3/direct-CNF cross-check passed
four pinned cases: an empty and a harmless one-row case are SAT, while direct
and genuinely transitive obstruction cores are UNSAT in both Z3 and CaDiCaL.
The compact report is
`transitive-two-circle-cnf-validation/report.json`, SHA-256
`a4aa8f049dfb2c8f1b829c1af034cbd41a80501ea62fc7ce7d17e1bc85c9bf0b`.

The baseline direct exporter was also rerun against the current source.  Its
structural model round-trip and seven static-bank digests passed; the compact
report is `transitive-two-circle-cnf-validation/baseline-report.json`, SHA-256
`f3a4a1c563151c56f3ce9dfc02e0d883692d375682e620c2abd9d9fe9bd6ef9b`.
This older validator regenerated and checked the structural formula; despite
its `--cnf` option name, it did not authenticate the bytes of a supplied
candidate CNF.  It therefore remains valid evidence for the source/static
families, but it was not a candidate-CNF validation result.

Finally, the 423 inherited clauses for normalized placement `(0, 1)` were
reauthenticated under the v2 source: 250 formalized-bank clauses and 173
weighted-Kalmanson clauses, with no skipped or unrecognized record.  The
artifact is `source-faithful-cap9-transitive-v2/reauth-o0-p0-1.json`, SHA-256
`7148a55359913118b66fb2c431e4f2d8e4398d6f438cf2dc72ffb7f5372325d7`.
Every formalized clause now retains its checked theorem-bank witness, so the
integrated exporter can replay the exact consumer rather than trusting a
classification tag.

The authenticated integrated export has 17,693 variables and 2,040,266
clauses.  Its CNF SHA-256 is
`d0006db1b1458b563ca3edc24b6484bfd6795ed2f50f932b8d0c2fb2b1a63d95`;
its manifest SHA-256 is
`71aeefb1ce1881efbe3763515a9fe9163f0f7eb9888c43a70b2894d26d8bb9f1`.
The clause total includes the source structural encoding, seven static theorem
families, the transitive two-circle layer, and all 423 reauthenticated learned
nogoods.

The first CaDiCaL canary is SAT.  The complete assignment was independently
checked against all 2,040,266 DIMACS clauses, pinned back into the source Z3
encoder, and accepted by the source model checker.  The assignment SHA-256 is
`ca8349f8a69204b35180a4a7d972dc32d2e3da50eb35eb6e8ceb0b4bd75cfb4f`;
the analysis report SHA-256 is
`4434485b66d7aae373e629b979b781d0bc86ccd783f15ef0ec458ec89f582e8f`.

This SAT assignment is not a metric survivor.  A fresh full theorem-bank scan
finds four already-formalized contradictions: forward and reverse convex
five-point cores, Kalmanson schema G, and the generic two-Kalmanson
cancellation consumer.  The result therefore exposes a completeness boundary
in the static clause expansion, not a soundness failure and not a new theorem.
The next CEGAR step is to add a source-minimized nogood for one of these hits
and rerun the direct solver.

These remain encoder and inherited-bank soundness checkpoints, not cap-nine
coverage.  Even a future UNSAT result still needs exact proof replay plus the
remaining normalization and Lean ingress before it can close the exact-17
cap-nine leaf.

## Assignment-pinned direct refinement

The first attempted continuation learned a valid 424th clause from an
arbitrary source-Z3 model, rather than from the CaDiCaL assignment returned by
the integrated direct CNF.  Re-exporting that artifact therefore returned the
same direct assignment.  This was an efficiency failure, not a soundness
failure: the new clause was valid, but it did not advance the direct frontier.

The source runner now accepts `--pin-analysis`.  The ingress fails closed
unless the analysis has the exact model-analysis schema, normalized order and
anonymous positions, all five direct/source verification flags, exactly one
four-point row at every one of the 17 centers, source-correct exactness flags,
and a legal fifth-center choice.  It then pins all 17 rows and the fifth center
into the source Z3 formula.  The current theorem bank is rescanned; the
analysis file's recorded bank hits are not trusted.  A separate continuation
bug was also fixed: transitive-v2 resume artifacts are now checked against the
active transitive schema rather than incorrectly against the base schema.

The first assignment-pinned authenticated continuation revalidated all 423
inherited clauses, reproduced the direct assignment, and added a four-row
reverse convex-five-point nogood.  Its artifact is
`source-faithful-cap9-transitive-v2/pinned-refine2-o0-p0-1.json`, SHA-256
`b34a6fd208c58a50f797d8e5552e19a49927290ce4029ab24568792d159c8416`.
It contains 424 clauses: 250 inherited formalized-bank clauses, 173 inherited
weighted-Kalmanson clauses, and the new pinned-model clause.  Revalidation and
refinement took 979.677 seconds.

A proposal-only export of those already authenticated clauses has 17,693
variables and 2,040,267 clauses, with CNF SHA-256
`8fa98ec8b7162247cd5e793cd4c22d04e3f0a712e2e50b6026e578db8f0e5565`.
CaDiCaL returned SAT in four seconds, but the old assignment is absent.  The
new assignment was independently checked against the direct CNF, source Z3
formula, source model checker, and static bank clauses.  Its analysis SHA-256
is `4f35d8f1d710167d3a3ebfd7edaf1eaf0e921122b2a520348ff0f460965673ae`.
The full bank rejects it through schema G, the forward five-point consumer,
and generic two-Kalmanson cancellation.

Pinning that successor produced an independently authenticated schema-G
supplemental clause in 59.097 seconds.  The artifact is
`source-faithful-cap9-transitive-v2/pinned-direct2-o0-p0-1.json`, SHA-256
`8e652bb81cfad186dbb0ce92f589d23b2c52e6dfcdc3b769c33dd0f977d22090`.
Combining it with the 424-clause predecessor gives a 425-nogood proposal CNF
with 2,040,268 clauses, SHA-256
`bb120b67d5630eca9fed6f580b30a1273810a8c97e4c15ee75e7d2ecfef58ff8`.
That CNF is again SAT in four seconds with a third, distinct source-verified
assignment.  The analysis SHA-256 is
`9b9309421d6fb173d0b59629a394d89909db943342f684c5aa6409858c88585c`;
the bank again rejects it through schema G, a five-point consumer, and generic
two-Kalmanson cancellation.

Thus direct assignment-pinned refinement now advances monotonically and costs
about one minute per new bank-rejected direct model after the authenticated
base.  The two successor exports above deliberately used the exporter's
proposal-only mode because their constituent artifacts had already been
authenticated.  They are discovery artifacts, not exact-17 closure evidence.
Before promotion, a terminal candidate must be exported with learned replay
enabled and independently certified.  The present result remains SAT and
closes no Lean `sorry`.

## Static schema-G expansion

A third assignment-pinned continuation again produced schema G rather than a
new obstruction.  The one-clause artifact
`source-faithful-cap9-transitive-v2/pinned-direct3-o0-p0-1.json` has SHA-256
`a55bba7bbf36b7b159a0ac317c381fc3749b7d625565b62f66016f9bcf904f3d`
and took 58.072 seconds.  Its successor with 426 learned clauses was SAT, and
the resulting assignment again passed the direct CNF, source Z3, independent
source-model, and static-bank checks.  The analysis SHA-256 is
`6fd7d46619cfda3ec788d555de4c2f3afe65c068b61ae7269a80070f3d9cda70`.
The full bank rejected this fourth direct assignment through schema G, a
five-point consumer, and generic two-Kalmanson cancellation.

The repeated G hits exposed a static-expansion omission.  Schema G was already
kernel-clean and present in the production matcher, but the exact-17 DIMACS
exporter expanded only schemas D and E.  The successor exporter now adds all
148,512 unique dihedral exact-17 instances of G.  The independent validator
regenerates the G clauses directly from the eight selected-row atoms and
compares their full commutative multiset digest with the DIMACS block; it does
not call a newly added source-encoder helper.

An automated import cleanup changed the byte hash of the source-frozen
full-cover helper.  Existing learned clauses are therefore not silently
accepted under the new hash.  The source runner has an explicit dependency
reauthentication mode: it records the predecessor/current hash mismatch and
still replays every formalized-bank clause against the current theorem bank
and every weighted clause against the pinned exact certificate cache.  This is
a provenance repair, not a waiver.  The current 424-clause reauthenticated
artifact is
`source-faithful-cap9-transitive-v2/pinned-refine2-reauth-current-o0-p0-1.json`,
SHA-256
`1d890abd357ef9c70175cb045fe658a1390c8356111bcb93c920d232fb38c8b5`.
It records the changed full-cover hash and successfully replays 251
formalized-bank and 173 weighted-Kalmanson clauses.

## Immutable candidate validation and five-point expansion

The candidate validator is now fail-closed over an immutable CNF/manifest
pair.  It hashes the supplied CNF before validation, checks the manifest and
all source/artifact hashes, regenerates the exact expected DIMACS bytes in
memory, and compares the variable count, clause count, block counts, and final
SHA-256.  Its separate structural CaDiCaL round-trip is written to another
path, so validation can no longer overwrite the candidate.  This repairs an
interface bug in the previous validator; no promoted UNSAT result depended on
that interface.  A second validator defect that counted rotated duplicate G
instances was also fixed by independently deduplicating the clause set before
digest comparison.

The source-faithful exporter now also compiles all 61,880 unique convex
five-point equality-label obstructions.  Together with the 148,512 schema-G
clauses and the 424 reauthenticated learned clauses, the resulting proposal
has 17,693 variables and 2,250,659 clauses.  Its CNF SHA-256 is
`4510677f18463b721c1493d6ded0a52b9c3d7127628fcd7735b2e804f68117b8`;
the manifest SHA-256 is
`0085aa0224eb4025408dd3873b96c60ceebcda0c53bd00365fda3dc0bedfb35d`.
The repaired full validator passes on that exact pair; its report SHA-256 is
`fab1518f47595a4da0121d32e5bcbe924dfaf1b0d2e245929e2267b828116187`.
The focused transitive two-circle audit also passes independently, with report
SHA-256
`e85fbed2c6b0db5713f6c0e0720c40423995e5f612b778232cae691a04cfb309`.

CaDiCaL still finds a model in 4.7 seconds.  The assignment passes the exact
DIMACS check, source Z3 replay, independent source-model checker, and all
directly compiled static banks.  Static G and five-point have therefore removed
the preceding repeated hits.  The full theorem bank rejects the new assignment
only through the kernel-clean generic two-Kalmanson cancellation consumer.  Its
analysis SHA-256 is
`2d2a7fbc39d4fb28d065423de2ae1ffddbfb11b85d0f190b45d6f7ee15742364`.
The minimized four-row core has been pinned as one authenticated
formalized-bank clause in
`source-faithful-cap9-transitive-v2/pinned-direct3-two-kalmanson-o0-p0-1.json`,
SHA-256
`b89c3202cd1c9a49b95962fe897468edcb14cf4e4673f7677efaf595e7b424ae`.

This advances one normalized exact-17 cap-nine case by another certified CEGAR
step.  It is still SAT before theorem-bank refinement, proves no exact-17
coverage theorem, and closes no Lean `sorry`.
