# Survivor-family and refinement history

## Interpretation rule

A “survivor” below means a model of the named finite encoding, not a model of
the Lean residual. SAT, UNSAT, UNKNOWN, iteration limit, and structurally
unresolved are kept separate. Counts from different formulas are not treated
as a monotone CEGAR sequence unless the retained artifacts establish the
predecessor relation.

## Families retained by the corpus

### L0: no large source-faithful family

There is no run or model at `n >= 18` for the live large residual. Consequently
there is no large-cardinality family to extend, project, classify, or kill.
This absence is the controlling fact for the risk decision.

### L16: off-class incidence shadow

The n=16 probe retains one SAT row/blocker object with cap profile `(5,5,9)`.
It is a stable regression witness against deriving the desired conclusion from
anonymous incidence alone. It has no authenticated cyclic order, metric data,
complete source identity, minimality/K4 packet, or deletion survival.

No refinement history is retained for this object. It is not connected by a
full-packet edge to EX12, EX17, or a large residual.

### E17-A: row/order shadows

The builder finds 286 analysis artifacts with the audited EX17 analysis schema
and collapses exact duplicates to 251 identity-canonical row/order records.
This is a retained-artifact census, not a census of all 8,280 models reported by
the order-0 run.

Among the 251 canonical records:

- 86 have only `linear_status=unsat` provenance;
- 164 have only missing/unknown linear status provenance;
- one normalized row/order object appears in both categories through different
  source artifacts.

The historical order-0 aggregate reports 8,280 Boolean models, 8,259 exact
strict-linear rejections, and 21 metric unknowns. Seven placement cells reached
the 500-model cap. Those numbers establish neither Boolean exhaustion nor a
canonical survivor count.

Earlier schema waves show the same nonterminal pattern: schema C retains 1,512
records/1,509 patterns, CDE retains 3,082/3,075, and CDEF retains
1,722/1,720; every production cell ends at iteration limit or linear unknown.
The cumulative C--G children 1--31 reauthenticate 31/31 model-bearing SAT
roots. Child 45 is SAT in all 13 attempted cells. Child 46 has a validated
export with nine inherited-model rejection cuts but no solver terminal, and is
therefore recorded as UNKNOWN/UNRUN rather than SAT or UNSAT.

### E17-B: decoded Boolean assignments

Two later artifacts retain complete 17-row Boolean assignments. Both are
structural SAT and replayed against their respective clauses. Both explicitly
record `source_realizable=false`. They are adversarial witnesses against an
unconditional base-CNF-UNSAT subgoal, not realizations of the Lean packet.

### E12-A: complete blocker-map incidence shadow

The exact-12 v2 object retains one complete 12-row cube and blocker map. All 42
placements in its audit were SAT (two endpoint and 40 nonendpoint placements).
The retained source-model mine summarizes 101 cube-bearing models:

| Blocker-cycle profile | Count |
|---|---:|
| one 2-cycle | 1 |
| two 2-cycles | 19 |
| one 3-cycle | 67 |
| one 5-cycle | 14 |

All 101 have maximum blocker-fiber size three; reciprocal-pair counts are
`0:81`, `1:1`, `2:19`; none is saturated. These are incidence facts only.

### E12-B: ordered and arm-static CEGAR survivors

The ordered v4 direct wave retained 12 cell counts
`500, 891, 462, 500, 900, 480, 500, 500, 471, 500, 732, 460`; each cell ended
at iteration limit or structurally unresolved, never UNSAT. Arm-static cell-6
canaries v1 through v21 each retained a replayed SAT witness. Projected v26
sampling reached at least 300 row cubes in 512 seconds; 0/300 passed the tested
orientation cover. None is an exhaustive family census.

## Refinement effects

The machine-readable reconstruction is `refinement_effects.csv`. The decisive
history is:

1. Nine EX17 assignment cuts kill only nine exact assignments; successor seeds
   remain Boolean SAT and linear UNSAT.
2. Sixty exact certificates and 2,040 dihedral theorem images reject matching
   assignments, but the source-frozen continuation remains SAT until its
   iteration cap.
3. PIQD adds 130,291 two-Kalmanson pair-closure clauses mined from 5,994 pairs.
   The successor is still structural SAT and presents 738 new disjoint
   cancelling pairs. This is refinement churn, not convergence evidence.
