# Math Skeptic Audit: strict-Kalmanson local-collapse producer checkpoint

**Target**: `docs/audits/2026-09-04-strict-kalmanson-local-collapse-producer.md`
**Date**: 2026-09-04
**Verdict**: CERTIFIED
**Claims audited**: 8

## Summary

The current checkpoint removes the historical 142-record selector as a producer
claim and states the correct finite scope: all inclusion-minimal one-comparison
equality collapses on exact supports four and five. The singleton-row reduction
is justified and independently checked at four roles over all 2¹² directed-atom
subsets. The canonical ordering and serialization are implemented and tested;
the n=12 stream reproduces the corrected externally reported SHA-256. The text
keeps the author catalog digest, the 42,504-clause n=11 bank, and all UNSAT or
general-n statements outside the established result. No blocker remains for
this producer checkpoint. The finite catalog and byte replay remain empirical,
not a general impossibility proof.

## Findings

### F1: Exhaustive finite scope is correctly stated

- **Location**: `docs/audits/2026-09-04-strict-kalmanson-local-collapse-producer.md:14-38,96-100`
- **Quote**: “a solver-free deterministic producer exhausts the inclusion-minimal one-Kalmanson equality collapses on exact supports four and five.”
- **Stated label**: EMPIRICALLY VERIFIED
- **Evidence present**: `complete_local_collapse_catalog` and the finite enumeration (`scripts/generate_strict_kalmanson_local_collapse_bank.py:239-280`); count/profile/minimality tests (`scripts/test_generate_strict_kalmanson_local_collapse_bank.py:30-61`).
- **Actual label**: EMPIRICALLY VERIFIED on exact role counts four and five
- **Verdict**: OK
- **Reason**: The checkpoint does not promote the 202-record computation to a general-`n` theorem or an UNSAT result.

### F2: Singleton-row reduction has adequate support

- **Location**: `docs/audits/2026-09-04-strict-kalmanson-local-collapse-producer.md:16-21`
- **Quote**: “A singleton row generates no edge equality; deleting its only atom leaves equality closure unchanged, so it cannot occur in an inclusion-minimal collapse core.”
- **Stated label**: implicit finite-enumeration justification
- **Evidence present**: `_row_choice_masks` documents the reduction (`scripts/generate_strict_kalmanson_local_collapse_bank.py:201-219`); the unrestricted test enumerates every nonempty subset of the 12 directed four-role atoms and compares the resulting minimal cores (`scripts/test_generate_strict_kalmanson_local_collapse_bank.py:64-75`).
- **Actual label**: EMPIRICALLY VERIFIED with a role-count-independent deletion argument
- **Verdict**: OK
- **Reason**: A singleton row contributes no same-center equality, so its removal leaves every quotient closure unchanged. The unrestricted four-role cross-check passes, and the same argument applies at five roles.

### F3: Collapse and no-solver boundaries are accurate

- **Location**: `docs/audits/2026-09-04-strict-kalmanson-local-collapse-producer.md:23-32,96-105`
- **Quote**: “No SAT, SMT, numerical geometry, or floating-point calculation enters this enumeration.”
- **Stated label**: solver-free finite computation
- **Evidence present**: `equality_components`, `collapsed_comparisons`, and one-atom deletion filtering (`scripts/generate_strict_kalmanson_local_collapse_bank.py:132-198,257-270`); focused tests (`scripts/test_generate_strict_kalmanson_local_collapse_bank.py:50-75`).
- **Actual label**: EMPIRICALLY VERIFIED encoded equality-collapse computation
- **Verdict**: OK
- **Reason**: Both Kalmanson forms are checked through quotient edge components, and no numerical or solver conclusion is claimed.

### F4: The historical 142-record correction is properly bounded

- **Location**: `docs/audits/2026-09-04-strict-kalmanson-local-collapse-producer.md:47-58`
- **Quote**: “Therefore the earlier width-10 deletion heuristic in this producer was false and has been removed.”
- **Stated label**: historical correction / count-only check
- **Evidence present**: external Wave 6 receipt cited as nthdegree message `#12335`; local test checks only the old support histogram (`scripts/test_generate_strict_kalmanson_local_collapse_bank.py:78-88`).
- **Actual label**: EXTERNAL REPORT, with local count consistency only
- **Verdict**: OK
- **Reason**: The checkpoint explicitly says the 142 records were a subset and that support counts do not select record identities. It no longer presents width-10 removal as a producer reconstruction.

### F5: Complete-Berge union and counts are supported

