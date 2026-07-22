# Exact-five distinct-bi-apex global-terminal audit

Date: 2026-07-22

Status: **NO DIRECT `False` THEOREM OBTAINED. A KERNEL-CHECKED CARD-12 SCOPE
GUARD SHOWS THAT THE CURRENT ROW-LEVEL CONSEQUENCES DO NOT FORCE THE POSITIVE
CROSS-INCIDENCE PACKET USED BY THE EXISTING EXACT-FIVE TERMINAL.**

## Target audited

The source target is the complete residual

```lean
false_of_originalUniqueFiveDistinctBiApexRobustResidual
    (R : OriginalUniqueFiveDistinctBlockersResidual F)
    (B : OriginalUniqueFiveDistinctBiApexRobustResidual R) : False
```

It retains the whole carrier, `D.Minimal`, the fixed total
`CriticalShellSystem H`, the MEC/cap packet and no-`IsM44` hypothesis, the
unique exact-five first-apex class, the strict-interior pair, distinct actual
blockers, directed cross-deletion survival, and full deletion robustness at
both physical apices.

The bank preflight required by `AGENTS.md` was repeated before this audit.
The closest existing exact terminal is

```lean
false_of_cardFive_exists_capLocal_or_mutualIncidence
```

via `CardFiveCapOrMutualFields`.  For two off-surplus points in the exact
five-class, that packet needs either a positive cross hit whose blocker lies
in the surplus cap, or reciprocal cross membership.  The distinct-blocker
residual itself supplies an omission/deletion survivor, not a positive hit.

## Kernel-checked scope guard

`DistinctBiApexScopeGuard.lean` gives an explicit twelve-label model with:

- a closed-cap `(5,5,5)` partition with the correct endpoint overlaps;
- a five-point first-apex class meeting its strict opposite-cap interior in
  three points;
- a selected four-row at the first apex, singleton-deletion robustness of the
  five-class, and failure after deleting the retained pair;
- an independent five-class giving singleton-deletion robustness at the
  second apex and survival after deleting the retained pair;
- one four-point row at every center;
- a total fixed-point-free blocker map whose image omits both physical
  apices;
- exact four-point source supports, own-source membership, and loss of one
  support point after deleting the source;
- both standard finite circle-incidence shadows: distinct rows meet in at
  most two points, and a fixed pair occurs together in at most two rows;
- the ordered-cap row bound for every represented row center in each of the
  three displayed caps;
- strong connectivity in its exact cut form: every nonempty row-closed set is
  the whole carrier;
- distinct retained blockers, both lying in the surplus cap; and
- reciprocal retained-pair omissions, hence both directed deletion-survival
  shadows.

Nevertheless the model proves

```lean
¬ HasCardFiveCapOrMutualTerminal
```

for **every** pair of off-surplus members of the represented exact-five
class.  Thus even blocker cap placement, the row-level consequence of
minimality, the two circle-incidence bounds, and both omission directions do
not manufacture the positive membership required by the current exact-five
consumer.

This is **exact within the stated finite incidence/cap abstraction**.  It is
not Euclidean, has no metric/MEC realization claim, does not encode complete
ambient radius partitions, and is not a `CounterexampleData` model.  It is a
scope guard against another incidence-only or selected-row proof attempt.

## Full cyclic Kalmanson audit of the fixed table

`check_kalmanson.py` enumerates all `3!^3 = 216` cyclic orders compatible with
the three displayed cap sets.  It imposes all selected-row radius equalities
and both strict Kalmanson inequalities for every cyclic quadruple.  Every order
is QF_LRA-UNSAT.  The complete apex-class equalities and strict triangle
inequalities are unnecessary: the selected rows alone are UNSAT.

One deletion-minimal rational Farkas core covers all 216 orders.  Every such
order has `0 < 2 < 6 < 11`; rows `2` and `6` give

```text
d(2,11) = d(2,0)
d(6,11) = d(6,0),
```

while strict Kalmanson gives

```text
d(0,2) + d(6,11) < d(0,6) + d(2,11).
```

