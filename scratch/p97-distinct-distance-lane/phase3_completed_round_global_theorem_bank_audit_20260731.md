# Phase 3 completed-round global theorem-bank audit — 2026-07-31

## Scope and trust boundary

This is a read-only source/artifact audit. No Lean/Lake command, solver, generator,
manifest mutation, or kernel/axiom gate was run.

- **Empirically verified from the 21 completed worker manifests/journals:** all
  workers ended `LEARNED_CORE_LIMIT`; 2,100,000 raw SAT candidate records were
  classified; 0 were unclassified and 0 survived. These are candidate records,
  not distinct isomorphism classes or a universal theorem.
- **Supplied completed-round evidence:** the certified selected terminal bank is
  unchanged at 44 leaves (`d5=23, d6=9, d8=3, d9=9`).
- **Lean status:** the local contradiction consumers named below already exist
  as Lean declarations and are recorded by the theorem-bank registry. This pass
  did not re-run their builds or transitive axiom checks, and it did not land the
  concrete Phase 3 certificates in Lean.

## Completed-round support census

All 2,100,000 learned cores have certificate kind `STRUCTURAL`.

| Existing theorem family / detector group | Raw records |
|---|---:|
| Duplicate center | 1,967,624 |
| Other equality-collision families | 121,749 |
| Convex five-point order | 5,747 |
| Convex rhombus order | 83 |
| Shared-pair cyclic separation | 4,797 |
| **Total** | **2,100,000** |

The named circle-system equality subfamilies (six-/seven-/eight-point circle
chains and networks) account for 2,964 of the 121,749 “other equality” records.
Dynamic Kalmanson, algebraic, real-distinctness, and equilateral-shell counts are
all zero.

Every observed detector already maps to a generic Lean consumer in
`census/census_554/formalized_structural_oracle.py`. Representative existing
mathematical statements are:

1. `Problem97.not_dist_eq_three_of_ne`: two distinct points cannot both be
   equidistant from the same three pairwise-distinct plane points.
2. `Problem97.Census554.EqualityCore.equilateral_bisector_collision`: under
   `r>0` and the listed equal-radius/equilateral/bisector distance equalities,
   the conclusion is `p = x ∨ c = b`.
3. `Problem97.Census554.EqualityCore.three_triad_collision`: the six equalities
   `BC=BD`, `BD=DA`, `CA=CD`, `CD=CE`, `EA=EB`, `EB=ED` force `A=B`.
4. `Problem97.Census554.FivePointCircleIsoscelesOrderBridge.false_of_two_selected_rows_of_ccw`:
   for five increasing vertices `W<F<P<X<Z` on an injective CCW boundary of a
   convex-independent set, the selected-row incidences
   `F,X,Z ∈ row(W)` and `P,X ∈ row(Z)` are contradictory.
5. `Problem97.Census554.CapCrossingKalmansonBridge.false_of_selected_rows_in_five_ccw_order`:
   the analogous ordered `O<A<Y<E<C` three-row pattern is contradictory.

Thus the dominant exact reusable consequence is already banked: no new local
geometry theorem is needed to reject any record in this completed round.

## Global-theorem candidates

| Candidate | Exact support in completed round | First missing bridge | Bankable now? |
|---|---:|---|---|
| Six-pair skew-Bollobas | 0 | Canonically construct six ordered set-pairs from a certificate and prove every required disjointness/cross-intersection relation. The prior 262 surviving incidence records also had zero sound skew candidates. | No |
| Closed angular-midpoint component | 0 | Construct certified midpoint/angle vertices and a closed oriented component from row supports. The 10,627 order records provide only discrete cyclic-order/equality data, not coordinates, angles, or midpoints. | No |
| Miquel/Clifford/bundle | 0 direct; 2,964 superficially related circle-network equality records | Prove the required concyclicity/intersection/nondegeneracy incidences. Rows are positive membership/equality data with `exact=false`, so they do not specify complete circles. Existing equality consumers already dispose of these records. | No new theorem |
| Circle power matrix | 0 dynamic algebraic | Build a 5-circle by 5-point matrix and prove its required exact zero/nonzero pattern. Positive row membership yields some equal-power/zero entries, but `exact=false` omissions yield no nonzero entries. Existing `powerMatrix_rank_le_four` / five-by-five determinant results are already banked. | No |
| EDM / Cayley-Menger / rigidity | 0 | Produce a sufficiently complete squared-distance matrix plus the rank/sign or minor hypotheses. Sparse equality cores do not supply them. | No |
| Kalmanson / Ptolemy order theorem | 0 dynamic Kalmanson; 10,627 handled order records | For a new global result, ingest concrete row certificates and prove a Lean-certified cyclic-order/global cover. The local ordered contradictions already exist. | No new local theorem |

One `nthdegree docs search --lean` was run for each candidate family. The hits
were the already-known midpoint inequality, equality/circle-network consumers,
power-matrix declarations, Ptolemy inequality, and convex-order consumers; no
new declaration matched the missing bridges.

## Terminal-core consequence

The terminal RUP classifier inventory contains 55 discovered records (a
superset of the supplied selected bank of 44). In every classified terminal
record, the final empty clause is justified solely by one hard exactly-one
clause on a variable triple and either all three negative prefix units or two
positive prefix units. Hence there is a universal propositional schema:

> Exactly one of `x,y,z` is true, so neither `¬x∧¬y∧¬z` nor any two-positive
> assignment is possible.

This is bankable only as a certificate-materializer/checker simplification, not
as a new geometric theorem. The missing bridges are (1) authenticated DIMACS
variable/provenance-to-Lean propositions, and (2) a kernel-checked proof that
the selected 44 leaves cover the intended Phase 3 search space.

## Verdict

**No new global cardinality-independent geometric theorem is bankable from this
round.** All 2,100,000 raw records instantiate already-banked structural
contradiction families. The next proof-relevant work is certificate ingress and
global coverage, not another local metric theorem.
