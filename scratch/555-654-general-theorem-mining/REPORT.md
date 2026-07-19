# General-theorem mining of the live 555/654 core bank

Date: 2026-07-17

## Correction: the `/opt/nfs` geometry ledger contains a universal bank motif

The later files `/opt/nfs/possible-new-geometry.md` and
`/opt/nfs/verified-results.md` materially supersede the initial theorem-bank
pass below.  In particular, Lemma 81 of `verified-results.md`
(`front-before-isosceles obstruction`) is the following ambient-cardinality
independent statement:

> Distinct strict-convex polygon vertices cannot occur in cyclic order
> `W,F,P,X,Z` with `WF = WX = WZ` and `PZ = XZ`.

On the live 230-core snapshot

```text
sha256  42101d8be2abfd5692b1076301a8d48580ab6dbad38fbd6024da4b54e1b24004

unit-core-555         89
forced-pair-core-555  17
unit-core-654         48
forced-pair-core-654  76
```

this single five-point statement matches **230/230 cores**.  A second matcher,
independent of the general equality-closure assignment pass, finds a literal
two-row witness in every core: one stored row centered at `W` contains
`F,X,Z`, and one stored row centered at `Z` contains `P,X`.  Thus the result
does not depend on a long transitive equality path or on the designated
forced-pair inequality.

For example, `unit-core-555-01` has

```text
(W,F,P,X,Z) = (9,10,1,3,0)
row 9 contains {10,3,0}
row 0 contains {1,3}
```

and the 555 boundary order, read cyclically from `W=9`, contains
`9,10,...,1,3,...,0`.

The exact audit is implemented in
`mine_opt_nfs_geometry.py`.  It also finds full-bank matches for Lemma 113(1),
Lemma 113(2), and Lemma 120(a), but Lemma 81 is the smallest and has the
cleanest literal two-row interface.  Indexed Lean-corpus searches did not
return an existing theorem with this exact statement.

This is a substantial simplification of the **555/654 bank proof surface**:
one new generic order theorem plus generated two-row adapters can replace the
per-core algebraic certificates for every currently stored core.  It is not,
by itself, a live `sorry` closure.  The existing source-map gate remains: no
current theorem proves that an arbitrary live `FaithfulCarrierPattern` branch
produces one of these fixed 555/654 cores.  The `/opt/nfs` ledger itself also
keeps the global target open at O17 after reducing the scoped six-center list
to two `000111` records.

Accordingly, the formalization priority changes to:

1. **Completed:** Lemma 81 is the generic, kernel-checked
   `FivePointCircleIsoscelesOrderCore`, with the literal convex-order theorem
   `FivePointCircleIsoscelesOrderBridge.false_of_core_of_ccw`;
2. **Completed as exact finite evidence:** the generated JSON coverage artifact
   records and checks all 230 literal two-row role assignments; and
3. **Still open:** use the completed bank as a consumer by proving that the live
   branch produces one of the fixed cores. The source/coverage theorem remains
   the actual closure blocker.

The production consumer is now a disjunct of both
`GeneralCarrierBridge.MetricCoreAlternative` and
`GeneralCarrierBridge.ShellMetricCoreAlternative`. The concise result and its
source-map limitation are recorded here. Run `mine_opt_nfs_geometry.py` with
`--lemma81-only` to reproduce the full 230-core role map; the script fails if
any live bank core lacks a direct two-row witness.

The remainder of this report records the earlier scan of already-formalized
Lean cores on its pinned 227-core snapshot.  Its counts remain historical
evidence, but it is no longer the strongest reusable layer found.

## Result

The strongest reusable layer in the current bank is not equality-only.  It is
cyclic-order-sensitive geometry.

On the pinned 227-core snapshot below, four existing ambient-label-type Lean
core theorems have 83 exact structural matches covering 77 distinct cores:

