# Math Skeptic Audit: native-bank-replacement-plan

**Target:** `prove2me/native-bank-replacement-plan.md`
**Date:** 2026-09-05 (America/Los_Angeles)
**Review base:** `9184d6a42bcadf900301dcff9e4dddd1440aed4d`
**Target SHA-256:** `32e21808429b873f64da8a887039128e0e8a51efa426c9d9c0113aa8ae07584d`
**Verdict:** NEEDS WORK on finite-endpoint acceptance scope; suitable as a staged research plan.
**Claims audited:** 5 claim groups below. Source review only; no new build, kernel axiom audit, solver run, or server submission.

## Summary

The plan proposes actual mathematical replacements and consistently distinguishes them from bank wrappers and checker soundness. Its first counting replacement is concrete. Its structural coverage, card-eleven, and polynomial pilots contain explicitly acknowledged research work. No mathematical contradiction or unsupported claim of completed bank removal was found.

For Adam's preceding question about eliminating the ten- and eleven-point banks, add explicit endpoint milestones. The stated pilot exits alone do not establish that either finite theorem has core-only dependencies. This is a scope refinement, not evidence that the research proposals are false.

## Findings

### F1: Add acceptance records for the finite endpoints

- **Location:** target lines 60–67 and 152–173.
- **Quote:** “Trace both `Problem97.erdos97_rhs` and `Problem96.erdos96_rhs`.”
- **Stated label:** planned dependency audit and one-terminal replacement.
- **Evidence present:** `P97/FiniteN10.lean:182–193` consumes `finiteN10_u2FullDistanceClasses`; its source describes the endpoint/pinned-surplus bank route at lines 27–31. `P97/FiniteN11.lean:37` invokes `FiniteN10Closure` to exclude smaller carriers, and lines 49–76 split into the pinned-surplus `IsM44` branch and fixed-card frontier branch.
- **Actual label:** partial replacement program; whole-endpoint native removal remains CONJECTURED future work.
- **Verdict:** CLARIFY.
- **Reason:** package 3 removes one selected exact-four terminal's replay dependency. It does not discharge all native dependencies of the eleven-point theorem, including those inherited from the ten-point theorem. The universal-root census is useful but does not identify a complete endpoint-specific work list.

Add `Problem97.FiniteN10Closure` and `Problem97.FiniteN11Closure` as named ledger and acceptance roots. Record every remaining native leaf on each actual dependency path, including the eleven-point proof's use of the ten-point endpoint. Require fresh root axiom checks containing only `propext`, `Classical.choice`, and `Quot.sound` before declaring the finite exclusions native-free. Derive the complete work list from those traces rather than treating the three exact-four terminal families as all of the eleven-point proof.

### F2: The counting pilot has a real general argument

- **Location:** target lines 80–112.
- **Quote:** “Its finite-set argument proves: a four-point support with two distinct known cap members and at most two cap members has two points outside the cap.”
- **Stated label:** existing source theorem, pending verified reuse.
- **Evidence present:** `P97/ATail/BlockerVExactSeventeenSourceNormalForm.lean:640–659` proves the claim by subset cardinality and `Finset.card_sdiff_add_card_inter`. The argument is PROVEN on paper: the intersection has exactly two elements, so subtracting it from a four-element support leaves two.
- **Actual label:** PROVEN finite-set argument; Lean integration remains pending.
- **Verdict:** OK.
- **Reason:** the two target bodies still use `native_decide +revert` at `BlockerVExactFifteenFourRowCoverage.lean:94` and `BlockerVExactSixteenFourRowCoverage.lean:93`. Their hypotheses match after the label adapters specified in the plan. Extracting the shared lemma avoids importing the large exact-seventeen source model. The metric-motif classifiers remain separate native dependencies, as the plan states.

### F3: Structural geometry and the card-eleven pilot preserve their missing work

- **Location:** target lines 114–173.
- **Quote:** “Prove exhaustive coverage for each retired family, or retain a precise residual classifier for uncovered cases.”
- **Stated label:** research candidates with existing source contradiction cores.
- **Evidence present:** `P97/Census554/FivePointCircleIsoscelesOrderBridge.lean:68–83` requires the injective exact-image CCW enumeration, strict index order, convexity, and selected-row memberships. `P97/ATail/KalmansonThreeEqualitySchemas.lean:58–69` similarly retains enumeration/order/equality hypotheses. `P97/ATail/CardElevenUniqueFourCertificate/Coordinator.lean:52–63` dispatches the stated terminal families.
- **Actual label:** source-backed candidates; new coverage and terminal replacements are CONJECTURED work.
- **Verdict:** OK.
- **Reason:** the plan does not infer case coverage from the existence of a geometric contradiction. Before dispatching these pilots, name one classifier/terminal and its exact source-to-antecedent contract as already required by package 0.

### F4: Polynomial checker soundness is correctly separated from identity production

- **Location:** target lines 175–199.
- **Quote:** “their concrete success premises must also be discharged without native evaluation.”
- **Stated label:** research task, not a completed symbolic identity family.
- **Evidence present:** `P97/EndpointCertificate/Soundness.lean:462–464` explicitly requires `checkProductSum products = true` and vanishing products. `P97/SurplusCertificate/RowZeros/DirectSoundness.lean:264–270` still requires valid rule alignment.
- **Actual label:** CONJECTURED replacement work using existing conditional semantic lemmas.
- **Verdict:** OK.
- **Reason:** no parameterized identity is supplied yet. Family selection and the identity/geometry proof remain substantive work; replacing the evaluator alone is correctly outside the mathematical extraction objective.

### F5: Transfer and progress claims retain their limits

- **Location:** target lines 33–37 and 228–250.
- **Quote:** “Removing two sites may leave the same two native axiom names at the root because other sites still use them.”
- **Stated label:** local trust improvement distinguished from theorem closure and accepted transfer.
- **Evidence present:** package 1 explicitly retains native motif classifiers. The plan separately requires actual consumer checks and server receipts.
- **Actual label:** sound accounting requirement; server acceptance remains untested in this review.
- **Verdict:** OK.
- **Reason:** preserve both measurements: retired dependency subtrees for partial progress, and final root axiom closure for a native-free theorem.

## Lean sorry graph and certification limits

This review inspected current source and the two accompanying audit documents. Independent bounded reviewers checked package 1 and packages 2–3. It did not refresh the kernel graph, reproduce the 5,035-site census, authenticate every generated proof leaf, or test Prove2Me. Existing root sorries are not closed by this plan review. No plan or Lean source was edited.

Before certifying an implemented replacement, satisfy the plan's own consumer build, axiom, source-binding, and independent-review gates. Add F1's endpoint records if the intended completion claim is elimination of native dependencies for all carriers of size at most eleven.
