# Rigid221 S0 coupled-two-row exact polynomial model

**Base HEAD:** `f26de746bc16d15d891c42ad8cfb42876a63ab06`
**Arithmetic:** exact rational arithmetic; no tolerance and no nonlinear solver

## Exact target

Determine whether the displayed prior single-row seed and its known opposite
row extension reach the source L1 S0-I or S0-N packet, or identify the first
source field that they cannot supply.

## Intended source-faithful L1 model

For every modeled role `p`, use coordinates `(pₓ,pᵧ)`. Define

```text
d²(c,p) = (pₓ-cₓ)² + (pᵧ-cᵧ)²
orient(a,b,p) = (bₓ-aₓ)(pᵧ-aᵧ) - (bᵧ-aᵧ)(pₓ-aₓ).
```

After a valid Euclidean scaling-and-isometry normalization, the physical center
and radius may be fixed to `O=(0,0)` and `rho=1`. The exact physical fiber requires

```text
d²(O,p)=1  for p∈{u,xu,delta,v,xv},
d²(O,z)≠1  for every modeled z∈A\C.
```

The actual rows require positive variables `ru²,rv²` and complete ambient
fibers

```text
d²(cu,p)=ru²  exactly for p∈Ku={u,xu,au,bu},
d²(cv,p)=rv²  exactly for p∈Kv={v,xv,av,bv}.
```

For a closed finite carrier, singleton blocking is checked without a tolerance:
after deleting `u`, every positive value in `{d²(cu,z) : z∈A\{u}}` has
multiplicity at most three. After deleting `v`, the corresponding assertion is
checked at `cv`.

For a proposed injective CCW enumeration `p₀,…,pₙ₋₁`, strict convexity is the
complete family

```text
orient(pᵢ,pᵢ₊₁,pⱼ)>0
```

for every nonincident `pⱼ`, with indices read cyclically. Consecutive triples
alone are insufficient.

For Moser vertices `(m1,m2,O)`, MEC center `m`, and squared radius `R²`, the
source packet requires all carrier points in the closed disk, all three Moser
vertices on its boundary, three nonnegative angle dot products, the exact
closed `OnArcOpposite` cap filters, and a cap selected by `surplusIdx` with
cardinality greater than four. `J` is the cap at `oppIndex2 surplusIdx` after
erasing its two Moser endpoints.

## Exact replay of the prior coordinate seed

**EMPIRICALLY VERIFIED (finite exact replay).** The known opposite-row
extension has exact fibers

```text
d²(O,C)=1,
d²(cu,Ku)=17/25,
d²(cv,Kv)=53649709/67240000.
```

Its 120 edge/nonincident orientations are positive, with minimum

```text
orient(v,delta,u)=2/5525.
```

After deleting the corresponding source, the maximum positive-distance
multiplicity at each actual row center is three. Thus the added row `Kv` causes
no contradiction in this closed row core.

## Exact MEC obstruction for the prior seed

Let

```text
v  = (8/17,-15/17),
xv = (228/397,325/397).
```

Their midpoint and quarter squared separation are

```text
m  = (v+xv)/2 = (3526/6749,-215/6749),
R² = d²(v,xv)/4 = 4900/6749.
```

**EMPIRICALLY VERIFIED (finite exact replay).** The independent verifier checks
`R²-d²(m,p)>0` for every other role in
both the nine-role seed and the twelve-role coupled extension. Equality holds
only for `v` and `xv`.

**PROVEN (pen-and-paper, conditional on the replayed arithmetic).** Every disk
containing `v` and `xv` has radius at least `dist(v,xv)/2` by the triangle
inequality. The displayed midpoint disk has that radius and contains the entire
listed carrier. It is therefore a minimum enclosing disk, with carrier boundary
exactly `{v,xv}`.

**PROVEN (pen-and-paper).** `SurplusCapPacket.hCirc` requires three
pairwise-distinct MEC-boundary Moser vertices. The prior carrier has only the
two boundary roles certified above and cannot supply that field. Its manually
named wedge cannot be interpreted as the source cap `J`, and it decides neither
S0-I nor S0-N.

## Completion matrix

| Obligation | Statement | Label | Status | Evidence |
|---|---|---|---|---|
| M1 | The displayed twelve-role coordinates satisfy the closed row equations, convexity checks, and deletion multiplicity bounds. | EMPIRICALLY VERIFIED | 🟡 partial | Exact producer plus independent exact verifier. |
| M2 | The displayed midpoint disk encloses every listed role with boundary `{v,xv}`. | EMPIRICALLY VERIFIED | 🟡 partial | Exact rational slack inventory. |
| M3 | M2 forces the listed carriers into the MEC diameter branch and excludes `SurplusCapPacket.hCirc`. | PROVEN (pen-and-paper) | ✅ done | Radius lower bound and the source field requiring three distinct boundary vertices. |
| M4 | Some different coordinate family supplies the source cap and decides S0-I or S0-N. | CONJECTURED | ⬜ open | No source-valid witness has been produced. |

The finite seed rejection is **EMPIRICALLY VERIFIED** because its arithmetic
premise is externally replayed. It is not an impossibility result for all L1
coordinates. A source-faithful search still needs a different coordinate family
with three distinct non-obtuse MEC-boundary vertices and the required rotated
surplus-cap pattern.
