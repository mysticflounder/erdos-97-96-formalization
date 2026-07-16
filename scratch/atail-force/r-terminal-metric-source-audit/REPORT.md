# R terminal metric-source audit

Date: 2026-07-16

Status: **KERNEL-CHECKED SOURCE-PROVENANCE NARROWING; NO IMPORTED PRODUCER
FOR THE TERMINAL METRIC HIT; PACKET INTERFACE LOSS IDENTIFIED.**

No production `sorry` is closed by this audit.

## Result

No source-faithful theorem was found in the imported bank or indexed sibling
corpora that proves either current closing antecedent:

```lean
∃ z,
  z ∈ SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap ∧
  z ∈ R.secondApexRow.support ∧
  dist R.firstCenter z = R.sourceRow.radius
```

or, in the aligned live-dangerous branch,

```lean
R.firstCenter = p
```

together with

```lean
∃ z,
  z ∈ terminalMarginal ∧
  z ∈ R.secondApexRow.support ∧
  z ∈ {t1,t2,t3}.
```

The audit did find and kernel-check a genuine source-level refinement:
`TerminalThreePointTwoRowCoverResidual` forces the coherent packet into the
least-positive-terminal-hit provenance arm. The minimal-cycle provenance arm
is incompatible with the residual.

The checked declarations in
`TerminalMetricSourceAudit.lean` are:

```text
terminalThreePoint_deleted_mem_terminalCarrier
terminalThreePoint_forces_leastTerminalHitProvenance
terminalThreePoint_exposes_leastTerminalHit
secondApexRow_inter_dangerousBase_card_le_two
```

The strongest statement exposes a source-faithful witness:

```lean
∃ K : LeastPositiveTerminalHitPredecessor P H,
  R.sourcePair.x = K.predecessorPair.x ∧
  R.deleted ∈ T.carrier ∧
  R.firstCenter =
    ((H.blockerVertex^[K.hitTime]) (actualBlockerStartVertex P)).1
```

Thus the residual's first retained row really is the exact critical row of
the source immediately preceding the least positive terminal blocker-orbit
hit. This is useful narrowing, but `K` still does not name the unique
terminal marginal point selected by `R.secondApexRow`.

## Why the cycle arm is impossible

The residual equation

```lean
terminalMarginal \
    (R.sourceRow.support ∪ R.secondApexRow.support) =
  {R.deleted}
```

puts `R.deleted` in `terminalMarginal`, hence in `T.carrier`.

In the cycle provenance arm, however,

```lean
R.deleted = (K.source ⟨1, K.two_le_period⟩).1
```

and `SourceExactMinimalActualBlockerCycle.source_mem_erased_at` puts that
point in `D.A \ T.carrier`. The two facts contradict each other. This proof
uses the exact source provenance retained by the packet; it is not a finite
incidence census.

## The interface loss that blocks the metric producer

The terminal-hit constructor begins with genuinely useful named data:

```lean
T.terminal :
  ∃ q w, ... ∧
    HasNEquidistantPointsAt 4
      ((T.carrier.erase q).erase w) S.oppApex2
```

It chooses one of `q,w` as `deleted`, specifically an endpoint omitted from
the exact predecessor source row. Let the other endpoint be `other`.

The helper

```text
nonempty_coherentPacket_of_terminalEndpoint
```

then performs two lossy steps:

1. it monotonically lifts the second-apex K4 existence from
   `((T.carrier.erase deleted).erase other)` to
   `((D.A.erase sourcePair.x).erase deleted)`; and
2. it invokes
   `nonempty_selectedFourClass_of_hasNEquidistantPointsAt`, which chooses an
   arbitrary four-point subset of the larger radius class.

The resulting `CoherentRCommonDeletionPacket` stores only:

```lean
secondApexRow :
  SelectedFourClass
    ((D.A.erase sourcePair.x).erase deleted) S.oppApex2
```

It does not store:

- `other`;
- that `other` is the second named terminal endpoint;
- the original post-terminal-pair second-apex row; or
- that the retained row support omits both terminal endpoints.

Consequently the current `R.secondApexRow` may use `other`, even though the
source terminal K4 witness from which existence was derived omitted it. The
unique second-row terminal hit in the residual is therefore anonymous at
exactly the point where the source proof had named endpoint information.

This is not a logical-independence result for the full parent. It is an exact
trace of information discarded by the current constructor.

## Candidate classification

