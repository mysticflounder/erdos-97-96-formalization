# Rigid221 source-heavy off-class branch: exact-cardinality-15 audit

## Scope and target

This is a read-only audit of the active residual theorem
`false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass`
in `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean`.
The theorem has hypotheses `15 ≤ D.A.card` and a next-row overlap bound
`|Kc.support ∩ C| ≤ 1`, where

- `C := SelectedClass D.A S.oppApex2 P.rho` is the physical five-class,
- `c` is the deleted-row blocker, and
- `Kc := (Hlate.selectedAt c hcA).toCriticalFourShell`.

No Lean or documentation source was changed by this audit.

## Facts already proved upstream

The private producer
`..._deletedRowBlockerOffClass_card_ge_fifteen` proves `15 ≤ D.A.card` from
the off-class blocker and strict-cap hypotheses.  Its counting spine is:

1. `C.card = 5` (`P.hclassFive`).
2. The five points of `C`, together with the off-class blocker `c` and a
   second center `e`, are distinct points of
   `I := S.capInteriorByIndex S.oppIndex2`.
3. Hence `7 ≤ I.card`.
4. `I.card + 2 = S.oppCap2.card`, so `9 ≤ S.oppCap2.card`.
5. `S.capSum`, `S.surplus_card_gt_four`, and
   `P.surface.firstOppCap_card_ge_four` give `15 ≤ D.A.card`.

The private producer
`..._deletedRowBlockerOffClass_nextRow_physical_hits_le_one` proves the
next-row bound `|Kc.support ∩ C| ≤ 1`.
`CriticalFourShell.support_card` supplies `Kc.support.card = 4`, and
`Kc.q_mem_support` supplies `c ∈ Kc.support`.

## Exact-cardinality-15 profile

Assume in addition `D.A.card = 15`.  Write
`s = S.surplusCap.card`, `o1 = S.oppCap1.card`, and
`o2 = S.oppCap2.card`.  The cap-sum identity gives

```
s + o1 + o2 = D.A.card + 3 = 18.
```

The established lower bounds are `s ≥ 5`, `o1 ≥ 4`, and `o2 ≥ 9`.
Therefore exactness forces the unique profile

```
S.surplusCap.card = 5,
S.oppCap1.card    = 4,
S.oppCap2.card    = 9.
```

Using `I.card + 2 = o2`, this also forces `I.card = 7`.

Let `N := insert e (insert c C)`, using the same seven named interior points
as the cardinality producer.  Since `N ⊆ I` and both have cardinality seven,
the exact-15 stratum proves `N = I` (strict interior exhaustion).

This does **not** mean that the seven points exhaust the closed second cap:
`S.oppCap2` has cardinality nine, so exactly two further points are on the
cap boundary (the standard `+2` endpoint gap).

## Consequence for the critical support

From `Kc.support.card = 4` and `|Kc.support ∩ C| ≤ 1`,

```
|Kc.support \\ C| ≥ 3.
```

One of these three is necessarily the named off-class point `c`, since
`c ∈ Kc.support` and `c ∉ C`.  Thus at least two further support points are
outside `C` and distinct from `c`.

The source does not prove `e ∉ Kc.support`, nor does it prove
`Kc.support ⊆ I`.  Consequently the safe statement is “at least three
support points outside the physical five-class,” not “three anonymous points
outside all seven named interior points.”  If `e` happens to lie in the
support, only one further support point is forced outside the seven-point
set; no source theorem currently excludes this.  Nevertheless, because the
producer proves `e ∉ insert c C`, the support can meet
`N = C ∪ {c,e}` in at most three points (`≤1` from `C`, plus `c`, plus
possibly `e`).  Therefore the unconditional exact-15 consequence is
`|(Kc.support \\ N)| ≥ 1`: at least one genuinely unnamed carrier point lies
on that critical row.  The source does not identify or geometrically place
that point.

## Why exactness is not yet a contradiction

The equality `N = I` constrains only the strict second-cap interior.  The
next-row support has no established placement in `I` (or in the second cap),
so its two additional points can remain among the other carrier points or the
two cap-boundary points.  Even under the stronger hypothetical placement
`Kc.support ⊆ I`, the available facts still allow `e` as one support point;
an exclusion or an independent geometric contradiction is required.

### Explicit finite shadow (not a Euclidean countermodel)

The following incidence/cardinality shadow satisfies all currently audited
counting facts and demonstrates that cardinal arithmetic alone cannot close
the branch.  Take a 15-element carrier

```
A = {u, xu, deleted, v, xv, c, e, bL, bR, z1, z2, z3, z4, z5, z6}.
```

Set

```
C = {u, xu, deleted, v, xv},
I = {u, xu, deleted, v, xv, c, e},
oppCap2 = I ∪ {bL, bR},
Kc.support = {c, u, z1, z2}.
```

Then `|C|=5`, `|I|=7`, `|oppCap2|=9`,
`|Kc.support|=4`, `c ∈ Kc.support`, and
`|Kc.support ∩ C|=1`.  Choose abstract cap labels with sizes
`|surplusCap|=5` and `|oppCap1|=4`; the cap-sum is 18.  This is only a
finite incidence shadow: it does not assert the Euclidean distances,
critical-shell equations, or any omitted source predicates.

## Lean ingress for the exact-15 stratum

The following helper facts are the natural next interface (names schematic):

```lean
have hsum := S.capSum
have hs := S.surplus_card_gt_four
have ho1 := P.surface.firstOppCap_card_ge_four
have ho2 := hsecond9
have hprof : S.surplusCap.card = 5 ∧ S.oppCap1.card = 4 ∧
    S.oppCap2.card = 9 := by omega
have hinter : I.card = 7 := by
  have hadd := ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
    S S.oppIndex2
  rw [capByIndex_oppIndex2_eq_oppCap2_sourceHeavy S] at hadd
  omega
```

After exposing the existing `N ⊆ I` and `N.card = 7` producer, exactness
closes it with `Finset.eq_of_subset_of_card_le`.  The support arithmetic can
then be stated as a separate producer for
`3 ≤ (Kc.support \\ C).card` and, using `e ∉ insert c C`,
`1 ≤ (Kc.support \\ N).card`.  A terminal proof still needs a new geometric
consumer placing or otherwise constraining that unnamed support point (or the
two non-`C` points beyond `c`).
