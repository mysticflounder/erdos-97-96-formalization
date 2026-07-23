# Exact-four robust-second-apex terminal audit

Date: 2026-07-22

Status: **THE INITIAL INCIDENCE FIXTURE IS REJECTED. THE EXACT-FIVE
LARGE-CLASS SUBARM HAS TWO HONEST FULL-LINEAR SAT MODES. THE
TWO-DISJOINT-K4-RADII SUBARM IS NOT AUDITED HERE. NO DIRECT `False` THEOREM
IS SOURCE-PROVED.**

Scope: only
`scratch/atail-force/unique4-robust-o2-terminal/` is modified. No production
Lean, shared plan, exact-five file, or other unique-four lane is changed.

## Source surface

This audit starts at the robust constructor

```lean
ExactFourPhysicalConsumerOutcome.robust ingress secondApex_robust
```

and retains both of its indices:

- `R : OriginalUniqueFourResidual F`; and
- `ingress : ExactFourPhysicalCommonDeletionIngress R`.

Write `B₁` and `B₂` for the two selected supports in
`ingress.packet`, at the actual late blocker and physical second apex,
respectively. The source packet proves

```text
|B₁ ∩ B₂| ≤ 2.
```

It does not prove a positive overlap.

## Required theorem-bank preflight

Before deriving a new local consumer, the audit checked the registries
required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered exact-four robust
second-apex common-deletion rows, shared support pairs, cyclic alternation,
perpendicular bisectors, and Kalmanson terminals. The closest declarations
are already in production:

```lean
Problem97.Census554.SeparationCore
  .SharedPairSeparationCore.satisfiedBy_of_realizes_ccw

Problem97.false_of_two_centers_equidistant_pair_after
Problem97.false_of_two_centers_equidistant_pair_enclosed
Problem97.false_of_two_centers_equidistant_pair_split
Problem97.false_of_two_centers_equidistant_pair_before
```

They classify or refute the placement of an already-produced shared pair.
They do not produce a shared pair or a third row.

## Correction: the first fixture was not geometrically admissible

The deleted `RobustO2IncidenceBoundary.lean` table made the first- and
second-apex rows share `{4,6}`. In every one of the 72 boundary orders
compatible with its three displayed caps, the four roles have order

```text
0 < 1 < 4 < 6.
```

The whole metric rejection is therefore the single normalized core

```text
row_0_4_6
row_1_4_6
kal2_0_1_4_6.
```

Equivalently, two distinct centers lie on the same boundary side of the
shared chord. Production `TwoCenterBisectorParity` already refutes this.
The fixture was an incidence-only table, not a valid regression, and has
been removed rather than retained as negative evidence.

## Honest retained-row overlap classification

Independently of how second-apex robustness is witnessed, there are only two
possibilities for the two retained rows.

1. `|B₁ ∩ B₂| ≤ 1`.

   No two-row shared-pair consumer can start.

2. `|B₁ ∩ B₂| = 2`.

   Let the two common points be `x ≠ y`. Both row centers are equidistant
   from `x,y`. Generic shared-pair separation therefore puts `x` and `y` on
   opposite open cyclic arcs between the two centers. All four
   nonalternating order types are already contradictory, so alternation is
   not a missing theorem: it is the only possible placement.

This is exhaustive only as a classification of `B₁ ∩ B₂`; it is not a
classification of the radius structure witnessing `secondApex_robust`. That
structure separately splits into one radius class of cardinality at least
five, or two disjoint K4 radius classes.

Consequently, asking the robust branch to produce a nonalternating
`B₁`/`B₂` shared pair is an overstrong target. A source-faithful closer must
couple another row or use geometry beyond these two rows.

## Exact local full-linear regressions for the exact-five large-class subarm

[`audit_robust_o2_boundary.py`](audit_robust_o2_boundary.py) assumes that the
large-class mode is realized by one exact five-point class. It constructs
exact rational QF_LRA witnesses for both retained-row overlap cases in the
cap-compatible order

```text
0, 5, 9, 10, 1, 3, 4, 2, 6, 7, 8.
```

Both witnesses retain the following local consequences:

- the retained pair is `{3,4}` and deleting `3` is the common deletion;
- `{3,4,5,6}` is the unique exact K4 class at the first apex `0`;
- every other first-apex distance is distinct, so there is no hidden second
  K4 radius there;
- the strict-pair bisector-localization conclusion for `{3,4}` holds at
  every carrier label;
- the late blocker has one exact four-class omitting the deleted point;
- the second apex has one exact five-class omitting both retained points,
  hence is fully singleton-deletion robust;
- the chosen second-apex row is a four-subset of that five-class;
- endpoint one-hit and same-cap two-hit bounds hold for the displayed
  classes;
- all strict Kalmanson inequalities hold with normalized slack at least one;
  and
- all triangle inequalities and positive-distance constraints hold.

The two supports are:

| case | late center | late exact class `B₁` | robust O2 class | chosen `B₂` | overlap |
|---|---:|---|---|---|---|
| overlap at most one | 6 | `{0,2,5,10}` | `{2,6,7,8,9}` | `{6,7,8,9}` | empty |
| overlap two | 6 | `{2,4,8,9}` | `{2,6,7,8,10}` | `{2,7,8,10}` | `{2,8}` |

In the second witness, `2` and `8` lie on opposite cyclic arcs between
centers `6` and `1`, exactly as shared-pair separation requires.

These are **exact QF_LRA witnesses for the stated local exact-five
large-class projection**. They are not coordinate realizations, not
`CounterexampleData`, and not
counterexamples to the desired direct-`False` theorem. In particular they do
not encode:

- the complete critical map at every source;
- global minimality over every witness choice;
- the global K4 deletion-closure relation; or
- the MEC/no-`IsM44` contract.

They do prove that the retained exact first class, one actual late-blocker
class, one robust second-apex class, cap order, bisector localization, and
all linear metric consequences do not by themselves close this constructor.

They say nothing about the other robustness mode with two support-disjoint
K4 radius classes at the second apex. That mode needs a separate source
audit, necessarily on a cap large enough to accommodate the endpoint one-hit
bounds for both classes. It remains untouched here.

## First missing source implication

The next theorem must consume at least one omitted global field and produce
an immediate terminal packet. The smallest honest Kalmanson target is not a
different placement of `B₁ ∩ B₂`; it is a **third-row coupled occurrence**:

> produce one additional actual selected row and a cyclic transport of three
> pairwise row equalities matching
> `CapCrossingKalmansonBridge.false_of_selected_rows_in_five_ccw_order`, or
> produce an ordinal comparison cycle matching
> `ATailOrdinalKalmansonCycle.false_of_transGen_cycle`.

An equally terminal geometric alternative is:

```lean
∃ T : SurplusCapPacket D.A, T.IsM44
```

which `R.noM44` immediately refutes.

Thus the first unresolved implication is, schematically,

```text
robust O2 + original exact-four residual + complete late critical system
  → third-row Kalmanson/ordinal terminal
    ∨ alternative IsM44 packet
    ∨ False.
```

It must visibly use the complete critical map, global minimality/K4, or
MEC/no-`IsM44`. In the exact-five large-class subarm, a theorem using only
`B₁`, `B₂`, their cardinalities, and their overlap bound is refuted by the
two exact local QF_LRA witnesses above. No corresponding claim is made for
the two-disjoint-K4-radii subarm.

No nonterminal adapter is proposed or formalized in this lane.

## Validation

Exact replay:

```bash
UV_CACHE_DIR=/tmp/uv-cache-p97 uv run --offline python \
  scratch/atail-force/unique4-robust-o2-terminal/\
audit_robust_o2_boundary.py --check
```

The stored JSON SHA-256 is:

```text
dc0d88fb420709878c5db07e5b1e28ece32dc92868dfea789e9cab73866824b3
```

[`ConsumerCheck.lean`](ConsumerCheck.lean) passes warnings-as-errors
elaboration. It imports and audits the exact source outcome, generic
separation theorem, and all four production parity terminals. Every printed
declaration depends only on:

```text
propext
Classical.choice
Quot.sound
```

There is no `sorryAx`, `admit`, custom axiom, unsafe declaration, or
`native_decide` boundary in the Lean check.