Substitution yields `x < x`.  The exact core has weight `1` on the strict
inequality, `-1` on `row_2_slot_3`, and `+1` on `row_6_slot_3`, as replayed in
`KALMANSON_CORES.json`.  Its extension-stable source theorem already exists:

```lean
Problem97.false_of_two_centers_equidistant_pair_enclosed
```

from `ATail/TwoCenterBisectorParity.lean`.

This is **not branch coverage**.  The twelve rows are one arbitrary fixed
incidence table.  The live residual does not force two actual rows analogous
to rows `2` and `6` to contain a common chord analogous to `{0,11}`, nor force
another occurrence of this Kalmanson schema.  Thus the fixed-table UNSAT result
closes no source leaf and no `sorry`; it only invalidates this table as a
cyclic Euclidean witness.

## Exact first missing source theorem

The shortest theorem with an immediate existing consumer is:

```lean
theorem exists_cardFiveCapOrMutualFields_of_distinctBiApexRobust
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFiveDistinctBlockersResidual F)
    (B : OriginalUniqueFiveDistinctBiApexRobustResidual R) :
    Nonempty (CardFiveCapOrMutualFields S H radius)
```

If proved, the checked terminal
`false_of_cardFive_exists_capLocal_or_mutualIncidence` closes the robust
distinct-blocker leaf immediately.  The scope guard shows that a proof cannot
come from class/cardinality counts, blocker omissions, two-circle incidence
bounds, or selected-row connectivity alone.  The Kalmanson audit supplies one
additional honest route: prove a source-level occurrence of two actual rows
sharing a chord in a forbidden cyclic placement.  Otherwise the proof must use
a stronger source field such as nonlinear Euclidean/MEC geometry, complete
ambient radius filters together with `H.no_qfree_at`, or `D.Minimal`/no-`IsM44`
beyond their current row-level consequences.

The alternative honest target is the direct `False` theorem above.  No new
conditional producer or residual structure is proposed.

## PROVEN / BLOCKED boundary

**PROVEN (kernel-checked):** the explicit twelve-label finite model satisfies
every incidence, cap-cardinality, blocker, deletion-survival, pair-intersection,
and row-closure condition listed above, while refuting the finite analogue of
`CardFiveCapOrMutualFields` for every eligible retained pair.  Therefore those
row-level consequences alone cannot prove the positive cross-incidence packet
used by the existing exact-five terminal.

**EXACT COMPUTATIONAL RESULT:** all 216 cap-compatible cyclic orders of this
fixed table are refuted by the universal two-equality/one-Kalmanson Farkas core
above.  This is complete fixed-table coverage, not quantified source coverage.

**BLOCKED:** no proof was obtained of

```lean
false_of_originalUniqueFiveDistinctBiApexRobustResidual
    (R : OriginalUniqueFiveDistinctBlockersResidual F)
    (B : OriginalUniqueFiveDistinctBiApexRobustResidual R) : False
```

and no proof was obtained of the immediately sufficient source theorem
`exists_cardFiveCapOrMutualFields_of_distinctBiApexRobust`.  Closing either
statement requires either a source occurrence theorem for the existing
two-center Kalmanson terminal or another source ingredient not represented by
the finite guard.

**NOT CLAIMED:** the finite model is not a Euclidean configuration, a MEC
configuration, or a `CounterexampleData` instance.  It does not refute the
source theorem; it sharply rules out only the enumerated incidence-only proof
surface.

## Validation

From `lean/`:

```bash
LEAN_PATH="../scratch/atail-force/unique5-distinct-biapex-global-terminal:.lake/build/lib/lean" \
  lake env lean -R .. -s 65536 -M 16384 -DwarningAsError=true \
  ../scratch/atail-force/unique5-distinct-biapex-global-terminal/DistinctBiApexScopeGuard.lean
```

The focused warning-as-error elaboration passed.  Every explicit axiom query
reported exactly

```text
propext
Classical.choice
Quot.sound
```

The file contains no `sorry`, `admit`, declared axiom, `native_decide`, unsafe
declaration, or external certificate.
