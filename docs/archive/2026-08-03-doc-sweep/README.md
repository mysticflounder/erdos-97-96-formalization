# Doc sweep — 2026-08-03

42 documents archived. Predecessor sweep: `docs/archive/2026-07-16-doc-sweep/`.

These are historical records, not current obligations or dispatch surfaces.
Nothing here was deleted; every file is preserved at its original name under
the subdirectory it came from. Live status comes from `proof-blueprint spine`
(snapshotted in `docs/live-blueprint.md`), with family-level analysis in
`docs/p97-spine-closure-audit-2026-08-03.md`.

## Criterion

A doc was archived only when its target obligations are absent from the live
open-obligation list for publish target `Problem97.erdos97_rhs`, verified
against `proof-blueprint spine` on 2026-08-03 (29 open obligations: 28 `sorry`
theorems plus the induced `sorryAx`, all inside `ATailFrontierLiveClosure`).

Audits recording dead ends or negative results were **kept** even when old —
those retain standing value per the project rule, and 27 audits remain in
`docs/audits/`. Docs naming any still-open obligation were kept.

## Top level (6)

Superseded prompts and route analyses whose targets are now proved:

- `atail-exact-two-localized-collision-deep-thinker-prompt-2026-07-26.md` —
  target `false_of_localizedCollisionMutualOmissionCycle_exactTwo_and_all_low_hits`
  is proved (`FrontierLiveClosure.lean:16955`).
- `front-a-biapex-robust-closure-prompt-2026-07-20.md`,
  `front-a-biapex-robust-closure-prompt-response-2026-07-20.md`,
  `front-a-exact-five-parent-row-bridge-prompt-2026-07-21.md` — the
  `false_of_frontierBiApexRobustExactFiveGlobalCoverStarResidual` chain has
  zero declarations under `lean/`; its modules were retired to
  `attic/atail-exact-five-parent-assembler-2026-07-26/`.
- `shortest-side-biequidistance-exclusion-2026-07-24.md` — intended consumer
  `false_of_frontierAllLargeCapsBiApexRobustResidual` was independently closed
  (`:17124`) by an argument that never uses bi-equidistance.
- `p97-fresh-third-normalized-residual-consumer-audit-2026-08-02.md` —
  tracked `..._normalized_residual` as the live terminal; that theorem is a
  proved coordinator dispatching into `..._normalized_remaining`. Superseded
  by `docs/p97-spine-closure-audit-2026-08-03.md`, which covers the same three
  arms with a stronger result.

## audits/ (26)

- **Closed slot-2 / four-point-subpacket and multi-center spec lanes** —
  `2026-07-06-four-point-subpacket-plan-audit.md`,
  `2026-07-06-frontier-missed-angle-analysis.md`,
  `2026-07-06-refactorization-audit.md`,
  `2026-07-06-slot3-certificate-closure-plan-audit.md`,
  `2026-07-07-multi-center-joint-census-spec-audit.md`,
  `2026-07-09-lean-codebase-audit.md`.
- **Closed endpoint general-m lane** (`isM44EndpointGeneralMResidualsExcluded`
  proved, `Base.lean:9508`) — `2026-07-11-endpoint-classifier-transport-map.md`,
  `2026-07-11-endpoint-generalm-representability.md`.
- **Closed ERASE / K-A lanes** — `2026-07-12-erase-p4-route-scoping.md`,
  `2026-07-12-ka-route-scoping.md`,
  `2026-07-13-erased-certificate-build-performance.md`.
- **Self-declared superseded snapshots** — `2026-07-13-closure-plan-audit.md`
  ("retained as evidence of the pre-correction state"),
  `2026-07-14-closure-plan-prose-audit.md`,
  `2026-07-15-atail-scratch-lane-24h-survey.md` ("a dated inventory, not the
  closure plan"), `2026-07-15-r-global-continuation-object-gate.md`.
- **Superseded bi-apex / exact-five second-cap lane**, closed by cap
  redesignation (closure-matrix `K-A-EXACT5-GLOBAL-COVER`) —
  `2026-07-17-critical-fiber-strategy-alignment.md`,
  `2026-07-20-exact-five-short-cap-terminal-audit.md`,
  `2026-07-21-exact-five-asymmetric-local-regression.md`,
  `2026-07-21-exact-five-card-ge-14-survival-cover.md`,
  `2026-07-21-exact-five-global-minimality-regression.md`,
  `2026-07-21-exact-five-global-occurrence-professor.md`,
  `2026-07-21-exact-five-multirow-curvature-audit.md`,
  `2026-07-21-exact-five-response-audit.md`,
  `2026-07-23-atail-new-session-handoff.md`,
  `2026-07-24-all-large-caps-terminal-route-inventory.md`,
  `2026-07-25-triapex-uniform-geometric-obstruction-analysis.md`.

The `proof-blueprint refs --refresh` tooling rule first recorded in
`2026-07-24-all-large-caps-terminal-route-inventory.md` is independently
preserved in `docs/closure-matrix-2026-07-09.md` and
`docs/closure-plan-full-spec-2026-07-09.md`.

## solve-prompts/ (8)

- **Family F, self-marked CONSUMED / historical** —
  `2026-07-27-exact-collision-terminals.md` ("STATUS: CONSUMED (2026-07-28)…
  do not redispatch"), `2026-07-27-f-bridge-cross-shell-incidence.md`,
  `2026-07-27-f-bridge-k4-subcarrier.md`,
  `2026-07-27-f-bridge-m44-repackaging.md`,
  `2026-07-27-f-bridge-second-cap-center.md`,
  `2026-07-27-f-round1-response.md`.
- **Retired U1 double-apex target** (`DoubleApexOffSurplusSharedRadiusPair`
  sits inside the dead block comment at `U1LargeCapRouteBTail.lean:2371-2623`) —
  `2026-07-27-u1-double-apex-shared-radius-pair.md`,
  `2026-07-28-u1-double-apex-round1-response.md`.

## external-prompts/ (2)

`front-a-closure-prompt-2026-07-16.md` and its response target the K-A-PAIR
hypothesis package, which `docs/closure-matrix-2026-07-09.md` marks
"SUPERSEDED AS ACTIVE GRANULARITY… ARCHIVED"; the response states it did not
obtain a proof. `docs/external-prompts/` is now empty and was removed.

## Reference repointing

12 citations in live docs were rewritten to point here
(`closure-plan-full-spec-2026-07-09.md` 5, `closure-matrix-2026-07-09.md` 3,
`atail-force-producer-plan-2026-07-13.md` 2,
`audits/2026-07-11-closure-plan-freshness-audit.md` 1,
`notes/d1-rigidity-literature-scan-2026-07-06.md` 1), plus one in
`audits/2026-07-24-…` before it was itself archived. Citations *between*
archived docs were left as-is: the subdirectory layout is preserved, so they
still resolve. `docs/solve-prompts/README.md` carries a relocation notice.
