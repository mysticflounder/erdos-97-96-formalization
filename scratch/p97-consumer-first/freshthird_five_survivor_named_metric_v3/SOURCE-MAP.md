# Source map and exact ingress contract

Status: bounded diagnostic/producer discovery only.  No finite-to-universal
lift is present.

## Live arms and tags

The represented source is the first two alternatives of
`FirstFiberOutsidePairExactRowsOrCrossedThreeRowsResidual`, consumed by
`FreshThirdAlignedDistinctBlockerFirstCapResidual`.

The inherited finite ingress has eight tags:

1. active cap source orientation: `first` or `second`;
2. deleted outside point: `qsource` or `qother`;
3. first-apex survivor: retained row `R` or `Rh`.

The crossed-three-row alternatives are out of scope.

## Five boundary rows

For a deleted point `q`, the boundary centers are

- `C0 = H.centerAt activeSource`;
- `C1 = H.centerAt Pρ.source₁`;
- `C2 = S.oppApex1`;
- `C3 = S.oppApex2`;
- `C4 = S.surplusApex`.

`B0..B4` are independent `U5QDeletedK4Class` witnesses of cardinality four.
Each has a positive radius, every support point is at that radius, its center
is omitted, and the deleted point is omitted.

Ambient theorems additionally identify:

- `B0` with the active source's canonical exact critical shell;
- `B1` with the `Pρ.source₁` canonical exact critical shell;
- `B2` with exactly one of the retained first-apex rows `R` or `Rh`;
- `B3` and `B4` remain independent q-deleted witnesses, including when other
  named roles alias their support labels.

The B0/B1 support traces and omissions are inherited exactly from v2:

- B0 contains the two active source points, has first-cap intersection exactly
  that pair, and omits both collision pairs, q, and its own center;
- B1 contains the Pρ pair, has first-cap intersection exactly that pair, and
  omits the P pair, q, and its own center;
- neither row is constrained at the nondeleted outside-Q point without a
  theorem.

## Actual deleted blocker

`DB = H.centerAt q` is a carrier point distinct from q and from `C0..C4`.
Its unique ambient four-class contains q, while deletion of q destroys K4 at
DB.  In the `qsource` arm the live blocker collision identifies `DB = CP`.

## Center inequalities

The five boundary centers are pairwise distinct in the live ambient packet:
source blocker inequalities give `C0 != C1`, deletion robustness separates
both blocker centers from the three apices, and the surplus-cap packet makes
the three apices pairwise distinct.  No center is forced distinct from an
arbitrary named support label unless a source API says so.

## Shared-coordinate geometry

The metric stage uses 17 pairwise distinct carrier coordinates and only these
source facts:

- convex independence, encoded by a strict separating line for each carrier
  point from all other carrier points;
- an enclosing circle with `C2,C3,C4` on its boundary and every carrier point
  inside it;
- the three non-obtuse dot-product inequalities for `C2,C3,C4`;
- exact first-cap membership via `OnArcOpposite C2 C3 C4`;
- a positive named radius and equal squared distance for every support point
  of each named selected row;
- exact off-support distance inequalities only for full critical shells at
  actual blocker-image centers: `PRow`, `PRhoRow`, `S0Row`, `S1Row`, and the
  actual-blocker row `DBRow`.

No off-support inequality is imposed on the arbitrary q-deleted witnesses
`B3/B4`.  No missing `FiveRowCircleIntersectionOrderCore` premise is added.

## Deliberate omissions

- crossed-three-row constructors;
- a full anonymous global-K4 row at each of the 17 carrier points;
- a complete order-core role producer;
- general-cardinality ingress or lift;
- any assertion that SAT is a P97 counterexample or UNSAT closes Lean.

An exact-rational SAT replay validates only the emitted finite motif.  An
UNSAT result validates only the exact source-labeled formula emitted here.