| Candidate | Classification | Exact issue |
|---|---|---|
| The three new terminal-residual lemmas | **direct adapter** | Eliminates cycle provenance and names the least terminal hit, but does not name the second-row marginal hit. |
| `U2NonSurplusSqueeze.oppApex1/2_*_one_hit` and the exact cap cover | **missing field** | These give partitions and upper bounds. They do not assign the named second-row hit to the source circle or dangerous base. |
| `U5QAllowedK4Class.inter_dangerous_p_circle_card_le_two` | **direct adapter, wrong polarity** | The checked `secondApexRow_inter_dangerousBase_card_le_two` repackages `R.secondApexRow` as a q-allowed ambient K4 class and yields at most two dangerous-circle points when its center is not `p`. An upper bound does not force the required one-point placement. |
| `U5QDeletedK4Class.not_dangerous_triple_subset_of_ne_center` | **missing field** | Requires omission of live `q` from the second row; the packet allows `q` to be its sole surplus hit. |
| `U3LocalizedNoQFreePacket.selected_off_circle_of_dangerousTriple` | **circular / wrong direction** | It applies after packaging a point as a selected candidate outside the dangerous triple and proves that point is off the circle. It cannot prove that the terminal hit is in the triple. |
| `f2CriticalRow_selected_support_eq_dangerous_of_center_p_q_named` | **missing field** | It identifies one specific `f2` critical row. No theorem identifies the arbitrary `R.secondApexRow` with that row or supplies its named-`q` hypothesis. Postulating that identification would substitute a different row for the target row. |
| `C5D3B` same-side-terminal and fresh-witness families | **missing field** | They require a different same-side terminal/bounded-support packet and primarily produce off-row or fresh alternatives. |
| `U3FixedTripleAuditFrame`, confined U5 audit payloads, and their residual closures | **requires `IsM44`** | Their constructors consume positive `D.IsM44`; the live parent has the opposite hypothesis. |
| `FixedSingleRadiusResidualClassifier` | **circular / inapplicable after narrowing** | It classifies off-fixed-circle points in a minimal-cycle row. The terminal residual has now been proved incompatible with that cycle provenance arm. |
| Reciprocal support/fixed-class consumers | **circular / different residual** | The sibling reciprocal audit already proves the two-point intersection is saturated. Its missing distinct-radius producer does not identify this terminal second-row hit. |
| `false_of_secondApexMarginal_hit_on_sourceCircle` and `false_of_aligned_secondApexMarginal_hit_in_dangerousBase` | **direct consumers, producer missing** | These are exactly the checked contradiction bridges; reusing them as input would be circular. |
| Production `DoubleApexOffSurplusSharedRadiusPair` / K-A-PAIR leaf | **circular** | This is the open parent being closed, not an independent source theorem. |
| Full MEC/cap order/global K4 fields | **missing source-indexed transport** | Existing declarations choose some row or bound cap hits; none transports the named terminal second-row hit into the predecessor's exact critical shell. |

## Correct next object

The next producer should not be another anonymous four-set or cap-count
census. First repair the terminal-hit packet so it retains the source witness
before the monotone lift:

```lean
otherTerminal : ℝ²
otherTerminal_mem_marginal : otherTerminal ∈ terminalMarginal
deleted_ne_otherTerminal : R.deleted ≠ otherTerminal
terminalSecondApexRow :
  SelectedFourClass
    ((T.carrier.erase R.deleted).erase otherTerminal) S.oppApex2
```

or an equivalent support-subset field tying the stored ambient row to that
original double-erased terminal witness.

This refinement would make the terminal row hit the third named marginal
point rather than an arbitrary point chosen after enlargement. It still
would not by itself prove the source-circle equality. The subsequent metric
theorem must visibly combine:

1. the forced `LeastPositiveTerminalHitPredecessor`;
2. its exact source critical row and actual blocker;
3. the original terminal second-apex witness with both endpoint omissions;
4. MEC/cap order and the live dangerous labels; and
5. global K4/total criticality only through a source-indexed continuation.

The final target can remain the already-checked smallest bridge:

```lean
the unique source-faithful terminal second-apex-row hit lies on
R.sourceRow's exact circle
```

or, after genuine alignment:

```lean
the hit lies in {t1,t2,t3}.
```

## Theorem-bank preflight

The required registries were checked before deriving the scratch lemmas:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused local and indexed searches covered:

- terminal marginal / second-apex row / source-circle hits;
- support/fixed-class and hit/residual consumers;
- least-positive-terminal-hit predecessors;
- MEC cap order and adjacent-cap one-hit theorems;
- dangerous-triple row support;
- same-side terminal packets; and
- q-allowed and q-deleted K4 classes.

The indexed corpus was current at the search time for the local project
source snapshot `4264ac2e`. No matching import-reachable producer was found.

## Validation

The audit file was checked directly as a deliberate single-file validation:

```bash
env LEAN_PATH=/private/tmp/p97-r-terminal-cap-row-oleans:/private/tmp/p97-r-orbit-entry-oleans \
  lake env lean -R .. -M 16384 \
  ../scratch/atail-force/r-terminal-metric-source-audit/TerminalMetricSourceAudit.lean
```

All four theorem declarations pass with only:

```text
propext, Classical.choice, Quot.sound
```

No full Lake build was run.
