# FreshThird normalized residual: global theorem-bank pass (v31, 2026-08-02)

Scope: read-only audit of the six registries required by `AGENTS.md`, followed
by indexed Lean searches with `nthdegree docs search --lean --agentic`. No
production Lean/docs files were changed.

## Registry result

The six registry files contain no declaration name or statement mentioning
`FreshThird`, `twoCapSources`, or `freshThirdBlockerFiber` (literal `rg` pass
over all three JSON files and the three Markdown reports). The broad reports
are inventories, not direct FreshThird closures:

* `docs/general-n-certificate-bank-mining-2026-07-09.md:47-58` says the scan
  separates aggregate consumers, shadows, and fixed-row expansions and that
  the semantic conclusion rules out a hidden directly stated general-`n`
  closer; it does not rule out a future combination of local lemmas.
* `certificates/p97_rvol_general_n_mining.md:20-33` records 2,148 sibling
  general-`n` candidates (2,143 source-proved), 1,486 absent normalized
  headers, and 500 novel contradiction consumers. The contradiction census
  is explicitly source-level (`:13-16`), not a kernel axiom audit.
* `certificates/erdos97_legacy_general_n_mining.md:16-34` has 285 bounded
  local candidates, zero ambient-`n` declarations, zero source `sorry`, and
  warns that scalar rows are not all-`n` classification theorems.
* `certificates/erdos_general_theorem_p97_mining.md:16-34` has the same
  bounded-local warning, with 297 candidates and zero ambient-`n` declarations.

The p97-rvol JSON does contain adjacent source-proved families (fresh/cap,
cross/collision, support/radius/order), but their normalized interfaces are
`C5D3B`, `U1Depth5`, `U1LargeCapRouteBTail`, etc.; they are not FreshThird
two-cap-source declarations. The legacy and erdos-general JSONs have no
FreshThird/fresh/cross/collision/support/order literal hits. Classification:
**no-hit** for a global-bank FreshThird terminal; adjacent families are
**incompatible** unless explicitly listed below.

One exact local producer is present in the p97-rvol census:

* `Problem97.CriticalFourShell.support_eq_radius` at
  `lean/RVOL/P97/U1CarrierInjection.lean:551` (JSON fields show
  `source-proved`, `source_reachable=true`, `local_exact_name=true`,
  `local_shape_match=true`). Its statement is
  `∀ z ∈ K.support, dist center z = K.radius`. A kernel `#print axioms`
  check through the current `FrontierLiveClosure` import reports only
  `propext, Classical.choice, Quot.sound` (no `sorryAx`). Classification:
  **reusable producer**, but only for the generic support-radius bridge.

## Indexed Lean search and source verification

Queries used (all with `--lean --agentic`): `"normalized FreshThird residual"`,
`"two cap sources fresh third blocker fiber"`, `"cross row collision terminal"`,
and `"support radius order terminal"`.

### Direct FreshThird hits

* `false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual`
  (`FrontierLiveClosure.lean:9806`) has the exact normalized residual target
  and a body `by sorry`. `#print axioms` reports `sorryAx` transitively.
  **Consumer-only / open load-bearing leaf**; not reusable proof evidence.
* `false_of_twoCapSources_freshThirdBlockerFiber_residual`
  (`:11231`) is a constructor coordinator that dispatches the normalized
  leaf or the all-endpoint-omission branch. Source body has no new `sorry`,
  but its normalized branch inherits the leaf above. **Consumer-only**.
* `false_of_twoCapSources_freshThirdBlockerFiber_core`
  (`:11275`) removes the checked distinct-cross-row arm and feeds the
  residual coordinator. Source body is complete, but `#print axioms` still
  includes `sorryAx` through the normalized leaf. **Consumer-only**.
* `exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows`
  (`:14230`) is the cross-row collision coordinator. Its source body has no
  literal `sorry`, but `#print axioms` includes `sorryAx` transitively via the
  FreshThird/core route. **Consumer-only**, not a closed producer.
* `false_of_freshThird_sameCapCrossRowAlignment` (`:8099`) is a concrete
  same-cap cross-row incompatibility theorem. Source has no `sorry`, and
  `#print axioms` reports only `propext, Classical.choice, Quot.sound`.
  **Reusable producer** for that exact alignment branch, not for the
  normalized residual as a whole.

### Closest non-FreshThird hits

* `FreshThirdSameCapCrossRowAlignment`,
  `FreshThirdTwoCapSourceObstruction`, and
  `freshThirdBlockerFiber_of_mutualCrossMembership` are definitions/bridges
  in the same module. They describe the packet but do not close it; classify
  **consumer/interface-only**.
* `support_eq_radius` is the clean generic producer described above.
* `terminal_order_of_mem`, `I1_v3_distance_chain`, and the left-tent support
  lemmas returned by the support/order query have different row-arc or
  analytic-kernel interfaces (and some corpus source paths are unavailable in
  this worktree). They are **incompatible** with FreshThird.

## Bottom line

The mandatory global-bank pass found no imported, source-clean, axiom-clean
FreshThird normalized-residual closer. The only branch-level reusable
producer is the exact same-cap alignment contradiction (plus generic
`support_eq_radius` infrastructure). The normalized residual, its residual
coordinator, the core, and the cross-row terminal remain **consumer-only** and
ultimately `sorryAx`-dependent. The first missing bridge is still the proof of
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual`.