| General core theorem | Matches | Distinct family coverage |
|---|---:|---|
| `FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg` | 68 | 28 unit-555, 2 forced-pair-555, 5 unit-654, 33 forced-pair-654 |
| `SixPointTwoCircleArcOvertakeOrderCore.false_of_core_of_neg` | 10 | 9 unit-555, 1 forced-pair-654 |
| `NestedEqualChordCore.false_of_core_of_neg` | 4 | 2 unit-555, 2 forced-pair-555 |
| `SixPointTwoCircleOrderCore.false_of_core_of_neg` | 1 | 1 forced-pair-654 |

There are six overlaps between rows of the table.  The union is:

- 39/106 profile-555 cores (36.8%);
- 38/121 profile-654 cores (31.4%); and
- 77/227 cores overall (33.9%).

This is the highest-leverage theorem reuse found.  The four theorems are
independent of ambient cardinality and consume only `RowPattern` equality
closure, injective realization, and strict orientation facts.  They do not use
the designated forced pair or any exact-off-circle hypothesis.

## Pinned evidence surface

The miner evaluated an in-memory byte snapshot of
`scratch/atail-force/unique-row-producer/card_five_interior_shadow_search.py`:

```text
sha256  b601e99f48d0735e2fd36970f6148ee093611656fd53aa898f44e07281e4812c
cores   227

unit-core-555         89
forced-pair-core-555  17
unit-core-654         47
forced-pair-core-654  74
```

The source hash was unchanged when the full pass completed.  The byte-snapshot
loader prevents a concurrently appended live bank from producing a mixed
census.

The profile cyclic orders used by the match were exactly those returned by the
finite-shadow frame:

```text
555: 0,9,10,11,1,3,4,5,2,6,7,8
654: 0,10,11,1,3,4,5,6,2,7,8,9
```

For each retained row system, the miner computes the complete transitive
`EdgeClosure`, exhaustively assigns theorem roles subject to the theorem's
inequalities, and checks every required negative signed-area triple against
the cyclic order.  A synthetic self-test reconstructs every parsed equality
schema from its own fields before the bank pass.

This matching is exact within the finite row-and-order model.  The finite
shadow remains theorem-discovery evidence: production use still has to obtain
the banked row memberships and boundary order from a real
`FaithfulCarrierPattern` branch.

## The four general statements

### 1. Two-circle same-side reflection: 68 cores

If `u ≠ y`,

```text
d(q,u) = d(q,y)
d(u,v) = d(y,v),
```

then `u` and `y` are the two possible intersections of circles centered at
`q` and `v`.  They cannot both lie on the same strict side of the line through
`q,v`.  The Lean core states the two distance equalities as arbitrary
`EdgeClosure` witnesses, so the equalities may be chained through any number
of rows.

Example match:

```text
unit-core-555-01: q=3, v=8, u=10, y=9
```

This example matters for routing: label `q=3` is not even a retained row
center.  Therefore the existing direct-three-row theorem in
`FourPointTwoCircleBisectorOrderBridge.lean` does not express all 68 matches.
The general core theorem does; a generated closure-path adapter is needed.

Exact matches by family:

```text
unit-555:
01 02 06 07 31 33 42 43 46 47 48 49 50 58 60 67 69 71 72 77
82 83 84 85 86 87 88 89

forced-pair-555:
12 17

unit-654:
08 11 35 38 46

forced-pair-654:
01 02 10 12 14 16 17 18 24 25 29 34 39 40 41 43 46 48 49 52
54 55 56 57 58 59 60 64 65 68 69 70 71
```

### 2. Six-point arc overtake: 10 cores

The theorem uses

```text
OA = OC = AC = OD = OE
DA = DE = DF
```

together with the six orientation signs supplied by cyclic order
`O,A,D,E,F,C`.  Those data force an impossible two-circle arc overtake.

Example match:

```text
unit-core-555-10: O=2, A=0, C=1, D=9, E=10, F=11
```

Exact matches:

```text
unit-core-555-10, unit-core-555-11, unit-core-555-13,
unit-core-555-31, unit-core-555-60, unit-core-555-61,
unit-core-555-62, unit-core-555-86, unit-core-555-88,
forced-pair-core-654-10
```

