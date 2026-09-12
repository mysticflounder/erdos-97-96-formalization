# Math Skeptic Audit: ExactFiveSecondApexProfile

Date: 2026-09-12. Verdict: CERTIFIED for the bounded claims below.
Targets: `InteriorPairSecondApexRobustness.lean`,
`MinimumAdmissibleInteriorChord.lean`, and the new guarded consumer in
`FrontierLiveClosure/Rigid221Closure.lean`.
Claims audited: 3 groups / 4 declarations — pair-deletion robustness,
two short-minimum-chord APIs, and the guarded exclusion.

## Summary and intended scope

This lane tests a second-apex radius-class condition in the remaining
mutual double-hit branch. It does not assert that arbitrary blocker rows
are mutual or close the physical terminal.

`WideRadiusProfile A V` means either a positive-radius class at V has
at least five points, or three distinct positive radii each have at least
four points. Both alternatives are explicit hypotheses, not facts
asserted for every source configuration.

## Claims and hypothesis custody

1. `InteriorPairSecondApexRobustness.survives_double_erase_of_wideRadiusProfile`:
   the profile and `dist V q ≠ dist V w` preserve a four-point radius
   class after deleting q and w. In the large-class arm, at most one of
   the two deletions hits that class. In the three-radius arm, at least
   one radius is hit by neither deletion.
2. `MinimalAdmissibleInteriorPair.dist_le_radius_of_secondApex_wideProfile`:
   an explicit five-point first-apex class and the profile force the
   minimum admissible chord to have length at most the first-apex radius.
   The existing cap count supplies at least three interior anchors;
   the supporting-cone geometry supplies a short pair among them.
   Distinct second-apex distances make every such pair admissible.
   The minimum-pair record alone does not store the class-cardinality
   premise, so the theorem retains it explicitly.
3. `false_of_exactFiveDistinct_mutualDoubleHit_wideSecondApex`:
   the profile contradicts the existing strict long-chord theorem under
   both mutual incidences. The normal form supplies the retained endpoint
   in the old row in either orientation. Full first-apex deletion
   robustness supplies the new center's distinctness from that apex.
   `Rmin.source_eq` transports the minimum chord to the actual pair.

The initially distinct minimum-custody both-hit dispatch tests both
incidences together with the profile after its existing four-interior
and high-radius guards. The complement retains the prior physical
terminal. Non-mutual, one-hit, zero-hit, and common-center cases remain
open; the new guard does not impose a lower bound on the fresh-row radius.

## Reuse preflight

The indexed search for a minimum admissible three-anchor short chord
returned the existing four-anchor theorem and its private proof helpers,
not the new result. The missing antecedent was joint-deletion robustness
for every candidate pair. This lane reuses `three_rays_short_pair`, the
interior second-apex distance separation, and
`selectedClass_capInteriorByIndex_card_ge_card_sub_two` rather than
reproving their geometry. Index snapshot: 2026-09-12 19:30 UTC,
source `04b4513a5`.

A parallel indexed search for three rich second-apex radius classes
returned single-deletion and adjacent classification APIs but no direct
pair-deletion theorem. The existing
`PhysicalSecondApexExactTwoFourRadiusResidual` records two exact-four
classes; its fields do not exclude additional rich classes. This audit
does not infer an exhaustive radius count from that structure's name.

## Verification record

- Both helper modules pass live Lean LSP checking with no diagnostics.
- The entire edited root passes live LSP checking with no errors or
  failed dependencies; seven warnings remain.
- The generic pair-deletion theorem, both new minimum-chord APIs, and
  the private guarded root consumer each have exactly `propext`,
  `Classical.choice`, and `Quot.sound` in their `lean_verify` axiom lists,
  with no warnings.
- The broader `false_of_originalFrontierUniqueRadiusArm` retains 3961
  axiom names: the three core axioms, `sorryAx`, and 3957 names containing
  `_native.`. This is not a new certification of those computations.
