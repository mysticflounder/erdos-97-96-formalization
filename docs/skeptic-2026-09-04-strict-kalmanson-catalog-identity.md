# Math Skeptic Audit: strict-Kalmanson catalog identity custody audit

**Target**: `docs/audits/2026-09-04-strict-kalmanson-catalog-identity.md`
**Date**: 2026-09-04
**Verdict**: CERTIFIED
**Claims audited**: 6

## Summary

The custody lane now has durable, replayable evidence for its bounded negative
serializer search. The scan reproduces 11,960 attempts across 5,520 unique
payload digests with zero target matches and report self-hash `e74c8916...`;
its three focused tests and Ruff check pass. The document keeps semantic
202-record reproduction, n=12 bank-hash reproduction, the external catalog
digest `dbbae6a5...`, and the absent archive `76af0391...` as distinct claims.
Archive absence is limited to named delivery locations, and the acceptance
protocol now has separate payload and generator/verifier branches. No current
blocker remains. The negative result is bounded to the documented families and
does not exclude an undisclosed serializer.

## Findings

### F1: Semantic catalog reproduction is correctly labeled

- **Location**: `docs/audits/2026-09-04-strict-kalmanson-catalog-identity.md:18-40,139-146`
- **Quote**: “the 202-record semantic catalog is independently reproduced, but the target catalog byte identity is not locally reproducible.”
- **Stated label**: EMPIRICALLY VERIFIED semantics; target bytes unestablished
- **Evidence present**: local producer, focused producer tests, and repository-local diagnostic JSONL digest.
- **Actual label**: EMPIRICALLY VERIFIED local semantic catalog; external catalog bytes NOT AUTHENTICATED LOCALLY
- **Verdict**: OK
- **Reason**: The document distinguishes the 202-record semantic result from the author-reported catalog object and does not promote the local diagnostic digest to source identity.

### F2: The n=12 bank hash is properly separated from catalog custody

- **Location**: `docs/audits/2026-09-04-strict-kalmanson-catalog-identity.md:29-35,141-146`
- **Quote**: “This authenticates the complete local bank semantics under the published bank serializer without authenticating the separate catalog object.”
- **Stated label**: EMPIRICALLY VERIFIED bank replay; catalog object unauthenticated
- **Evidence present**: producer replay of 193,380 clauses and SHA `93407f5...`; corrected external report supplies the same count and digest.
- **Actual label**: EMPIRICALLY VERIFIED hash replay, not original-payload custody
- **Verdict**: OK
- **Reason**: The n=12 bank hash is not used to assert the separate author catalog digest `dbbae6a5...`.

### F3: The negative serializer search is durable and appropriately bounded

- **Location**: `docs/audits/2026-09-04-strict-kalmanson-catalog-identity.md:82-113`
- **Quote**: “These are bounded negative results, not a claim that no undisclosed serializer can produce the target.”
- **Stated label**: bounded negative result
- **Evidence present**: `scripts/audit_strict_kalmanson_catalog_identity.py` defines the fixed basic and row-mask families and self-hashed report; `docs/audits/2026-09-04-strict-kalmanson-catalog-identity-scan.json` records 11,960 attempts, 5,520 unique digests, zero matches, and self-hash `e74c8916...`; `scripts/test_audit_strict_kalmanson_catalog_identity.py` checks the inventory and retained report.
- **Actual label**: EMPIRICALLY VERIFIED bounded search result
- **Verdict**: OK
- **Reason**: A fresh replay returned the recorded counts and self-hash. The scan scope explicitly limits the conclusion to its documented serializer families and does not make a universal negative assertion.

### F4: Archive absence is now limited to inspected delivery locations

- **Location**: `docs/audits/2026-09-04-strict-kalmanson-catalog-identity.md:42-80,141-146`
- **Quote**: “No such archive or archive attachment was found in the inspected repository, `/Users/adam/Downloads`, or nthdegree delivery/conversation records.”
- **Stated label**: NOT FOUND IN THE INSPECTED DELIVERY LOCATIONS
- **Evidence present**: Wave-6 prose file size/SHA, message `#12335`, and the explicit search-scope disclaimer.
- **Actual label**: NOT FOUND IN THE INSPECTED DELIVERY LOCATIONS
- **Verdict**: OK
- **Reason**: The revised wording no longer implies an exhaustive filesystem or remote-storage search. It accurately records the local delivery inventory and leaves the claimed archive undelivered.

### F5: The later acceptance protocol covers both ingress paths

- **Location**: `docs/audits/2026-09-04-strict-kalmanson-catalog-identity.md:115-137`
- **Quote**: “A future delivery starts with one of two ingress branches: ... Payload branch ... Generator/verifier branch.”
- **Stated label**: proposed acceptance protocol
- **Evidence present**: payload branch hashes received bytes; generator/verifier branch preserves and hashes source/runtime inputs, executes deterministic output, and blocks undeclared environmental inputs; common semantic and bank checks follow.
- **Actual label**: COMPLETE PROPOSED PROTOCOL for the stated delivery alternatives
- **Verdict**: OK
- **Reason**: The protocol handles code-only delivery by hashing source, declared inputs, and deterministic generated catalog bytes before applying common checks.

### F6: Claim boundaries and prohibited prose checks are sound

- **Location**: `docs/audits/2026-09-04-strict-kalmanson-catalog-identity.md:139-146`; cross-reference `docs/audits/2026-09-04-strict-kalmanson-local-collapse-producer.md:40-48`
- **Quote**: “author catalog identity `dbbae6a5...` | EXTERNAL REPORT; NOT AUTHENTICATED LOCALLY”
- **Stated label**: EXTERNAL REPORT / NOT AUTHENTICATED LOCALLY
- **Evidence present**: explicit status table and producer cross-reference; no claim of the 42,504-clause bank, UNSAT, or general-`n` conclusion.
- **Actual label**: Correctly bounded
- **Verdict**: OK
- **Reason**: The semantic catalog, n=12 bank hash, author digest, and archive status remain separate. The target documents contain no project-banned comparison-language tokens and no unsupported proof-label upgrade.

## Weasel words

No prohibited proof-context weasel words were found. The serializer conclusion
is explicitly called bounded, and the document states what it does not exclude.

## Scope conflation

No material scope conflation remains. Semantic reproduction, bank-hash replay,
catalog-byte custody, archive delivery, and the broader 42,504/UNSAT/general-n
questions have distinct statuses.

## Lean sorry graph

Not applicable. This is a custody and serializer audit; no Lean theorem is used
as proof of catalog identity.

## Upgrade drift

No unsupported upgrade was found. The durable scan is empirical and bounded, the
n=12 hash is a replay rather than original-payload custody, and the author digest
and archive remain unauthenticated or undelivered.

## Required before CERTIFIED

None for this checkpoint. A future claim of author catalog identity still requires
the catalog payload or generator/verifier delivery to pass the stated protocol.
