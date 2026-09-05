# Math Skeptic Audit: exact-five cap-radius drop

**Target:** `docs/references/exactfive-cap-radius-drop-original-2026-09-05/cap-radius-drop-proofs-and-formalization.md`
**Date:** 2026-09-05
**Verdict:** NEEDS WORK — scalar proofs checked; source adapters and physical closure remain open.
**Claims audited:** 13 (six scalar declarations and seven source/application/evidence claims below).

## Summary

The original ZIP is now the primary source. All eight checksums verify. Its
nine members are preserved byte-for-byte under
`docs/references/exactfive-cap-radius-drop-original-2026-09-05/`. The earlier
five-file recovered-text bundle remains under the separately named recovered
directory; its four checksums also verify. Statements about missing files or
unavailable Lean in these archived documents describe their original sessions.

The original scalar source elaborates in the project's Lean LSP environment
without proof errors. All six named theorems report exactly `propext`,
`Classical.choice`, and `Quot.sound`. The unchanged source produces 13
whitespace-style warnings. These historical source bytes were preserved for
provenance, rather than edited during the audit.

The independent checker replay passes, and its regenerated `exact_checks.json`
is byte-identical to the original: 6,174 rational sign cases, 100 sharp-family
cases, and 2,400 supporting-edge checks. The symbolic identities and rational
disk obstruction also pass. These checks do not establish the source adapter.

Exact file hashes, tool versions, axiom reports, and validation scope are in
[`2026-09-05-exactfive-cap-radius-drop-validation.json`](audits/2026-09-05-exactfive-cap-radius-drop-validation.json).
The lane base is `79ee277bc3000d19b6a021d9915d24305f7f6a8c`; the archive's
source pin is `2bb06af72f01a0b5cfc422427375c029b3eebc7f`.

## Claim inventory

All scalar names below are in `Problem97.ExactFiveCapRadiusDropScalar`.
“Conditional” means that the indicated hypotheses remain inputs; it does not
claim that the physical packet has been connected to those inputs.

| Claim | Supported classification | Scope |
|---|---|---|
| `chord_sq_identity` | PROVEN — Lean-formalized | Coordinate polarization identity. |
| `apex_dot_identity` | PROVEN — Lean-formalized | Polynomial identity over arbitrary real coordinates. |
| `apex_dot_pos` | PROVEN — Lean-formalized | Explicit coordinate bounds, nonobtuse-apex bound, and positive heights. |
| `paired_radius_lt_of_dots` | PROVEN — Lean-formalized | Equal radii, nonnegative radii, positive outer dot, nonpositive inner dot. |
| `normalized_cap_pair_radius_lt` | PROVEN — Lean-formalized | Combines those explicit scalar hypotheses; no source normalization. |
| `old_local_model_no_common_boundary_disk` | PROVEN — Lean-formalized | Only the four named rational points and common boundary-disk assumptions. |
| Source-specific radius drop (RD) | CONJECTURED at the audited source interface | Prose argument supplied; actual-apex and cap metric/order bridges not checked. No counterexample found. |
| Double hit with radius at least the first radius is impossible | PROVEN — conditional pen-and-paper implication | Follows from RD and the source/radius memberships; RD remains the unconnected input. |
| Exact two-inside/two-outside support | PROVEN — conditional pen-and-paper counting implication | Requires localization, distinct-circle/own-cap bounds, own-source membership, and exact row cardinality. Source adapter not checked. |
| High-radius strict-interior trace has cardinality at most one | PROVEN — conditional pen-and-paper implication | Choose two distinct trace points and apply RD. |
| High-radius canonical trace is its source singleton | PROVEN — conditional pen-and-paper implication | Previous bound plus own-source membership. |
| No fixed contraction factor follows from the local radius-drop hypotheses | PROVEN — pen-and-paper | The displayed rational unit-circle family has squared ratio `(1-y)/(1+y)` tending to one. No four-row/global realization is claimed. |
| Reported finite checker cases | EMPIRICALLY VERIFIED — exact finite arithmetic | Replayed stated sample scopes; no full physical realization. |

## Findings

### F1: The actual opposite apex needs its own normalization bridge

- **Location:** target lines 94–124 and 352–370.
- **Quote:** “The normalized frame must identify the actual chord endpoints and actual opposite apex.”
- **Stated label:** required source adapter, with a prose proof strategy.
- **Evidence present:** the CGN normalization and actual nonobtuse MEC-triangle fields.
- **Actual label:** CONJECTURED at the assembled source interface; scalar consequence is separately PROVEN.
- **Verdict:** CLARIFY — retain this as the first missing radius-drop adapter.
- **Reason:** `CGN6norm_minorCapChainModel_of_mecCapPacket`
  (`lean/Erdos9796Proof/P97/CGN/CGN6.lean:371`) normalizes an ordered cap
  packet whose `center` is the enclosing-circle center. The intended outer
  apex is `S.oppApex1`, a Moser triangle vertex. The exported model does not
  identify that vertex's coordinates. Substituting the packet center for the
  apex would lose both strict negative-side height and the nonobtuse-apex
  bound. This is a missing Lean bridge, not a refutation of the prose argument.

`CircumscribedMECPacket.inner_at_v2`, `.inner_at_v3`, and `.inner_at_v1`
(`CircumscribedMECPacket.lean:98`) supply the intended endpoint and apex angle
antecedents. Carry the actual apex through the same positive similarity,
prove its coordinate bounds, and derive strict cap heights using interior
membership and convex independence. Do not add these conclusions as new
fields of the physical residual.

### F2: Localization exists; the full metric/order transport is still required

