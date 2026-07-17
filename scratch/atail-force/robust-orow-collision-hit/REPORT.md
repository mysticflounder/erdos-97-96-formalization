# Robust blocker collision / first-apex O-row hit audit

Date: 2026-07-17

Status: **KERNEL-CHECKED EXACT DISJUNCTION; KERNEL-CHECKED FINITE BOTH-OFF
REGRESSION; NONTERMINAL. NO PRODUCTION `sorry` IS CLOSED.**

## Corrected question

The pinned `O,A,X` Kalmanson core contains

```text
O-row: J,C
A-row: C,K
X-row: J,K.
```

The memberships `C,K in A-row` do not by themselves consume the robust
blocker collision: they could be arbitrary support points of an `A`-row.
For a genuinely collision-driven match, at least one of the two distinct
sources in the repeated blocker fiber must be forced into the `O`-row.

This lane tests exactly that source incidence. It does not silently relabel an
arbitrary `O`-row member as a deletion-critical fiber source.

## Required theorem-bank preflight

Before deriving a new row-incidence statement, this lane checked the
registries required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

It also ran indexed Lean searches for critical-shell blocker collisions,
same-center exact supports, first-apex selected rows, retained radius classes,
and selected rows preserving a prescribed support point. The reusable
finite-set input is

```lean
FiniteEndpointShell
  .exists_fourSubpacket_preserving_point_of_selected_card_ge_four.
```

No registered theorem forces a repeated blocker-fiber source onto the
retained first-apex radius.

## Kernel-checked exact parent disjunction

`RobustORowCollisionHit.lean` proves

```lean
nonempty_criticalFiberFirstApexRowOutcome
    (R : FrontierCommonDeletionParentResidual F) :
    Nonempty
      (CriticalFiberFirstApexRowOutcome (radius := radius) (S := S) H)
```

The outcome has exactly two mathematical arms.

### 1. Both collision sources are off the retained O-class

There are distinct carrier sources `source1, source2` with the same actual
blocker, but

```text
source1 notin SelectedClass D.A S.oppApex1 radius
source2 notin SelectedClass D.A S.oppApex1 radius.
```

This constructor is not eliminated by any current parent field.

### 2. A deletion-critical collision source hits an O-row

If either collision source lies in the retained radius class, the theorem
constructs an actual

```lean
row : SelectedFourClass D.A S.oppApex1
```

whose support contains that source and another distinct support point. The
packet retains:

- the two distinct carrier sources;
- equality of their actual blocker vertices;
- deletion criticality of both sources at the common blocker;
- an explicit proof that the selected `hitSource` is one of those two fiber
  sources; and
- `hitSource, other in row.support` with `other != hitSource`.

Thus the desired `O`-row `J,C` incidence is routine **after** proving that a
collision source lies on the retained O-radius. It is not routine before
that placement theorem.

## The cap/MEC/order contribution does not identify the fiber preimages

The full parent supplies a positive retained radius and a class of cardinality
at least four. The existing MEC/cap one-hit theorem constrains how that class
meets the surplus cap, and the frontier already names off-surplus members of
the class. Those facts constrain the **radius class**.

The blocker collision is obtained independently by finite-endomap
noninjectivity after the robust apex is omitted from the blocker-map image.
That argument constrains a **blocker-map fiber** but does not place its
preimages in the retained radius class, a cap, or one of the frontier names.

No source-valid implication currently crosses those two quantifiers. Global
convexity and cap order can consume the equalities once a source placement is
known, but the current interfaces do not create that placement.

## Kernel-checked finite regression

`RobustORowCollisionFiniteBoundary.lean` gives a `Fin 12` model of the
represented blocker/row/minimality surface. It simultaneously has:

- a total fixed-point-free source-indexed blocker map;
- omission of the first apex from the blocker image;
- a five-point first-apex class surviving every single deletion;
- a selected four-row inside that class;
- two distinct sources mapping to one common blocker;
- source membership in, and exact support locking of, their common critical
  row;
- deletion of either source reducing that exact row from four points to
  three; and
- the finite row-closure consequence of minimality: every nonempty
  row-closed subset is the whole carrier.

Nevertheless, both collision sources lie outside both the robust first-apex
class and its selected O-row:

```lean
collision_sources_off_firstApex_class_and_row_checked
```

This is an exact kernel-checked regression inside the stated finite
abstraction. It is not a Euclidean counterexample to the full parent and does
not prove that a future geometric theorem cannot eliminate the both-off arm.
It does prove that double prescribed criticality, blocker-fiber exactness,
first-apex robustness, and minimal row closure do not force the O-row hit.

## Consequence for the three-row Kalmanson route

The existing three-row terminal is not yet collision-driven.

1. In the `bothOff` arm, neither critical fiber source is available for the
   O-row equality.
2. In the `rowHit` arm, one collision source and an arbitrary other O-row
   point are available, but the terminal still needs the other point in the
   `X`-row, the `A`-row pair, and the shared six-role cyclic placement.
3. If `C,K` in the `A`-row are allowed to be arbitrary support members, the
   terminal does not use the repeated-fiber multiplicity at all.

Therefore the next load-bearing producer would have to prove one of:

- at least one of the two repeated-fiber sources lies in the retained
  first-apex class, together with the cross-row incidence/order needed by the
  terminal; or
- a different direct consumer for the honest `bothOff` arm.

Without that new Euclidean/source-localizing theorem, promoting the generic
three-row Kalmanson terminal would add a consumer but would not advance the
live parent proof.

## Validation

Both owned Lean files compile without `sorry`, `admit`, custom axioms,
`native_decide`, unsafe code, or linter suppression. The displayed theorem
closures use only:

```text
propext
Classical.choice
Quot.sound
```

Focused scratch elaboration was run with the project environment and the
16 GiB memory cap; the finite row-closure proof also used a 65,536 KiB thread
stack. Only files under
`scratch/atail-force/robust-orow-collision-hit/` were created.
