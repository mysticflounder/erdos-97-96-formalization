# Exact-11 V7 G3 U5 clause-consumer audit

Date: 2026-07-30

## Bottom line

The two general-\(n\), source-proved U5 kernels matching the generator families
already exist in the live tree:

- `Problem97.u5_nontriple_equilateral_on_p_circle_incompatibility`;
- `Problem97.u5_common_bisector_triple_incompatibility`.

They are the right terminal consumers.  They are already transitively
import-reachable from the V7 semantic stack.  What does **not** yet exist is
the atom-level adapter proving either G3 clause family from
`CanonicalPacket.sourceChoiceHolds`, `localEqHolds`, and
`qDeletedPairHolds`.  In particular, the only live occurrences of
`qDeletedPairHolds` and `localFourHolds` are their definitions and the
valuation cases in `FullRadiusSemantics.lean`; there is no downstream
consumer theorem.

Thus the first missing bridge is finite-decoder/geometry ingress, not a new
U5 incidence contradiction.

This was a read-only source audit apart from this requested scratch report.
No Lean build or fresh transitive axiom check was run.  The sibling bank
registry classifies both kernels as `source-proved` and `source_reachable`;
that status is not by itself a kernel-closure verdict.

## Exact existing consumers

Source:
`lean/Erdos9796Proof/P97/U5GlobalIncidenceKernels.lean`.

Direct imports:

```lean
import Erdos9796Proof.P97.U5GlobalIncidenceBasic
import Erdos9796Proof.P97.TwoCircleCrossing
```

### Family A: nontriple equilateral on the \(p\)-circle

```lean
theorem Problem97.u5_nontriple_equilateral_on_p_circle_incompatibility
    {D : CounterexampleData} {q p t x : ℝ²} {Bt Bx : Finset ℝ²}
    (ht_radius : dist p t = dist p q)
    (hx_off_circle : dist p x ≠ dist p q)
    (Kt : U5QDeletedK4Class D q t Bt)
    (Kx : U5QDeletedK4Class D q x Bx)
    (hpBt : p ∈ Bt) (hxBt : x ∈ Bt)
    (hpBx : p ∈ Bx) (htBx : t ∈ Bx) : False
```

Location: lines 112–136.

This exactly matches each compact generator clause.  For generator names
`deleted = q`, `center = p`, `member = t`, `off_circle = x`:

```text
[-choice,
 -qpair(q, t, p, x),
 -qpair(q, x, p, t)]
```

where the actual Python argument order is
`qpair(deleted, classCenter, first, second)`.  The first q-pair supplies a
q-deleted class centered at \(t\) containing \(p,x\); the second supplies one
centered at \(x\) containing \(p,t\).  The selected source row supplies
`ht_radius`, and exact-row exclusion supplies `hx_off_circle`.

The clause is generated in
`scratch/card11-exact5-common-fullradius-v6/probe.py`, lines 578–613, under
`v6-u5-nontriple-equilateral-incompatibilities`.

### Family B: common bisector triple

```lean
theorem Problem97.u5_common_bisector_triple_incompatibility
    {D : CounterexampleData} {q p x t1 t2 t3 : ℝ²} {Bx : Finset ℝ²}
    (hr_pos : 0 < dist p q)
    (hT_noncol : ¬ Collinear ℝ ({t1, t2, t3} : Set ℝ²))
    (ht1_radius : dist p t1 = dist p q)
    (ht2_radius : dist p t2 = dist p q)
    (ht3_radius : dist p t3 = dist p q)
    (Kx : U5QDeletedK4Class D q x Bx)
    (hpBx : p ∈ Bx) (ht1Bx : t1 ∈ Bx) (ht2Bx : t2 ∈ Bx)
    (ht3Bx : t3 ∈ Bx) : False
```

Location: lines 146–155 (proof continues below).

For one selected row \(R=\{q,t_1,t_2,t_3\}\) at \(p\), the generator clause is

```text
[-choice,
 -eq(x,p,t1),
 -eq(x,p,t2),
 -eq(x,p,t3)]
```

and is generated in `probe.py`, lines 615–647, under
`v6-u5-common-bisector-triple-incompatibilities`.

The three `localEqHolds ⟨x,p,ti⟩` atoms make
\(\{p,t_1,t_2,t_3\}\) a same-radius four-class at \(x\).  The selected
source row supplies the positive \(p\)-radius, the three \(p\)-radius
equalities, and distinct labels.  Existing
`Problem97.MEC.not_collinear_of_three_dist_eq`
(`Moser/NonDeg.lean`, lines 144–147) then supplies `hT_noncol`.

There is also a strictly smaller metric route for Family B:
`Problem97.eq_of_equidistant_three_noncollinear`
(`U5GlobalIncidenceBasic.lean`, lines 129–136) proves that the two centers
\(p,x\) are equal from their equality on the three noncollinear points,
contradicting the decoded fact \(x\ne p\).  That route avoids constructing
`U5QDeletedK4Class`; the named U5 theorem remains the exact theorem-bank
consumer and provenance match.

## Existing finite wrappers are not the smallest G3 adapter

`lean/Erdos9796Proof/P97/U5FiniteExtraction.lean` imports
`U5FiniteAudit`, `U5GlobalIncidenceKernels`, and
`U5GlobalIncidenceSupport`, and provides:

- `Problem97.U5AuditLabel.route_nontripleEquilateralOnPCircle`
  (line 513);
- `Problem97.U5AuditLabel.route_commonBisectorTriple`
  (line 567).