- **Location**: `docs/audits/2026-09-04-strict-kalmanson-local-collapse-producer.md:60-70,96-100`
- **Quote**: “The producer ... imports the existing complete 40-template three-row Berge classifier, verifies the Lean-derived Berge patterns against its pinned classifier, rejects cross-family overlap, and canonicalizes the union.”
- **Stated label**: EMPIRICALLY VERIFIED / bookkeeping
- **Evidence present**: classifier comparison and overlap guard (`scripts/generate_strict_kalmanson_local_collapse_bank.py:325-349`); full-support classifier tests and n=11/n=12 bank tests (`scripts/test_generate_strict_kalmanson_local_collapse_bank.py:91-118`).
- **Actual label**: EMPIRICALLY VERIFIED for the implemented families
- **Verdict**: OK
- **Reason**: The tests check 40 full-support Berge templates, exact lift counts, empty cross-family intersections, and the stated union sizes.

### F6: Canonical serialization and local n=11 replay are correctly labeled

- **Location**: `docs/audits/2026-09-04-strict-kalmanson-local-collapse-producer.md:72-86,96-101`
- **Quote**: “clause order `(width, lexicographic atom tuple)`”
- **Stated label**: EMPIRICALLY VERIFIED deterministic replay
- **Evidence present**: `canonical_bank_clauses` sorts by `(len(clause), clause)` (`scripts/generate_strict_kalmanson_local_collapse_bank.py:298-305`); serializers canonicalize, deduplicate, and terminate each line (`scripts/generate_strict_kalmanson_local_collapse_bank.py:452-482`); tests pin catalog bytes and n=11/n=12 stream sizes/hashes (`scripts/test_generate_strict_kalmanson_local_collapse_bank.py:91-155`).
- **Actual label**: EMPIRICALLY VERIFIED local serialization
- **Verdict**: OK
- **Reason**: The implementation matches the stated variable map, within-clause ordering, width-first global ordering, LF/header, and terminal-zero convention. The n=11 digest is presented as a local replay, not as external custody.

### F7: Exact n=12 hash match is not overstated as payload custody

- **Location**: `docs/audits/2026-09-04-strict-kalmanson-local-collapse-producer.md:81-92,101-104`
- **Quote**: “The `n=12` digest exactly matches the corrected author report. This is an independent byte replay ... not custody of the author's original payload.”
- **Stated label**: EMPIRICALLY VERIFIED byte match; original payload NOT ESTABLISHED
- **Evidence present**: local test compares the generated n=12 SHA with the pinned reported digest (`scripts/test_generate_strict_kalmanson_local_collapse_bank.py:106-118`); the corrected external receipt reports the same digest and 193,380 count.
- **Actual label**: EMPIRICALLY VERIFIED hash match, with source identity still unestablished
- **Verdict**: OK
- **Reason**: The checkpoint distinguishes reproducing a reported digest from possessing or independently validating the original payload and catalog serialization. It also keeps the author catalog digest `dbbae6a5...` explicitly unreproduced.

### F8: The 42,504-clause and impossibility boundaries are correct

- **Location**: `docs/audits/2026-09-04-strict-kalmanson-local-collapse-producer.md:5-12,94-105`
- **Quote**: “This checkpoint does not reconstruct the later 42,504-clause `n=11` CEGAR/base bank and makes no SAT, UNSAT, Euclidean, or general-`n` claim.”
- **Stated label**: NOT ESTABLISHED / CONJECTURED only for the broader question
- **Evidence present**: explicit claim-boundary table and producer module docstring (`scripts/generate_strict_kalmanson_local_collapse_bank.py:1-11`).
- **Actual label**: Correctly bounded
- **Verdict**: OK
- **Reason**: The local producer supplies clauses and finite replay evidence only. It does not claim the missing base, an UNSAT certificate, or strict all-center impossibility beyond its finite catalog scope.

## Weasel words

No prohibited proof-context weasel words occur in the target. “Corrected,”
“concrete,” and “independent” are accompanied by explicit evidence boundaries;
the hash match is not described as original-payload custody.

## Scope conflation

No material scope conflation remains. The target separates the complete local
catalog, complete-Berge union, historical subset correction, byte replay, author
catalog identity, missing 42,504-clause bank, and broader impossibility question.

## Lean sorry graph

Not applicable to the local-collapse producer claim. The target uses Python
enumeration and tests; the imported Berge classifier is checked as a pinned
semantic input, not presented here as a new Lean proof closure.

## Upgrade drift

No unsupported label upgrade was found. The formerly overstated 142-record
width-selection reconstruction is explicitly removed, and the exact n=12 hash
match is labeled empirical rather than source custody or proof.

## Required before CERTIFIED

None for this checkpoint. Any future claim of author catalog identity, the
42,504-clause base, UNSAT, or a general-`n` impossibility result requires its own
payload and verification evidence.
