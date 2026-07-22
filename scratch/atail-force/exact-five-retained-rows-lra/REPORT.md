# Exact-five retained-row geometry audit

Date: 2026-07-21

## Result

**NO at the full triangle + strict-Kalmanson distance boundary.**  The
asymmetric `SourceTwoHitNormalForm`, the retained first/second-apex rows
`B₁,B₂`, their sharp physical endpoint distribution, the exact-five class,
the strict-middle/strict-obtuse conclusion, and the frontier first-apex class
do not force

```text
dist O₁ outside₁ = dist O₁ outside₂
```

and do not force a second center in the closed physical cap through the
outside pair.

This is an exact rational countermodel to that **linear ordered-distance
implication**, not a planar Euclidean realization and not a Problem-97
counterexample.  It satisfies every strict triangle inequality and both
strict convex-quadrilateral/Kalmanson inequalities for every cyclic
quadruple.  Therefore another argument using only those inequalities and the
displayed row equalities cannot close the asymmetric leaf.

The first missing source-level premise remains a positive cross-row return:

```lean
N.outside₁ ∈ R.common.packet.B₁ ∧
N.outside₂ ∈ R.common.packet.B₁
```

or, more generally, a complete actual row at a distinct center of the same
physical cap containing both outside points.  A successful producer must use
information absent from the countermodel: rank-two planar Euclidean
realizability, the actual MEC/nonobtuse support semantics and `noM44`, or a
genuinely global all-center K4/total-critical-system coupling.

## Theorem-bank and indexed-corpus preflight

The required registries were searched before testing a new implication:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- indexed Lean searches for the asymmetric outside pair, retained apex rows,
  common convex order, Kalmanson closure, and same-cap second centers.

No hidden producer was found.  The nearest current declarations are:

1. `SourceTwoHitNormalForm.false_of_firstApex_coRadial`, which is the terminal
   after the equality has already been produced;
2. `CapSelectedRowCounting.outsidePair_unique_capCenter`, which refutes a
   genuinely distinct same-cap center after the second equality has already
   been produced;
3. `parentSecondRow_subset_physicalClass`,
   `two_le_physicalVertices_inter_parentSecondRow_card`, and
   `physicalVertices_inter_parentFirstRow_card_le_one`; and
4. the parent endpoint/bridge fields in
   `FrontierBiApexRobustExactFiveMutualParentResidual`.

None mentions either outside point.

## Exact source theorem chain

Let `P = physicalVertices profile`, let `O₁=S.oppApex1`, and let
`O₂=S.oppApex2`.

From `N : SourceTwoHitNormalForm ...`:

- the actual source row is centered at `N.target`;
- its physical-cap intersection is exactly
  `{N.source, N.third}`;
- its outside-cap complement is exactly the distinct pair
  `{N.outside₁,N.outside₂}`; and
- all four points are co-radial from `N.target`.

From `ExactFiveGlobalCoverStarGeometry`:

- the target/hub lies strictly between source and third in the physical cap;
- `N.third` is the other spoke in the aligned asymmetric star arm; and
- `SourceTwoHitNormalForm.blocker_inner_neg` makes the angle at the hub
  strictly obtuse.

From the retained parent rows:

```text
B₂ ⊆ SelectedClass A O₂ profile.radius
2 ≤ |P ∩ B₂|
|P ∩ B₁| ≤ 1
∃ x : P, x ∈ B₂ \ B₁
```

The mutual-parent packet additionally says that at least one pair endpoint
lies in `B₂`, at least one lies outside `B₁`, and records the exact
four-way endpoint distribution.  These are all incidences among physical
vertices.  They do not put `N.outside₁` or `N.outside₂` into either
retained row.

If both outside points were in `B₁`, the requested equality would be
immediate:

```lean
(R.common.packet.row₁.same_radius N.outside₁ hu).trans
  (R.common.packet.row₁.same_radius N.outside₂ hv).symm
```

That exact membership pair is unavailable.

## Exact rational ordered-distance countermodel

Use the following cyclic order:

```text
O₂, f1, c1a, u, c1b, V, s, h, t, O₁,
v, f2, b1a, b1b, b1c, z.
```

The three displayed closed caps for support vertices `O₂,V,O₁` are:

```text
C₁ = {O₂,f1,c1a,u,c1b,V}                     card 6
C₂ = {V,s,h,t,O₁}                          card 5
C₀ = {O₁,v,f2,b1a,b1b,b1c,z,O₂}       card 8
```

Thus the strict physical set is `P={s,h,t}` and the cap counts meet the live
`6/5/>4` lower bounds.

The exact distance classes used by the row roles are:

