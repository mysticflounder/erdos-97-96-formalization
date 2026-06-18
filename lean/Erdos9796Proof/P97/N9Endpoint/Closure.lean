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

## What this proof now does (no longer a bare `sorry`)

Earlier this symbol was `:= sorry` — a single opaque hole that **consumed
nothing**, so `#print axioms FiniteN9Closure` was blind to every downstream
form-exclusion and counting gate.  The body below is the genuine geometric
assembly of the live route-1 spine; it consumes the written machinery and
leaves an honest, *named* `SORRY-GATE` at each genuinely-unwritten leaf, so the
axiom closure now decomposes into the real remaining obligations:

```
¬conclusion (A.card=9, ConvexIndep A, HasNEquidistantProperty 4 A)
  ⟹ finiteEndpointShellOfCounterexample          S : FiniteEndpointShell A   [D1 ✓]
  ⟹ n4cClassifies_v1/v2/v3                        classifiers                 [✓ defs]
  ⟹ n4dExcludes_v{1,2,3}_of_forms                 fed by the 9 form producers [v₁ ✓, v₂/v₃ ✓ transport]
  ⟹ n4eCapContainment_of_n4c_n4d                  S.N4eCapContainment         [✓ glue, D2]
  ⟹ n7_circle_placement                           common-radius `d` packet    [✓]
  ⟹ N8 exhaustion + counting clash                False                        [GATE: D3/D4/W8]
```

Open leaves still standing between this body and a kernel-clean proof (see
`docs/n-lane/97-finiteN9-closure-audit-2026-06-11.md` §4/§6):

* **B4–B9 — now wired (no longer gated).** The six `v₂`/`v₃` form-exclusion
  producers (`N4dExcludesForm{A,B,C}_v{2,3}_proof`, in
  `N4dCyclicTransport.lean`) are cyclic transports of the `v₁` exclusions
  around the apex relabelling — pure field permutations, no new geometry.
  `FormB`/`FormC` at `v₂`/`v₃` are kernel-clean; `FormA` at `v₂`/`v₃` inherit
  only `N4dExcludesFormA_v1_proof`'s own W3/W5 gate.  Net effect: the six
  former leaves collapse onto FormA_v1's single gate.
* The **v₁** inputs are the real producers: `N4dExcludesFormA_v1_proof`
  (carries internal W3/W5 gates), `N4dExcludesFormB_v1_proof` (sorry-free),
  `N4dExcludesFormC_v1_proof` (sorry-free) — their own sorries now surface
  through this symbol's axiom closure.
* **The N8 → counting tail** (audit D3/D4 + the N8b W8 gate) is unwritten: no
  theorem routes the `n7_circle_placement` radius-`d` packet through the N8
  single-apex / endpoint-pair exhaustion into the `Counting.lean` clash.  That
  is the final `SORRY-GATE` below.

The statement uses `EuclideanGeometry.ConvexIndep` and
`Erdos97.HasNEquidistantProperty` (from the `formal_conjectures` Lake
dependency) via the abbreviations in `Foundation.lean`.
-/

open scoped EuclideanGeometry

namespace Problem97

/-- The `n = 9` endpoint.  Assembled from the live route-1 spine; the remaining
open leaves (the six `v₂`/`v₃` form producers and the N8 → counting tail) are
carried as named `SORRY-GATE`s so the axiom closure reflects the true state of
the proof.  Tracked as obligation `p97-finite-n9-closure`. -/
theorem FiniteN9Closure : FiniteN9ClosureStatement := by
  intro A hcard hconv hbad
  -- A nonempty (card = 9 > 0).
  have hne : A.Nonempty := Finset.card_pos.mp (by omega)
  -- D1 — build the finite endpoint shell from the counterexample.
  have S : FiniteEndpointShell A :=
    finiteEndpointShellOfCounterexample hne hcard hconv hbad
  -- N4d form exclusion at v₁ — the three real producers (their own internal
  -- gates W3/W5 and the FormC leaf gates surface through this closure).
  have hExcl1 : S.N4dExcludes_v1 S.n4cClassifies_v1 :=
    S.n4dExcludes_v1_of_forms
      -- FormA_v1's W3 proof consumes FormB_v2 (cyclic transport of FormB_v1,
      -- FormA-independent — no circularity); thread it explicitly.
      (S.N4dExcludesFormA_v1_proof S.N4dExcludesFormB_v2_proof)
      S.N4dExcludesFormB_v1_proof
      S.N4dExcludesFormC_v1_proof
  -- N4d form exclusion at v₂ — the three real producers, cyclic transports of
  -- the v₁ exclusions (`N4dCyclicTransport.lean`).  FormB/FormC are kernel-clean;
  -- FormA inherits only `N4dExcludesFormA_v1_proof`'s internal W3/W5 gate.
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
  -- N6/N7 — the rigid common-radius `d` packet (consumes the spine this far).
  obtain ⟨d, hd_pos, hd_c1, hd_c2, hd_c3⟩ := S.n7_circle_placement hN4e
  -- D3/D4 + W8 — route the radius-`d` packet through the N8 single-apex
  -- exhaustion.  Cap interior `I1` is nonempty (card ≥ 2), so pick any apex
  -- `x ∈ S.I1`; it is a genuine non-Moser cap-interior point.  The shell's
  -- global `K4` hypothesis (`S.hK4`, specialized to `x ∈ A`) supplies a
  -- selected `4`-class radius `r`; package these into the `N8SelectedApex S 0 x`
  -- and discharge via `S.N8k_single_apex_false`.  The W8/W10 gates inside
  -- `N8k_single_apex_false` surface through this closure (expected).
  classical
  -- An apex `x` in the first cap interior (nonempty: `I1.card ≥ 2 > 0`).
  obtain ⟨x, hxI1⟩ : S.I1.Nonempty := Finset.card_pos.mp (by have := S.I1_card_ge_two; omega)
  -- `I1 ⊆ C1 ⊆ A`, so `x ∈ A` and `S.hK4` applies at `x`.
  have hxC1 : x ∈ S.CP.C1 := Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hxI1)
  have hxA : x ∈ A := S.CP.C1_subset hxC1
  obtain ⟨r, hr_pos, hr_card⟩ := S.hK4 x hxA
  -- Build the single-apex packet at cap index `0` (= `I1`) and close.
  exact S.N8k_single_apex_false (i := 0) hN4e
    { radius := r
      radius_pos := hr_pos
      cap_mem := hxI1
      selected_card := hr_card }

end Problem97
