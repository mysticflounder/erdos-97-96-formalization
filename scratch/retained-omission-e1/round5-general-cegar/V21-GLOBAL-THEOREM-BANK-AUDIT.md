# v21 FreshThird residual global theorem-bank audit

Date: 2026-08-02

## Verdict

**NO-GO — v21 yields no source-clean reusable producer or direct bridge** for
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual`, nor for
its equal-center, same-blocker, or omission residual arms.  All three probes
ended in canceled `unknown`; therefore they produce no UNSAT core, Boolean
cut, generalized family, finite-coverage result, or Lean theorem.

The result is consistent with the prior terminal-bank audit
(`scratch/retained-omission-e1/round5-general-cegar/V19-TERMINAL-GLOBAL-THEOREM-BANK.md`):
that audit found no smaller/generalized producer and no direct bridge into the
live fresh-third target.

## Artifacts and trust boundary

All runs use schema 21, seed 97, a 60,000 ms timeout, and the v8 base script
(`base_script_sha256 =
e0c98be80b2729cf50ee1d9da6c081fc4db2095e66abfb3c85abfbf5799b7162`).  The
scope is the exact-`n=15`, `(6,6,6)` v8 relaxation plus explicit selectors;
source labels are `0..3` and fresh `Q` labels are `4..11`.

| mode | exact artifact | status / reason | constraints | elapsed |
|---|---|---|---:|---:|
| equal-center | `scratch/retained-omission-e1/round5-general-cegar/artifacts-v21-probe/20260802T170824.948230Z/result.json` | `unknown` / `canceled` | 20,620 | 63.53 s |
| same-blocker | `scratch/retained-omission-e1/round5-general-cegar/artifacts-v21-probe/20260802T171006.898507Z/result.json` | `unknown` / `canceled` | 20,605 | 63.55 s |
| omission | `scratch/retained-omission-e1/round5-general-cegar/artifacts-v21-probe/20260802T171114.555974Z/result.json` | `unknown` / `canceled` | 20,577 | 63.27 s |

The result records explicitly classify each run as
`external-z3-only; no Lean theorem or finite coverage claim`.  `canceled` is
the wrapper timeout outcome, not `unsat`; no model, proof-producing
certificate, or kernel ingress is present.

The selector meanings are source-faithful only at the bounded-relaxation
level: `equal-center` forces both selected source rows to be exactly
`{s1,s2,q1,q2}` and equal source blockers; `same-blocker` equates one selected
source row/blocker with the selected `Q` row/blocker; `omission` selects one
`Q` point omitted from a selected source row.  These are probes, not universal
normal-form implications.

## Source and bank cross-check

The current source contains the checked normalization and the open terminal:

* `freshThirdNormalizedResidualCase_of_crossRowResidual` and
  `nonempty_freshThirdCapSourceInteraction_of_noAlignment` are source-clean
  routers/producers;
* `false_of_two_freshThirdCrossRowHits_distinctCenters` is the already-closed
  distinct-center two-hit arm;
* `freshThirdEqualCenterExactFourRow_of_hits` and
  `commonCollisionEndpointOmission_of_equalCenterHits` expose the equal-center
  exact-row/omission data but do not conclude `False`;
* `false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual` remains
  a direct `sorry` at
  `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:9738` (current
  source snapshot), and the residual coordinator calls it.

The three required theorem-bank registries contain no declaration matching
the FreshThird/normalized-residual/equal-center/same-blocker/omission shapes:

* `certificates/p97_rvol_general_n_mining.json` — zero matching candidate
  declarations;
* `certificates/erdos97_legacy_general_n_mining.json` — zero;
* `certificates/erdos_general_theorem_p97_mining.json` — zero.

Indexed Lean-corpus searches likewise returned only the current
FreshThird declarations and unrelated generic U1/U5 or omission consumers.
Those generic consumers require stronger hypotheses (for example positive
mutual cross-membership, equal actual blockers, or exact deletion packets)
that the three v21 selector modes do not produce.  In particular, do not
erase the live distinct-blocker hypothesis or identify the bounded named
points with the general carrier.

The current refactor plan
(`docs/false_of_capSource_freshThirdBlockerFiber_without_sameCapCrossRow_refactor_plan_2026-07-31.md`)
requires one acyclic source-clean core fed by positive interaction data; its
acceptance gate still lists the residual terminal leaves as open.  The v21
probe does not change that frontier.

## Recommendation

Retain all three JSON artifacts as authenticated **external-Z3 UNKNOWN**
discovery data only.  Do not promote cuts, selector relations, or exact-15
observations into the theorem bank.  The next proof task should be a
source-clean contradiction producer that preserves the branch provenance:
an equal-center common-endpoint-omission consumer or a same-blocker/
source-row-omission consumer (with the required positive incidence and
metric hypotheses).  A bounded incremental cube may be useful for discovery,
but it cannot close the live general theorem without a separately proved
bridge.

## Fidelity correction

This audit is intentionally limited to the exact-`n=15`, `(6,6,6)` v8
relaxation.  The live `TwoCapSourceThirdCanonicalRowSurface` witness requires
`cap_card_ge_eight`, hence `n≥17`, and additionally requires a same-cap source
pair, exclusion of all four collision endpoints, exact selected-four support,
and deletion-survival data.  V21 does not encode those predicates.  Its NO-GO
must therefore not be extrapolated to the full live packet.  The n≥17 encoder
inventory is recorded separately in
`scratch/retained-omission-e1/round5-general-cegar/N17-ENCODER-INVENTORY.md`.
