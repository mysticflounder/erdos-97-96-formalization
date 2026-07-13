# ERASE-P2-R/L remainder blocker — adversarial audit (2026-07-11)

> **Status update (2026-07-13):** this blocker analysis remains valid for the
> overstrong remainder route, but it is no longer an open obligation. Commit
> `652fdfcb` closes P2 through the label-complete card-10 producer and
> faithful-carrier card-11 classifier/closure chain. The exact-pin ERASE target
> is 0/1376 open and target-verified.

Skeptic audit of the blocker report produced by the §B.3 consumer-refactor
dispatch on `Continuation.lean:312/:337` (matrix rows ERASE-P2-R/L, inside
`Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded`).
Audited at `four-point-subpacket-reduction`. Overall: the report's structural
analysis is sound; its crux claim was scope-conflated as worded but the
corrected form still carries the blocker.

## Per-claim verdicts

1. **CONFIRMED** — the third `hfiniteResidualRows` goal (via `refine` at
   `Continuation.lean:149`) is `ErasedPinFiniteCandidateSepSplitOrderedScaffoldFacts S x`,
   the final conjunct (`Base.lean:9190`) of the intermediate statement
   `IsM44NonSurplusContainmentErasedPinTripleRoutedSeedFiniteResidualRowsFactsStatement`
   (`Base.lean:9167`).

2. **CONFIRMED** — unfold chain `Base.lean:5616 → :5568/:5592 →
   RightOneSidedErasedPayloadFiniteCandidateSepFacts :1212` (left `:1258`);
   the conjuncts at `:1220-1234`/`:1266-1280` are the two
   `OneSidedSeedCandidateRemainder` obligations. Precision note: the field is
   existential in `centerClass` (pinned only at `.v/.w/.Pw/.Pu`,
   `Base.lean:1215-1219`); the `:312/:337` goals are the stronger
   pinned-witness instances, but the refutation below applies at the
   existential level. Non-vacuous: the scaffold forces `x ∈ {s1,s2,s3}`
   (`Base.lean:5580`). Every producer of the Sep facts takes the remainder
   pair as explicit hypothesis (`rightFiniteCandidateSepFacts_of_erasedPayloadCenterClass`,
   `Base.lean:1648`, `hcandidate` at `:1667-1683`; reflected `:1875`).

3. **CONFIRMED in substance** — producers of `OneSidedSeedCandidateRemainder`
   at a non-fixed center are exactly
   `oneSidedSeedCandidateRemainder_of_mask_interfaces`
   (`SurplusCOMPGBankGeometry.lean:3913`), the transfer lemma `:3756`
   (requires a base remainder), and the raw route `:3773` that `:3913` wraps —
   all bottoming out at per-center maskCard-4/self-exclusion/trigger facts
   with **zero producers** in `lean/` (the `Base.lean:442` bundle's 8
   occurrences are defs, `hseed` consumers, and unproved statement
   obligations). Bank cross-check: `docs/general-n-certificate-bank-mining-2026-07-09.md:244`
   (zero of 151 sibling-bank shapes mention the remainder) and `:798` (the
   producer boundary is exactly these mask-incidence facts). Detail errors in
   the original report (which lemma takes the `Base.lean:442` bundle) do not
   affect the conclusion.

4. **Refutation chain CONFIRMED; original scope REFUTED as worded** — chain
   `Base.lean:8630 → :6032 → false_of_right_row0004_finiteCandidateFacts :2212
   → false_of_privateSurplusTriple_u_crossSeparation`
   (`SurplusCOMPGBankGeometry.lean:5238`, `decide`-backed `:5218`) verified
   line-by-line. The refutation fires under the row-(0,0,0,4) count
   hypotheses — that is the designed exclusion mechanism, not proof that the
   facts are false in the real configuration. **Corrected form, which holds**:
   `rightPinned_crossSeparationOKForMasks_of_exactCaps_selectedClasses`
   (`SurplusCOMPGBankGeometry.lean:2016`) is sorry-free, so cross-separation
   for the pinned witness is unconditional; hence for any `p` realizing
   row-(0,0,0,4) counts the `:312` remainder goal is false in the real
   configuration (mirror row (0,0,4,0), `Base.lean:6107`, analogous). So any
   honest producer must itself establish that no such `p` exists — the
   positive-assertion factoring at `Base.lean:9167` forces
   row-exclusion-strength geometry into the producer, and downstream row
   exclusion via those facts becomes circular in obligation order. The
   literal claim "provably FALSE in the configuration where the chain invokes
   it" overclaims and must not be repeated.

5. **PARTIALLY CONFIRMED** — the wired spine (`Continuation.lean:505-520`) is
   the only proof path feeding the outer statement (`Base.lean:345`); the two
   unwired alternative surfaces (SeedMaskInputs statements `Base.lean:5232/:5252`;
   relaxed-shape bank surface `Base.lean:1306`) bottom out at equivalent
   producer-less obligations (mining doc `:311`). "Redraft required" is
   overstated as logical necessity (a producer containing the row exclusions
   would also close the holes) but the redraft is the correct factoring.
   **Caveat: the redraft alone closes nothing** — the per-row `→ False`
   derivations still need new geometric content (e.g. forced `.u`-class facts
   under row counts); the redraft removes the refutable-as-stated
   intermediate, it does not do the math.

## Hypotheses in scope at :312/:337

Local intros carry no membership/distinctness/ordering facts for
`p₁ p₂ q₁ q₂ s1 s2 s3 p`; the branch-level facts are not in scope (helpers
defined before the `rcases` at `:340`). No in-scope hypothesis supplies the
per-center labeled-membership facts the only remainder producers require.
**No Continuation-only discharge exists.**

## Load-bearing conclusion

The `:312/:337` goals demand `OneSidedSeedCandidateRemainder` pairs that
(1) have no producer in `lean/` or any indexed bank, and (2) are refutable in
the real configuration for any `p` realizing row-(0,0,0,4)/(0,0,4,0) counts.
Honest closure = redraft `Base.lean:9167` to per-row refutation form (folding
row-forced masks such as the proven `right_row0004_privateMask_eq_surplusTriple`
into the `→ False` derivations) **plus** new per-row geometric content.
{{NEEDS_ADAM_INPUT}} — the redraft changes a spine intermediate statement and
supersedes the §B.3 prescription.
