# F2/TwoSource checkpoint 36 synthesis audit

**Date:** 2026-08-22
**Scope:** the 41 F2-related files in `Erdos-97-Proof` from
`/tmp/Erdos-97-Proof-complete-2026-08-22.tar`, reconciled with the live
repository.  This is a read-only synthesis of the archive and current source;
it is not a proof-closure claim.

## Executive status

Checkpoint 36 is the current F2 prose authority.  It supersedes checkpoint 27
and the earlier six-leaf/FreshThird-first architecture as the recommended
mathematical boundary.  Its reduction is prose-complete, but its terminal
consumers remain open.

The retained context consists of two exact canonical collision rows with
distinct positive first-apex radii (r\ne\rho).  Their cap traces are pairs
`P` and `Q`; the retained row centers are distinct and lie in the strict first
cap.  The correct choice order is to retain all legal canonical blockers,
choose two fresh strict-first-cap sources, classify their radii, and only then
choose a blocker section.

The resulting exhaustive packets are:

```text
CR-CB   common first-apex radius / common canonical blocker
CR-MO   common first-apex radius / mutually omitting blockers
AR-CB   aligned singleton radii / common canonical blocker
AR-MO   aligned singleton radii / mutually omitting blockers
```

These group into two open theorem families:

1. **Root A:** exclude the common canonical blocker packets.
2. **Root B:** exclude the mutual-omission survival square, including its
   `CC`, `CS`, `SC`, and `SS` retained-pair trace modes.

Checkpoint 36 strengthens the hard first-cap-blocker branch.  Unless the
four-survivor upgrade applies, the source-faithful output is an exact
cross-radius mutual-omission cycle: the old source is blocked by one center
and omitted from the opposite retained row, while the newly selected source
is blocked by the other center and omitted from the first row.  This is
stronger than the earlier “smaller-radius renewal” statement.

One branch remains separate:

```text
four-survivor upgrade
∨ exact cross-radius mutual-omission cycle
∨ F8 full-smaller-pair saturation.
```

In F8, the source-blocker row contains the complete smaller-radius pair.  It
needs a provenance-preserving adapter to the historical mutual-omission
consumer.  It must not be silently folded into the ordinary two-cap-hit
proof.

## FreshThird compatibility route

The preferred-first-cap route is a useful compatibility lane for existing
raw-main callers.  It proves, at prose level, the common-radius distinct-cap
FreshThird packet by choosing a legal critical blocker in the strict first cap
whenever one exists.  The resulting blocker cannot simultaneously lie in a
distinct strict cap.  This is a local route and does not prove Root A or Root
B.

The archive’s static audit reports successful synthetic `git apply --check`,
25 declarations, and 24 caller edges.  Those results are not Lean
elaboration, `lake build`, or publication-target `#print axioms` results.  The
new module proposed by the patch,
`lean/Erdos9796Proof/P97/ATail/RegionPreferredCriticalShell.lean`, is absent
from the live tree.  The patch’s canonical-surface line anchors are therefore
historical source anchors, not an applied change.

## Live source and trust boundary

The live source scan finds eight bare `sorry` occurrences in the F2 modules:

| Module | Bare `sorry` occurrences | Interpretation |
|---|---:|---|
| `TwoSourceCanonicalSurface.lean` | 1 | canonical-surface residual |
| `TwoSourceFirstFiberCollision.lean` | 1 | outside-pair exact-row residual |
| `TwoSourceClosure.lean` | 1 | acyclic-hard residual consumer |
| `TwoSourceFreshThirdResidual.lean` | 5 | two first-non-hit residuals, two unresolved equal-center constructor arms, and the pinned-endpoint residual |
| `TwoSourceRetainedMinimalCore.lean` | 0 | source/packet plumbing only; current uncommitted change clarifies that its early retained packet is a branch witness |

The repository README’s “six F2 leaves” is a tracked-frontier grouping, not a
count of bare `sorry` tokens.  The old six boundaries remain reachable until a
future, separately verified spine change bypasses them.

The trust boundary is consequently unchanged: prose reductions, static patch
audits, synthetic patch application, finite stress models, and archive
manifests do not remove `sorryAx`.  Reclassification requires a live Lean
elaboration/build, direct reachability check, and publication-target axiom
audit.  No archive file establishes kernel closure of F2.

## Live manuscript destinations

The current canonical manuscript already contains the following relevant
headings:

