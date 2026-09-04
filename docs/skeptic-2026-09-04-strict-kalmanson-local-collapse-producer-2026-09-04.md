# Math Skeptic Audit: strict-Kalmanson local-collapse producer checkpoint

**Target**: `docs/audits/2026-09-04-strict-kalmanson-local-collapse-producer.md`
**Date**: 2026-09-04
**Verdict**: NEEDS WORK
**Claims audited**: 9

## Summary

The checkpoint is careful not to claim recovery of the unavailable 42,504-clause
bank, and its finite count and digest claims are reproducible: the focused suite
passes all 11 tests. The largest rigor issue is the word “exhausts”: the producer
enumerates a reduced search space that omits singleton rows, but the checkpoint
does not state the short deletion argument showing that a singleton-row atom
cannot occur in an inclusion-minimal equality collapse. The Wave-5 aggregate
arithmetic also supports only a support histogram under an explicit lift model;
it does not select the 130 five-role records or authenticate their membership.
Add those qualifications and a direct completeness lemma or test before marking
the checkpoint CERTIFIED.

## Findings

### F1: Finite catalog counts are correctly labeled

- **Location**: `docs/audits/2026-09-04-strict-kalmanson-local-collapse-producer.md:24-33,116-117`
- **Quote**: “The complete independently generated catalog has: ... **total** ... **202**”
- **Stated label**: EMPIRICALLY VERIFIED
- **Evidence present**: `scripts/generate_strict_kalmanson_local_collapse_bank.py:226-257`; focused tests `scripts/test_generate_strict_kalmanson_local_collapse_bank.py:37-55,57-68`
- **Actual label**: EMPIRICALLY VERIFIED on the implemented finite search
- **Verdict**: OK
- **Reason**: The implementation computes the finite catalog and the focused tests check counts, width histograms, row profiles, exact support, collapse witnesses, and deletion minimality. This does not establish the external catalog’s identity, which the checkpoint separately disclaims.

### F2: “Exhausts directed ... cores” needs the missing reduction lemma

- **Location**: `docs/audits/2026-09-04-strict-kalmanson-local-collapse-producer.md:11-19`
- **Quote**: “`...` exhausts directed selected-membership cores on exactly four or five cyclically ordered roles.”
- **Stated label**: implicit EMPIRICALLY VERIFIED / exhaustive
- **Evidence present**: `_row_choice_masks` only creates row choices of width 0 or at least 2 (`scripts/generate_strict_kalmanson_local_collapse_bank.py:195-206`); the main product loop is at lines 244-257.
- **Actual label**: EMPIRICALLY VERIFIED conditional on a reduction lemma
- **Verdict**: CLARIFY
- **Reason**: The code does not enumerate arbitrary directed membership subsets: it omits a row containing exactly one selected atom. The omission is plausibly sound because deleting such an atom leaves all same-center equality closures unchanged, so it cannot be inclusion-minimal for a collapse. That argument is not stated or tested at the checkpoint. State it explicitly, or add a direct cross-check over the unrestricted subsets for the small role counts, before using “exhausts” without qualification.

### F3: The collapse predicate matches the stated equality-closure test

- **Location**: `docs/audits/2026-09-04-strict-kalmanson-local-collapse-producer.md:15-19`
- **Quote**: “retains the core only when some comparison has the same two quotient-edge components on its two sides”
- **Stated label**: implicit EMPIRICALLY VERIFIED
- **Evidence present**: `equality_components` and `collapsed_comparisons` in `scripts/generate_strict_kalmanson_local_collapse_bank.py:132-170`; tests at lines 57-68.
- **Actual label**: EMPIRICALLY VERIFIED for the encoded predicate
- **Verdict**: OK
- **Reason**: The implementation unions exactly the selected same-center incident edges and compares the two unordered pairs of quotient representatives for both Kalmanson forms on every increasing quadruple. No numerical or solver claim is hidden in this check.

### F4: The two-support arithmetic is conditional, not an unconditional catalog reconstruction

- **Location**: `docs/audits/2026-09-04-strict-kalmanson-local-collapse-producer.md:43-60,112-120`
- **Quote**: “If the records have exact support four or five, their histogram is uniquely forced ... so `a4=12` and `a5=130`.”
- **Stated label**: PROVEN arithmetic from the stated lift model
- **Evidence present**: `solve_two_support_histogram` and focused test `scripts/test_generate_strict_kalmanson_local_collapse_bank.py:71-90`.
- **Actual label**: PROVEN arithmetic under the explicitly stated support and one-increasing-subset-lift assumptions
- **Verdict**: OK
- **Reason**: The conditional is visible in the checkpoint, the integer solution is unique under that model, and the test checks `(12,130)`. The result does not imply that the external producer used that model.

### F5: Width-10 deletion does not identify the external 130 records

- **Location**: `docs/audits/2026-09-04-strict-kalmanson-local-collapse-producer.md:58-77`
- **Quote**: “Removing that width class gives exactly the forced `12+130` catalog.”
- **Stated label**: INFERRED
- **Evidence present**: Candidate enumeration and `count_matched_wave5_catalog` (`scripts/generate_strict_kalmanson_local_collapse_bank.py:270-281`); no external catalog payload or source serializer.
- **Actual label**: INFERRED, with only aggregate-count support
- **Verdict**: CLARIFY
- **Reason**: The count equations force the numbers of support-four and support-five records, but every support-five record contributes the same number of increasing-subset lifts. The aggregate therefore cannot distinguish the selected 130 records. The checkpoint eventually says source authentication is absent, but should state directly that width-10 removal is one count-matched selector, not a consequence fixing catalog membership.

