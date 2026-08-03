# Round 14: second-cap two-step endpoint global-bank audit

## Scope and status

This is a read-only audit of the source-safe second-cap walk relevant to
`Problem97.ATailFrontierLiveClosure.false_of_retainedOmission_triApexAllLarge_core`.
It does **not** close that live `sorry`.

The exact object is
`ATailRetainedMatchingCommonDeletionCycle.RetainedMatchingTwoStepCommonDeletionWalk`
in `lean/Erdos9796Proof/P97/ATail/RetainedMatchingCommonDeletionCycle.lean`.
For the `freshSecondCap` arm, `first` and `second` are strict-cap-I1 points on
the selected I1-apex radius, while `next` is a strict-cap-I2 point.  Therefore
the `sourceReturn` endpoint is impossible by the disjoint-cap lemma embedded in
the constructor route.  The exact remaining partition is:

1. `RetainedMatchingEndpointCriticalFiber W`: `blocker(next)=blocker(first)`,
   with a source-tagged critical fiber and a first-apex `RowHit`.
2. `RetainedMatchingThreeDistinctBlockerPath W`: all three successive actual
   blockers are pairwise distinct.

The former already has an exact continuation
`nonempty_endpointFreshCrossOrCommonDeletion`; the latter has
`nonempty_threeDistinctEndpointCrossOrCycle`.  Both are source-proved but are
only constructors of the explicitly `COMPAT-ONLY/BANK`
`RetainedStrictInteriorTerminalSurface`, not a consumer of the live core.

## Provenance guard

`W.firstPacket` and `W.secondPacket` are
`CommonDeletionTwoCenterPacket`s.  Their `B1/B2` data are U5 selected
four-subsets, not full `H.selectedAt` shells.  What is source-valid at this
level is only

* `second_not_mem_first_shell`;
* `next_not_mem_second_shell`; and
* endpoint-continuation dichotomies which explicitly test membership in an
  **actual** `H.selectedAt ... .toCriticalFourShell.support`.

Thus neither generic packet can be used to infer a fifth-point absence from a
full critical shell, nor can its selected row be fed to a full-circle power or
two-hit theorem.  This blocks a tempting but invalid cross-cap localization
argument.

## Mandatory registry and corpus audit

Consulted the four required registry summaries and all three JSON inventories:

* `docs/general-n-certificate-bank-mining-2026-07-09.md`;
* `certificates/p97_rvol_general_n_mining.md/json`;
* `certificates/erdos97_legacy_general_n_mining.md/json`; and
* `certificates/erdos_general_theorem_p97_mining.md/json`.

Exactly one corpus query was run:

```text
nthdegree docs search --lean --agentic
  "RetainedMatchingTwoStepCommonDeletionWalk secondCapLocalizedReverseHit
   endpointCriticalFiber threeDistinctBlockers geometric contradiction"
```

It returned no reusable hit.  No further Lean corpus search was made.

## Candidate declarations and mismatch

| Candidate | What it would give | Why it does not apply |
|---|---|---|
| `Problem97.U1LargeCapRouteBTailMetricResidualTarget.u1TwoLargeCapObstruction` (`RVOL.P97.U1TwoLargeCapObstruction`, source-proved, **not source-reachable**) | A coordinate-level `False` from seven precisely arranged equalities on five points. | The two-step data supply consecutive deletion/survival facts, not its seven edge equalities. In particular no equality relates `next` to the first-apex selected radius. |
| `Problem97.false_of_largeCapInterior_localSameCircleOrAuditedSupport` (`RVOL.P97.C5D3BBoundedRecovery`, source-proved/reachable) | `False` from a large-cap point plus a universal local U3 payload. | Requires `D.Minimal`, `IsM44`, `U2Statement`, `U5ModeA`, `U5ModeADeletion`, and a `forall p` local same-circle/audited-support payload. None is an ATail consequence, and its `largeCapInterior` is not the role-indexed I1/I2 cap API. |
| `Problem97.U3LocalizedNoQFreePacket.false_of_sameCircleExport` (`RVOL.P97.U3ToU5Terminal`, source-proved/reachable) | Contradicts a `U5SameCircleExport`. | Requires a `U3LocalizedNoQFreePacket`, `U5DangerousTriple`, and `U5SelectedCandidateSkeleton`; the endpoint supplies neither those legacy packets nor a same-circle export. A generic common-deletion row is insufficient. |
| Current `ATailRetainedMatchingEndpointContinuation.nonempty_endpointFreshCrossOrCommonDeletion` | Endpoint collision gives either actual-shell cross membership or another common deletion. | Its positive arm is a first-apex full-shell membership; it does **not** provide two hits of one blocker in a rich class at I2. Its negative arm renews only a generic common-deletion packet. |
| Current `ATailRetainedMatchingEndpointContinuation.nonempty_threeDistinctEndpointCrossOrCycle` | Three-blocker path gives `first ∈ selectedAt next` or a third common deletion. | The positive arm is again an actual blocker shell at `next`, not a rich-apex I2 class. The cycle arm is a selected-subset packet. No bridge maps either to a cross-cap rich two-hit. |

## Verdict and first missing producer

**No source-safe global-bank theorem closes either second-cap endpoint.**  The
new useful target remains a genuinely geometric bridge, not a wrapper around
the compat-only normal form:

> From the second-cap two-step endpoint data (plus either the endpoint fiber
> or the three-distinct-blocker path), produce two actual points of one
> `H.selectedAt` blocker shell in a rich I2-apex radius slice, or prove that
> such endpoint data are impossible.

The direct route must preserve two distinct notions of row throughout:
`H.selectedAt` full critical shells versus `CommonDeletionTwoCenterPacket`
U5 four-subsets.  No imported or legacy candidate supplies that bridge.
