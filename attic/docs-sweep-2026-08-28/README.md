<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Documentation sweep — 2026-08-28

These seven files are preserved as implementation history, not current plans,
obligation maps, or dispatch prompts. Moving them changed no Lean source and
establishes no proof closure.

## Completed plans

- [`atail-force-producer-plan-2026-07-13.md`](docs/atail-force-producer-plan-2026-07-13.md)
  centered on `false_of_twoLargeCaps_commonCriticalMap`. That theorem is now a
  source-clean coordinator in `FrontierLiveClosure/Coordinator.lean`; the plan's
  former 28-leaf status and producer taxonomy are historical.
- [`frontier-live-closure-sharding-plan-2026-08-05.md`](docs/frontier-live-closure-sharding-plan-2026-08-05.md)
  says at its opening that no split had executed. The monolith is now an
  umbrella import over the landed `FrontierLiveClosure/` shard tree.
- [`false_of_capSource_freshThirdBlockerFiber_without_sameCapCrossRow_refactor_plan_2026-07-31.md`](docs/false_of_capSource_freshThirdBlockerFiber_without_sameCapCrossRow_refactor_plan_2026-07-31.md)
  records a landed normal-form refactor. Its advertised descendant
  `false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining` is now
  source-clean, and current FreshThird work uses later residuals.
- [`false_of_retainedInteriorDirectedOmission_and_all_low_hits_refactor-plan-2026-07-31.md`](docs/false_of_retainedInteriorDirectedOmission_and_all_low_hits_refactor-plan-2026-07-31.md)
  explicitly records a landed refactor; the named public theorem is now a
  source-clean compatibility wrapper.

## Retired or duplicate prompts

- [`2026-07-27-b-round1-response.md`](solve-prompts/2026-07-27-b-round1-response.md)
  responds to a removed Family B prompt and no longer names the live B-family
  interfaces.
- [`front-a-closure-prompt-2026-07-16.md`](solve-prompts/front-a-closure-prompt-2026-07-16.md)
  and
  [`front-a-closure-prompt-response-2026-07-16.md`](solve-prompts/front-a-closure-prompt-response-2026-07-16.md)
  target the superseded K-A-PAIR package. The 2026-08-03 documentation archive
  already preserves the original prompt lane; these copies are retained here
  only because one prompt copy had diverged from that archived snapshot.

Current proof obligations come from a freshly generated `proof-blueprint
spine`. The authoritative authored plan remains
`docs/computational-closure-plan-2026-07-28.md`.
