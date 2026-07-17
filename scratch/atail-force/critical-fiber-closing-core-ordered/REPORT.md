# Ordered critical-fiber closing-core audit

Date: 2026-07-17

Status: **KERNEL-CHECKED EXACT ROW-HIT ADAPTER; TWO PRECISE PRODUCER FIELDS
REMAIN OPEN. UNCONDITIONAL ROW-HIT CLOSURE IS REJECTED BY FINITE REGRESSION;
FULL-GEOMETRY EXISTENTIAL SELECTION REMAINS PLAUSIBLE BUT UNPROVED. NO
PRODUCTION `sorry` IS CLOSED.**

## Question

Start from the production objects

```lean
R : FrontierCommonDeletionParentResidual F
P : FrontierCommonDeletionCriticalFiber R
hit : ATailFirstApexCriticalFiberRow.RowHit P
```

where `P` is to be chosen after inspecting the full geometry, rather than
fixed by the first available pigeonhole collision.  Determine the smallest
source-faithful result which reaches the `ordered` constructor of

```lean
ATailCriticalFiberClosingCore.CriticalFiberClosingCore R.
```

## Required theorem-bank preflight

Before introducing a new incidence or order packet, this lane checked the
registries required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed `nthdegree docs search --lean` queries covered critical-source exact
shell cross membership, cross-deletion failure at an actual blocker, the
first-apex row hit, and cyclic placement of the robust apex, two blocker
centers, a critical source, and the collision pair.

No registered declaration supplies the missing source-indexed packet.  The
closest production results are:

- `cross_deletion_survives_iff_not_mem_selected_support`, which gives the
  exact equivalence used below but not either side of it;
- `source_mem_critical_support_of_no_qfree`, which requires deletion failure
  at the **new** center and therefore does not consume either old
  deletion-critical field of `P`;
- the blocker-center equality/mutual-cross-membership theorems in
  `CriticalPairFrontier`, which apply after a second blocker relation is
  already known; and
- the general-carrier boundary and ordered Kalmanson consumers, which
  consume cyclic order but do not produce it from cap placement.

The U1 source-unit, U5 incidence, and legacy ordered-cap banks remain
conditional consumers with larger named packets.  None maps the live
critical fiber and one `RowHit` to the required cross deletion or six-role
order.

## Kernel-checked reduction

`CriticalFiberClosingCoreOrdered.lean` proves the complete routine part.

### 1. Orient the actual collision by the row hit

```lean
nonempty_orientedFiberRowHit
```

names the hit fiber source `C` and the other source in the same actual
critical fiber `K`.  This retains the production
`IsFiberOrientation P C K`; it does not relabel an arbitrary selected support
pair as the collision.

The extra row point is named `J := hit.other`.  The file derives:

```text
J in D.A
dist O J = dist O C
```

directly from `hit.row`.  Thus the first-apex equality required by
`OrderedCrossRowCore` is already proved on every honest `RowHit` arm.

### 2. Identify the exact cross-shell obstruction

The theorem

```lean
OrientedFiberRowHit.K_mem_other_shell_iff_cross_deletion_blocked
```

kernel-checks

```text
K in (H.selectedAt J).support
iff
not HasNEquidistantPointsAt 4 (D.A.erase K) (H.centerAt J).
```

This is the precise missing `K_mem_J_shell` lemma.  The two criticality facts
stored in `P` are

```text
not K4 (D.A.erase C) at A
not K4 (D.A.erase K) at A,
```

where `A` is the old common blocker.  They do not imply deletion failure at
`X := H.centerAt J`.  Invoking `source_mem_critical_support_of_no_qfree`
without first proving this new-center failure reverses its implication.

### 3. Separate boundary existence from cyclic placement

```lean
nonempty_fullCarrierBoundary
```

proves that every `CounterexampleData` has an injective global CCW boundary
enumeration indexed by `Fin D.A.card`.  Boundary construction is therefore
not missing.

`OrderedBoundaryRoles oriented` packages only the remaining role placement,
in the re-cut linear form

```text
O < A < X < J < C < K,
```

where

```text
O = S.oppApex1
A = H.centerAt P.source1
X = H.centerAt J
C,K = the oriented actual collision sources.
```

Equivalently, before re-cutting, these six points must form the CCW cyclic
subsequence `O,A,X,J,C,K`.  In particular the statement includes all six
roles being distinct.  Neither convexity nor existence of a boundary fixes
this relative permutation.

