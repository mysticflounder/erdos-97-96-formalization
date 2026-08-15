# Schema-8 FreshThird theorem-bank audit

Date: 2026-08-06

## Scope and verdict

Schema 8 is a bounded hypothesis probe for the equal-center,
`distinctBlockersDifferentCaps × distinctBlockersDifferentCaps` branch.  It
was intended to negate the proposed shared-late-pair producer while retaining
dynamic selected rows, deletion-survivor rows, cap membership, and arbitrary
boundary positions.  All 16 historical `n = 17` cases were SAT (0 UNSAT, 0
UNKNOWN), but the round is **INVALID / NOT INTERPRETABLE AS COUNTERMODELS**.
The formula has an existential selector bug, so these artifacts provide no
valid bounded countermodel evidence and no Lean closure credit.

### Quantifier and source-boundary audit

`shared_late_pair_terms` introduces free selector variables for the A anchor,
the named B row, the later points, and the boundary permutation.  `build`
adds `Not(shared)` without quantifying them.  Z3 therefore checks
`exists selectors, not shared`, whereas the intended negation of a producer
`exists selectors, shared` is `not (exists selectors, shared)` (or an
equivalent universal encoding).  A SAT assignment only witnesses one
selector choice with `shared` false; it does not rule out another choice with
`shared` true.

The arbitrary boundary permutation is a second independent gap: the source
provides a concrete convex boundary indexing/order packet, not an arbitrary
permutation.  Thus the historical schema has no source-entitled ingress or
universal lift even after repairing the quantifiers.

The probe script and historical serial wrapper now refuse production runs
while preserving the builder/matrix for bug reproduction and audit.  No new
CEGAR round is authorized from the historical artifacts.

The indexed Lean search and the four required theorem-bank registries found no
general theorem that consumes every schema-8 survivor.  There are, however,
source-clean producers for the boundary/order packet.  The remaining missing
fact is positive global incidence: a second selected row `BRow` and indices
`ia < ib < ic < id` such that both late points belong to both selected rows.

## Candidate audit

