# Exact-five omission-cycle minimality audit

Date: 2026-07-17

Status: **THE CURRENT SOURCE-EXACT OMISSION CYCLE IS NOT CONSUMED BY
GLOBAL MINIMALITY OR WITNESS-CLOSED-SUBSET DESCENT.  ONE-DELETION SURVIVAL
HAS THE WRONG POLARITY FOR CUMULATIVE DELETION.**

This audit owns only
`scratch/atail-force/exact-five-omission-cycle-minimality-audit/`.
It does not construct the omission cycle and does not change production or
closure documents.

## Verdict

Let `U` be the finite set of physical sources in an exact-five omission
cycle.  At an edge `q -> w`, current production gives

```text
K4(D.A.erase w, H.centerAt q).
```

But `H` is a `CriticalShellSystem`, so deleting `q` blocks K4 at
`H.centerAt q`.  Since `q in U`,

```text
not K4(D.A \ U, H.centerAt q).
```

holds for every cycle source.  Extra deletions cannot restore a K4 witness
which is already absent after deleting `q`.

Therefore the edge facts do not compose to K4 on the cumulative carrier.
They compose to a family of **blocked** actual-source centers.

There are only two cases.

1. Some actual blocker remains in `D.A \ U`.  It directly witnesses failure
   of global K4 on the cumulative carrier.
2. Every actual blocker named by the cycle also lies in `U`.  Those local
   failures occur at deleted centers and no longer address the remaining
   carrier.  `D.Minimal` then produces a new blocked center outside `U`
   and the already-banked fresh shared-radius/minimal-deletion-core
   alternative.  It does not produce a contradiction.

This is a structural obstruction to the proposed descent, not a missing
bookkeeping lemma.

## Kernel-checked reduction

`OmissionCycleMinimalityAudit.lean` proves five declarations.

### 1. Cumulative deletion blocks every source's own blocker

```lean
cumulativeDeletion_blocked_of_source_mem
```

For any `U` containing `q`, it proves

```text
not K4(D.A \ U, H.centerAt q).
```

The proof is just monotonicity into `D.A.erase q`, followed by
`H.no_qfree_at q`.

### 2. The exact noncomposition statement

```lean
oneDeletionSurvival_and_cumulativeBlockage
```

Given any finite family of source-exact omission edges, it retains the stated
single-successor deletion survival and simultaneously proves cumulative
blockage at the same actual blocker for every source.

### 3. Global cumulative survival is already contradiction-strength

```lean
false_of_globalK4_on_cumulativeDeletion
```

For nonempty `U subset D.A` with nonempty complement, `D.Minimal` refutes

```lean
HasNEquidistantProperty 4 (D.A \ U).
```

This is the exact field a smaller-carrier proof would need.  It is not a
plausible invariant awaiting induction: once proved, it closes the branch
immediately, and the local critical rows show why current one-edge facts
cannot prove it.

### 4. The cumulative complement is not witness-closed

```lean
exists_selectedRow_escape_from_cumulativeDeletion
```

For every `FaithfulCarrierPattern`, some remaining center has a selected
support point outside `D.A \ U`.  Thus the cycle complement cannot be the
proper witness-closed subset required by the alternate minimality argument.

### 5. Strongest generic minimality split

```lean
remainingCycleBlocker_or_freshMinimalDeletionCore
```

The theorem returns exactly:

- a named cycle blocker which remains and is blocked on `D.A \ U`; or
- a fresh remaining center, distinct from all cycle blockers, together with
  a nonempty minimal blocking subdeletion `V subset U` and either a
  shared-radius pair in `V` or
  `MinimalDeletionCore D.A V center`.

This is the complete current generic use of `D.Minimal`.  The second arm is
the existing `ATailGlobalMinimalDeletion` endpoint, not `False`.

