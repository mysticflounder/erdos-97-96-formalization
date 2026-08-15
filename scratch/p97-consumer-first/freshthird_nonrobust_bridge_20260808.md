# FreshThird non-robust branch audit (2026-08-08)

## Scope

Anchor: `Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_freshThird_pinnedEndpoint_outsideSeedResidual` (source theorem at `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean:3365`; current body ends in `sorry` at line 3474).

The required first command,
`nthdegree docs search --lean --agentic --corpus erdos-97-96-formalization-lean ...`, was attempted twice but the agentic backend returned Codex usage-limit/503 errors; exact source inspection followed with `rg`/`sed`.

## New theorem and what it gives

`MinimalUniqueFourCover.lean:305-356`,
`exists_criticalSelectedFourClass_of_mem_of_not_fullyDeletionRobust`, takes
`center ∈ D.A`, `K : SelectedFourClass D.A center`, `z ∈ K.support`, and
`¬ FullyDeletionRobustAt D center`, and returns

* `C : CriticalSelectedFourClass D.A z center`;
* `¬ HasNEquidistantPointsAt 4 (D.A.erase z) center`; and
* `K.support = C.toCriticalFourShell.support`.

Thus it strictly strengthens the anchor's non-robust disjunct (the first arm of `hfanOutcome` at lines 3468-3473): it identifies the exact critical shell that deleting the escaping point kills. It does **not** prove `False` or remove `¬ FullyDeletionRobustAt D center`.

## Why `overrideAt` does not close the anchor

The anchor's `hterminal` supplies an escaping `K` and
`SourceFaithfulSelectedFourDeletionFan D S H K` (lines 3448-3459), then computes
`hfanOutcome`/`hmutualOutcome` and stops at `sorry` (lines 3465-3474).
`SourceFaithfulSelectedFourDeletionFan` (TriApexEndpointRetainedOmission.lean:988-1007) is pointwise in the original `H`: every source needs a cap-interior witness for `H.centerAt w` and a blocker/survival dichotomy involving `H.selectedAt w`.

Applying the new theorem and setting `H' := H.overrideAt C hblocked` changes the center and selected support at `z` (U1CarrierInjection.lean:1356-1391), so the old fan is not definitionally reusable. Existing APIs only preserve `centerAt`/support at points *other than* `z`; the support-preservation helpers in `TwoSourceRetainedMinimalCore.lean:1144-1165` are private and local to that residual. No generic theorem transports `SourceFaithfulSelectedFourDeletionFan` (or the FreshThird endpoint-row packets) across this override. In particular, the old fan's cap witness for `H.centerAt z` gives no cap witness for the new center `center`.

## Existing consumers / registries

`TriApexEndpointRetainedOmission.lean:2929-2948` uses the new theorem only to package an escape mode; it does not eliminate non-robustness. `TwoSourceRetainedMinimalCore.lean:1436-1469` demonstrates the available local override pattern (construct `H'`, preserve all rows at `v ≠ z`, install the new shell at `z`) but also has no fan rebase.

There is a compatibility-only `false_of_freshCanonicalRowOverride` in
`TwoSourceRetainedMinimalCore.lean:1311`, but it rebases a fixed retained
frontier/collision packet and is explicitly not the live FreshThird route; it
does not transport `SourceFaithfulSelectedFourDeletionFan`.

The theorem-bank registries named in `AGENTS.md` were checked. `certificates/p97_rvol_general_n_mining.json` contains the generic `Problem97.CriticalSelectedFourClass.exists_of_shell` entry (around lines 17248-17270), but no FreshThird, source-faithful fan, or override transport consumer. The legacy/general theorem registries and the markdown registry have no matching bridge entries.

## First exact missing bridge / route

First missing bridge: a source-faithful fan rebase theorem of the form

```
SourceFaithfulSelectedFourDeletionFan D S H K →
SourceFaithfulSelectedFourDeletionFan D S (H.overrideAt C hblocked) K
```

under `z ∈ K.support`, `K.support = C.support`, and enough cap data for the overridden source `z`; plus analogous preservation of the FreshThird endpoint row and all source/fresh shell hypotheses. Only after this transport can an existing bounded consumer (same-cap collision, mutual cross-deletion, or cyclic-triangle endpoint consumer) be applied to `H'`. Without it, the new theorem is a strict producer/strengthening, not closure of the anchor.