- `F2. TwoSource cluster — semantic all-blockers reduction`;
- `14.1 Finite late-choice API for the intrinsic F2 reduction`;
- `16.5.E-H F2 TwoSource cluster — all-blockers semantic refactor`;
- `Theorem 11.1 — intrinsic F2 four-packet reduction`;
- `Corollary 11.2 — one theorem closes the entire F2 branch`;
- `19. Compatibility lane: FreshThird preferred-choice synchronization`;
- `16.6.3 Intrinsic F2 adapters`; and
- `16.7 Current Lean sorry impact ledger`.

The checkpoint36 cross-radius-cycle and F8-adapter delta belongs under
`16.5.E-H`, with its source/API consequences reflected in `16.6.3` and its
open-kernel classification in `16.7`.  The compatibility patch belongs only
under heading 19 until it has been rebased and build-checked.

## Appendix: complete 41-file source accounting

### Active authority (3)

- `erdos-97-descent-prose-proof-atomic-leaf-ledger-F2-checkpoint36.md`
- `F2-all-blockers-two-cap-source-refactor-checkpoint36.md`
- `F2-TwoSource-semantic-all-blockers-ledger-checkpoint36.md`

### Current references and handoffs (5)

- `F2-all-blockers-refactor-README.md`
- `FreshThird-first-cap-preferred-blocker-synchronization-prose-proof-v2.md`
- `FreshThird-first-cap-preferred-closure-Lean-patch-kit.md`
- `FreshThird-first-cap-preferred-closure-README.md`
- `FreshThird-first-cap-synchronization-Lean-handoff.md`

### Supporting implementation evidence (9)

- `F2-all-blockers-semantic-refactor-bundle-v2.zip`
- `F2-all-blockers-semantic-refactor.patch`
- `F2-checkpoint36-bundle.zip`
- `F2-checkpoint36-prose.patch`
- `FreshThird-first-cap-preferred-closure-bundle.zip`
- `FreshThird-first-cap-preferred-source.patch`
- `FreshThird-first-cap-preferred-static-audit.txt`
- `FreshThird-preferred-choice-prose-v2.patch`
- `RegionPreferredCriticalShell.lean`

### Historical/provenance archive (24)

- `erdos-97-descent-prose-proof-atomic-leaf-ledger-F2-all-blockers-refactor.md`
- `erdos-97-descent-prose-proof-atomic-leaf-ledger-F2-closure-pass-2026-08-20.md`
- `erdos-97-descent-prose-proof-atomic-leaf-ledger-F2-expanded-audited.md`
- `erdos-97-descent-prose-proof-atomic-leaf-ledger-F2-FreshThird-preferred-choice-v2.md`
- `erdos-97-descent-prose-proof-atomic-leaf-ledger-F2-FreshThird-synchronization-prose-closed.md`
- `F2-all-blockers-semantic-refactor-bundle.zip`
- `F2-all-blockers-two-cap-source-refactor.md`
- `F2-cap-repair-verification.txt`
- `F2-expanded-audited.patch`
- `F2-TwoSource-closure-pass-2026-08-20.zip`
- `F2-TwoSource-closure-research-pass-2026-08-20.md`
- `F2-TwoSource-expanded-formalization-ledger-FreshThird-preferred-choice-v2.md`
- `F2-TwoSource-expanded-formalization-ledger-FreshThird-synchronization-prose-closed.md`
- `F2-TwoSource-expanded-formalization-ledger.md`
- `F2-TwoSource-repaired-diagnostic.lean`
- `F2-TwoSource-row-center-cap-cut.lean`
- `F2-TwoSource-semantic-all-blockers-ledger.md`
- `FreshThird-first-cap-preferred-blocker-synchronization-prose-proof.md`
- `FreshThird-first-cap-synchronization-prose-closure.patch`
- `erdos-97-descent-prose-proof-atomic-leaf-ledger-F2-checkpoint27.md`
- `F2-all-blockers-two-cap-source-refactor-checkpoint27.md`
- `F2-TwoSource-semantic-all-blockers-ledger-checkpoint27.md`
- `F2-checkpoint27-bundle.zip`
- `F2-checkpoint27-prose.patch`

The supersession rule is: checkpoint36 governs mathematics; current handoffs
and supporting patches preserve implementation evidence; checkpoint27 and
earlier prose are historical and cannot override the live source or the
checkpoint36 status above.
