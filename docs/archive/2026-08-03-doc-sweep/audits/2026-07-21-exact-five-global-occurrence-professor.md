# Exact-five global occurrence audit — 2026-07-21

## Answer

No proof was found that the full exact-five parent data force either an
existing terminal occurrence or an alternative `(m,4,4)` support triangle.
In particular, this audit does **not** close a source `sorry`.

The strongest new conclusion is structural.  Production now supplies a
distinct physical pair with a carrier-wide deletion cover.  For the fixed
critical system, no actual critical support can contain both endpoints.  On
the all-one-hit arm, the three physical sources and their actual blocker
centers additionally form a source-faithful five-center deletion matrix:
deleting a physical source kills K4 at its own blocker, but preserves K4 at
both robust apices and at the other two physical blockers.  These statements
are stronger than the previously isolated four-center packets, but the
current theorem bank has no terminal consuming them without an additional
positive row incidence.

The requested output disjunctions are also not weaker intermediate targets.
Given the existing consumers, either one is logically equivalent to `False` on
its respective normalized branch.

## Epistemic status

| Claim | Status |
| --- | --- |
| A critical blocker has one K4-capable positive radius and its complete class has exactly four points | **PROVEN** |
| A distinct physical pair globally covers all carrier centers by its two singleton-deletion witnesses | **PROVEN IN PRODUCTION LEAN** |
| The three-vertex cover graph has a two-edge star, and its hub row is one-hit | **PROVEN IN PRODUCTION LEAN** |
| No fixed-system actual critical support contains both endpoints of that global-cover pair | **PROVEN IN PRODUCTION LEAN** |
| The all-one-hit arm supplies the five-center diagonal deletion matrix below | **PROVEN** from existing declarations |
| Blocker multiplicity forces either two nontrivial fibers or a fiber with at least three sources; in the latter case at least two sources are nonphysical | **PROVEN** |
| The normalized all-one-hit incidence facts alone force a closing core | **DISPROVEN** by an explicit abstract set system |
| Full Euclidean/MEC parent data force an asymmetric first-apex co-radial pair, a `CriticalFiberClosingCore`, or a new `(m,4,4)` triangle | **CONJECTURED** |
| Existing rational finite models obstruct geometry-free occurrence claims | **EMPIRICALLY VERIFIED** exactly within those finite metric models, not as Euclidean counterexamples |
| The best next search surface is the complete five-center deletion matrix coupled to boundary order, MEC data, and `noM44` | **HEURISTIC** |

## 1. Critical-blocker radius rigidity

Let `s` be a source, let `c = H.centerAt s`, and let `K` be the complete
critical shell selected by `H` at `s`.  Any positive-radius class at `c` with
at least four carrier points must contain `s`; otherwise it survives deletion
of `s`, contradicting criticality at `c`.  Its radius is therefore
`dist c s = K.radius`.  It cannot contain five points, because deleting `s`
would again leave four points at that radius.  Hence:

1. `K.radius` is the unique K4-capable positive radius at `c`;
2. its complete ambient class is exactly four points; and
3. every member of that exact class could use `c` as a latent critical blocker
   under a reselected critical system.

This fact is already represented in the scratch theorem bank.  It does not by
itself create a distinct second center: reselecting the same center for another
member merely reproduces the same complete shell.

## 2. The carrier-wide favorable pair

Production `ExactFiveGlobalCrossDeletionPair.lean` now proves

```lean
exists_distinct_physicalPair_globalDeletionCover
```

and packages its output as `PhysicalGlobalCrossDeletionPair profile`.  Thus
there are distinct physical vertices `q,w` such that, for every carrier center
`c`, K4 survives deletion of `q` at `c` or survives deletion of `w` at `c`.
The production method

```lean
PhysicalGlobalCrossDeletionPair.toMutualOmissionPair
```

specializes this cover at the actual blockers of `q` and `w`, obtaining their
mutual omission.

There is a useful stronger reformulation.  For every source `s`, the complete
critical support at `H.centerAt s` omits `q` or omits `w`.  Indeed, if it
contained both, critical-radius rigidity (equivalently the existing
cross-deletion iff theorem) would make both singleton deletions fail at that
center, contradicting the global cover.  Therefore

```text
∀ s ∈ A, ¬ (q ∈ support(H,s) ∧ w ∈ support(H,s)).
```

This is a global negative incidence theorem.  It does not produce a row
containing a requested pair, a second center through a repeated fiber, or a
first-apex distance equality.  At the three physical blocker centers on the
all-one-hit arm it is already implied by the one-hit equations.  At
nonphysical blocker centers it adds a genuine restriction, but still only an
omission.

Production now strengthens this pair to a two-edge global-cover star.  Its hub
row is forced one-hit.  If either spoke row is two-hit, the asymmetric normal
form is oriented from that spoke toward the hub, so the resulting pair retains
the carrier-wide cover.  This repairs the earlier provenance loss, but does
not itself produce the positive outside-pair equality or alternative packet
needed by a terminal.