| Declaration | Status | Why it does or does not close schema 8 |
|---|---|---|
| `Problem97.CapCrossingKalmansonBridge.false_of_two_selected_rows_shared_late_pair` (`P97/ATail/CapCrossingKalmanson.lean:427`) | **Usable consumer** | Exact target once `SelectedFourClass` rows, injective CCW boundary, `ia < ib < ic < id`, and four late-point memberships are supplied. It is source-clean (`#print axioms`: only `propext`, `Classical.choice`, `Quot.sound`). It is not a producer. |
| `Problem97.selectedFourClass_shared_pair_separated` (`P97/Phase3SharedPairSeparation.lean:31`) | **Usable producer component** | Source-clean cyclic alternation theorem for two distinct selected rows sharing two points. It requires the boundary/index transport and distinct centers/points, and returns only a `btw` separation equivalence; it does not produce the late index order or a second selected row. |
| `freshThird_canonicalSource_differentFreshCap_sharedPairCyclicPacket` (`P97/ATail/FrontierLiveClosure/TwoSourceCanonicalSurface.lean:933`) | **Usable producer component** | Source-clean and import-reachable through `TwoSourceFreshThirdResidual`. Produces a boundary indexing plus cyclic separation for the two fresh endpoints, and preserves canonical/different-cap facts. It does not return `SelectedFourClass` objects at the needed boundary indices or `ia < ib < ic < id`. |
| `freshThird_canonicalDifferentCap_boundary` (`TwoSourceCanonicalSurface.lean:1057`) | **Usable producer component** | Source-clean. Adds zero-cut cap blocks, boundary labels, and shared-pair separation. It still lacks the second-row selector and the four memberships required by the Kalmanson consumer. |
| `freshThird_canonicalDifferentCap_fivePointKalmansonOrder` (`TwoSourceCanonicalSurface.lean:~1830`) | **Usable order producer** | Source-clean and cardinality-free. Gives the four possible orders for the fresh endpoints, fresh center, canonical source center, and canonical source. It supplies cyclic/order information only; it does not provide a second selected row with shared late support. |
| `freshThird_canonicalDifferentCap_exists_orderSelectedEndpointSurvivingRow` (`P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdFiber.lean:2826`) | **Usable survivor producer** | Source-clean and import-reachable. Converts the five-point order into either a surviving selected row or the already-consumed deletion-obstruction arm. The survivor is cap-split and avoids one deletion, but no theorem turns it into the required two shared late memberships. |
| `freshThird_orderSelectedEndpointSurvivingRow_capSplit` | **Usable adapter** | Source-clean cap composition (`≤ 2` inside / `≥ 2` outside). It is only a shape refinement and cannot imply positive overlap with another selected row. |
| `CapCrossingKalmansonBridge.false_of_freshThird_four_order_arms` (`CapCrossingKalmanson.lean:529`) | **Incompatible consumer** | Closes four-point order arms only when two explicit deletion-row distance equalities are already present. Schema 8 retains a survivor row, so its required equalities/row interface are absent. |
| `false_of_freshThird_canonicalDifferentCap_of_endpointDeletionObstructions` (`TwoSourceFreshThirdFiber.lean:2891`) | **Already-used / incompatible here** | Consumes all four named deletion-blocked hypotheses. Schema-8 survivors are precisely the complementary surviving-row cases, so this theorem cannot be applied. |
| `freshThird_commonRadius_distinctCaps_*` and `freshThird_commonRadius_distinctCaps_dual_packet` | **Producer component only** | Establish canonical/noncanonical cap indices and fresh endpoints off the canonical cap in the equal-center dual packet. They do not produce boundary order or the second selected-row incidence required by the consumer. |
| `selectedClass_inter_capByIndex_card_le_two` and related cap-cardinality bounds | **Too weak** | Bound cap intersections but provide no positive cross-row witness or order transport. |
| `false_of_five_ccw_two_selected_rows` and other five-point Kalmanson terminals | **Incompatible** | Require fixed five-point support/order/equality interfaces different from the dynamic survivor-row packet. No adapter currently supplies those hypotheses from schema 8. |
| U1/U5 declarations in the three general theorem-bank JSON registries | **No-go / unrelated** | Registry scan found no `FreshThird`, normalized-residual, or equal-center theorem with a matching interface. Sibling U1/U5 consumers use different carrier packets and are not import-reachable adapters. |

## Import and trust checks

`TwoSourceFreshThirdResidual.lean` imports `TwoSourceFreshThirdFiber`, which
imports both `TwoSourceCanonicalSurface` and `CapCrossingKalmanson`; therefore
the listed producer components and Kalmanson consumer are import-reachable from
the live residual.  A targeted Lean 4.27 check was run from
`schema-v8-check.lean`; every listed theorem has no `sorryAx` in its reported
axioms (only standard classical/propositional axioms).  The residual itself is
still the sole load-bearing `sorry` at
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`.

The agentic indexed search transcript is retained at
`schema-v8-agentic-search.txt`.

## Remaining obligations

The residual has three constructor families:

1. `firstNonHit`: prove `FreshThirdSameCapCrossRowAlignment` (or an equivalent
   global contradiction), parametrically in the source side.
2. `secondNonHit`: the symmetric alignment/contradiction theorem.
3. `equalCrossRowCenters`: same-cap noncanonical interactions are handled when
   the stronger common-radius surface is available; the distinct-cap pair is
   reduced to the missing positive-incidence producer.

For the distinct-cap arm, the first exact source theorem still missing is:

```text
from the canonical different-cap five-point order and the selected survivor,
construct BRow : SelectedFourClass carrier (boundary ib) and
ia < ib < ic < id with
boundary ic, boundary id ∈ ARow.support ∩ BRow.support.
```

Once this producer and its subtype-to-`SelectedFourClass`/boundary-index
adapter are proved, `false_of_two_selected_rows_shared_late_pair` closes the
arm directly.  Schema 8's historical SAT output cannot show whether the
current abstract packet forces this producer because of the quantifier bug;
further bounded solver runs without a new source-level incidence theorem
should remain diagnostic only.