As above, the existing `SixPointTwoCircleArcOvertakeCarrierBridge` is a useful
direct-three-row specialization but is narrower than the transitive-closure
matches mined here.

### 3. Nested equal chords: 4 cores

The theorem consumes

```text
oa = ob = oc = od = ad = bc
```

and the four signs forced by cyclic order `o,a,b,c,d`.  Two radius-length
chords cannot be properly nested in that order.

Example match:

```text
unit-core-555-09: o=2, a=0, b=9, c=10, d=1
```

Exact matches:

```text
unit-core-555-09, unit-core-555-14,
forced-pair-core-555-01, forced-pair-core-555-04
```

### 4. Six-point two-circle order: 1 core

The theorem consumes

```text
AB = AC = AD = BC
CD = CP
DA = DQ
```

and seven signs forced by cyclic order `A,P,Q,B,D,C`.

The exact match is:

```text
forced-pair-core-654-54: A=2, P=7, Q=8, B=0, D=10, C=11
```

## Lean status and import boundary

All four theorem source files contain complete proof terms and no
`sorry`/`admit` tokens.  No Lean build was run in this pass, so this report
does not claim a fresh kernel check.

- `FourPointTwoCircleBisectorOrderCore` and
  `SixPointTwoCircleArcOvertakeOrderCore` are imported by their existing
  carrier-bridge modules.
- `NestedEqualChordCore` and `SixPointTwoCircleOrderCore` currently have no
  importer under `lean/`; they are source-clean but not import-reachable from
  the production target.
- None of the four is currently a disjunct of
  `GeneralCarrierBridge.MetricCoreAlternative`.

The latter is the actionable integration gap.  The already-public core
consumers are broad enough; what is missing is a common public adapter from
boundary cyclic indices plus generated `EdgeClosure` paths.

## Secondary theorem layer: certificate-active kernels

The 49 independently replayed certificate-active 654 kernels from
`core_data_pattern_mining.json` were also embedded into the live snapshot.
There are 16 embeddings from 13 named kernels, covering 14 live cores:

```text
unit-core-654-03, unit-core-654-16, unit-core-654-18,
unit-core-654-19, unit-core-654-20, unit-core-654-21,
unit-core-654-22, unit-core-654-23, unit-core-654-24,
unit-core-654-25, unit-core-654-26, unit-core-654-36,
forced-pair-core-654-01, forced-pair-core-654-05
```

The reused source kernels are:

```text
source-indexed-unit-core-654-{07,08,10,11,12,21,41,43,45,47,48,49,53}
```

Kernels 07 and 08 are relabel-equivalent, so this is 12 distinct schema
orbits.  There are no such hits in profile 555.  Only
`forced-pair-core-654-01` overlaps the 77-core order-theorem union, so the two
layers prospectively cover 90 distinct cores and leave 137.

Two especially useful facts are:

- the five-row, nine-equality source kernel 12 embeds in
  `forced-pair-core-654-01`; and
- the six-row, thirteen-equality source kernel 21 embeds in
  `forced-pair-core-654-05`.

Thus those two retained forced-pair cores already contain pure unit-ideal
contradictions; their designated Rabinowitsch pair is not mathematically
needed after the smaller kernel is transported.

This layer is certificate-backed rather than Lean-generalized.  The rational
identities were independently replayed, but there is not yet a generic
arbitrary-label Lean wrapper for these Fin-12 row embeddings.

The reusable infrastructure theorem suggested by this bank is therefore:

> A `Fin n` (or at least Fin-12) row-certificate soundness and support-embedding
> theorem, parameterized by the two normalization anchors and optional
> Rabinowitsch pairs, transporting a checked unit-ideal certificate through an
> injective relabeling into any `Realizes` row pattern.

The pieces already exist but do not meet at the required type:

- `Census554.CertCheck.isDead_of_checkCert` is checker-sound but fixed to
  `Fin 11` and its fixed coordinate environment;
