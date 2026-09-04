# Math Skeptic Audit: strict-Kalmanson catalog identity custody audit

**Target**: `docs/audits/2026-09-04-strict-kalmanson-catalog-identity.md`
**Date**: 2026-09-04
**Verdict**: NEEDS WORK
**Claims audited**: 6

## Summary

The document correctly separates the 202-record semantic reproduction, the
193,380-clause n=12 bank hash, the external catalog digest `dbbae6a5...`, and
the undelivered archive `76af0391...`. Its serializer search is explicitly
bounded and does not claim that no undisclosed serializer can match. Two custody
details still need tightening: the 11,960-variant negative search has no retained
replay artifact or manifest, and the acceptance protocol describes received-byte
delivery but not the generator/verifier-only delivery allowed by the opening
paragraph. These are protocol and reproducibility gaps, not evidence for catalog
identity.

## Findings

### F1: Semantic 202-record reproduction is correctly labeled

- **Location**: `docs/audits/2026-09-04-strict-kalmanson-catalog-identity.md:18-40,121-127`
- **Quote**: “the 202-record semantic catalog is independently reproduced, but the target catalog byte identity is not locally reproducible.”
- **Stated label**: EMPIRICALLY VERIFIED semantics; target byte identity not reproducible
- **Evidence present**: local producer and focused tests; local diagnostic JSONL digest `eb9d60...` is explicitly called repository-local.
- **Actual label**: EMPIRICALLY VERIFIED local semantic catalog, with external byte identity unestablished
- **Verdict**: OK
- **Reason**: The document does not turn the 202-record count or local serialization into proof of the author’s catalog bytes.

### F2: The n=12 bank hash is properly separated from catalog-byte custody

- **Location**: `docs/audits/2026-09-04-strict-kalmanson-catalog-identity.md:29-35,123-127`
- **Quote**: “This authenticates the complete local bank semantics under the published bank serializer without authenticating the separate catalog object.”
- **Stated label**: EMPIRICALLY VERIFIED n=12 bank replay; catalog object not authenticated
- **Evidence present**: producer/test replay of 193,380 clauses and SHA `93407f5...`; corrected Wave-6 receipt reports the same count and digest.
- **Actual label**: EMPIRICALLY VERIFIED hash replay, not source-payload custody
- **Verdict**: OK
- **Reason**: A bank-hash match is kept distinct from the missing catalog serializer and the author-reported catalog digest `dbbae6a5...`.

### F3: The bounded negative serializer search is not overstated, but its evidence is not durable

- **Location**: `docs/audits/2026-09-04-strict-kalmanson-catalog-identity.md:79-104`
- **Quote**: “None matched `dbbae6a5...`. This is a bounded negative result, not a claim that no undisclosed serializer can produce the target.”
- **Stated label**: bounded negative result
- **Evidence present**: prose inventory of 11,960 variants across listed representation, ordering, and wrapper families; no search script, result ledger, or manifest is cited.
- **Actual label**: BOUNDED UNREPRODUCED SEARCH, not a universal negative
- **Verdict**: CLARIFY
- **Reason**: The scope is explicit enough to avoid a false universal claim, and the wording is appropriately cautious. However, the count and “two independent lanes” cannot be independently replayed from the repository because no retained artifact or command manifest is supplied. Call it a reported bounded search, or retain a manifest and replay receipt before using it as custody evidence.

### F4: Archive absence should name the inspected search scope

- **Location**: `docs/audits/2026-09-04-strict-kalmanson-catalog-identity.md:42-77,123-128`
- **Quote**: “No such archive or archive attachment is present locally.”
- **Stated label**: NOT DELIVERED
- **Evidence present**: local Wave-6 prose file with size and SHA; message `#12335` names the claimed archive digest but no archive attachment; no archive path is listed.
- **Actual label**: NOT FOUND IN THE INSPECTED LOCAL LOCATIONS
- **Verdict**: CLARIFY
- **Reason**: The custody conclusion is supported for the inspected Downloads/conversation delivery, but “present locally” is broader than the documented search scope. Replace it with “not found in the inspected local delivery locations” or add the exact inventory/search scope. The claim must not imply that every filesystem location was exhaustively searched.

### F5: The later acceptance protocol needs a code-only delivery branch

- **Location**: `docs/audits/2026-09-04-strict-kalmanson-catalog-identity.md:14-16,106-119`
- **Quote**: “The smallest missing item is either the exact bytes hashed to obtain the target or the generator/verifier code defining those bytes ...” followed by “hash the received bytes before parsing.”
- **Stated label**: proposed acceptance protocol
- **Evidence present**: seven checks covering byte hashing, identity procedure, record parsing, semantic validation, comparison with 202 patterns, and n=12 bank replay.
- **Actual label**: Incomplete for the stated generator/verifier-only delivery path
- **Verdict**: CLARIFY
- **Reason**: If only code is delivered, there are no received catalog bytes for step 1. The protocol should branch: hash any supplied bytes before parsing; otherwise hash the generator’s deterministic output before parsing, while preserving the delivered code and environment as evidence. The current seven checks are adequate for byte delivery but do not fully specify the alternative named at lines 14-16.

### F6: Claim boundaries and prohibited prose checks are sound

- **Location**: `docs/audits/2026-09-04-strict-kalmanson-catalog-identity.md:121-128`; cross-reference `docs/audits/2026-09-04-strict-kalmanson-local-collapse-producer.md:40-48`
- **Quote**: “author catalog identity `dbbae6a5...` | EXTERNAL REPORT; NOT AUTHENTICATED LOCALLY”
- **Stated label**: EXTERNAL REPORT / NOT AUTHENTICATED LOCALLY
- **Evidence present**: explicit status table and cross-reference to the bounded custody audit; neither document claims the 42,504-clause bank, UNSAT, or general-`n` result.
- **Actual label**: Correctly bounded
- **Verdict**: OK
- **Reason**: The semantic catalog, n=12 bank hash, author digest, and absent archive have distinct statuses. Neither target file contains the project-banned comparison-language forms, and no unsupported proof label upgrade is present.

## Weasel words

No prohibited proof-context weasel words were found. The negative search uses
“bounded” and explicitly denies a universal conclusion, which is appropriate.

## Scope conflation

The document avoids conflating semantic record reproduction with catalog-byte
identity and avoids treating the n=12 bank hash as proof of the separate catalog
object. F4 and F5 identify the remaining scope/protocol clarifications.

## Lean sorry graph

Not applicable. This is a custody and serializer audit; no Lean-backed theorem
is presented as the basis for the catalog identity claim.

## Upgrade drift

No unsupported upgrade was found. The target remains appropriately empirical for
the local catalog and n=12 byte replay, and keeps the author digest and archive
as unauthenticated or undelivered.

## Required before CERTIFIED

- Retain a bounded-search manifest/receipt, or label the 11,960-variant count as an unreplayed report.
- Add a generator/verifier-only branch to the acceptance protocol.
- Narrow “present locally” to the inspected delivery locations or document a complete search inventory.
