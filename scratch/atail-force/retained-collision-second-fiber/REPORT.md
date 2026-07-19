# Retained-collision different-pair continuation audit

Date: 2026-07-17

Status: **ONE ALTERNATION-COMPATIBLE DIFFERENT-PAIR TERMINAL IS
KERNEL-CHECKED, BUT THE LIVE COLLISION DOES NOT PRODUCE ITS CROSS INCIDENCE
OR ORDER COVERAGE. AFTER BOTH MANDATORY SHARED-PAIR ALTERNATIONS, ONLY 2 OF 7
ORDER TYPES CLOSE ORDINAL-LINEARLY; ALL 5 SURVIVING TYPES HAVE EXACT RATIONAL
STRICTLY CONVEX LOCAL REALIZATIONS. NO PRODUCTION `sorry` IS CLOSED.**

## Scope and bank preflight

This lane owns only
`scratch/atail-force/retained-collision-second-fiber/`. It starts from the
production packet

```lean
Q : RetainedRadiusCollision (R := R)
```

and the already-checked facts that:

- `Q.nonempty_rowHit` supplies a first-apex selected row through one collision
  source;
- the collision sources alternate across the first apex and common blocker;
- every actual critical row through that same collision pair has the existing
  common blocker as center; and
- the collision has the production cap-localization consequences recorded in
  `RetainedCollisionCapLocalization`.

Before deriving the new local packet, the lane checked the registries required
by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed `nthdegree docs search --lean` queries covered retained blocker
collisions, third common-pair centers, different equality pairs, source-indexed
critical rows, and ordinal/Kalmanson cycles. The closest existing endpoints
were:

- `ATailRetainedCollisionCapLocalization.actualRow_center_eq_commonBlocker_of_contains_collisionSources`;
- `ATailThirdCenterCommonPair.false_of_thirdActualCenter_selectedRow_contains_frontierPair`;
- `CapCrossingKalmansonBridge.false_of_selected_rows_in_five_ccw_order`; and
- `ATailOrdinalKalmansonCycle.false_of_two_cycle`.

No banked theorem produces a different-pair cross incidence from the retained
collision or excludes the residual cyclic order types.

## Automatic live prefix

`RetainedCollisionDifferentPair.lean` first proves

```lean
nonempty_freshFirstApexRowPoint
    (Q : RetainedRadiusCollision (R := R)) :
  Nonempty (FreshFirstApexRowPoint Q)
```

The packet orients the actual collision sources as `C,K`, retains a selected
first-apex row through `C`, and chooses a row point `J` different from both
`C` and `K`. The fresh choice uses only the selected row's exact cardinality
four. Thus the live packet automatically supplies

```text
OJ = OC,  OC = OK,  AC = AK.
```

It does **not** supply the next source-valid equality. The narrow missing
incidence is exactly

```lean
K ∈ (H.selectedAt J J_mem_A).toCriticalFourShell.support
```

which gives `XJ = XK` at the actual center `X = H.centerAt J`. This asks for
one different equality pair `J,K`; it does not ask for a third center through
the already-saturated pair `C,K`.

## Corrected alternation-compatible terminal

The same Lean file defines `OrderedDifferentPairCrossHit Q` and proves

```lean
OrderedDifferentPairCrossHit.false : False
```

for the boundary order

```text
O < J < C < A < X < K.
```

Unlike the older `O < A < X < J < C < K` target, this order is compatible
with the mandatory alternation of `C,K` across `O,A`. The proof is the exact
two-cycle

```text
AC < AJ   from O < J < C < A and OJ = OC,
AJ < AC   from J < A < X < K, XJ = XK, and AC = AK.
```

Both inequalities are direct applications of
`complementary_dist_add_dist_lt_diagonal_sum_of_ccw`; `linarith` only cancels
the three source-valid shell equalities.

## Full order audit and the second mandatory alternation

The different-pair cross hit gives two shared-pair configurations:

```text
centers O,A through C,K;
centers O,X through J,K.
```

Consequently a valid convex boundary must satisfy **both** shared-pair
alternations. Omitting the second alternation gives a misleading `15/20`
ordinal-cycle count. That number is not the live geometric result.

`audit_orders.py` checks the corrected finite order surface exhaustively. Up
to rotation and reversal, both alternations leave exactly seven order types:

- two contain an ordinal Kalmanson cycle; and
- five remain ordinal-acyclic:

```text
O,J,X,C,A,K
O,J,C,X,A,K
O,C,A,J,X,K
O,C,A,K,X,J
O,C,J,A,X,K
```

Thus the corrected terminal is real but covers only `2/7` of the actual
alternation-compatible order surface.

## The five survivors are genuinely locally realizable

`audit_rational_survivors.py` constructs an exact rational configuration for
each of the five acyclic orders. It parameterizes `J,C,K` on the rational unit
circle about `O`, takes `X` on the perpendicular bisector of `J,K`, and takes
`A` on the perpendicular bisector of `C,K`. For each case `Fraction` arithmetic
checks:

- all twenty increasing triples have one strict orientation, hence the listed
  six-point boundary is strictly convex;
- `OJ = OC = OK`, `AC = AK`, and `XJ = XK` at squared-distance level;
- both shared-pair alternations;
- and absence of an ordinal cycle under the current exact row equalities.

This is externally exact rational arithmetic, not floating-point sampling.
In addition, `DifferentPairAcyclicModel.lean` independently kernel-checks a
strictly convex rational realization of the first survivor
`O < J < X < C < A < K`, including `IsCcwConvexPolygon`, `ConvexIndep`, all
five distance equalities, and collision alternation.

The models deliberately do not claim a full `CounterexampleData` or exact
four-point critical shells at `A,X`. They are decisive for the local consumer
surface: convexity, the three equality rows, and both forced alternations do
not by themselves imply `False`.

## Exact route verdict

The collision arm now has a precise two-stage continuation:

1. **Cross-incidence producer.** For the automatic fresh `J`, prove that one
   orientation of the collision has the other source `K` in `J`'s actual
   critical shell, or produce an equally strong different-pair row.
2. **Residual-order closer.** Use information absent from the rational local
   models to force one of the two cyclic order types or kill all five acyclic
   types. The added information must be genuinely global: cap/MEC placement,
   full exact-radius filters, prescribed-deletion criticality at another
   center, `R.noM44`, or another source-valid row equality.

Merely obtaining `K ∈ selectedAt(J).support` is not enough. Conversely, no
further theorem through the original pair `C,K` can help, because production
already proves that every such actual row reuses `A`.

## Validation

The scratch Lean modules were elaborated from the `lean/` Lake root with:

```text
lake env lean \
  ../scratch/atail-force/retained-collision-second-fiber/RetainedCollisionDifferentPair.lean

lake env lean \
  ../scratch/atail-force/retained-collision-second-fiber/DifferentPairAcyclicModel.lean
```

Both completed successfully. The printed theorem closures are contained in:

```text
propext
Classical.choice
Quot.sound
```

There is no `sorryAx`, custom axiom, `native_decide`, unsafe declaration,
`sorry`, or `admit` in either file.

The exhaustive and rational replays completed with:

```text
UV_CACHE_DIR=/tmp/uv-cache-atail uv run python \
  scratch/atail-force/retained-collision-second-fiber/audit_orders.py

UV_CACHE_DIR=/tmp/uv-cache-atail uv run python \
  scratch/atail-force/retained-collision-second-fiber/audit_rational_survivors.py
```

No production source, plan document, generated blueprint, `SurplusM44`, or
shell-curvature file was modified.
