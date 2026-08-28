# A2 CAP T0 exact-17 / second-cap-9 review

**Status:** reviewed candidate; not T0-accepted; no solver or live-search work authorized

**Target ID:** `p97-capcfg-rigid221-exact17-cap9-exactcover-negative-v1`

**Pinned base:** `38f6b0ced41acbda8b2d2f590f2acf6b1a14a7a4`

## Review verdict

The proposed T0 record is ready for a separate coordinator decision. It correctly selects the exact-cover arm of the exact-17, second-cap-cardinality-9 A2 leaf as an exhaustive negative-closure target. It does not claim that the current theorem is proved: the target and downstream spine still contain `sorryAx`.

| Check | Verdict | Evidence |
|---|---|---|
| Exact residual and proposition | PASS | The complete dependent context, five geometric/cardinality hypotheses, next-row one-hit bound, and exact `incidenceBag` cover are embedded and the proposition elaborates at the pinned base. |
| Source split and finite ingress | PASS | The named split yields unused-outside or exact-cover; the named ingress maps the complete exact-cover hypotheses to a `SourceRealization` with `model.order = 0`. |
| Mode, polarity, termination | PASS | `NEGATIVE_BRANCH_CLOSURE`, universal empty-branch polarity, and `EXHAUSTIVE`; partial or discovery-only outcomes make no target claim. |
| Consumers | PASS | Exact-cover target, immediate cap-split consumer, and `Problem97.erdos97_rhs` are named. |
| Bridge directions and omissions | PASS | Existing ingress/landing directions are separated from missing source-to-cell, exhaustiveness, symmetry, atom-entitlement, and aggregate-promotion obligations. All affected claim flags remain false. |
| Trust boundary | PASS for T0 description | Split is core-only; ingress and landing include native-reduction trust; target, downstream cap split, and final published consumer currently include `sorryAx`. |
| Theorem-bank preflight | PASS with disclosed limitation | The retained canonical summary binds the exact commands, ancestor revision, byte-identical target source, results, and first missing obligations. The original raw console log was not retained and is not claimed. |
| Source/build custody | PASS | Base commit, direct target/import source bytes, declaration slices, Lean toolchain, lake lock, formal-conjectures revision, and mathlib revision are cross-bound. |
| Imported problem source | PASS for review | `FormalConjectures/ErdosProblems/97.lean` was independently materialized at pinned revision `89a67be506fbae633d02941ccbd9f3737bbd5457` and matched SHA-256 `a7e81af09cba91a7c12ff878ba11b0fade761e0076f3f5f4a55e22c6df426824`. |
| Authorization separation | PASS | Candidate drafting is authorized; T0 acceptance, T1a, Phase 1, PIQD, solver, campaign, certificate, and Lean promotion are not. |

## Frozen artifact identities

| Artifact | Structured SHA-256 | Stored-byte SHA-256 |
|---|---|---|
| Source identity | `d1f59ff953b0b08e253f8440c2a4ee4002ede1ce1d3fbdf089524346a21f83d4` | `ac1bd6d6b07787460849cfdd2031297b9a57905d5867d32a07280d842daf7daf` |
| Theorem-bank preflight | `ef8c27ee5c3bb6b42ee5c3c3402d05577fa8b5a615536bf6fec0b88646d52735` | `f398dd2ee26a49e72119bc0f9c0f303c86147b95dde584a47ccfaa279c73149b` |
| Target | `5b29d98980d7bf163f0d17dee459a644175545a7fcca71464a8db4189bb77c9a` | `87b209c06443f4811903eb30ade86e1751b28d858dd6ca8198c63fab1347a260` |
| Elaborated proposition text | n/a | `0dcf5e74a8c4fe5ee6e6fdd2626f69743d65a7284f755f06c2f14d32a8568c66` |

## Independent reviews

### Mathematical/source review

- Reviewer identity: `codex-chore-reviewer-math-20260827`
- Agent task: `/root/review_a2_t0_math`
- Final verdict: `PASS_FOR_COORDINATOR_REVIEW`
- Verified exact proposition/source anchoring, cardinalities, split polarity, consumer chain, bridge directions, omissions, phase boundary, and final-consumer trust profile.
- Initial precision findings were remediated by separating the immediate source-to-cell gap from later universe/atom gaps and by adding the fresh `Problem97.erdos97_rhs` axiom profile.

### Custody/schema review

- Reviewer identity: `codex-chore-reviewer-custody-20260827`
- Agent task: `/root/review_a2_t0_custody`
- Final verdict: `PASS_FOR_COORDINATOR_REVIEW`
- Verified canonical storage, structured-hash preimages, raw cross-bindings, base-revision source/declaration checks, metadata locks, external-source hard gate, independent reviewer identities, and non-circular acceptance binding.
- Initial fail-open validator findings were remediated. Eighteen focused tests include rehashed deletions and metadata mutations that must fail closed.

## Remaining gate

The sole remaining T0 gate is an explicit coordinator acceptance record. It must bind the exact source, preflight, target, and review structured/raw hashes and identify the coordinator's `ACCEPT` act. T0 acceptance alone must not authorize live search or a solver campaign.

The missing source-to-cell theorem, finite raw-cell universe, atom ledger and entitlement, symmetry transport, T1a controls, checked branch certificates, and aggregate Lean theorem are downstream obligations. They are not silently promoted into completed T0 evidence.