- **Location:** target lines 55–86 and 328–351.
- **Quote:** “The actual CGN theorem returns this inner-product inequality; no informal angle convention is needed.”
- **Stated label:** reusable geometric input.
- **Evidence present:** source declarations listed below; a clean LSP diagnostic pass for the localization module.
- **Actual label:** CONJECTURED for the assembled source metric bridge.
- **Verdict:** CLARIFY.
- **Reason:** the between-order theorem consumes the original ordered cap;
  `CGN6b_nonacute_of_minorCapChainModel` consumes the mapped model. Transport
  the selected indices and points explicitly. `SimilarityTransportData`
  exports distance scaling, so polarization supplies the needed squared
  metric inequality without assuming a new inner-product transport axiom.

The bounded indexed reuse preflight found:

- `FirstApexInteriorPairGeometry.bisectorCenter_mem_firstApexInterior`
  (`ATail/FirstApexInteriorPairGeometry.lean:128`);
- `SurplusCapPacket.capByIndex_cgn4g_capData_oriented`
  (`SurplusM44Packet/Shard01.lean:704`);
- `CGN.index_strictly_between_of_equidistant`
  (`CapSelectedRowCounting.lean:51`);
- `CGN.CGN6b_nonacute_of_minorCapChainModel` (`CGN/CGN6.lean:1494`).

Paths in this list are relative to `lean/Erdos9796Proof/P97/`. Source inspection
and a module diagnostic pass are not a transitive axiom audit of this chain.

### F3: The canonical blocker inputs are available; the bypass needs support preservation

- **Location:** target line 175; original `formalization-request.md:8`.
- **Quotes:** “The physical packet and first-apex robustness give `e≠O`.”
  “Do NOT reuse an old strictly fresh source after changing the row; rerun the strict-source selector on the new supports.”
- **Stated label:** source consequence and pending integration requirement.
- **Evidence present:** current source contracts and independent swarm traces.
- **Actual label:** PROVEN — pen-and-paper derivation from the inspected contracts; bypass implementation remains open.
- **Verdict:** OK, with the pending adapter made explicit.
- **Reason:** use `H.selectedAt fresh packet.q_mem_A` for the actual shell,
  including `.q_mem_support`, `.support_eq_radius`, `.radius_pos`, and
  `.support_card`. Convert `packet.row₀` to deletion survival using
  `U5QDeletedK4Class.hasNEquidistantPointsAt_erase_q`; then
  `ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives`
  proves the blocker differs from `S.oppApex1`. The original strict pair is
  retained by `R.interior.frontier.pair.q_mem`, `.w_mem`, and `.q_ne_w`.

Priority 1 in the original request is the retained double-deletion-row bypass.
`R.interior.frontier.secondApexDouble` already supplies
`HasNEquidistantPointsAt 4 ((D.A.erase q).erase w) S.oppApex2`
(`ATail/CriticalPairFrontier.lean:573`). The first missing packaging step is
an exact four-point support extracted **inside that double-erased set**.
The generic single-deletion extractor in `U5GlobalIncidenceBasic.lean:366`
does not preserve the second omission after monotone enlargement.

After extracting that support, rebuild the common-deletion packet and normal
form, then call `nonempty_strictThreeCenterAlternative` on the new supports.
The referenced preceding `ExactFiveRetainedDoubleDeletion.lean` draft is not
in this ZIP and was not located in the bounded local search. The current
source contracts still identify the implementation task directly.

### F4: Keep the checker and trace claims within their stated domains

- **Location:** target lines 252–255 and 423; original checker lines 63–71.
- **Quote:** “The restriction is to `I_C`, not all of `C`.”
- **Stated label:** strict-interior restriction and finite validation.
- **Actual label:** PROVEN conditional trace implication; EMPIRICALLY VERIFIED finite checks.
- **Verdict:** OK for the trace restriction; CLARIFY for the negative control.
- **Reason:** the assumption-removal control checks coordinates, disk
  membership, dot sign, and radius growth. It does not verify a complete
  strict cap-chain or physical packet. Run the checker without `python -O`,
  since its checks use `assert`, and from an isolated copy, since it writes
  `exact_checks.json` beside itself.

## Weasel words and scope conflation

Target line 284 uses a prohibited comparison term. The independently
audited disk inequalities are correct; a maintained rewrite should state
the two center-coordinate inequalities directly. The archived source remains
unchanged. No finite sample count has been upgraded into a source theorem.

## Lean sorry graph and upgrade drift

The six scalar axiom closures contain no `sorryAx`, custom axiom, or native
reduction axiom. The scalar source is preserved under `docs/references/` and
is not imported into the production aggregate. No production Lean source,
obligation, or proof-spine edge changed in this checkpoint. No publication
build, live-spine refresh, or Lean-ingress promotion was performed.

`false_of_exactFiveDistinct_threeCenter_distinctFresh_physical` remains a
direct `sorry` in `Rigid221Closure.lean:1533`. The smaller-radius double-hit
case, omission cases, and full physical contradiction remain open. The active
source plan is `docs/plans/2026-09-01-rigid221-exactfive-distinct-three-center.md`.
The sole evidence upgrade here is the formerly unelaborated scalar draft:
its six explicit statements have now been checked, with the recorded warnings.

## Required before CERTIFIED

Finish the support-preserving double-deletion bypass and regenerate freshness.
For radius drop, prove the actual-apex coordinate bridge and cap metric/index
transport, then connect the source theorem and its restricted corollaries to
the physical consumer. Validate the affected modules and actual consumer
axiom closures independently. Strict radius decrease supplies no descent
without a producer of another instance satisfying the same source hypotheses.