All five declarations were checked directly against the current Lake
environment.  Each printed axiom closure is exactly:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorryAx`, custom axiom, `admit`, or `native_decide`.

## Relation to the older actual-blocker-cycle bank

The new exact-five successor does **not** instantiate
`SourceExactMinimalActualBlockerCycle` from
`scratch/atail-force/r-actual-blocker-transition/`.

The two notions of successor are different.

- The exact-five omission successor chooses a physical source `w` omitted by
  the actual critical support at `q`:

  ```text
  w notin H.selectedAt(q).support.
  ```

- `SourceExactMinimalActualBlockerCycle` iterates
  `H.blockerVertex`; its next vertex is the actual blocker center
  `H.centerAt q`.

Current production proves no equality

```text
w = H.centerAt q.
```

It also supplies none of the older bank's `RobustPairedErasureHistory`,
`FixedSingleRadiusTerminalHistory`, first-apex fixed-radius, or terminal
carrier fields.

Consequently:

- `LeastTerminalHitPredecessor` is inapplicable because there is no retained
  terminal carrier or blocker-map terminal hit;
- `SpentEntryAlternateRadiusDescent` is inapplicable because there is no
  spent frontier-entry/alternate-first-apex-radius packet;
- `FixedSingleRadiusCycleConsequence` is inapplicable because the exact-five
  class is the physical second-apex class, not a fixed first-apex erased
  history; and
- `FixedSingleRadiusCycleCommonDeletion` consumes an actual-blocker edge
  whose successor/mate is the blocker center.  An omission edge between two
  physical sources does not provide that identification.

Even if an additional theorem identified the two cycle notions, the older
bank ends at another `CommonDeletionTwoCenterPacket`; its own module
docstring records that downstream cycle foreclosure remains open.  It is not
a hidden minimality consumer.

## Pinned regression

The existing exact rational 24-vertex model was replayed:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run --frozen python \
  scratch/atail-force/paired-common-deletion-nonreturn-audit/\
exact_five_paired_cycle_model.py
```

It returned `PASS` with digest:

```text
db4d45278e5f412212fbef2f5903959a831ef952434ee892642d7f5f779242aa
```

The model realizes the physical omission two-cycle

```text
1 -> 2 -> 1
```

while the actual blockers are `20` and `21`.  Thus deleting the two cycle
sources leaves both blockers present but removes the critical source from
each blocker's exact shell.  This is an exact witness, inside the stated
finite-metric abstraction, of the first arm of the Lean split.

The model is not a Euclidean planar convex/MEC realization and is not a
Problem-97 counterexample.  It refutes only an implication using the current
finite exact-five, total-critical-shell, and paired common-deletion semantics
without the omitted global geometry.

## Exact missing fields and epistemic status

| Candidate field | Status |
|---|---|
| `HasNEquidistantProperty 4 (D.A \ U)` | **REFUTED under `D.Minimal`** for every nonempty proper deletion with nonempty complement.  It would immediately close by contradiction, but current cycle data cannot derive it. |
| For every remaining center, a selected four-row contained in `D.A \ U` | **REFUTED under `D.Minimal`**; this is witness closure and production proves an escaping row. |
| Cumulative K4 at each cycle source's actual blocker | **REFUTED by `CriticalShellSystem.no_qfree_at`** because `q in U`. |
| Equality of omission successor with actual blocker successor | **NOT DERIVABLE from current fields; exact finite model refutes it in the audited abstraction** (`1/2` versus `20/21`). |
| Fresh minimality blocker plus shared-radius pair or minimal core | **DERIVABLE and already production-banked**, but nonterminal. |
| A joint Euclidean/convex/MEC theorem converting the physical omission cycle into a named terminal cross-incidence | **CONJECTURAL / OPEN**; this is the only honest continuation from the cycle route. |

The immediate closure target should therefore not be a cumulative-deletion
or witness-closed-subset lemma.  It must be a cycle-edge geometric consumer
which visibly couples the physical source order, the actual blocker rows, and
the common MEC/cap realization, or it must consume the fresh minimal-deletion
endpoint with a new cross-center incidence.

There is **no viable new `D.Minimal` theorem beyond the already-generic fresh
core split**.  If the omission-cycle route is continued, the honest next
statement is instead the conjectural joint-geometric consumer

```lean
theorem false_of_physicalActualCriticalOmissionCycle
    (K : PhysicalActualCriticalOmissionCycle H profile) : False
```

where `K` must retain the complete physical exact-five class, its common cap
order, every source's actual blocker and exact selected support, and each
omission edge.  A proof must force a named cross-incidence consumed by an
existing same-cap/U5 sink or derive a common global no-wrap invariant.  The
current minimality API supplies neither fact, so this statement is
**CONJECTURAL / OPEN**, not a ready adapter theorem.

## Theorem-bank preflight

Before writing the reduction, the required bank registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed Lean searches were run for cumulative deletion, proper
witness-closed subsets, omission cycles, and minimal deletion.  The closest
hits were exactly the current production theorems used here:

- `cumulative_deletion_blocked_at_source_blocker`;
- `FaithfulCarrierPattern.eq_carrier_of_nonempty_closed`;
- `FaithfulCarrierPattern.exists_row_escape_of_proper_subset`;
- `exists_global_cardMinimal_blocking_subdeletion`; and
- `exists_fresh_sharedRadiusPair_or_minimalDeletionCore`.

The older `r-full-parent-entry` cycle family was also audited declaration by
declaration as described above.  No banked theorem converts the exact-five
physical omission cycle into cumulative survival, proper witness closure, or
a terminal contradiction.
