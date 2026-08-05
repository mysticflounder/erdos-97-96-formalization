# FreshThird theorem-bank search (2026-08-03)

## Scope and target

This audit searched the indexed Lean corpora and the local P97 source for an
existing, source-clean consumer of `FreshThird`, `sourceRowOmission`, mixed-cap
membership, one-inside/one-outside cap data, or common-radius reciprocal
incidence that could discharge
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`.

The target is the unresolved theorem in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:11324-11331`.
Its residual interface is the inductive
`FreshThirdNormalizedResidualRemainingCase` at lines `11280-11300`:
`firstNonHit`, `secondNonHit`, or `equalCrossRowCenters` with two
noncanonical interactions.

## Searches performed

Commands used:

```text
nthdegree docs search --lean --agentic "Find existing Problem 97 theorem-bank consumers for FreshThird, sourceRowOmission, mixed cap membership, one-inside-one-outside, or common-radius reciprocal incidence; prioritize source-clean theorems relevant to false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining"
nthdegree docs search --lean "FreshThird" --current-project
nthdegree docs search --lean "<sourceRowOmission|mixed cap|one-inside one-outside|common-radius reciprocal|FreshThirdBlockerFiber>" --corpus erdos-97-96-formalization-lean
nthdegree docs search --lean "<same terms>" --corpus p97-rvol-lean
```

The two `--agentic` searches returned no result after the allowed wait, so no
agentic hit is claimed. Regular indexing returned the local FreshThird
declarations and the target consumers below. The p97-rvol corpus returned U1
row-slot and U5 metric/scalar contradiction families, but no type-compatible
FreshThird consumer. The theorem-bank certificates likewise classify those as
syntactic portability candidates, not a bridge for this P97 packet.

## Local candidates

| Candidate | Evidence/status | Applicability to the target |
|---|---|---|
| `false_of_two_freshThirdCrossRowHits_distinctCenters` (`FrontierLiveClosure.lean:10992-11000`) | Source-clean. Consumed by `false_of_hasDistinctCrossRows` (`:11305-11315`). | Handles only the positive arm with both cross-row hits and distinct centers. It cannot consume either non-hit constructor or the equal-center/noncanonical constructor. |
| `false_of_freshThird_sameCapCrossRowAlignment` (`:9411-9415`) | Source-clean ordered-cap contradiction. | Requires the excluded same-cap cross-row alignment packet; the normalized residual deliberately stores noncanonical interactions instead, so this is not a direct consumer. |
| `false_of_equalBlockers_complementaryMembership` (`:9841`) | Source-clean older complementary-membership arm. | Uses the old equal-blocker/complementary-membership schema, not `FreshThirdCapSourceInteraction` or source-row omission. No adapter was found. |
| `false_of_twoCapSources_mutualCrossMembership_distinctBlockers` (`:13706-13722`) | Source-clean. Requires two old `SelectedClass ... commonRadius` hypotheses, mutual cross-membership, and distinct blocker values. | Closest reusable terminal, but the normalized residual supplies deletion-survival/noncanonical cap data rather than common-radius membership and the old `FirstFiberCapSourceWitness`. A new, load-bearing adapter would be needed. |
| `false_of_twoCapSources_oneSidedDeletionSurvival` (`:13892-13913`) | Compatibility wrapper only. It calls `false_of_twoCapSources_freshOutsideFirstBlockerFiber`, whose body is `sorry` at `:9359-9363`. | Not transitively source-clean and uses the former `FreshOutsideFirstBlockerFiber` packet. It cannot close the normalized target. |
| `false_of_twoCapSources_sameBlockerAllEndpointOmission` (`:12873`) | Source-clean stronger old packet. | Requires all endpoint omissions, exact cap-intersection data, and the former first-fiber witnesses. The normalized residual does not provide this interface. |
| `false_of_twoCapSources_freshOutsideFirstBlockerFiber` (`:9359-9363`) | Explicit `sorry`. | Rejected as a theorem-bank closure candidate. |

## Sibling theorem banks

The p97-rvol census has many source-proved U5 metric-point/scalar-algebra
incompatibility consumers and a small U1 source-unit row-slot family. Their
ambient structures and imports are disjoint from `FreshThirdBlockerFiber` and
`FreshThirdCapSourceInteraction`; no direct reduction or API bridge was found.
They are therefore analogies/possible producer ingredients, not consumers of
the target theorem.

## Conclusion

No existing source-clean theorem was found that closes
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`. The
theorem remains a genuine load-bearing producer obligation. The nearest exact
terminal is `false_of_twoCapSources_mutualCrossMembership_distinctBlockers`,
but using it requires a new theorem that transports each normalized residual
branch (especially `sourceRowOmission` deletion survival and the
same-cap/distinct-cap noncanonical cases) into the old common-radius,
mutual-cross-membership interface. Wrapping the existing compatibility
coordinators would not provide kernel/source-clean closure.

No production Lean files were edited by this audit; only this scratch report
was added.