## 3. Asymmetric `SourceTwoHitNormalForm`

For

```lean
N : SourceTwoHitNormalForm ...
```

the actual source row is an exact four-point class centered at the physical
point `N.target`.  It meets the physical cap in exactly
`{N.source, N.third}` and has exactly the two distinct outside points
`N.outside₁`, `N.outside₂`.

The existing terminal

```lean
N.false_of_firstApex_coRadial
```

closes the branch from

```lean
dist S.oppApex1 N.outside₁ = dist S.oppApex1 N.outside₂
```

Equivalently, a genuinely distinct source-faithful center in the same physical
cap whose complete row contains both outside points would contradict the
existing same-cap uniqueness theorem.  Neither is supplied by `N`, the
retained apex rows, or critical-radius rigidity.  The latter only reproduces
the row at `N.target`.

The first source-level global return statement is therefore:

```lean
asymmetric_global_return
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R)
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius ...)
    (G : PhysicalGlobalCrossDeletionPair profile)
    (N : SourceTwoHitNormalForm ... ) :
    dist S.oppApex1 N.outside₁ = dist S.oppApex1 N.outside₂ ∨
      ∃ T : SurplusCapPacket D.A, T.IsM44
```

This statement is **CONJECTURED**.  It must use the global K4/minimality and
MEC/cap data; the normalized local geometry does not imply it.

Moreover, it is already contradiction-strength.  Its first disjunct is
refuted by `N.false_of_firstApex_coRadial`, and its second by `R.noM44`.
Conversely, `False` proves the disjunction.  Thus, under the displayed inputs,
`asymmetric_global_return` is logically equivalent to closing this normalized
branch.

If `N` is obtained without changing the favorable pair, the extra global
cover says that every carrier center survives at least one deletion of
`N.source` and `N.target`.  At the two endpoint blockers this is exactly the
already-recorded mutual omission.  At the actual blockers of
`N.outside₁`, `N.outside₂`, it only omits at least one favorable endpoint
from the corresponding row; it gives no incidence or distance equality
between the two outside points.  Hence it does not feed
`N.false_of_firstApex_coRadial`.

## 4. All-one-hit five-center deletion matrix

Assume

```lean
hall : AllPhysicalActualCriticalRowsOneHit ...
```

and enumerate the three physical sources as `p₀`, `p₁`, `p₂`.  Write
`cᵢ = H.centerAt pᵢ`; let `O₁`, `O₂` be the two robust apices.  Existing
declarations imply:

1. `O₁`, `O₂`, `c₀`, `c₁`, `c₂` are pairwise distinct.  The `cᵢ` are distinct
   by `hall.blockerCenters_injective`; bi-apex robustness excludes either apex
   as an actual blocker center.
2. Deleting `pᵢ` destroys K4 at `cᵢ`, by the criticality field
   `H.no_qfree_at`.
3. Deleting `pᵢ` preserves K4 at `O₁` and `O₂`, by the two robust-apex
   hypotheses.
4. If `j ≠ i`, then `pᵢ` is omitted from the complete critical row at `cⱼ`
   by the all-one-hit normal form.  The canonical cross-deletion equivalence
   therefore shows that deleting `pᵢ` preserves K4 at `cⱼ`.

So each of the three physical deletions is critical at its diagonal blocker
and robust at the other four distinguished centers:

| deleted source | fails at | survives at |
| --- | --- | --- |
| `p₀` | `c₀` | `O₁, O₂, c₁, c₂` |
| `p₁` | `c₁` | `O₁, O₂, c₀, c₂` |
| `p₂` | `c₂` | `O₁, O₂, c₀, c₁` |

This is **PROVEN** from the current source contracts.  It is more aggregate
than the existing one-deletion four-center packets.  However, none of the
banked terminal consumers turns this survival matrix into the positive
cross-row membership, repeated-fiber second center, first-apex equality, or
new MEC support packet that it needs.

For a favorable pair `q,w`, the carrier-wide cover also says that no actual
critical row anywhere contains both `q` and `w`.  This strengthens the table
by a universal pair-exclusion invariant, but it does not change any survival
entry at the three displayed physical blockers: all-one-hit already omits both
other physical sources there.

## 5. Consequence of blocker multiplicity

The all-one-hit condition makes the blocker map injective on the three physical
sources.  Combining this with the existing blocker-multiplicity alternative
gives:

- either there are two distinct nontrivial blocker fibers, each containing at
  most one physical source; or
- some blocker fiber contains at least three sources, and hence at least two
  of those sources lie outside the physical cap.

This is **PROVEN**, but it does not identify a second center through a fiber
pair, place the relevant points in a common cap, or produce the ordered
cross-membership required by `CriticalFiberClosingCore`.

## 6. Why the current normalized facts do not force the terminal

