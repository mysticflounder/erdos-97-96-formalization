# A2 CAP T0 acceptance-readiness record

Date: 2026-08-27 (America/Los_Angeles)

Target: `p97-capcfg-rigid221-exact17-cap9-exactcover-negative-v1`

Status: `SUBMITTED_PENDING_COORDINATOR`

## Outcome

The independently reviewed A2 target packet is ready to be presented for an explicit T0 coordinator decision. This record and the companion acceptance-request JSON are not an acceptance act. No T0 target contract, Phase 1 work, live search, PIQD submission, solver campaign, Lean source edit, or certificate promotion is authorized by them.

The only valid next decisions on this request are `ACCEPT` or `REJECT`, made explicitly by a `T0_COORDINATOR`. If accepted, the effect is limited to `T0_ACCEPTED_TARGET_CONTRACT_ONLY`; Phase 1, live search, and solver-campaign authorization remain false and require their own governed controls.

## Authenticated custody model

Acceptance cannot honestly use one Git commit for both mathematical source provenance and packet custody:

- Frozen source base: `38f6b0ced41acbda8b2d2f590f2acf6b1a14a7a4`.
- Reviewed evidence packet: `64d65e4ebbbf7439b48dc56990fcb0886045e9a6`, whose parent is the frozen source base.
- Observed committed `main`: `a301d85e2a432b2804cfc98fd9f3e620dc1f0ec5`.

The reviewed packet files exist at the evidence-packet commit and are not present at the observed `main` commit. Conversely, the acceptance-time drift check is about the committed source and build objects at `main`. The acceptance request therefore binds both heads and assigns each a distinct role.

The request authenticates the source identity, theorem-bank preflight, target contract, and independent review using their repository paths plus raw and structured SHA-256 values. It also authenticates the two independent reviewer identities and a nested packet-binding digest.

## Source-drift result

Independent comparison found no relevant drift from the frozen base through the observed `main` commit:

- all repository-local files in the T0 source manifest match byte-for-byte;
- the target, finite-ingress/landing context, direct imports, declaration slices, proposition, consumers, and recorded trust facts are unchanged;
- `lean/lake-manifest.json`, `lean/lakefile.toml`, and `lean/lean-toolchain` match byte-for-byte;
- the pinned formal-conjectures and mathlib revisions are unchanged.

This attestation covers committed Git objects only. It deliberately makes no cleanliness claim about the shared working tree. The T0 packet also continues to state that a kernel-mined transitive dependency manifest is unavailable at this stage.

## Request identity

- Schema: `cap-configuration-t0-acceptance-request/v1`
- Structured request SHA-256: `e008035c5e8ec6b5df230d2a073c38c21cebfffc404bb482dbf151253c3c0eb9`
- Raw stored request SHA-256: `0576bfa1bb621c868f74b0d8a8322b8dbcdfd5aba342c378a93d95c33a66c3c3`
- Packet-binding SHA-256: `959cabd83049d2f6a3c9e49dd64939d7efc3eea5e0c5ece5852b715f3dbd1695`
- Request status: `SUBMITTED_PENDING_COORDINATOR`
- Requested scope: `T0_TARGET_CONTRACT_ONLY`

The governed validator requires any later acceptance to use the canonical repository acceptance path, bind this exact request and reviewed packet, repeat the reviewer identities, record an acceptance-time committed-source drift attestation, use an explicit coordinator identity and `ACCEPT` decision, and keep Phase 1/live-search/solver authorization false.

## Validation

- Focused request/acceptance and packet tests: `33 passed`.
- Focused Ruff check: passed.
- Full governed validator with independently materialized pinned formal-conjectures source: passed with no warnings.
- Independent implementation audit: passed with no blockers after remediation.
- Independent adversarial audit: passed with no blockers after directly checking forged-request, external-revision, external-path traversal, branch-ref, CLI-conflict, and timestamp cases.

No Lean source or solver campaign was changed or run.

## Coordinator boundary

No acceptance JSON is present. Creating
`certificates/cap_configuration_t0_a2_exact17_second_cap9_acceptance_v1.json`
requires a separate explicit coordinator decision. A plain acknowledgment such as “continue” or “looks good” is not interpreted as `ACCEPT`.
