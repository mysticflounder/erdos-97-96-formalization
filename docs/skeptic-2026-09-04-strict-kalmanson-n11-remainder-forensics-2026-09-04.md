# Math Skeptic Audit: Strict-Kalmanson n=11 remainder forensics

**Target**: `docs/audits/2026-09-04-strict-kalmanson-n11-remainder-forensics.md`  
**Date**: 2026-09-04  
**Verdict**: NEEDS WORK  
**Claims audited**: 15 grouped mathematical and computational claims

## Summary

The target is substantially careful about the finite scope: it does not promote
the 22,660 remainder to a producer decomposition, and it separates the
announced bank from locally reproduced clauses. The focused tests pass and the
survivor verifier checks 33 row equalities, 660 strict Kalmanson comparisons,
and 495 strict triangle comparisons at n=11.

The file is not ready for CERTIFIED because two table labels are provenance
descriptions rather than rigor categories, the Lean chain is left explicitly
unclassified despite a bounded closure check now available, and the broad
“other searched families” negative claims have no cited enumeration artifact or
scope. The arithmetic identity itself is correct, but its PROVEN label must
identify the direct pen-and-paper calculation (or a named checked lemma) under
the skeptic format.

## Findings

### F1: Arithmetic PROVEN label lacks the required proof citation

- **Location**: target:27
- **Quote**: “This identity is **PROVEN by integer arithmetic**.”
- **Stated label**: PROVEN
- **Evidence present**: The displayed calculation and `scripts/test_audit_strict_kalmanson_n11_remainder.py::test_arithmetic_fingerprint_is_exact_but_unclaimed`; no named Lean lemma or cited pen-and-paper proof file.
- **Actual label**: PROVEN, direct finite arithmetic
- **Verdict**: CLARIFY
- **Reason**: The subtraction and multiplication are gap-free and correct, but the skeptic format requires the proof kind and citation for a PROVEN claim. Identify the displayed calculation as the pen-and-paper proof, or cite a dedicated checked arithmetic lemma. The focused Python test is evidence of reproduction, not a kernel proof.

### F2: “External announcement” is not a rigor category

- **Location**: target:47-49
- **Quote**: “42,504 base and 375,144 augmented bank | external announcement | nthdegree message #10544; bytes and proof absent”
- **Stated label**: external announcement
- **Evidence present**: nthdegree message #10544 reports the counts and an exact UNSAT status, but supplies neither the bank bytes nor a replay trace.
- **Actual label**: HEURISTIC (external report only)
- **Verdict**: CLARIFY
- **Reason**: Provenance is not proof status. Until the bytes and a checkable search proof exist, classify the count/UNSAT statements as HEURISTIC external reports, not as any form of PROVEN or EMPIRICALLY VERIFIED result. The surrounding prose correctly says the custody is missing.

### F3: Lean chain status is left outside the permitted categories

- **Location**: target:51,153-156
- **Quote**: “displayed planar chain obstruction | Lean declaration present; closure not classified here”
- **Stated label**: unclassified Lean declaration
- **Evidence present**: `lean/Erdos9796Proof/P97/ATail/ThreeEquilateralChainCollision.lean`, theorem `Problem97.false_of_realizes_three_equilateral_chain`; source re-elaboration succeeds and `#print axioms` reports only `[propext, Classical.choice, Quot.sound]`.
- **Actual label**: PROVEN, Lean-formalized (for the stated theorem and hypotheses)
- **Verdict**: CLARIFY
- **Reason**: The theorem has an explicit body, no `sorry`, and no custom axiom in its reported transitive closure. The target need not promote the theorem to the computational bank, but it must give the exact Lean-formalized label and axiom result while separately stating that no bank ingress/consumer closure was audited. This distinguishes theorem proof from missing finite-bank custody.

### F4: Broad negative inventory claims lack a reproducible scope

- **Location**: target:126-145
- **Quote**: “The following bounded inventories did not produce the missing 49-plus-22 producer:”
- **Stated label**: implicit finite/source fact
- **Evidence present**: Source files are named, but no script, manifest, exact candidate universe, or per-family deduplication result is cited for the listed 2K3, S1/S2/S3, unordered-D, endpoint, adjacent-grid, ordinal-cycle, and weighted-ingress claims.
- **Actual label**: HEURISTIC, until the candidate universe and enumeration are documented
- **Verdict**: CLARIFY
- **Reason**: “Bounded” alone does not state what was enumerated. In particular, “did not produce” and “do not define fixed uniform row-only banks” need the finite input set and verification command. Attach a ledger/script and scope, or downgrade these bullets to explicitly local, unaudited search notes. The final sentence correctly prevents their use as proof of inclusion in the announced base.

### F5: Whole-block subset test must distinguish arithmetic sums from deduplicated unions

- **Location**: target:105-109
- **Quote**: “No subset of the eleven whole schema blocks sums to either 22,660 or the expanded-union difference 13,486.”
- **Stated label**: implicit finite enumeration fact
- **Evidence present**: `scripts/audit_strict_kalmanson_n11_remainder.py` computes `matching_family_subsets` by summing the individual block counts; it does not compute each subset’s deduplicated union.
- **Actual label**: EMPIRICALLY VERIFIED, n=11 arithmetic block-count test
- **Verdict**: CLARIFY
- **Reason**: The implementation supports “the sum of the eleven listed block counts,” not “the distinct clause count of a subset.” Since the surrounding paragraph discusses unions and deduplication, state explicitly which operation is meant. This is not a defect in the reported arithmetic test, but the current sentence permits a stronger reading than the code establishes.

## Weasel words

No automatic proof-context weasel words were found in the target. “Heuristic,”
“external announcement,” and “unverified” are useful evidence-boundary labels,
though the first two need the category clarification noted above.

## Scope conflation

The target generally keeps the abstract n=11 metric witness separate from the
Euclidean obstruction and from the missing announced bank. The sentence
“abstract strict-Kalmanson impossibility is refuted at n=11” is supported only
for the stated finite all-center row abstraction; it must not be read as a
general Euclidean or all-n conclusion. The surrounding scope and the final
paragraph make that boundary explicit, so no downgrade is required.

## Lean sorry graph

No `sorry`, `native_decide`, `unsafe`, `@[implemented_by]`, or `@[extern]` was
found in the inspected theorem sources. Re-elaborating
`Problem97.false_of_realizes_three_equilateral_chain` reports only
`[propext, Classical.choice, Quot.sound]`; the K2 theorem likewise reports only
core axioms. The target’s statement that it did not perform a transitive audit
was conservative, but it must now report this bounded result and distinguish
it from bank-ingress reachability.

## Upgrade drift

No base commit was supplied, so upgrade drift cannot be assessed. The current
labels do not promote the external 42,504-clause announcement or case-20 UNSAT
to a locally verified result.

## Required before CERTIFIED

- Name the proof kind/citation for the arithmetic PROVEN claim.
- Replace provenance-only table labels with explicit unverified/HEURISTIC
  status until the announced bank and UNSAT trace are reproducible.
- Label the equilateral-chain theorem as Lean-formalized with its core-only
  axiom closure, while retaining the separate bank-ingress caveat.
- Provide a finite ledger and exact scope for every “other searched families”
  negative claim.
- Clarify whether the whole-block subset statement uses raw arithmetic sums or
  deduplicated unions.