Both call the two kernels above.  They require the fixed eight-label
`U5AuditLabel.IndexPattern`, six already-materialized q-deleted classes, and
mask equalities.  G3 instead has eleven labels, one source-indexed selected
row, local equality atoms, and existential q-deleted-pair atoms.  Routing G3
through these wrappers would add an unnecessary relabeling/extraction layer.

## Smallest live V7 adapter

Fix a true source choice and abbreviate

```text
q := source
p := (sourceChoiceAt source choice).1
R := P.cube.cube p
```

The existing semantic chain already gives most source-row geometry:

1. `sourceChoiceHolds` says that `p = shadow.centerOf q` and the decoded row
   index is `P.baseIndex p.val`
   (`FullSourceChoiceSemantics.lean`, lines 331–341).
2. `shadow.source_mem_cube`, after rewriting, gives `q ∈ R`.
3. `sourceChoiceHolds_sourceCenterHolds` followed by
   `sourceCenterHolds_usedCenterHolds` gives `usedCenterHolds p`
   (`FullRadiusSemantics.lean`, lines 146–170).
4. `exactAt_usedCenter` gives
   `Census554.EqualityCore.ExactAt P.cube.cube L.pointOf p`
   (`FullRadiusSemantics.lean`, lines 75–83).
5. Membership in `R` gives the required same-\(p\)-radius equalities through
   `Card11SelectedCube.equidist_of_mem_cube`; exactness turns
   `x ∉ R` into the required off-radius inequality.

The missing reusable ingress should be split into two small adapters.

### A. Encoded q-deleted pair to a U5 class

A suitable theorem shape is:

```lean
theorem qDeletedPairHolds_to_u5QDeletedK4Class
    {D : CounterexampleData} ... (P : CanonicalPacket L)
    (i : Fin 3960)
    (h : P.qDeletedPairHolds (qDeletedPairRow i)) :
    ∃ B : Finset ℝ²,
      Nonempty (U5QDeletedK4Class D
        (L.pointOf (qDeletedPairRow i).deleted)
        (L.pointOf (qDeletedPairRow i).center) B) ∧
      L.pointOf (qDeletedPairRow i).first ∈ B ∧
      L.pointOf (qDeletedPairRow i).second ∈ B
```

with the ambient type specialized so that the labeling carrier is `D.A`.
Take `B` to be the image under `L.pointOf` of the witness
`candidate.support`.

The remaining proof obligations are mechanical decoder facts:

- every member of `encoderLocalFourRows` has a nodup support of length four;
- its center is not in its support;
- decoded q-pair labels are distinct and exclude `deleted` and `center`;
- `L.pointOf` is injective and every label lies in `D.A`;
- `localFourHolds` gives the common radius, whose positivity follows because
  the center is distinct from a support label.

`FullRadiusAtoms.lean` currently proves only the enumeration lengths
(`2310` and `3960`), not these shape lemmas.  Although the comment above
`localFourHolds` says the finite decoder proves length four, no corresponding
Lean theorem was found.

Applying this adapter twice, plus the source-row radius/off-radius facts above,
feeds Family A directly to
`u5_nontriple_equilateral_on_p_circle_incompatibility`.

### B. Three local equalities to the Family B contradiction

For the named U5 consumer, form

```text
Bx = {L.pointOf p, L.pointOf t1, L.pointOf t2, L.pointOf t3}
```

and use the three `localEqHolds ⟨x,p,ti⟩` atoms to construct
`U5QDeletedK4Class D (L.pointOf q) (L.pointOf x) Bx`.
Decoded row-shape facts and labeling injectivity supply cardinality,
q-freeness, center exclusion, and positivity.

The even smaller clause proof uses
`eq_of_equidistant_three_noncollinear` directly and needs only:

- the selected-row decoder facts
  \(R=\{q,t_1,t_2,t_3\}\), pairwise distinctness, and \(x\notin R\cup\{p\}\);
- the three selected-row radius equalities;
- the three local equality atoms.

No q-deleted-pair adapter is needed for Family B.

After either geometry adapter, clause satisfaction itself should be a thin
`simp`/`decide` wrapper around
`CanonicalPacket.fullRadiusValuation_encodeG3Var`.

## Import reachability

No new production import is required to see the two kernels from the current
V7 semantic stack.  The transitive path is:

```text
CanonicalPacket
  -> Census554.SeparationGeometry
  -> Census554.SeparationMirror
  -> Census554.SeparationCore
  -> Census554.EqualityCore
  -> U5GlobalIncidenceKernels
```

For a durable dedicated clause-family module, directly importing
`U5GlobalIncidenceKernels` would make the intended dependency explicit.

## Theorem-bank registry check

The mandated registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

The exhaustive sibling `p97-rvol` JSON contains both exact kernels, classifies
them as general-\(n\) `U5GlobalIncidence`, `source-proved`, and
`source_reachable`, and also records the two finite wrappers.  The concise
registry describes the larger 96-class-level U5 incidence bank but does not
name these declarations.  No exact-name hit occurs in either legacy
registry.

Literal/local search was sufficient, so the optional
`nthdegree docs search --lean` was **not** run.  No `--agentic` search was run.

## Honest terminal status

- Existing mathematical consumers: **present and source-proved**.
- Import visibility from V7 semantics: **present**.
- Typed G3 atom-to-consumer adapter: **absent**.
- Clause-family soundness theorem: **absent**.
- Full G3 start-clause satisfaction / theorem closure: **not established by
  these kernels**.
