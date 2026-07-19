# Named-row containment proof audit

Date: 2026-07-18

Status: **THE PROPOSED CONTAINMENT IN EITHER STORED FOUR-POINT FIRST-APEX
SUBROW IS OVERSTRONG AT THE CURRENT INTERFACE. IT IS NOT FORCED BY THE
PERIOD-THREE / ALL-REVERSE / EXACT-`2 + 2` / SHARED-CAP-ORDER MARGINALS, EVEN
AFTER ADDING COMPLETE COVERAGE OF ALL THREE OUTSIDE PAIRS BY THE UNION OF THE
TWO NAMED ROWS. MORE DECISIVELY, CONTAINMENT IN A PREVIOUSLY CHOSEN FOUR-ROW
DOES NOT FOLLOW EVEN IF THE DESIRED PAIR IS ALREADY CO-RADIAL IN A SIX-POINT
FIRST-APEX RADIUS CLASS. THE CHOICE-FREE FULL-RADIUS-CLASS FORM IS
KERNEL-CHECKED EQUIVALENT TO THE EXISTING METRIC OCCURRENCE AND SHOULD REPLACE
THE NAMED-SUBROW TARGET.**

This lane owns only
`scratch/atail-force/named-row-containment-proof/`. It did not edit
production Lean, shared documents, protected scratch lanes, blueprint state,
or git.

## Required theorem-bank preflight

Before testing the target, this lane checked the registries required by
`AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered complete first-apex
radius classes, retained-radius critical fibers, reverse outside pairs,
selected-row support containment, and full critical-map support. No banked
theorem supplies the proposed cross-family occurrence. The closest current
production results are:

- `criticalShell_inter_frontierRadiusClass_card_le_two`, which is an upper
  bound of two, not a positive two-hit producer;
- `RetainedRadiusCollision.firstApex_equidistant`, which applies after a
  repeated blocker fiber has already been found on a prescribed first-apex
  radius class; and
- `false_of_transitionReverseOutsidePair_coRadial_firstApex`, which is the
  existing terminal once the desired equality is produced.

## Exact production target

For

```lean
A : FullParentExactFiveAllReverseData L profile continuation
```

the proposed producer is

```lean
exists q,
  transitionReverseOutsidePair A.transition q <=
      A.firstApexRoles.retainedRow.support or
  transitionReverseOutsidePair A.transition q <=
      A.firstApexRoles.doubleRow.support
