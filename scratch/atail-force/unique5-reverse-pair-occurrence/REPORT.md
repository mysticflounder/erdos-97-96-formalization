# Original unique-five reverse-pair occurrence audit

Date: 2026-07-22

Status: **THE EXISTING TERMINAL IS THE CORRECT CONSUMER, BUT ITS CO-RADIAL
OCCURRENCE IS NOT FORCED BY THE FINITE RADIUS/CRITICAL-MAP/MINIMALITY
PROJECTION OF `OriginalUniqueFiveInteriorResidual`.  AN EXACT REORIENTED
15-ROLE MODEL SATISFIES THAT PROJECTION AND GLOBAL ALL-REVERSE MEMBERSHIP
WHILE NEGATING EVERY CANDIDATE OCCURRENCE.  THE NEXT PROOF MUST USE GENUINE
EUCLIDEAN/MEC OR GLOBAL `noM44` FORCE.**

This lane owns only
`scratch/atail-force/unique5-reverse-pair-occurrence/`.  It does not modify
production Lean, shared plan documents, proof-blueprint state, or another
scratch lane.

## Required theorem-bank preflight

Before attempting a new incidence or metric theorem, this audit checked the
registries required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused indexed Lean searches covered reverse outside-pair co-radiality,
critical shells outside a cap, double-deletion witnesses at the opposite
apex, all-center K4/minimality, and `noM44`.  The immediate consumer is
already production:

```lean
false_of_transitionReverseOutsidePair_coRadial_firstApex
```

The checked reorientation wrapper already transports its first-apex metric
back to the original orientation:

```lean
ReorientedUniqueFivePhysicalCycle
  .false_of_globalAllReverse_of_coRadialOccurrence
```

No indexed theorem produces the missing equality from the original retained
pair or either original second-apex double-deletion witness.

## Exact target

For

```lean
R : OriginalUniqueFiveInteriorResidual F
W : ReorientedUniqueFivePhysicalCycle R
```

and the global all-reverse relation, the terminal producer would have to
construct a transition `T` and

```lean
exists q a b,
  a != b /\
  a in transitionReverseOutsidePair T q /\
  b in transitionReverseOutsidePair T q /\
  dist S.oppApex2 a = dist S.oppApex2 b.
```

The last equality is the only missing terminal field.  Once it is available,
the checked wrapper calls the production terminal directly.  A named-row
containment theorem would be stronger than necessary.

## Source-field audit

The proof of `nonempty_reorientedUniqueFivePhysicalCycle` uses the original
residual only to build the exact-five profile at the swapped physical apex:

- `class_card_eq_five` gives the exact class;
- `unique_K4_radius` gives uniqueness; and
- the original frontier gives positivity of the radius.

The resulting cycle retains `R` as `W.base`, but its transition is constructed
solely from the fixed `H`, the exact-five class, and cap localization.  No
current theorem relates a transition reverse outside pair to:

- `F.secondApexDouble`;
- `R.originalPair_doubleDeletion_blocks`;
- `R.interior.frontier.secondApexDouble`;
- `R.interiorPair_doubleDeletion_blocks`;
- `R.minimal`; or
- `R.noM44`.

The two second-apex double-deletion fields assert existence of some K4 radius
after deleting a named exact-five pair.  They do not identify that radius
class with either point of any successor row's outside residual.  Conversely,
the reverse row theorem identifies exactly two points outside the physical
cap, but supplies no original-second-apex radius color for either point.

This is the precise source gap; it is not a slot-order or selected-subrow
problem.

## Exact finite abstract countermodel

`verify_reoriented_unique5_abstract_countermodel.py` reorients the existing
15-role exact-seven global-marginal fixture into the original unique-five
orientation.  In the original notation it has:

- an exact unique five-point radius class at `S.oppApex1`;
- three members of that class in the strict interior of `S.oppCap1`;
- an original and an interior retained pair inside those three points;
- failure of K4 at `S.oppApex1` after deleting either retained pair;
- full singleton-deletion robustness at `S.oppApex1`;
- two disjoint K4 radius classes at `S.oppApex2`, so both retained pair
  deletions survive there simultaneously;
- a total fixed-point-free critical blocker map omitting both apices;
- complete exact-four support locking at every blocker value;
- source membership and deletion criticality at every chosen blocker;
- one declared K4 radius class at every carrier center;
- a strongly connected selected-row graph;
- no proper K4 subset under any of the declared complete radius partitions,
  checked exhaustively over all `32766` nonempty proper subsets;
- the exact cap-incidence and at-most-two same-cap row projections;
- a global all-reverse relation on all three physical vertices; and
- a fixed-point-free period-three omission transition whose successor rows
  have exact `2+2` cap splits.

The three reverse outside pairs are

```text
{3,9}, {8,10}, {6,7}.
```

At the original second apex, the two nontrivial radius classes are

```text
{3,8,6,4}, {9,10,7,14}.
```

Every reverse pair therefore uses two different original-second-apex radius
colors.  The requested occurrence is false for every transition source.

Replay from the repository root:

```bash
UV_CACHE_DIR=/tmp/p97-unique5-reverse-pair-uv \
uv run --no-project python \
  scratch/atail-force/unique5-reverse-pair-occurrence/\
  verify_reoriented_unique5_abstract_countermodel.py
```

Expected verdict:

```text
PASS: reoriented unique-five abstract countermodel
status=EXACT_FINITE_ABSTRACT_RADIUS_MINIMAL_NOT_EUCLIDEAN_NOT_GLOBAL_NOM44
global_all_reverse_membership=true
proper_abstract_k4_subset=none_exhaustive_32766
all reverse pairs split original-second-apex radius colors
```

## Trust boundary

The regression is **exact within its finite radius abstraction**.  It is not
a symmetric planar Euclidean distance table, not a realization of the MEC
cap packet, and not a model of the production quantifier over every
alternative `SurplusCapPacket` in `R.noM44`.  It is therefore not a Problem-97
counterexample and does not refute the full Euclidean theorem.

It does rule out deriving the occurrence from the currently exposed finite
incidence, complete-radius partition, total critical-map, deletion, and
abstract-minimality consequences.  In particular, adding another anonymous
row, blocker-fiber count, selected-row connectivity lemma, or finite
radius-color CEGAR round cannot prove this producer unless it also introduces
new Euclidean/MEC or alternative-support-triangle information.

## Route verdict

No new Lean adapter is warranted: the reorientation and exact terminal
consumer are already checked, and another conditional theorem would merely
rename the open equality.

The first genuinely stronger theorem must retain `W.base` and use one of:

1. nonlinear Euclidean/MEC geometry coupling a complete reverse outside pair
   to one original-second-apex radius class; or
2. a packet exchange showing that the all-split configuration constructs an
   alternative `SurplusCapPacket` with `IsM44`, contradicting `R.noM44`.

Any such theorem must visibly consume information absent from the regression.
The original pair's second-apex deletion survival, exact-five uniqueness,
the total critical map, and abstract minimality are already present there.

## Epistemic ledger

| Claim | Status |
|---|---|
| Reorientation constructs the production omission cycle | **PROVEN / KERNEL-CHECKED in predecessor scratch** |
| A co-radial reverse pair closes through the production terminal | **PROVEN / KERNEL-CHECKED in predecessor scratch** |
| The finite radius/critical-map/minimality projection forces such a pair | **REFUTED by exact finite abstraction** |
| The full Euclidean unique-five residual forces such a pair | **OPEN** |
| Euclidean/MEC geometry or `noM44` closes the all-split residual | **CONJECTURAL** |
| A production `sorry` is closed by this audit | **NO** |

No Lean declaration was added, so there is no new kernel axiom closure to
report.
