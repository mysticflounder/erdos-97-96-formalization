# LIVE-C source-closure audit

Date: 2026-07-19

Status: **no unconditional replacement proof body exists in the current
production/imported bank inventory; all seven leaves share a missing geometric
producer.  No source `sorry` is closed.**

Owned scope was only
`scratch/atail-force/live-c-source-closer/`.  The protected production file
`lean/Erdos9796Proof/P97/U1LargeCapRouteBTail.lean` was read but not edited.

## Live result

`proof-blueprint` currently reports exactly eight on-spine source-sorry
declarations under the P97 target: `DoubleApexOffSurplusSharedRadiusPair` and
the seven `liveData_C_*_false` leaves.  The audit anchor was set to the closest
leaf, `Problem97.liveData_C_center_t2_named_false`.

The seven C leaves are one common interface with six center cases:

```text
f2CriticalRow.center = q | t1 | t2 | t3 | u | fresh
```

The two `t2` leaves split the row content into a positive named case and a
row-failure case.  Every leaf also receives the full large-cap/MEC/no-removable
parent hypotheses, but its `rows` and `f2CriticalRow` arguments are arbitrary
packets.  The common `CriticalShellSystem` construction equalities visible at
the caller are not retained in the leaf signatures; only conditional center
and `l1` comparisons remain.

## Mandatory theorem-bank preflight

Before deriving the boundary, this audit checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- indexed Lean corpus searches via `nthdegree docs search --lean` for critical
  row centers/supports, same-cap two-center collisions, dangerous-triple
  support hits, equal-center support transport, and
  `u1TwoLargeCapObstruction`.

The closest current consumers are:

1. `CapSelectedRowCounting.outsidePair_unique_capCenter`;
2. `U5QCriticalTripleClass.two_triple_points_incompatibility`;
3. the generated source-unit metric consumers;
4. the sibling unimported `u1TwoLargeCapObstruction`; and
5. the five-point circle/order consumers behind `GeneralCarrierBridge`.

None produces its own row placements, cap placement, cyclic order, or
cross-row equalities.  The sibling `u1TwoLargeCapObstruction` is additionally
marked `source_reachable: false`, and requires seven explicit metric
equalities.  Importing it without an equality producer would not close a leaf.

No landed production theorem named `false_of_twoLargeCaps_commonCriticalMap`
or `false_of_largeOppositeCapsBiApexRobust` currently exists.  Existing
exact-five parent consumers still require either a mutual-arm closer or a
co-radial reverse-pair occurrence producer.

## Kernel-checked common boundary

`Boundary.lean` proves, from the exact common leaf surface:

```lean
center_ne_p
two_le_support_sdiff_dangerousBase
exists_two_support_off_dangerousBase
```

Thus every C leaf gives:

```text
f2CriticalRow.center != p

and two distinct x,w with
  x,w in f2CriticalRow.support
  x,w not in {q,t1,t2,t3}.
```

The proof uses the exact two-circle intersection bound for distinct selected
four-class centers.  This is the strongest uniform positive row statement:
the extra row has cardinality four and intersects the dangerous four-point
circle in at most two points, hence at least two points lie off it.

The same module defines the exact missing producer:

```lean
SameCapDangerousPairProducer S p q t1 t2 t3 source f2CriticalRow
```

It consists of:

- a cap index `k` containing both `p` and `f2CriticalRow.center`;
- two distinct selected points `x,w` of the f2 row;
- both `x,w` in the dangerous base `{q,t1,t2,t3}`; and
- both `x,w` outside cap `k`.

The theorem

```lean
false_of_sameCapDangerousPairProducer
```

then closes immediately using the existing public
`outsidePair_unique_capCenter`: the dangerous `p`-circle and the f2 circle
make two distinct centers in one ordered cap equidistant from the same
outside pair.

This producer is not a repackaged target.  Its consumer is fully proved and
source-clean.  The mathematical gap is exactly production of the common-cap
placement and the dangerous support pair from the full parent geometry.

The uniform witnesses already derivable from all seven leaves point in the
opposite incidence direction.  `offDangerous_pair_not_dangerous` proves that
the two extracted off-dangerous witnesses cannot themselves populate either
dangerous-point field of the closing producer.

## Branch-by-branch result

| Leaf | Strongest positive row content | First missing antecedent of a checked sink | Decision |
|---|---|---|---|
| `center_q` | center `q`; two off-dangerous support points | any two dangerous support hits plus common-cap/outside-cap placement; moreover `q` itself is excluded from support because it is the center | not independently closable |
| `center_t1` | center `t1`; two off-dangerous support points | two dangerous support hits plus cap placement | not independently closable |
| `center_t2_named` | center `t2`; `f5`, `p`, and `q` named; checked equilateral prefix | one additional dangerous support hit (only `q` is supplied as a dangerous hit), then common-cap/outside-cap placement; alternative metric banks need further cross-row equalities/order | closest partial, not terminal |
| `center_t2_rowFailure` | center `t2`; at least one of the `f5`, `p`, `q` radius tests fails | no uniform positive membership survives; the exact rational projection in `live-c-t2-rowfailure-closure` realizes this local surface | not independently closable |
| `center_t3` | center `t3`; two off-dangerous support points | two dangerous support hits plus cap placement | not independently closable |
| `center_u` | center `u`; two off-dangerous support points | alignment of the `u` row with a cap consumer and two dangerous hits | not independently closable |
| `center_fresh` | fresh carrier center; two off-dangerous support points | any cap/row alignment and two dangerous hits | not independently closable |

Here “not independently closable” means no theorem in the audited current
production/imported bank inventory has all antecedents produced by the exact
leaf signature.  It is not a claim that the production theorem is false.

The `t2_named` branch is the only near match.  Its three named points already
feed `t2ResidualHRows_of_f2CriticalRow_named`, but the existing terminal
`false_of_f2CriticalRow_named` additionally requires the branch-0 collision
exclusion packet, the metric bridge, and further q/t3/u row equalities.  None
is produced by the leaf.

The row-failure branch is also not a hidden contradiction.  The prior
source-faithful reduction proves the failure is exactly omission of at least
one of `f5,p,q` from the exact row support, and a kernel-checked rational
Euclidean projection realizes its first arm.  A closing proof must therefore
visibly use omitted global cap/MEC/critical-fiber/minimality information.

## Architecture consequence

Do not patch the seven source bodies with another adapter layer.  The reusable
closing theorem is already present; the missing object is the aggregate
producer from the full large-opposite-caps parent.

The preferred route remains:

```text
full two-large-cap parent
  + retained L/R/F Euclidean-MEC-critical-fiber-minimality data
  -> SameCapDangerousPairProducer (or direct False)
  -> outsidePair_unique_capCenter
  -> False before LIVE center enumeration.
```

Once that parent contradiction lands, the seven C leaves can be deleted or
retained as source-clean ex-falso compatibility wrappers.  The older generic
`UniformShellMetricCoverage` suggestion should not be revived: the later
positive circular-split counterfamily refutes the corresponding uniform
aggregate/Kalmanson route from even cardinality 12 onward.

## Validation

Run from `lean/`:

```text
lake env lean ../scratch/atail-force/live-c-source-closer/Boundary.lean
```

The file elaborates with no errors or warnings.  Each of the five printed
declarations has axiom closure exactly:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorry`, `admit`, `native_decide`, or custom axiom in the file.