4. Authenticated EX17 children 33--44 remain SAT; child 32 is UNKNOWN. Mines at
   child 41 (`1282 -> 433 -> 133`), child 43 (`155 -> 100 -> 57`), and child 44
   (`500 -> 212 -> 99`) describe occurrence supports in one retained assignment
   per cell, not unavoidable motifs.
5. Exact12/A5 v17 is the only strong fixed-cell elimination: five live source
   clauses, together with 467 inherited safe-cover clauses, form a verified
   472-clause core forcing label 9 both into and out of row 8. This kills only
   the fixed `xu/w`, `(jointDeletion,v)=(0,2)`, `d=8` selector.
6. Exact12 cells 52, 58, 65, and 71 are separately kernel-checked finite
   pure-RUP terminals. No theorem covers every selector, so the family remains.

No canonical cross-cardinality family has a recorded first extinction point.
The only defensible first-disappearance statements concern individual exact
assignments or fixed selector cells.

## Potential and invariant mining

`model_features.csv` computes the requested row, pair, blocker, interval, and
potential features wherever the source artifacts supply their inputs. Missing
inputs remain empty rather than being inferred.

For the 253 EX17 records with full row tables (251 shadows plus two decoded
assignments), the observed ranges are:

| Feature | Range |
|---|---:|
| `I_out` | 29--37 |
| `P_repeat` | 8--24 |
| `X_cross` | 10--74 |
| `H_def` | exactly 9 |
| minimum outside-pair span | 1--2 |
| maximum outside-pair span | 4--7 |
| total outside-pair span | 34--94 |

The exact-12 incidence shadow has
`(I_out,P_repeat,F_max,H_def)=(23,25,3,6)`. The n=16 shadow has
`P_repeat=34` and `F_max=1`, but lacks an authenticated outside set/order, so
the other quantities are intentionally absent.

Three precise empirical patterns were tested:

1. **`H_def = 9` on EX17.** This holds for every retained EX17 row table because
   17 rows can match into only eight outside labels and all stored tables attain
   an outside matching of size eight. It is a cap-count identity, not a metric
   contradiction. The exact-12 shadow (`H_def=6`) is the smallest retained
   countermodel to the literal constant statement; it belongs to a different
   cardinality and schema. A normalized counting lemma is Lean-plausible but
   does not close any live leaf.
2. **`P_repeat >= 8` on stored row tables.** It holds on all 255 canonical
   records for which the feature is defined; no retained countermodel exists.
   Its support is HEURISTIC because EX17 lacks actual blocker provenance and
   the corpus has no large source-faithful population. Even if proved by
   pair-counting, repeated support pairs alone have no checked contradiction
   consumer.
3. **`X_cross >= 10` on EX17.** It holds on all EX17 row tables with a stored
   order. EX12/n16 supply no comparable order, so there is no cross-cardinality
   test. The smallest observed EX17 witness has `X_cross=10`; it survives the
   Boolean encoding, showing the inequality is not itself terminal.

The builder's feature vectors were also searched with every nonzero coefficient
vector in `[-3,3]^6` over
`(I_out,P_repeat,X_cross,Span_min,Span_max,Span_total)`. No linear score strictly
separates the 86 linear-UNSAT-only canonical objects from the 164
linear-status-unknown objects. One identical vector
`(30,15,19,1,6,43)` occurs with both statuses. Unknown is not a positive metric
class, so this search is diagnostic only; it supplies no statistical theorem.

No lexicographic potential or small-coefficient inequality found here combines
with a current packet theorem to produce `False`.

## Bounded-obstruction mining

The two-Kalmanson motifs are the smallest repeatedly mined exact-17 obstruction
family, but the corpus does not show that every Boolean survivor contains one
of a bounded source-faithful list. New disjoint pairs continue to appear after
large closure additions, and the occurrence mines are per-model rather than
exhaustive.

Therefore no bound `N` is supported for the statement

```text
Every tested large residual contains a source-faithful obstruction on at most N points.
```

The quantifier has an empty tested large-residual population. A future selection
algorithm would need to start from the actual source/blocker/deletion packet,
choose a role-preserving subset, prove every needed row and deletion witness
survives, and only then map it into a checked finite terminal. The current data
provides no such algorithm.