- The four literal root sorries remain at lines 120, 453, 1384, and 1709.
  No admission, custom axiom, or `native_decide` was added.
- The read-only hygiene report found zero checkpoint issues; unrelated
  dirty paths and generated trees were left untouched.
- Independent review certified the bounded claims with no blocking
  findings and separately left the overall root uncertified. The existing
  admitted fallback is not a dependency of the guarded theorem.
- No full-project build or headline publication gate is claimed.

Lane: `exactfive-second-apex-profile-20260912`.
Base: `04b4513a587040d0d9f5b24ab5500123fc60d48b`.
Toolchain: `leanprover/lean4:v4.33.1`, with mathlib
`0df444a360eaa60ab8c11dca51a86af692955474`.
Immediate consumer: the named private root guard above.
Final target: `Problem97.erdos97_rhs`.
Open physical anchor:
`Problem97.ATailFrontierLiveClosure.false_of_exactFiveDistinct_threeCenter_distinctFresh_physical`.

## Required before broader certification

Full route closure requires the remaining physical and common-center
consumers and the project's final trust and publication gates. This lane
does not supply them. Stage only the checkpoint's exact owned paths and
require the staged hygiene gate before committing this bounded work.

## Findings

### F1: Pair-deletion robustness

Location: `InteriorPairSecondApexRobustness.lean:42`.
Quote: `HasNEquidistantPointsAt 4 ((A.erase q).erase w) center := by`.
Evidence: `Problem97.InteriorPairSecondApexRobustness.survives_double_erase_of_wideRadiusProfile`.
Actual label: PROVEN, Lean-formalized under the explicit profile and
unequal-distance hypotheses. The live source check and core-axiom audit
pass. Independent review accepted both cardinality arguments. Verdict: OK.

### F2: Short minimum chord

Location: `MinimumAdmissibleInteriorChord.lean:302`.
Quote: `dist M.frontier.frontier.pair.q M.frontier.frontier.pair.w ≤ radius := by`.
Evidence: the `dist_le_radius_of_secondApex_wideProfile` and
`dist_le_radius_of_secondApex_pairwise_robust` methods in
`Problem97.FirstApexExactFiveInteriorFrontier.MinimalAdmissibleInteriorPair`.
Actual label: PROVEN, Lean-formalized. Both methods pass live checks and
core-axiom audits. The class-cardinality premise is explicit, not inferred
from the record name. Independent review accepted the source custody.
Verdict: OK.

### F3: Conditional root exclusion

Location: `FrontierLiveClosure/Rigid221Closure.lean:1812`.
Quote: `(hprofile : InteriorPairSecondApexRobustness.WideRadiusProfile D.A S.oppApex2)`.
Evidence: `Problem97.ATailFrontierLiveClosure.false_of_exactFiveDistinct_mutualDoubleHit_wideSecondApex`.
Actual label: PROVEN, Lean-formalized under this profile and both mutual
incidences. The declaration is core-axiom-only. Independent review found
the guard, minimum transport, both orientations, and fallback sound.
Verdict: OK for the conditional exclusion, not for the enclosing root.

## Scope conflation and upgrade drift

The enclosing admitted physical theorem is not promoted by this report.
Its `sorryAx` dependency remains a blocker to overall root certification,
not a hidden dependency of the new guarded theorem. The new plan labels
refer only to the profile, minimum-chord proof, and actual consuming
branch. Neither an exhaustive two-radius classification nor termination
of reselection is asserted. No prohibited proof-context wording was found
in these claims.

## Audited source bytes

SHA-256 before the scoped commit:

```text
InteriorPairSecondApexRobustness.lean f056f89e2f4c79f5000cbaaf8fc3c90d41bbde4700e2a954053ddc2372fb1d96
MinimumAdmissibleInteriorChord.lean d662221a8d366b655a5386d1651c564bd7f92702cff7b9252b4624863ae3e503
FrontierLiveClosure/Rigid221Closure.lean 66c2ddc2973a61bf9b5e8ffd5be49f2ba05404506a493ba97ada099282e6581b
```