- `Census554.motif_transfer_of_supportInjOn` transports a dead motif, also on
  `Fin 11`; and
- `U5GramCert.false_of_unitIdealCertChecker{Normalized}` is generic algebraic
  soundness for a supplied real valuation, but does not build the geometric
  facts from a Fin-12 `Realizes` pattern.

Generalizing that seam is higher leverage than adding one theorem per
certificate core.  It is the fallback for the 137 cores not covered by either
mined layer, and it also handles forced-pair certificates when the optional
Rabinowitsch facts are present.

## Negative results and one correction

These searches did not produce additional theorem reuse:

1. **Pure equality cores:** exhaustive matching against 23 existing
   equality-only `EdgeClosure` schemas found zero matches in all 227 cores.
2. **Other order cores:** `ConvexFivePointCore`, `ConvexRhombusCore`,
   `FiveRowCircleIntersectionOrderCore`, `SixPointCircleChainOrderCore`, and
   `SixPointNestedCenterOrderCore` found zero matches.
3. **Current full-core containment:** among 136 unit cores there are 48
   embedding edges, all mutual relabel-equivalences.  There are zero strict
   embeddings into another unit or forced-pair core.  Full retained cores do
   not yield smaller reusable theorem schemas.
4. **Sibling U5 theorem bank:** 106 supported incidence patterns and eight
   metric patterns were checked fail-closed against the 69 retained cores
   which still contain the exact pinned card-five row.  There were zero hits.
   Eight incidence declarations were unsupported by the matcher and were not
   counted as misses; metric support was complete.
5. **Other archived registries:** the sibling, legacy `erdos/97`, and older
   `erdos-general-theorem/97` censuses contain no exact `RowPattern`/`Realizes`
   or certificate-transport match for these Fin-12 cores.  Indexed
   `nthdegree docs search --lean` queries for the small 654 kernels likewise
   returned the general equality-core bank, not an exact existing wrapper.

The equality-only pass does **not** reproduce the earlier claim in
`loop_generalization_findings_2026-07-16.md` that the active kernels of
`unit-core-654-16` and `unit-core-654-18` directly instantiate
`SixPointCircleChainCollisionCore`.  Their shared five-row/nine-generator
kernel is still independently certificate-proved and the two are still
relabel-equivalent.  What fails is the stronger wrapper claim: exhaustive
role assignment, allowing every role coincidence permitted by the Lean
structure, cannot satisfy the nine required `EdgeClosure` fields of
`SixPointCircleChainCollisionCore`.  A new generic certificate lemma could
prove the same algebraic contradiction, but the existing circle-chain
constructor is not a direct route.

## Recommended formalization order

1. Add the four hit core families to a production-imported order alternative
   (either extend `MetricCoreAlternative` or introduce a sibling alternative)
   and its contradiction consumer.
2. Publicize one cyclic-index-to-negative-orientation lemma and define an
   adapter which accepts arbitrary `EdgeClosure` witnesses.  Do not restrict
   it to the direct three-row layouts of the two existing bridge modules.
3. Extend the miner with Lean emission of the role assignment and explicit
   reflexive/symmetric/transitive row-closure paths.  This turns the 77
   structural matches into auditable fixed-pattern consumers without new
   geometry proofs.
4. Then generalize the certificate checker/transport seam to Fin-12 or
   `Fin n`, and emit the 12 certificate-active schema-orbit wrappers before
   tackling the remaining certificates one by one.

This theorem work is a consumer layer.  It can sharply compress the residual
case bank, but it does not by itself prove the still-open general producer
which must force one of these row-and-order alternatives from the live A-tail
hypotheses.

## Reproduction

Run the owned miner from the repository root:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run python \
  scratch/555-654-general-theorem-mining/mine_existing_equality_cores.py \
  --brief
```

Use `--full` for every role assignment, or `--core <exact-core-id>` for the
equality and order witnesses of one retained core.
