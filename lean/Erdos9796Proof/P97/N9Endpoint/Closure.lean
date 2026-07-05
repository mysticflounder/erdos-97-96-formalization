import Erdos9796Proof.P97.Foundation
import Erdos9796Proof.P97.N9Endpoint.Shell
import Erdos9796Proof.P97.N9Endpoint.N4a
import Erdos9796Proof.P97.N9Endpoint.N67
import Erdos9796Proof.P97.N9Endpoint.N4e
import Erdos9796Proof.P97.N4d.TrackBRows
import Erdos9796Proof.P97.N4d.ExcludesFormAv1
import Erdos9796Proof.P97.N4d.ExcludesFormBv1
import Erdos9796Proof.P97.N4d.ExcludesFormCv1
import Erdos9796Proof.P97.N4d.CyclicTransport
import Erdos9796Proof.P97.N8.N8kDistribution

/-!
# n = 9 endpoint — top-level assembly

`FiniteN9Closure` is the `n = 9` finite endpoint of the Problem 97 universal
proof.  It is tracked as obligation `p97-finite-n9-closure` in the blueprint DB
and is the base case consumed by `UniversalProblem97.lean`.

## Route

The body assembles the live route-1 spine into a contradiction.  It is
kernel-clean: `#print axioms Problem97.FiniteN9Closure` reports only
`propext`, `Classical.choice`, `Quot.sound`.

```
¬conclusion (A.card = 9, ConvexIndep A, HasNEquidistantProperty 4 A)
  ⟹ finiteEndpointShellOfCounterexample   S : FiniteEndpointShell A   [D1]
  ⟹ n4cClassifies_v{1,2,3}                 classifiers
  ⟹ n4dExcludes_v{1,2,3}_of_forms          fed by the form producers
  ⟹ n4eCapContainment_of_n4c_n4d           S.N4eCapContainment         [D2]
  ⟹ n7_circle_placement                    rigid common-radius `d` packet
  ⟹ N8 single-apex exhaustion              N8k_single_apex_false ⟹ False
```

The three `v₁` form exclusions (`N4dExcludesForm{A,B,C}_v1_proof`) are the
real producers; the `v₂`/`v₃` exclusions are cyclic transports of them around
the apex relabelling (`N4d/CyclicTransport.lean`) — pure field permutations,
no new geometry.  The final contradiction routes the common-radius packet
through the single-apex exhaustion in `N8/N8kDistribution.lean`.

The statement uses `EuclideanGeometry.ConvexIndep` and
`Erdos97.HasNEquidistantProperty` (from the `formal_conjectures` Lake
dependency) via the abbreviations in `Foundation.lean`.
-/

open scoped EuclideanGeometry

namespace Problem97

/-- The `n = 9` endpoint: a `card = 9`, convex-independent, 4-equidistant set
is contradictory.  Assembled from the live route-1 spine — form exclusions at
the three apices, cap containment, the rigid common-radius packet, and the N8
single-apex exhaustion.  Kernel-clean.  Tracked as obligation
`p97-finite-n9-closure`. -/
theorem FiniteN9Closure : FiniteN9ClosureStatement := by
  intro A hcard hconv hbad
  -- A nonempty (card = 9 > 0).
  have hne : A.Nonempty := Finset.card_pos.mp (by omega)
  -- D1 — build the finite endpoint shell from the counterexample.
  have S : FiniteEndpointShell A :=
    finiteEndpointShellOfCounterexample hne hcard hconv hbad
  -- N4d form exclusion at v₁ — the three real producers.
  have hExcl1 : S.N4dExcludes_v1 S.n4cClassifies_v1 :=
    S.n4dExcludes_v1_of_forms
      -- FormA_v1's proof consumes FormB_v2 (cyclic transport of FormB_v1,
      -- FormA-independent — no circularity); thread it explicitly.
      (S.N4dExcludesFormA_v1_proof S.N4dExcludesFormB_v2_proof)
      S.N4dExcludesFormB_v1_proof
      S.N4dExcludesFormC_v1_proof
  -- N4d form exclusion at v₂ — the three real producers, cyclic transports of
  -- the v₁ exclusions (`N4d/CyclicTransport.lean`).
  have hExcl2 : S.N4dExcludes_v2 S.n4cClassifies_v2 :=
    S.n4dExcludes_v2_of_forms
      S.N4dExcludesFormA_v2_proof
      S.N4dExcludesFormB_v2_proof
      S.N4dExcludesFormC_v2_proof
  -- N4d form exclusion at v₃ — likewise, the direct `cyclicShift3` transports.
  have hExcl3 : S.N4dExcludes_v3 S.n4cClassifies_v3 :=
    S.n4dExcludes_v3_of_forms
      S.N4dExcludesFormA_v3_proof
      S.N4dExcludesFormB_v3_proof
      S.N4dExcludesFormC_v3_proof
  -- D2 — N4e cap containment from the three classifiers + three exclusions.
  have hN4e : S.N4eCapContainment :=
    S.n4eCapContainment_of_n4c_n4d
      S.n4cClassifies_v1 S.n4cClassifies_v2 S.n4cClassifies_v3
      hExcl1 hExcl2 hExcl3
  -- D3/D4 + W8 — route a cap-interior apex through the K4-facing N8 single-apex
  -- consumer.  Cap interior `I1` is nonempty (card ≥ 2), so pick any apex
  -- `x ∈ S.I1`; the shell's global `K4` hypothesis supplies the selected
  -- `4`-class, and W10 exhausts its distribution.
  classical
  -- An apex `x` in the first cap interior (nonempty: `I1.card ≥ 2 > 0`).
  obtain ⟨x, hxI1⟩ : S.I1.Nonempty := Finset.card_pos.mp (by have := S.I1_card_ge_two; omega)
  exact S.N8k_capInterior_false_of_hasNEquidistantProperty (i := 0) hN4e S.hK4 hxI1

end Problem97
