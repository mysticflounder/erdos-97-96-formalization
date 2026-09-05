# Math Skeptic Audit: Prove2Me Erdős 97/96 mission claims

**Target**: `mission-description.md`, `README.md`, and `items.json`, checked against the platform Lean payloads in `scratch/runs/prove2me-p97-p96-mission-20260905/run-0001/artifacts/platform/`
**Date**: 2026-09-05
**Verdict**: CERTIFIED
**Claims audited**: 17

## Summary

The packet labels its platform theorem declarations as statement-only sketches and
the open targets as open, which is accurate: every theorem payload carries `by
sorry`, while the definition payload has no asserted theorem. The witness forms
in the Problem 97 and nine-point prose are faithful classical renderings of the
negated universal definition. The updated bridge declaration asserts both the
conditional per-set `3 * A.card` bound and the conditional `Problem96` conclusion.
Source proofs are reported but were not freshly inspected in this audit and remain
external reports rather than platform proof evidence. This CERTIFIED verdict is
limited to claim fidelity and label accuracy; it does not certify any open
theorem or source proof.

## Findings

### F1: Problem 97 witness form is classically faithful

- **Location**: `mission-description.md:43-49`; `items.json:98`
- **Quote**: "The Problem 97 target is the canonical statement that every nonempty finite convex-independent $A$ has no four-equidistant-point property" followed by `\\forall A, A\\ne\\varnothing \\to ConvexIndep(A) \\to \\neg HasNEquidistantProperty(4,A)`; `items.json:98` displays `\\exists p\\in A\\;\\forall r>0`.
- **Stated label**: Open target / CONJECTURED.
- **Evidence present**: Platform definition `Def_Erdos9796Mission.lean:63-65` defines `Problem97` using `¬ HasNEquidistantProperty 4 A`; `HasNEquidistantProperty` expands at `:44-45` to `∀ p ∈ A, ∃ r > 0, ...`.
- **Actual label**: CONJECTURED, accurately rendered in classical mathematics.
- **Verdict**: OK
- **Reason**: The declaration is `¬ (∀ p ∈ A, ∃ r > 0, filtered-cardinality ≥ 4)`. Classical negation supplies a point witnessing failure of the inner property, and cardinality `≥4` failing is `≤3`; the prose therefore introduces no semantic strengthening for this classical mathematical target.

### F2: Nine-point exclusion witness form is classically faithful

- **Location**: `items.json:56-60`
- **Quote**: "some vertex has no four other vertices at a common positive distance" and `\\exists p\\in A\\;\\forall r>0:\\;|\\{q\\in A:\\|p-q\\|=r\\}|\\le3`.
- **Stated label**: Existing base-case result / CONJECTURED in the platform packet.
- **Evidence present**: `Thm_Erdos9796Mission_finite_nine_exclusion.lean:5` asserts `¬ HasNEquidistantProperty 4 A`; the definition expands that property as the universal-over-points, existential-over-radii statement.
- **Actual label**: CONJECTURED, accurately rendered in classical mathematics.
- **Verdict**: OK
- **Reason**: The Lean target says that the all-points property is false. In the classical setting used for these geometric statements, this gives an exceptional point and the `≤3` bound for every positive radius, so the prose preserves the intended mathematical assertion.

### F3: The bridge explicitly includes the Problem 96 conclusion

- **Location**: `mission-description.md:13-22`, `mission-description.md:51-60`, `README.md:4-7`, and `items.json:113-127`
- **Quote**: "This gives the Problem 96 bound and therefore $O(n)$" and "Problem 97 supplies ... at most three ... so ... at most $3n$ ... hence Problem 96's `O(n)` statement."
- **Stated label**: Conditional theorem / intended one-way dependency.
- **Evidence present**: `Thm_Erdos9796Mission_linear_bound_of_problem97.lean:5` asserts `Problem97 → (∀ A, ConvexIndep A → unitDistancePairsCount A ≤ 3 * A.card) ∧ Problem96`. `Def_Erdos9796Mission.lean:56-68` defines the count set, natural supremum, and real Big-O statement.
- **Actual label**: CONJECTURED conditional bridge in the platform draft.
- **Verdict**: OK
- **Reason**: The updated declaration explicitly asserts both the per-set estimate and the `Problem96` supremum/Big-O conclusion under `Problem97`. The prose correctly describes this as a one-way conditional route; the draft declaration remains open because its proof is `sorry`.

### F4: The bridge's empty-set scope is stated accurately

- **Location**: `items.json:115-117`
- **Quote**: "Then every finite convex-independent set $A$, including the empty set, satisfies ..."
- **Stated label**: Conditional theorem.
- **Evidence present**: The platform bridge quantifies over every `A : Finset Plane` after the `Problem97` premise and has no `A.Nonempty` premise; `Problem97` itself has the nonempty premise in `Def_Erdos9796Mission.lean:63-65`.
- **Actual label**: CONJECTURED, accurately scoped.
- **Verdict**: OK
- **Reason**: The metadata preserves the nonempty restriction on the assumed P97 statement and the unrestricted finite-set quantifier in the bridge conclusion.