```

Production already proves that this conclusion implies `False` through

```lean
false_of_fullParentExactFiveAllReverseData_of_namedRowOccurrence
```

The owned Lean file checks the corresponding negation for every assembled
packet:

```lean
not_namedRowOccurrence_of_fullParentExactFiveAllReverseData
```

This does not refute the desired full-parent contradiction. It records the
correct logical status: proving the proposed occurrence is itself the entire
all-reverse closure theorem, not a selector or bookkeeping lemma.

## Why the stored-row statement is overstrong

`FirstApexShellRolePacket` stores two actual `SelectedFourClass` values:

- `retainedRow`, a four-subpacket chosen from the retained first-apex radius
  class while preserving the frontier pair and two chosen cap-interior hits;
- `doubleRow`, a four-subpacket chosen after deleting the frontier pair while
  preserving two chosen cap-interior hits.

Neither support is a complete ambient radius class. The extractor uses
existential four-subpacket selection, and its choices are made before any
transition reverse pair is named. In particular:

- when a complete radius class has more than four points, a co-radial reverse
  pair can lie in the omitted part of that class;
- in the unequal-radius arm, the packet only proves the two chosen supports
  are disjoint;
- in the equal-radius arm, it proves a six-point full class, not that either
  chosen support contains every two-point subset of that class.

The independent selector regression in
`NamedRowContainmentMarginal.lean` is exact finite Lean:

```text
complete first-apex radius class = {0,1,2,3,4,5}
chosen retained four-row         = {0,1,2,3}
chosen double four-row           = {6,7,8,9}
co-radial residual pair          = {4,5}
```

Lean checks all cards, checks that the pair lies in the complete six-point
radius class, and proves that it lies in neither chosen row. Thus named-row
containment is strictly stronger than the actual metric occurrence at the
available selector interface. This regression is independent of the harder
question whether the full Euclidean parent is contradictory.

## Exact finite marginal countermodel

The same owned Lean file gives a stronger finite-incidence regression with 16
roles. It preserves:

- an exact period-three successor on three physical sources;
- the global all-reverse implication for every pair of physical sources;
- omission of each successor from its source row;
- three exact four-point successor supports, each split into exactly two
  physical-cap points and two outside points;
- one shared linear physical-cap order with each actual blocker strictly
  between its transition endpoints;
- two disjoint named first-apex supports, each of cardinality four;
- three pairwise-disjoint reverse outside pairs, each of cardinality two; and
- the stronger extra fact that every reverse outside pair is contained in the
  union of the two named rows.

The three residuals are

```text
{0,4}, {1,5}, {2,6}
```

against named supports

```text
retained = {0,1,2,3}
double   = {4,5,6,7}.
```

Each residual has intersection cardinality one with each named row. Lean
therefore proves

```lean
no_reverseOutsidePair_subset_namedRow
```

This is an exact kernel proof about the stated finite abstraction. It is not
a Euclidean realization, a `CounterexampleData`, or a countermodel to the
full Problem 97 theorem. It sharply refutes deriving named-row containment
from the current incidence/cardinality/shared-order projections, including a
union-coverage strengthening that production does not presently have.

## Nonlinear / MEC / full-fiber audit

No current nonlinear theorem closes the missing direction:

1. `criticalShell_inter_frontierRadiusClass_card_le_two` permits exactly two
   common points. It can consume a three-hit lower bound, but it cannot force
   a two-hit lower bound.
2. `outsidePair_unique_capCenter` and its production wrapper are terminals.
   They need the first-apex equality; they do not create it.
3. The shared physical-cap order constrains the physical sources and actual
   blockers. It contains no order or first-apex metric data for the six
   outside roles.
4. The retained-radius blocker selector acts on **sources already known to
   lie on one first-apex radius class**. It does not identify either endpoint
   of a transition reverse outside pair with such a source.
5. The complete critical map `H` owns the transition rows, but the two
   first-apex rows are selected K4 witnesses, not rows of `H`; production in
   fact proves every actual blocker is different from the robust first apex.
   Therefore full-fiber support equality cannot silently upgrade either named
   row to an actual critical shell.
6. Minimality, `noM44`, and the two cap-six bounds remain available through
   `L`, but no current theorem converts them into the missing cross-family
   first-apex equality.

Accordingly, the finite target negation recorded by the existing
first-apex-return/Kalmanson audit remains a valid regression gate: any proof
must visibly use genuinely additional nonlinear Euclidean, MEC, minimality,
or full critical-map force. Merely enlarging the same marginal quotient cannot
prove the theorem.

## Checked replacement statement

The owned Lean file defines the choice-free occurrence

```lean
FirstApexRadiusClassTransitionReversePairOccurrence A :=
  exists q radius,
    transitionReverseOutsidePair A.transition q <=
      SelectedClass D.A S.oppApex1 radius
```

and proves both directions:

```lean
firstApexCoRadialOccurrence_of_radiusClassOccurrence
radiusClassOccurrence_of_firstApexCoRadialOccurrence
```

Thus complete-radius-class containment is exactly equivalent to

```lean
FirstApexCoRadialTransitionReversePairOccurrence A
```

at the current source interface. It has no arbitrary selected-subpacket
quantifier and feeds the existing terminal immediately.

## Recommendation

Do not make the named selected-row statement the required producer. Replace
the all-reverse consumer slot by either:

```lean
FirstApexCoRadialTransitionReversePairOccurrence A
```

or its equivalent complete-radius-class form checked here. Then attack that
choice-free occurrence directly from the complete full parent `L`.

If a future proof wants to use selected rows, choose a four-subpacket only
**after** obtaining the target reverse pair and only after proving that the
pair's complete first-apex radius class has cardinality at least four. Those
are new positive facts; the present extractor does not provide them, and the
terminal does not require the extra packaging.

## Validation

The owned file compiled against the current production graph with warnings as
errors:

```bash
cd lean
lake env lean -M 16384 -DwarningAsError=true \
  ../scratch/atail-force/named-row-containment-proof/\
NamedRowContainmentMarginal.lean
```

It contains no `sorry`, `admit`, declaration-level `axiom`, `native_decide`,
or `unsafe` declaration. Displayed axiom checks for the finite refutation, the
production negation adapter, and both full-radius-class equivalence directions
are exactly:

```text
propext, Classical.choice, Quot.sound
```

No production `sorry` is closed by this audit.