| center | radius | complete class or selected support | role |
| --- | ---: | --- | --- |
| `O₂` | `167` | exact class `{V,s,h,t,O₁}` | exact-five profile |
| `O₂` | `167` | selected `B₂={V,s,h,t}` | retained second row after deleting `q=f1` |
| `O₁` | `113` | exact class `{f1,u,t,z}` | frontier class, with `q=f1`, `w=t` |
| `O₁` | `127` | exact class `B₁={c1a,c1b,s,f2}` | retained first row, surviving deletion of both `q,w` |
| `h` | `76` | exact class `{s,t,u,v}` | asymmetric source row |
| `f1` | `111` | exact class `{O₂,h,f2,b1a}` | one-physical-hit actual row at the hub |
| `c1a` | `71` | exact class `{f1,u,v,b1b}` | an actual critical row for `q`, with blocker distinct from both apices |

The retained rows have

```text
B₁ ∩ B₂ = {s}.
```

For the asymmetric pair `source=s`, `target=h`, this realizes the sharp
endpoint distribution

```text
s ∈ B₁ ∩ B₂,
h ∈ B₂ \ B₁,
```

and the parent bridge can choose `h` (or `t`).  The two selected supports omit
`q=f1`, their centers are distinct, and their overlap has cardinality one.
The `O₁` row of radius `127` also witnesses the retained double deletion
of `q=f1,w=t`.

The asymmetric row has

```text
d(h,s)=d(h,t)=d(h,u)=d(h,v)=76,
d(s,t)=229/2.
```

In particular,

```text
(229/2)^2 > 76^2 + 76^2,
```

so the strict-obtuse conclusion at `h` is retained, not merely the row
equality.

Nevertheless the desired first-apex equality fails sharply:

```text
d(O₁,u)=113,
d(O₁,v)=64.
```

Every other vertex of the closed physical cap also distinguishes the pair:

| physical-cap center | `d(center,u)` | `d(center,v)` |
| --- | ---: | ---: |
| `V` | `48` | `88` |
| `s` | `51` | `82` |
| `h` | `76` | `76` |
| `t` | `110` | `70` |
| `O₁` | `113` | `64` |

Hence `h` is the only recorded physical-cap center through `{u,v}`.  The
model even has a second exact row through `{u,v}`, namely the `q`-critical row
centered at `c1a`, but `c1a∈C₁\C₂`; this illustrates why a bare second
center is insufficient without same-cap localization.

## Exhaustive checks and trust boundary

The replay program is `search_exact5_retained_rows_lra.py`. Run it from the
repository root with:

```bash
UV_CACHE_DIR=.uv-cache uv run --no-project \
  scratch/atail-force/exact-five-retained-rows-lra/search_exact5_retained_rows_lra.py
```

It:

1. uses Z3 `QF_LRA` with a 60-second cap to obtain a rational assignment;
2. independently converts every distance to `Fraction` and substitutes it
   back into the original constraints;
3. checks all `1680` normalized strict triangle inequalities;
4. checks all `3640` normalized strict Kalmanson inequalities;
5. checks every displayed exact class, row equality, endpoint incidence,
   strict-obtuse strengthening, and terminal negation; and
6. includes a known-good square smoke test plus a deliberately bad diagonal
   assignment that the smoke predicate rejects.

The current run reports:

```text
sat
PASS: exact rational model independently replayed
```

Status: **EMPIRICALLY VERIFIED EXACTLY WITHIN THE QF_LRA
TRIANGLE/KALMANSON ABSTRACTION.**  This does not assert a rank-two Euclidean
embedding, an MEC disk, a total critical system, all-center K4, minimality, or
`noM44`.  Those omitted nonlinear/global fields are precisely what a closing
producer must now use.

## First missing premise

The smallest direct producer is still

```lean
dist S.oppApex1 N.outside₁ = dist S.oppApex1 N.outside₂
```

which feeds `N.false_of_firstApex_coRadial`.

The smallest row-level strengthening is

```lean
N.outside₁ ∈ R.common.packet.B₁ ∧
N.outside₂ ∈ R.common.packet.B₁.
```

The more flexible same-cap version is

```lean
∃ source hsource,
  let c := H.centerAt source hsource
  c ∈ S.capByIndex S.oppIndex2 ∧
  c ≠ N.target.1 ∧
  N.outside₁ ∈ (H.selectedAt source hsource).toCriticalFourShell.support ∧
  N.outside₂ ∈ (H.selectedAt source hsource).toCriticalFourShell.support.
```

That feeds the existing same-cap uniqueness consumer.  Neither output follows
from the retained rows plus full triangle/Kalmanson closure.  The next proof
attempt should therefore not add more linear Kalmanson consequences; it must
derive one of these positive occurrences from planar/MEC/global critical
geometry.
