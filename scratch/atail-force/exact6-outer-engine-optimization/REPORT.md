# Exact-six direct-CNF / piqd checkpoint report

Date: 2026-07-18/19

Status: **`NONCONVERGENT_UNDER_OPTIMIZED_ENGINE` — STOP LITERAL CEGAR.**

No production Lean file changed and no production `sorry` closed.  The runs
below concern only the fixed n=14 `(5,6,6)` exact-six mutual abstraction.  They
do not decide cap cardinality at least seven and do not prove the
variable-cardinality A-tail parent.

## Result

The direct-CNF adapter and the deployed piqd raw-CNF endpoint are sound enough
for bounded theorem discovery: submitted and exported CNFs agree byte for
byte, every 476-variable model is complete and satisfies the submitted CNF,
the decoded source packet reconstructs the Boolean model, and every banked cut
passes both exact metric replay and independent cut replay.

They do not produce a convergence signal.  Three initial seven-orbit
checkpoints each returned ten further exact-dead candidates per orbit.  A
fourth checkpoint, after correcting the cyclic transporter, returned 28 more
exact-dead cuts before five orbit budgets and two fail-closed outer timeouts.
No orbit became structurally UNSAT and no exact retained survivor appeared.

The first round-three minimizer deletion-minimized only inside each returned
solver certificate.  A subsequent global short-core audit found a stronger
normal form: all nine shell-free six-membership cuts have deletion-minimal
five-constraint certificates consisting of two strict Kalmanson inequalities
and three row equalities.  Cyclic normalization reduces those nine cores to
two dihedral classes.  One class was already in the bank modulo a cyclic
reindexing that the transporter had omitted; the other is exactly the
production `OrderedCrossRowCore.false` row/order family.

This is the specification's terminal decision D:

> The optimized engine can produce verified exact cuts, but literal families
> are not saturating and the seven orbits remain live.  Stop literal CEGAR and
> require an aggregate theorem or omitted Euclidean/MEC/parent information.

## Piqd endpoint and trust gates

The active daemon was started from

```text
/Users/adam/projects/rustprojects/target/release/piqd
```

with SHA-256

```text
ef0fa615441b65ca5c0741d1bc13f77eaa2077c0e3d3ca20482d5bbb77d4cdc2
```

The older `~/.cargo/bin/piqd` binary did not expose `/jobs/prepare-cnf` and was
not used.  Each accepted piqd iteration performs the following checks before
the metric oracle or bank mutation:

1. submit deterministic DIMACS through `/jobs/prepare-cnf`;
2. confirm and poll the pinned job;
3. retrieve `/cnf` and require byte identity with the submitted bytes;
4. retrieve a complete, consistent assignment for variables `1..476`;
5. substitute the assignment through every clause;
6. decode and reconstruct all Boolean fields bit for bit;
7. independently check selected-row strong connectivity;
8. run the exact metric oracle;
9. replay the returned cut and prove that it excludes the current witness;
10. only then append the cut.

Piqd UNSAT remains fail-closed unless a proof artifact and Lean endpoint can be
retrieved and independently checked.  No checkpoint reached that path.

## Input corpus

The restart used the independently replayed immutable banks:

| bank | records | SHA-256 |
| --- | ---: | --- |
| `exact6-integrated-milp/global-cuts-cross-20260718.jsonl` | 12,509 | `92a88957465e7d9e3c47392e8748ad6a8da05089b75e14abb7b16181a17e7288` |
| source recovery bank | 1,000 | `719975b8320c73bc4c803ea33d0971b2437534a9d594c05df1ca532534c1511e` |
| target recovery bank | 1,000 | `5fbcfb8f91f488ae3bd50d1d68880a0cb7555ea50a852b4ae5aa6eff5cdce5ef` |

All seven fixed-leaf dual seeds were replay-gated before use.

## Bounded checkpoints

| checkpoint | outer oracle | cuts | result | merged SHA-256 |
| --- | --- | ---: | --- | --- |
| `runs/20260719T023555Z` | direct CaDiCaL | 70 | 10 new cuts in every orbit | `6c7077c0b42261ade1a0db990f2cc0814c281137140ac561a6636c775b00ac78` |
| `runs/20260719T032400Z-piqd-round2` | piqd/CaDiCaL | 70 | 10 new cuts in every orbit | `99dfee0f3aea32c8dbfdcf4c698506c7cd6c154165c9cb189330bf6f503c0807` |
| `runs/20260719T034302Z-piqd-round3` | piqd/CaDiCaL | 70 | 10 new cuts in every orbit | `f8d4dd4335f7c123a5bd753870fc52c64a1ded396de0f47b43af92bc20ef2fd4` |
| `runs/20260719T041707Z-piqd-cyclic-round4` | piqd/CaDiCaL | 28 | five orbits reached 5 cuts; two stopped fail-closed at 2 and 1 | `7878bc41df5443964edfa8d55ee2bda9137b78654b9f46fcd580f48be236127d` |

