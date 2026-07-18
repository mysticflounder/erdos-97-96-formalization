# LIVE-C `t2` row-failure closure audit

Date: 2026-07-18

Status: **local closure refuted; parent/global producer required; no source
`sorry` closed**.

Owned scope for this audit is only
`scratch/atail-force/live-c-t2-rowfailure-closure/`.  No production Lean file
was edited.

## Live boundary

The proof-blueprint anchor was set to
`Problem97.liveData_C_center_t2_rowFailure_false`.  The live index reports it
on the publication spine; closing it alone would change the on-spine frontier
from eight declarations to seven.

The declaration is at
`lean/Erdos9796Proof/P97/U1LargeCapRouteBTail.lean:7709`.  After the common
large-cap, MEC, minimality, critical-system, LIVE-data, and row-provenance
arguments, its branch-specific inputs are

```lean
(hcenter_t2 : f2CriticalRow.center = t2)
(hrowFailure :
  dist t2 (rows.pointOfChoice { source := .t2, slot := 1 }) ≠
      dist t2 (rows.pointOfChoice { source := .t2, slot := 0 }) ∨
    dist t2 p ≠
      dist t2 (rows.pointOfChoice { source := .t2, slot := 0 }) ∨
    dist t2 q ≠
      dist t2 (rows.pointOfChoice { source := .t2, slot := 0 })) :
False
```

Write `f2 := t2Row[0]` and `f5 := t2Row[1]`.  Thus the leaf says:

> the extra critical row sourced at `f2` has blocker center `t2`, while at
> least one of `f5`, `p`, and `q` is not on the `t2`-circle through `f2`.

There is one direct caller, in
`u1_largeCap_routeB_tail_liveData_false` at lines 9487--9501.  The caller uses
`f2CriticalRow_all_named_or_t2ResidualHRowFailure` to split into:

1. all three of `f5,p,q` are named members of the exact `f2` shell; or
2. the displayed `hrowFailure` disjunction.

At the outer wrapper, lines 9611--9622 construct both `rows` and
`f2CriticalRow` from the same concrete `Hcritical`.  The leaf signature does
not retain those construction equalities: it retains only `Nonempty
(CriticalShellSystem D.A)` and conditional center/`l1` comparison maps.  This
loss matters for any helper-local use of full common-system provenance.

## Bank and corpus preflight

The required registries were checked before deriving anything:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

The indexed Lean corpora were queried with `nthdegree docs search --lean` for
the exact declaration, the residual row-failure phrase, the three raw distance
tests, and `CriticalRowPacket` centered at `t2`.

Result: the bank contains the positive transport lemmas
`hrow_t2_f5_f2`, `hrow_t2_p_f2`, `hrow_t2_q_f2`, the named-row producer
`t2ResidualHRows_of_f2CriticalRow_named`, and larger positive row-slot
consumers.  Every one requires the corresponding named support placements or
distance equalities.  No banked theorem consumes a **failure** of one of those
equalities.

This agrees with the earlier source audits:

- `docs/audits/2026-07-13-atail-live-c-provenance-audit.md` records that
  no-qfree forces only the source `f2` into the extra shell, not `f5`, `p`, or
  `q`;
- `scratch/atail-force/live-helper-direct-closure-audit/REPORT.md` records
  that this disjunction has no uniform positive equality core; and
- `scratch/atail-force/incidence_delta_census.py` has a checked
  incidence-only witness with all three tested points outside the exact `f2`
  support.

## Exact Euclidean projection

`SourceBoundary.lean` first keeps the production `CriticalSourceRows` and
`CriticalRowPacket` types and proves

```lean
rowFailure_iff_supportOmission
```

under the exact center and ambient-membership assumptions.  It identifies
`hrowFailure` with

```text
f5 not named in the f2 shell OR
p  not named in the f2 shell OR
q  not named in the f2 shell.
```

This is a source-faithful, kernel-checked normal form.  In particular, there
is no uniform positive member among `f5,p,q` left after the split.

`LocalMetricProjection.lean` strengthens the incidence-only evidence.  It
kernel-checks an exact rational planar configuration with:

- distinct `p,q,t1,t2,t3,u`;
- `q,t1,t2,t3` at one common positive radius from `p`;
- an original four-point circle centered at `t2Blocker`, sourced at `t2`, with
  slots `f2` and `f5`;
- a second four-point circle sourced at `f2` and centered at `t2`; and
- the exact production `hrowFailure`, with its `f5` arm true.

The coordinates are small rationals.  In particular,

```text
t2 = (0,0),  f2 = (1,0),  f5 = (1/2,1/2),
t2Blocker = (1/2,0).
```

The original row has radius `1/2` around `t2Blocker`; the extra row has radius
`1` around `t2`.  Therefore `f2` and `f5` are co-radial in the original source
row, but `dist t2 f5 != dist t2 f2`.

Validation:

```text
lake env lean ../scratch/atail-force/live-c-t2-rowfailure-closure/LocalMetricProjection.lean
lake env lean ../scratch/atail-force/live-c-t2-rowfailure-closure/SourceBoundary.lean
```

passes, and

```text
#print axioms exact_local_projection
#print axioms rowFailure_iff_supportOmission
```

reports exactly `propext`, `Classical.choice`, and `Quot.sound`.

Epistemic boundary: this is an exact Euclidean **projection model**, not a
`CounterexampleData`.  It does not model convex minimality, total all-center
K4, caps/MEC, `noM44`, or a common critical-shell system.  It therefore does
not refute the production theorem.  It does refute any attempted proof using
only the displayed fixed-circle and two-row metric algebra.

## Closure decision

There is no source-faithful helper-local proof from the currently exposed row
surface.  The negative disjunction is a broad realizable branch, not a
contradictory algebraic residue.  Producing one more conditional row adapter
would not change that result.

The first sufficient missing input is one of the following genuinely global
producers:

1. **Preferred:** the parent direct contradiction
   `false_of_largeOppositeCapsBiApexRobust`, assembled into
   `false_of_twoLargeCaps_commonCriticalMap` before LIVE row enumeration.  It
   uses the two physical large-cap bounds, complete frontier, total common
   critical map/global K4, minimality, and `noM44`; the current leaf can then
   be deleted or retained as an ex-falso compatibility wrapper.
2. **Leaf-specific but currently unproved:** a theorem at the actual caller,
   retaining the concrete common `Hcritical`, that derives `False` separately
   from each of the three inequality arms using cap order/full-fiber/global
   minimality.  The local model proves that at least one of those omitted
   global ingredients must be visibly used.
3. **Stronger-than-needed exclusion:** common-system/global geometry forcing
   all three equalities.  This directly negates `hrowFailure`, but no existing
   theorem produces any of them on this branch, and the sibling named branch
   would still require its own closure.

Accordingly this leaf is not a sensible independent one-sorry target.  The
load-bearing work remains the aggregate large-opposite-caps parent producer;
once that lands, this declaration disappears from the spine together with the
other LIVE-Q/C leaves.
