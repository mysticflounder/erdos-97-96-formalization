# Math Skeptic Audit: strict-Kalmanson local-collapse producer checkpoint

**Target**: `docs/audits/2026-09-04-strict-kalmanson-local-collapse-producer.md`
**Date**: 2026-09-04
**Verdict**: CERTIFIED
**Claims audited**: 9

## Summary

The corrected checkpoint now labels the result at the strength supported by its
evidence. The reduced enumeration is justified by the singleton-row deletion
argument, and a direct unrestricted enumeration over all 2¹² directed-atom
subsets at four roles reproduces the reduced result. The aggregate reconstruction
is explicitly conditional on the increasing-subset lift model, and the width-10
choice is explicitly described as one count-matched selector rather than an
identified external catalog. The focused suite passes all 12 tests and Ruff
passes. No Lean-backed or solver-backed proof claim is made.

## Findings

### F1: Reduced enumeration is now properly justified

- **Location**: `docs/audits/2026-09-04-strict-kalmanson-local-collapse-producer.md:11-17`
- **Quote**: “A row with one retained membership generates no edge equality; deleting that membership leaves the closure unchanged, so it cannot occur in an inclusion-minimal collapse core.”
- **Stated label**: implicit EMPIRICALLY VERIFIED finite enumeration
- **Evidence present**: `_row_choice_masks` documents the reduction (`scripts/generate_strict_kalmanson_local_collapse_bank.py:195-213`); the test enumerates every nonempty subset of the 12 directed atoms and compares its minimal cores with the reduced enumeration (`scripts/test_generate_strict_kalmanson_local_collapse_bank.py:71-82`).
- **Actual label**: EMPIRICALLY VERIFIED, with the stated deletion reduction
- **Verdict**: OK
- **Reason**: A singleton row contributes no same-center equality, so deleting its sole atom leaves every equality component and collapse witness unchanged. The unrestricted four-role cross-check independently exercises the reduction over all directed-atom subsets. The same argument is role-count independent.

### F2: Finite catalog counts and profiles carry the correct label

- **Location**: `docs/audits/2026-09-04-strict-kalmanson-local-collapse-producer.md:29-38,121-126`
- **Quote**: “The complete independently generated catalog has ... **total** ... **202**.”
- **Stated label**: EMPIRICALLY VERIFIED, exhaustive reduced finite enumeration
- **Evidence present**: enumeration loop and minimality filter (`scripts/generate_strict_kalmanson_local_collapse_bank.py:233-264`); count, width, profile, support, and deletion tests (`scripts/test_generate_strict_kalmanson_local_collapse_bank.py:37-68`).
- **Actual label**: EMPIRICALLY VERIFIED on the stated finite role counts
- **Verdict**: OK
- **Reason**: The checkpoint no longer presents this finite computation as a general theorem or as source custody of the external catalog. The tests pass with 12 tests total.

### F3: Equality-collapse predicate matches the stated obstruction

- **Location**: `docs/audits/2026-09-04-strict-kalmanson-local-collapse-producer.md:18-27`
- **Quote**: “retains the core only when some comparison has the same two quotient-edge components on its two sides”
- **Stated label**: implicit EMPIRICALLY VERIFIED
- **Evidence present**: `equality_components` and `collapsed_comparisons` (`scripts/generate_strict_kalmanson_local_collapse_bank.py:132-170`); per-pattern collapse and minimality assertions (`scripts/test_generate_strict_kalmanson_local_collapse_bank.py:57-68`).
- **Actual label**: EMPIRICALLY VERIFIED for the encoded equality-closure predicate
- **Verdict**: OK
- **Reason**: The implementation unions selected same-center incident edges and checks both Kalmanson forms for every increasing quadruple. The checkpoint correctly says that no numerical geometry or solver is part of this enumeration.

### F4: Support-histogram arithmetic is correctly conditional

- **Location**: `docs/audits/2026-09-04-strict-kalmanson-local-collapse-producer.md:48-67,121-130`
- **Quote**: “If the records have exact support four or five, their histogram is uniquely forced ... so `a4=12` and `a5=130`.”
- **Stated label**: PROVEN arithmetic from the stated lift model
- **Evidence present**: `solve_two_support_histogram` and its focused test (`scripts/generate_strict_kalmanson_local_collapse_bank.py:351-367`; `scripts/test_generate_strict_kalmanson_local_collapse_bank.py:85-104`).
- **Actual label**: PROVEN arithmetic under the explicit assumptions
- **Verdict**: OK
- **Reason**: The support assumption and one-increasing-subset lift model are stated before the equations. The test checks the unique solution `(12,130)`. No claim is made that the external producer used this model.

### F5: Catalog membership uncertainty is now explicit

