# A2 CAP T0 acceptance-readiness record

Date: 2026-08-27 (America/Los_Angeles)

Target: `p97-capcfg-rigid221-exact17-cap9-exactcover-negative-v1`

Status: `T0_ACCEPTED_TARGET_CONTRACT_ONLY`

## Outcome

Adam McKenna explicitly returned `ACCEPT` as the T0 coordinator on
`2026-08-28T16:12:40Z`. The content-addressed acceptance record binds that act
to the reviewed request and accepts the T0 target contract only.

The acceptance is frozen to committed source head
`a301d85e2a432b2804cfc98fd9f3e620dc1f0ec5`. It does not govern current
`main`, authorize Phase 1 work, live search, PIQD submission, a solver
campaign, Lean source edits, or certificate promotion. It also does not
retroactively authorize implementation committed after the reviewed request.

## Authenticated custody model

Acceptance cannot honestly use one Git commit for both mathematical source provenance and packet custody:

- Frozen source base: `38f6b0ced41acbda8b2d2f590f2acf6b1a14a7a4`.
- Reviewed evidence packet: `64d65e4ebbbf7439b48dc56990fcb0886045e9a6`, whose parent is the frozen source base.
- Observed committed `main`: `a301d85e2a432b2804cfc98fd9f3e620dc1f0ec5`.

The reviewed packet files exist at the evidence-packet commit and are not present at the observed `main` commit. Conversely, the acceptance-time drift check is about the committed source and build objects at `main`. The acceptance request therefore binds both heads and assigns each a distinct role.

The request authenticates the source identity, theorem-bank preflight, target contract, and independent review using their repository paths plus raw and structured SHA-256 values. It also authenticates the two independent reviewer identities and a nested packet-binding digest.

## Source-drift result at request time

Independent comparison found no relevant drift from the frozen base through the observed `main` commit:

- all repository-local files in the T0 source manifest match byte-for-byte;
- the target, finite-ingress/landing context, direct imports, declaration slices, proposition, consumers, and recorded trust facts are unchanged;
- `lean/lake-manifest.json`, `lean/lakefile.toml`, and `lean/lean-toolchain` match byte-for-byte;
- the pinned formal-conjectures and mathlib revisions are unchanged.

This attestation covers committed Git objects only. It deliberately makes no cleanliness claim about the shared working tree. The T0 packet also continues to state that a kernel-mined transitive dependency manifest is unavailable at this stage.

## Post-request drift at decision time

At the coordinator-decision boundary, committed `main` was
`6d0fcc389255ac24be267636abb8f7545d63bcb7`, the direct child of the reviewed
source head. The target theorem statement is textually unchanged, and the
recorded build-identity files are unchanged. However, the reviewed source
manifest no longer matches:

- `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean`
  changed from SHA-256
  `c5e46308208ac2ae75fdf7e6a21db18fd03825af7f44bed7f3f47ffc630b542b`
  to
  `f2a5b2bf20dd6063177a2622f86751ce8a3a8549d8c9c386d660193bf4a54530`;
- a new relevant dependency,
  `lean/Erdos9796Proof/P97/ATail/ExactA2CapMetric.lean`, is present with
  SHA-256
  `da12070236b41fa8f2d2465894e189ad0dc3b2afe64a2e74965d0e750230bd15`.

Consequently, the newer implementation is outside this acceptance. A fresh
source manifest, request, and independent review are required before applying
the T0 contract to current `main`.

## Request identity

- Schema: `cap-configuration-t0-acceptance-request/v1`
- Structured request SHA-256: `e008035c5e8ec6b5df230d2a073c38c21cebfffc404bb482dbf151253c3c0eb9`
- Raw stored request SHA-256: `0576bfa1bb621c868f74b0d8a8322b8dbcdfd5aba342c378a93d95c33a66c3c3`
- Packet-binding SHA-256: `959cabd83049d2f6a3c9e49dd64939d7efc3eea5e0c5ece5852b715f3dbd1695`
- Request status: `SUBMITTED_PENDING_COORDINATOR`
- Requested scope: `T0_TARGET_CONTRACT_ONLY`

## Acceptance identity

- Schema: `cap-configuration-t0-acceptance/v1`
- Structured acceptance SHA-256:
  `1511c8e938d21e560518c22f2a890cc47d27b9cd0e4854da10abbb0523694ed6`
- Raw stored acceptance SHA-256:
  `0df61ece25bd0cdd0a8755a31e8c7166ffb1671a86e4e7afbde962bccf928503`
- Accepted source head: `a301d85e2a432b2804cfc98fd9f3e620dc1f0ec5`
- Scope mode: `FROZEN_REQUEST_SNAPSHOT_ONLY`
- Coordinator: `Adam McKenna`, role `T0_COORDINATOR`
- Decision: `ACCEPT`
- Status: `T0_ACCEPTED_TARGET_CONTRACT_ONLY`

The governed validator requires the acceptance to use the canonical repository
request, bind the exact request and reviewed packet, repeat the reviewer
identities, authenticate the frozen committed-source attestation, match the
explicit coordinator identity and decision event, and keep
Phase 1/live-search/solver authorization false.

## Validation

- Focused request/acceptance and packet tests: `39 passed`.
- Focused Ruff check: passed.
- Full governed acceptance validator with independently materialized pinned
  formal-conjectures source: passed with no warnings.
- Independent artifact/custody audit: passed after recomputing all six raw and
  structured record hashes, checking packet ancestry and bindings, and
  confirming the coordinator identity and decision event.
- Independent adversarial acceptance audit: passed after checking current-main,
  retroactive-implementation, downstream-authorization, rehashed-scope, and
  substituted-drift-context cases.

No Lean source or solver campaign was changed or run.

## Remaining boundary

The frozen request has received its explicit decision; there is no remaining
coordinator decision on those bytes. Current-`main` applicability remains
unreviewed because of the post-request source drift described above. No
downstream execution authority follows from this acceptance.
