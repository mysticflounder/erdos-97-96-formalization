<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Endpoint general-m leaf vs. the card-11 machinery (2026-07-11)

Route analysis for `Problem97.isM44EndpointGeneralMResidualsExcluded`
(`RemovableVertexAxiom/Base.lean`, sorried leaf created by the K-B-END
route-(b) split): can it be discharged by the forced `m = 6 / A.card = 11`
machinery recorded on closure-matrix row K-B-PIN? Produced by a read-only
math-prover pass (2026-07-11); statement-level claims against the sibling
session's uncommitted WIP (`CapSelectedRowCounting.lean`,
`Census554/{CapSelectedFiniteCode,PinnedCarrierBridge}.lean`) are marked.

## Verdict

**(i) with a scoped extension.** The endpoint leaf embeds in the same
card-11 architecture — card-11 forcing, extractor pipeline, carrier
machinery, and all twelve generic metric-core consumer families transfer
verbatim or by mechanical port — but it is **not dischargeable by the
K-B-PIN deliverables as scoped**: the endpoint configuration provably fails
`PinnedShellOK` (the escape hypothesis forces the Moser apex label `0` OUT
of the escaped row, while `PinnedShellOK` requires `0` in it), so the
pinned 12-placement classifier and the (4,2,2) bridge do not cover it.
Neither an existing route (§4 of the full report) nor a bank theorem
applies; U2/reflection kernels close only the complementary
endpoint-on-first-radius branch.

## What the endpoint hypothesis gives at card 11 (PROVEN composition,
not yet Lean-checked as one lemma)

For the left escape at `oppIndex1` in canonical `Fin 11` labels
(moser `{0,1,2}`, surplus interior `{3..6}`, opp1 interior `{7,8}`,
opp2 interior `{9,10}`):

- both selected classes are exactly 4 and interior-pinned
  (`moserCapCoreSelectorAt`, `SurplusM44Packet.lean:2194`);
- escaped row `T₁ = {7, 8, e, w}` with `e ∈ {9,10}`, `w ∈ {2} ∪ intS`,
  and `0 ∉ T₁`;
- second row `T₂ = {0, 9, 10, s}` with `s ∈ {1} ∪ intS`;
  `rho = |v₀v₂|` (a Moser side), `radius ≠ |v₀v₁|`.

The pinned residual row is `{0, 7, 8, pinSource ∈ intS}` — a disjoint row
shape at the same center. Hence the new seed family.

## Required additions (the "scoped extension")

1. New seed predicate pair `EndpointLeft/RightShellOK` (~32 ordered
   placements at the three-row seed); classifier obligation extends from
   `IncidenceOK ∧ PinnedShellOK` to the union with the endpoint seeds; the
   (4,2,2) bridge needs one additional seed-production case (its
   IncidenceOK / hull-order / color-soundness components are
   seed-independent and shared).
2. ~6 mechanical lemma ports from the pinned lane (k4Radius_eq,
   no_qfree_of_mem at both apices, y-extraction, four-class wrapper,
   endpoint critical-shell system, `EndpointEscapeAlignedCarrierData`).
   CONJECTURED-mechanical until built; one genuine design point in the
   four-row carrier variant (blocker = apex(opp2) collision case).
3. Consumer signature (stateable today):
   `Census554.EndpointCarrierBridge.false_of_endpointEscapeLeft_cardEleven
   (D) (hmin) (hM44) (hgt : 5 < D.packet.surplusCap.card) (hend : …) :
   False` + right mirror.

Optional acyclic refinement: the endpoint leaf may consume
`isM44PinnedSurplusGeneralMResidualsExcluded` (no reverse reference
exists — use-site inventory checked), reducing to two joint cases
(double-endpoint; endpoint + exact containment forcing an isosceles
`|v₂v₀| = |v₂v₁| = rho`). Wiring constraint: K-B-PIN's classifier proof
must then not case through the endpoint predicates.

## The one substantive unknown (EMPIRICAL) — RESOLVED 2026-07-11

**Zero residuals.** The exact finite-model sweep over both
`EndpointLeft/RightShellOK` families (64 ordered placements, twelve
formalized metric cores, enumerate-residuals mode, complete=true) returned
EXHAUSTIVE on every placement with an empty residual bank:
`census/endpoint_confinement/endpoint_direct_metric_core_residuals_n11.json`.
Verdict (i) is empirically confirmed — the endpoint extension needs NO new
metric cores; the remaining work is exactly the scoped extension of §
"Required additions" (seed predicates, classifier extension to the seed
union, one (4,2,2) bridge case, mechanical ports).

Original framing of the gap, for the record: no probe had established zero
residuals for the endpoint seed placements — the pinned zero-residual
result carried no evidence for this domain. The plan was: run the probe
over the `EndpointLeft/RightShellOK` families; zero residuals confirms
verdict (i);
residuals name the missing cores. RESOLVED 2026-07-11: per Adam, the
pinned-surplus lane keeps its tooling for now; an insulated snapshot lives at
`census/endpoint_confinement/` (provenance hashes in `PROVENANCE.md`),
validated by an exact parity run in pinned mode
(`parity_pinned_residuals_n11.json` — identical results and residual bank).
The endpoint sweep runs via
`endpoint_direct_metric_core_probe.py --enumerate-residuals --family both`
(32 ordered placements per family, seed = the `EndpointLeftShellOK` shape:
exact escaped row `{7, 8, escapee, fourth}` at center 1 with
`escapee ∈ intO2`, `fourth ∈ {2} ∪ intS`, `deleted ∈ intS`,
`fourth ≠ deleted`; right family is the O1↔O2 mirror at center 2).

## Pricing for the route-(b) decision record

Route (b)'s endpoint half = K-B-PIN's remaining gap + one seed family +
mechanical ports, versus disposition (a)'s open-ended general-M44
confinement producer. Full extractor-by-extractor inventory, row-shape
derivations, and dead-ends check: see the 2026-07-11 analysis session
notes (nthdegree) and the file:line citations therein.