- **Location**: `docs/audits/2026-09-04-strict-kalmanson-local-collapse-producer.md:63-67,79-86,121-130`
- **Quote**: “Removing that width class gives one count-matched `12+130` catalog. The arithmetic does not distinguish this choice from another 130-element subset of the 190 five-role candidates.”
- **Stated label**: HEURISTIC reconstruction candidate
- **Evidence present**: `count_matched_wave5_catalog` (`scripts/generate_strict_kalmanson_local_collapse_bank.py:277-288`), aggregate tests, and the explicit non-identification statement.
- **Actual label**: HEURISTIC / count-consistency candidate
- **Verdict**: OK
- **Reason**: The corrected wording no longer promotes width-10 deletion to an inferred catalog identity. It expressly records that aggregate counts cannot distinguish the selected 130 records.

### F6: Aggregate checks are correctly described as sharing a model

- **Location**: `docs/audits/2026-09-04-strict-kalmanson-local-collapse-producer.md:69-86`
- **Quote**: “The n=11 and n=12 totals are two aggregate consistency checks under the same local-catalog and increasing-subset lift model.”
- **Stated label**: consistency evidence, not proof of source identity
- **Evidence present**: bank-count tests (`scripts/test_generate_strict_kalmanson_local_collapse_bank.py:107-137`) and the explicit source-authentication disclaimer.
- **Actual label**: EMPIRICALLY VERIFIED consistency checks under the stated model
- **Verdict**: OK
- **Reason**: The revised text avoids calling the checks independent evidence of catalog membership and keeps the external byte-hash mismatch visible.

### F7: Cross-family disjointness is supported

- **Location**: `docs/audits/2026-09-04-strict-kalmanson-local-collapse-producer.md:76-82`
- **Quote**: “There is no cross-family overlap because every local clause has exact support at most five and every complete-Berge clause has exact support six.”
- **Stated label**: implicit PROVEN bookkeeping
- **Evidence present**: local four/five-role lifting (`scripts/generate_strict_kalmanson_local_collapse_bank.py:314-326`) and full-support complete-Berge tests (`scripts/test_generate_strict_kalmanson_known_clause_census.py:49-74`); intersection checks in the producer tests (`scripts/test_generate_strict_kalmanson_local_collapse_bank.py:107-125`).
- **Actual label**: PROVEN bookkeeping for the two implemented families
- **Verdict**: OK
- **Reason**: The support carriers are disjoint, and the tests check empty intersections at both n=11 and n=12.

### F8: Local hashes are not presented as external custody

- **Location**: `docs/audits/2026-09-04-strict-kalmanson-local-collapse-producer.md:88-105`
- **Quote**: “The independent n=12 stream hash does not match the reported external hash ... A matching clause count is not byte custody.”
- **Stated label**: local deterministic replay; external identity NOT ESTABLISHED
- **Evidence present**: deterministic serializers (`scripts/generate_strict_kalmanson_local_collapse_bank.py:428-456`) and pinned byte/hash tests (`scripts/test_generate_strict_kalmanson_local_collapse_bank.py:107-125,140-160`).
- **Actual label**: EMPIRICALLY VERIFIED local serialization; external identity NOT ESTABLISHED
- **Verdict**: OK
- **Reason**: The local sizes and hashes are replayed, while the checkpoint expressly refuses to treat them as custody of the announced external stream.

### F9: Missing 42,504-clause reconstruction remains correctly unestablished

- **Location**: `docs/audits/2026-09-04-strict-kalmanson-local-collapse-producer.md:107-130`
- **Quote**: “This producer does **not** reconstruct the later 42,504-clause base.”
- **Stated label**: NOT ESTABLISHED
- **Evidence present**: relation-to-missing-base discussion and evidence-label table.
- **Actual label**: NOT ESTABLISHED
- **Verdict**: OK
- **Reason**: The target clearly separates the 82,500-clause count-matched candidate from the missing 42,504-clause source bank and does not claim UNSAT or source recovery.

## Weasel words

No prohibited proof-context words or unsupported certainty markers occur in the
mathematical claims. “Concrete reconstruction candidate” and “inferred” are
properly bounded by the surrounding non-authentication statements.

## Scope conflation

No material scope conflation remains. The target separates finite enumeration,
conditional arithmetic, aggregate consistency, external byte identity, and the
42,504-clause reconstruction.

## Lean sorry graph

Not applicable. The target makes no Lean-backed claim and cites no Lean theorem
as proof evidence.

## Upgrade drift

The previous audit’s two required label clarifications are present in the target:
the reduced search space is justified and cross-checked, and the width-10 choice
is downgraded to a heuristic/count-matched candidate. No unsupported upgrade to
PROVEN was found.

## Required before CERTIFIED

None for this checkpoint. Any future claim of external catalog identity, the
42,504-clause reconstruction, or UNSAT would require separate source custody and
verification evidence.
