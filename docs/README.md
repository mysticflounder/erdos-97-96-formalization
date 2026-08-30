<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Documentation map

This directory contains living plans, generated proof-state snapshots, dated
research records, and historical archives. A date in a filename scopes the
record; it does not make that file a current status authority.

## Current authorities

- [Current proof pointer](proof/CURRENT.md) — short human-readable pointer to
  the latest accepted frontier change.
- [Obligation registry](../proof-status/README.md) — machine-readable roster and
  trust-gate documentation. The 2026-08-30 registry has 25 publish-reachable
  declarations and 6 off-spine declarations.
- [Live blueprint](live-blueprint.md) — generated snapshot. Do not edit it by
  hand, and do not assume the committed copy is fresh; run
  `proof-blueprint spine` for live state.
- [Computational closure plan](computational-closure-plan-2026-07-28.md) —
  authored closure-program ledger. Its embedded dated checkpoints remain
  historical; the current summary at the top points back to the registry.
- [Plans index](plans/README.md) — active lane plans and explicitly historical
  implementation records.

The theorem roots remain open because their dependency closures
still reach `sorryAx`. Only `Problem97.erdos97_rhs` is configured as the
Proof Blueprint publish target; Problem 96 is checked separately.

## Research narrative and operations

- [Descent manuscript](erdos-97-descent-prose-proof-atomic.md) — authoritative
  merged research manuscript as of its stated 2026-08-23 snapshot, not a live
  obligation count.
- [Evidence-status ledger](closure-evidence-status-ledger-2026-08-05.md) —
  controlled status vocabulary plus dated corrections.
- [Prose integration ledger](p97-prose-material-integration-ledger-2026-08-22.md)
  — source-to-destination accounting for the merged prose library.
- [Counterexample-search runbook](runbooks/p97-cap-configuration-ce-search.md)
  — fail-closed operator contract.
- [Dead ends](dead-ends.md) — durable do-not-repeat record.
- [General-n theorem-bank census](general-n-certificate-bank-mining-2026-07-09.md)
  — dated bank census; verify statements and imports before reuse.

## Directory policy

- [`plans/`](plans/) contains executable or implementation plans. Each plan
  states whether it is current, partially superseded, or historical.
- [`audits/`](audits/) contains dated evidence and reviews. These files are
  snapshots, not live status surfaces.
- [`specs/`](specs/) contains protocol and schema contracts; implementation or
  solver success must be established elsewhere.
- [`runbooks/`](runbooks/) contains operator procedures and fail-closed gates.
- [`notes/`](notes/) contains research notes that do not govern dispatch.
- [`solve-prompts/`](solve-prompts/) contains prompt inputs and responses; see
  its own index before reuse.
- [`archive/`](archive/) preserves superseded documentation and provenance.
- [`references/`](references/) contains local literature audit material subject
  to the repository's provenance and licensing policy.

When the proof frontier changes, update the current pointer, living plan, and
reader-facing summary in the same checkpoint. Keep generated status blocks and
`live-blueprint.md` generator-owned.

Relocated documents may leave short compatibility pointers at their former
paths so existing citations keep working; those pointers are never status
authorities.