### F5: Global minimality is faithfully described

- **Location**: `items.json:75-80`; `mission-description.md:72-80`
- **Quote**: "The smaller-set assumption quantifies over all point sets, not only subsets of $A$."
- **Stated label**: Open descent obligation / CONJECTURED.
- **Evidence present**: `Thm_Erdos9796Mission_minimal_counterexample_removable.lean:5` quantifies `∀ B : Finset Plane` and tests only `B.card < A.card`, nonemptiness, convex independence, and the four-equidistant property; it has no `B ⊆ A` hypothesis.
- **Actual label**: CONJECTURED, accurately rendered.
- **Verdict**: OK
- **Reason**: The prose preserves the global quantifier over every smaller finite set and the conclusion that some `x ∈ A` can be erased while the four-equidistant property remains. It does not replace the global hypothesis by a subset-only condition.

### F6: Pointwise positive radii are faithfully described

- **Location**: `mission-description.md:26-32`; `items.json:20-22`, `39-41`, and `75-80`
- **Quote**: "the radius may vary with the vertex" and "which may depend on that vertex."
- **Stated label**: Definition and theorem statements / CONJECTURED for theorem items.
- **Evidence present**: `Def_Erdos9796Mission.lean:38-45` places `∃ r : ℝ, r > 0` inside `∀ p ∈ B`.
- **Actual label**: CONJECTURED for the open theorem assertions, with accurate local quantifier description.
- **Verdict**: OK
- **Reason**: The metadata does not turn the radii into one common radius and preserves the strict positivity condition.

### F7: The unit-pair convention is faithfully described

- **Location**: `mission-description.md:30-32`, `README.md:37-39`, and `items.json:117`
- **Quote**: "counts unordered pairs at distance $1$" and "unordered pairs of distinct points at distance one, each pair once."
- **Stated label**: Definition-level description / conditional CONJECTURED bridge.
- **Evidence present**: `Def_Erdos9796Mission.lean:47-54` filters `A.sym2` by `0 < dist p q ∧ dist p q = 1` and counts the filtered symmetric-square pairs.
- **Actual label**: Accurate definition; theorem consequence remains CONJECTURED in the statement packet.
- **Verdict**: OK
- **Reason**: The prose preserves the unordered symmetric-square counting convention and the distance-one condition. The explicit positivity conjunct is redundant for Euclidean distance at one but is present in the code.

### F8: The platform/source proof boundary is correctly stated, but source closures are not audited here

- **Location**: `mission-description.md:88-107`; `README.md:9-19`; theorem preambles in `items.json:20-21`, `40`, `59`, `78`, `97`, `116`, `135`, and `154`
- **Quote**: "The source repository reports closed proofs"; "The current platform draft contains statement-level sketches and no imported source proofs"; "**SKETCH — NOT PROMOTABLE.**"
- **Stated label**: Source results reported as closed; platform items explicitly open/not promotable.
- **Evidence present**: The platform metadata's theorem formal statements all end in `by sorry`; the definition has no theorem assertion. Source URLs and declaration names are supplied, but this audit did not inspect those source proof files.
- **Actual label**: Platform theorem items are CONJECTURED. Source closure status is an unverified external report for this audit.
- **Verdict**: OK WITH EVIDENCE BOUNDARY
- **Reason**: The packet does not claim that its `sorry` declarations prove the source results. Do not upgrade the source links to platform PROVEN status until transfer, compilation, dependency, and axiom audits are performed.

## Weasel words

No automatic proof-context weasel words such as “clearly,” “obviously,” “trivially,”
“WLOG,” or “similarly” were found in the audited mission claims. The phrases
“source repository reports” and “intended dependency graph” are appropriately
cautious metadata descriptions, but they are not proof evidence.

## Scope conflation

The packet separates the open P97/P96 roots, the conditional bridge, and the
source repository's reported proof status. The witness formulas in F1 and F2 are
classical renderings of the negated definitions, and the updated bridge includes
the supremum/Big-O conclusion explicitly. No unresolved scope conflation remains
in the audited claims.

## Lean sorry graph

The platform theorem declarations in the audited packet are open statement
sketches: `danzer_nine`, `counterexample_card_ge_nine`,
`finite_nine_exclusion`, `minimal_counterexample_removable`,
`problem97`, `linear_bound_of_problem97`, `problem96`, and `combined` each have
`by sorry` in their `items.json` formal statement. Consequently no platform
theorem receives the Lean-formalized PROVEN label from this packet. The
definition payload has no asserted theorem, and this report does not certify any
external source theorem or its transitive dependency closure.

## Upgrade drift

No base commit or target diff was supplied for this audit. The visible metadata
does not upgrade the platform declarations: README and theorem preambles retain
the SKETCH/NOT PROMOTABLE status. The source links describe reported results but
provide no new in-packet proof evidence.

## Required before theorem promotion

1. Replace each platform theorem's `sorry` with a transferred proof and run the
   required compilation, `sorry`, axiom, and dependency-closure checks.
2. Keep all source proof references marked as external reports until the source
   files are transferred and independently checked for compilation, `sorry`,
   axioms, and dependency closure.