Round two has 69 semantic cuts because its first continuation and reverse-
continuation cuts coincide.  Its 69 semantic cuts are new over round one.
Round three has 70 semantic cuts, all new over round two.
Round four has 28 exact and semantic unique cuts, all new over round three;
five are conditioned on the exact-five shell.  The two `UNKNOWN` results are
ordinary 180-second outer timeouts and bank no cut from the timed-out jobs.

The per-orbit median elapsed times were about 102 seconds for the first direct
checkpoint, 97 seconds for piqd round two, and 131 seconds for piqd round
three.  These are diagnostic, not fixed-corpus acceptance benchmarks because
the transported bank grew between rounds.  They do not demonstrate the 2x
end-to-end speedup required by the specification.  Event logs show that exact
metric classification is normally around 0.15 seconds; repeated fresh
CaDiCaL solves dominate.  The raw-CNF piqd endpoint does not retain learned
clauses across CEGAR iterations.

## Generalization review

Round one exposed the four-role schema

```text
row a: b,d
row c: a,d
row d: a,b
```

and round two rediscovered the already-production theorem

```text
Problem97.Census554.FourPointTwoCircleBisectorOrderBridge.
  false_of_three_rows_and_cyclic_subsequence
```

The corresponding four-role finite schema was added to the round-two overlay,
contributing 2,002 new n=14 applications.

The local round-three minimizer is

```text
mine_checkpoint_schemas.py
```

and its replayed output is

```text
runs/20260719T034302Z-piqd-round3/
  checkpoint-70-piqd.minimized-schemas.json
```

with SHA-256

```text
a48ff8d2a7b0add33fa6fc3b02382e95648afa4aa21096d9e70886bfd3a5ca08
```

Its 56 reported schemas are deletion-minimal relative to the constraints in
each solver certificate, not globally shortest consequences of the membership
packet.  They remain exact theorem-discovery artifacts but should not be used
as the aggregate normal form.

The global short-core audit instead identifies one new six-role family.  For
ordered roles `0 < 1 < 2 < 3 < 4 < 5`, one representative certificate is

```text
kal2(0,1,3,4) + kal1(0,2,4,5)
  + row 4:(1,5) - row 2:(0,5) + row 3:(0,1) = 0.
```

It is exact-QF_LRA UNSAT and every single-constraint deletion is SAT.  Seven of
the nine six-membership round-three cuts lie in this dihedral class, which is
the row/order pattern consumed by

```text
Problem97.ATailCriticalFiberClosingCore.OrderedCrossRowCore.false
```

The remaining two cuts lie in an older bank class and were missed solely
because the historical transporter generated increasing embeddings and one
reflection, but not cyclic rotations of the compressed order.

`audit_cyclic_schema_coverage.py` corrects that audit surface.  Every cyclic
schema is independently replayed against the full exact strict-Kalmanson
system before it is bankable.  Adding the `OrderedCrossRowCore` schema and
closing all 33 compact schemas under the full cyclic dihedral action gives:

| quantity | value |
| --- | ---: |
| cyclic schema records | 424 |
| current linear/reflection applications | 120,338 |
| full cyclic-dihedral applications | 737,100 |
| genuinely new applications | 616,762 |
| round-one cuts subsumed | 23 / 70 |
| round-two cuts subsumed | 18 / 70 |
| round-three cuts subsumed | 26 / 70 |

The cyclic-closed bank is

```text
runs/20260719T034302Z-piqd-round3/
  checkpoint-210-cyclic-closed-schema-bank.json
```

with SHA-256

```text
97866aa45cf30efd4de5535b2721cd3ea9ce4b4676467cd9ad06798542b68706
```

It materializes 737,100 learned applications and 926,519 total clauses for
`continuationOrder` in 9.2 seconds.  The corrected round-four CNFs contain
about 941,000 clauses after the immutable literal banks are added.  All 28 new
round-four cuts escape the corrected cyclic schema bank, so the symmetry fix
is real but nonterminal.  Repeated fresh CaDiCaL solves now take roughly
17--116 seconds on successful iterations; two orbits hit the 180-second
timeout.  This rules out another literal round under the specification's
convergence and performance gates.

## Proof implication and next action

The finite engine has confirmed that the remaining structural models are
repeatedly killed by strict Kalmanson geometry, but it has not found a finite
coverage proof or a uniform occurrence theorem.  The reusable mathematical
consumer is already known; the missing producer is aggregate:

- prove that every exact-six live parent packet emits one of a finite,
  source-valid weighted Kalmanson family; or
- add a named omitted input—rank-two Euclidean geometry, MEC/cap constraints,
  full critical-map provenance, or global minimality—that collapses the
  structural surface for a theorem-visible reason.

Until one of those inputs is stated with an immediate on-spine consumer, this
lane should remain stopped.  More literal CEGAR rounds would improve only the
cut bank, not the proof spine.