The all-one-hit marginal admits the following abstract set system.  Let

```text
P  = {p₀,p₁,p₂}
Kᵢ = {pᵢ} ∪ Xᵢ
```

where the three `Xᵢ` are pairwise disjoint three-element sets, and assign
distinct centers `cᵢ` to the `Kᵢ`.  Then each row has cardinality four,
`Kᵢ ∩ P = {pᵢ}`, the physical sources mutually omit one another, and the
blocker centers are injective.  There is no shared outside pair and no repeated
fiber among physical sources.

Therefore the normalized all-one-hit incidence facts alone cannot force a
closing core.  The example is only a logical obstruction to a marginal
set-theoretic derivation; it is not claimed to realize the full Euclidean
parent.

The new global-cover property also has an exact abstract critical-hypergraph
model.  Take the carrier to be `Z/13Z`, give center `c` the unique four-row

```text
R(c) = {c+1,c+2,c+3,c+4},
```

and set `H(s)=s-1`.  Every source lies in the unique exact row at its blocker,
so deletion of that source kills K4 there.  The chosen-row digraph is strongly
connected because every vertex points to its successor.  Put

```text
P = {0,4,8},     q = 0,     w = 4.
```

Then `R(H(p)) ∩ P = {p}` for every `p∈P`, and no row `R(c)` contains both
`0` and `4`.  In the unique-row deletion semantics this last fact is exactly
the carrier-wide cover: at every center, at least one of deleting `q` or
deleting `w` preserves its row.  The blocker map is bijective, so there is no
nontrivial critical fiber and hence no `CriticalFiberClosingCore`.

This is an **exact finite incidence/deletion countermodel** to deriving the
closing occurrence from `hall`, criticality, strong connectivity, and the new
global cover alone.  It is not a model of bi-apex robustness, Euclidean
distance, the MEC packet, or `noM44`; those are therefore necessarily
load-bearing in any successful theorem.

The corrected rational finite model bank similarly contains exact models with
global K4, a total deletion-critical map, and mutual omission while avoiding a
shared terminal pair.  That evidence is **EMPIRICALLY VERIFIED within the
encoded finite metric abstraction**, but it is not a Euclidean/convex/MEC
counterexample.  Conversely, the local Euclidean regressions realize the cap
and circle geometry but omit global all-center K4.  Together these results show
that a successful occurrence theorem must genuinely couple the two sides.

## 7. First missing all-one-hit implication

The exact existing terminal would be fed by:

```lean
allPhysicalOneHit_closingOccurrence
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R)
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius ...)
    (G : PhysicalGlobalCrossDeletionPair profile)
    (hall : AllPhysicalActualCriticalRowsOneHit ...) :
    Nonempty (CriticalFiberClosingCore R) ∨
      ∃ T : SurplusCapPacket D.A, T.IsM44
```

This statement is **CONJECTURED** and, like the asymmetric statement, is
equivalent to `False` under the same inputs: the first disjunct is consumed by
`false_of_criticalFiberClosingCore`, and the second contradicts `R.noM44`.

The first genuinely missing positive data inside the two constructors are:

- **same-cap constructor:** choose a nontrivial
  `FrontierCommonDeletionCriticalFiber`, then produce a genuinely distinct
  source-faithful second center whose actual selected row contains both fiber
  sources, together with a common cap containing the two centers and excluding
  the pair;
- **ordered constructor:** produce the cross membership `K ∈ E_{H(J)}`, the
  required first-apex equal-radius relation, and the compatible six-role cyclic
  order.

The repeated fiber must involve nonphysical sources: `hall` excludes a fiber
collision between two physical sources.

With the new favorable-pair theorem, the sharpest equivalent formulation is
to add its universal exclusion invariant as an input and prove that this
invariant is incompatible with the nonlinear MEC cap geometry and `noM44`, or
that it forces all fields of a closing-core constructor.  No current theorem
performs this negative-to-positive conversion.

## 8. Recommended next object

Do not add another bare deletion-survival adapter.  The next search or proof
attempt should retain, in one object:

1. the three boundary-ordered physical sources;
2. the five pairwise-distinct centers `O₁, O₂, c₀, c₁, c₂`;
3. each complete exact critical row and its full `no_qfree` property;
4. the full diagonal/cross-deletion matrix above;
5. the carrier-wide favorable-pair cover, equivalently universal exclusion of
   its two endpoints from every actual critical support;
6. the source-faithful robust apex rows after each physical deletion; and
7. the nonlinear MEC cap partition and `noM44` hypothesis.

The occurrence query should ask directly for either:

- all fields of one existing `CriticalFiberClosingCore` constructor; or
- two new MEC support vertices whose induced full cap partition contains the
  required two exact four caps.

Any abstraction dropping full deletion criticality, source provenance, or the
nonlinear MEC/`noM44` geometry is expected to reproduce already-known
survivors rather than decide the live branch.