### 4. Exact sufficient packet

The structure

```lean
OrderedRowHitProducerFields oriented
```

contains exactly:

1. `K` in `J`'s actual critical shell; and
2. `OrderedBoundaryRoles oriented`.

The checked definitions/theorems

```lean
OrderedRowHitProducerFields.toOrderedCrossRowCore
OrderedRowHitProducerFields.toClosingCore
false_of_orderedRowHitProducerFields
```

derive every other field, build the production `OrderedCrossRowCore P`, enter
the actual `CriticalFiberClosingCore.ordered` constructor, and close through
its immediate Kalmanson consumer.

## Narrowest honest missing theorem

The ordered branch of the existential closing-core producer can now be
stated without any anonymous row packet:

```text
there exist a geometry-chosen critical fiber P,
a source-stable RowHit hit for P,
and its hit-oriented pair C,K such that

  deletion of K blocks K4 at X = centerAt(J),
  and O,A,X,J,C,K occur in that CCW cyclic order.
```

Using the checked equivalence, the deletion statement may be replaced by
`K_mem_J_shell`.  This is one coupled full-geometry selection theorem, not
two independently plausible local axioms: the choice of `P`, the preserved
first-apex row, the choice of `J`, the cross deletion, and the boundary
permutation must be made together.

The production `CriticalFiberClosingCore` contract needs **no correction**.
Its ordered constructor already states the correct terminal.  Plan wording
should, however, replace generic “cross-row/order” with the exact two facts
above and should not claim that `RowHit` alone is close to terminal.

## Regression gates

`RowHitOrderedFiniteBoundary.lean` gives two kernel-checked finite
incidence/order regressions.  These are exhaustive checks of the displayed
`Fin 12` objects, not Euclidean counterexamples.

### Cross membership may fail

```lean
rowHit_crossMembership_missing_checked
```

retains:

- a total fixed-point-free blocker map;
- four-point rows and source membership in every actual critical support;
- support locking on equal blocker fibers;
- two distinct sources `C,K` with one common blocker and one common support;
- a four-point first-apex row containing `C` and a distinct `J`; and
- the finite row-closure consequence of minimality.

Nevertheless `K` is absent from `J`'s actual critical support.  Thus the
represented critical-map, row-hit, and minimality surfaces do not prove the
new-center deletion failure.

### Cyclic order may fail independently

```lean
rowHit_crossMembership_present_order_missing_checked
```

uses another first-apex row hit in the same finite system.  Here `K` **is**
in `J`'s actual critical support, but the modeled carrier order is not the
cyclic subsequence `O,A,X,J,C,K`.  Cross membership therefore does not imply
the order terminal.

The earlier fixed-fiber `BothOff` regression remains a separate gate: an
arbitrarily chosen blocker collision need not have any `RowHit`.  These new
checks show that even after selecting a row-hit fiber, the two terminal
fields remain independent in the represented abstraction.

## Classification and next move

- **PROVEN:** every honest row hit supplies its orientation, carrier source
  `J`, and `O`-row equality; the exact two-field packet closes immediately.
- **PROVEN:** `K_mem_J_shell` is equivalent to cross-deletion failure at
  `J`'s actual blocker; global boundary enumeration exists automatically.
- **REFUTED WITHIN THE FINITE ABSTRACTION:** `RowHit` plus the currently
  represented critical-map/minimality facts automatically supplies either
  cross membership or the required cyclic order.
- **PLAUSIBLE BUT UNPROVED IN THE FULL EUCLIDEAN PARENT:** an adaptive choice
  of fiber and `J` can make both fields hold simultaneously.

The next useful theorem must use cap/MEC/full-filter geometry or `R.noM44` to
choose the fiber and row jointly.  A particularly concrete target is a cap
interval theorem which first forces the cyclic subsequence and then uses a
source-criticality argument to rule out cross-deletion survival at `X`.
Selected-row counting or another arbitrary collision cannot pass the
regression gates.

## Validation

Both owned Lean files elaborate directly against the current project imports.
Every printed declaration has axiom closure contained in:

```text
propext
Classical.choice
Quot.sound
```

There is no `sorry`, `admit`, custom axiom, `native_decide`, or unsafe code in
the owned lane.  No production file or plan document was edited.
