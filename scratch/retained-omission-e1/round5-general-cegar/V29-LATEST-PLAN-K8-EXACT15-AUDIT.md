# Latest-plan/source K8 and exact-15 audit

Date: 2026-08-02
Scope: one bounded, read-only review of the current plan, live source, and
theorem-bank registries. No Lean edits, builds, or solver runs.

## Stale import-path statement

`EXACT15-ADAPTER-AUDIT-R3.md` says that
`ATail/ExactFifteenApexProfile.lean` “is not imported by
`ATail/FrontierLiveClosure.lean`.”  The current source contradicts that
sentence: `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:14` contains

```lean
import Erdos9796Proof.P97.ATail.ExactFifteenApexProfile
```

This is import-path drift only.  A repository-wide `rg` finds no calls from the
live closure to the exact-15 theorem names; importing the module has not made an
adapter or closure consumer.

## Exact-15 applicability

`ExactFifteenApexProfile.lean` is source-clean and has these relevant
producers:

* `card_ge_fifteen_of_all_cap_card_ge_six` gives only `15 ≤ A.card`.
* `exactCapProfile_of_card_eq_fifteen` and the selected-four profile theorems
  require the additional hypothesis `A.card = 15`.
* The selected-four profiles are centered at
  `S.oppositeVertexByIndex i` and consume `SelectedFourClass` data.

The live `TriApexAllLargeContext` at
`FrontierLiveClosure.lean:7093-7110` supplies cap lower bounds, apex-rich
structures, a not-robust-cover bound, and the no-center-covers-all-apices
condition.  It contains neither `D.A.card = 15` nor an apex-centered
`SelectedFourClass` adapter for the blocker-centered
`CriticalFourShell` data in `RetainedOmissionAllLargeNormalForm`.  Therefore the
exact-15 module is importable but still not promotable into
`false_of_retainedOmission_triApexAllLarge_core`.

## K7/K8 and bank census

The query

```bash
rg -n -i "theorem .*K7|theorem .*K8|ExactFifteen|exact.?15" \
  lean/Erdos9796Proof/P97/ATail -g '*.lean'
```

finds only the exact-15 module declarations/import and no production K7/K8
theorem.  The mandatory registry scan for
`ExactFifteen|exact.?15|K7|K8` returns no entries in each of:

```text
certificates/p97_rvol_general_n_mining.json
certificates/erdos97_legacy_general_n_mining.json
certificates/erdos_general_theorem_p97_mining.json
```

Current plan language correctly classifies K7/K8 as finite-packet scratch
labels (four-point rows avoiding centers 7 and 8), not production interfaces.
No banked K8 theorem is available for promotion.

## Verdict

Correct the stale sentence about the exact-15 module not being imported.  The
mathematical status is unchanged: `card_ge_fifteen_of_all_cap_card_ge_six` is a
usable lower-bound producer, while exact-15 profiles and all K7/K8 finite
claims still lack the card-equality and apex-to-blocker-row bridges needed by
the retained-omission core.  No theorem can safely be promoted into the live
core on this pass.