### F6: The “two independent aggregate matches” share the same reconstruction assumptions

- **Location**: `docs/audits/2026-09-04-strict-kalmanson-local-collapse-producer.md:62-77`
- **Quote**: “These two independent aggregate matches make the width-10 deletion the leading reconstruction of the Wave-4 catalog rule.”
- **Stated label**: INFERRED
- **Evidence present**: The same count-selected catalog and lift rule produce both rows of the table; the external Wave-5 attachment supplies the n=12 count, while the n=11 comparison is an older reported aggregate.
- **Actual label**: INFERRED / heuristic evidence for selector choice
- **Verdict**: CLARIFY
- **Reason**: The n=11 and n=12 totals are useful consistency checks, but they are not independent tests of catalog membership: both are generated from the same local pattern set and lift convention, and the external n=12 byte hash does not match (`:93-96`). Replace “two independent aggregate matches” with “two aggregate consistency checks under the same model,” or explain exactly what independence is meant.

### F7: The no-overlap claim is supported by the imported full-support invariant

- **Location**: `docs/audits/2026-09-04-strict-kalmanson-local-collapse-producer.md:69-73`
- **Quote**: “There is no cross-family overlap because every local clause has exact support at most five and every complete-Berge clause has exact support six.”
- **Stated label**: implicit PROVEN / bookkeeping
- **Evidence present**: Local instantiation uses four- or five-role patterns (`scripts/generate_strict_kalmanson_local_collapse_bank.py:260-311`); the complete-Berge tests verify 40 full-support six-role patterns and exact instantiation counts (`scripts/test_generate_strict_kalmanson_known_clause_census.py:49-74`).
- **Actual label**: PROVEN bookkeeping for these two implemented families
- **Verdict**: OK
- **Reason**: Any local lifted clause has at most five labels, while each imported complete-Berge pattern is full-support on a six-subset. The checkpoint’s own bank test also checks empty intersection at n=11 and n=12.

### F8: Stream hashes are self-consistency evidence, not external custody

- **Location**: `docs/audits/2026-09-04-strict-kalmanson-local-collapse-producer.md:79-96`
- **Quote**: “The count-selected banks are: ... SHA-256 ...”
- **Stated label**: independent stream identities; external identity explicitly NOT ESTABLISHED
- **Evidence present**: deterministic serializers `scripts/generate_strict_kalmanson_local_collapse_bank.py:428-456`; pinned focused tests `scripts/test_generate_strict_kalmanson_local_collapse_bank.py:93-125,140-160`.
- **Actual label**: EMPIRICALLY VERIFIED self-generated bytes; external identity NOT ESTABLISHED
- **Verdict**: OK
- **Reason**: The bytes, sizes, and local hashes replay exactly, and the checkpoint explicitly records the mismatch with the reported external n=12 hash. The local digest must not be described as custody of the external bank.

### F9: No Lean sorry or axiom audit applies, but the report should not imply formal proof

- **Location**: `docs/audits/2026-09-04-strict-kalmanson-local-collapse-producer.md:112-121`
- **Quote**: “12 four-role and 190 five-role minimal local collapses | EMPIRICALLY VERIFIED, exhaustive finite enumeration”
- **Stated label**: EMPIRICALLY VERIFIED
- **Evidence present**: Python producer and focused tests; no Lean declaration or pen-and-paper proof is cited.
- **Actual label**: EMPIRICALLY VERIFIED
- **Verdict**: OK
- **Reason**: The checkpoint does not label the finite enumeration as Lean-formalized or as a general mathematical theorem. There is no Lean sorry graph to inspect. The qualification in F2 is the remaining completeness concern.

## Weasel words

No prohibited proof-context words such as “clearly,” “obviously,” “trivially,” or
“WLOG” occur in the target. “Leading reconstruction” is appropriately marked as
inferred, but should carry the shared-model qualification in F6.

## Scope conflation

The checkpoint keeps the 42,504-clause n=11 base separate from the 82,500-clause
candidate and explicitly says that source identity is absent. The remaining scope
conflation is between matching aggregate counts and identifying the external
catalog membership (F5-F6).

## Lean sorry graph

Not applicable: the target cites Python enumeration and tests, not a Lean-backed
theorem. No Lean proof closure is claimed.

## Upgrade drift

No unsupported upgrade to PROVEN was found for the main finite catalog claims.
The only needed label correction is to qualify “exhausts” by the omitted-singleton
row reduction (F2) and to distinguish aggregate consistency from source custody
(F5-F6).

## Required before CERTIFIED

- State the deletion argument that rules out singleton rows in an inclusion-minimal collapse, or add an unrestricted small-role cross-check.
- State that aggregate counts determine only the support histogram; width-10 removal is a count-matched selector whose membership is not authenticated.
- Replace “two independent aggregate matches” with wording that records their shared lift/catalog assumptions.
