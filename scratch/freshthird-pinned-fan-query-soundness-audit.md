# FreshThird pinned-fan query soundness audit

**Scope.** Read-only comparison of `census/p97_search/freshthird_firstnonhit_pinned_endpoint_fan_query.py`, its test/spec, `FreshThirdPinnedEndpointOutsideSeedQueryPacket.ofSource`, and `FreshThirdPinnedFanPacket`. No Lean build, test run, or source edit was performed.

## Overall verdict

**UNSOUND AS LABELED / NOT SOURCE-FAITHFUL.** None of the generated packets is a Lean serialization of `ofSource`. The Python generator constructs a deterministic, internally rational-consistent role/metric pattern. It does not ingest actual `C`, `Q`, `B`, source points, `DRow`, `H`, cap indices, or fan proofs. Consequently, every item currently listed under `field_provenance.source_entitled` (`freshthird_firstnonhit_pinned_endpoint_fan_query.py:268-282`) overclaims at least some serialized fields. The `metric_witness` is correctly marked `untrusted_proposal`, but its internal validation does not make it source evidence.

## Field audit

| Python field | Comparison with Lean producer/intrinsic fan | Verdict |
|---|---|---|
| `source_contract` (`:271-275`) | A matching producer name and consumer path are metadata. `ofSource` supplies an object from explicit hypotheses (`TwoSourceFreshThirdResidual.lean:5345-5470`); it does not prove the Python contract or closure status. | **METADATA-ONLY** |
| `endpoint_split` (`:284-292`) | The Lean packet has an actual endpoint identity (`:5306-5307`) and the intrinsic fan preserves the actual branch (`FreshThirdPinnedFanPacket.lean:141-202`). Python instead fixes role names, support relations, and escape slots. | **PARTIAL / UNSOURCED INSTANTIATION** |
| `alias_partition` and role universe (`:283, :293`) | The intrinsic fan has an actual `Row.support ≃ Fin 4` and source-image equality (`FreshThirdPinnedFanPacket.lean:31-37, :41-77`), not a 30-role synthetic universe or lexical boundary/row aliases. | **NOT SOURCE-ENTITLED** |
| `rows` (`:294-297`; construction `:238-246`) | Exact four-point support/cardinality is source-shaped, but the listed role identities and centers are invented. Lean retains the actual selected row and boundary row (`TwoSourceFreshThirdResidual.lean:5264-5291`). | **PARTIAL** |
| `blocker_records` (`:298-324`; checks `:583-616`) | Lean derives each blocker from `H.centerAt`/`H.selectedAt` (`FreshThirdPinnedFanPacket.lean:87-113`) and gives a per-point cap plus either equal-support/nonrobust or distinct/intersection-`≤2` dichotomy (`TriApexEndpointRetainedOmission.lean:984-1007`). It does not order blockers as Python slots, force slot 0 to be the equal case, force overlap 1 for other slots, or supply the hard-coded booleans. | **PARTIAL + UNSUPPORTED RELATIONS** |
| `hrow_at` (`:325-374`; checks `:618-660`) | Lean preserves the actual four strict-order alternatives and actual endpoint/cap identities (`TwoSourceFreshThirdResidual.lean:5276-5291, :5318-5338`; row definitions in `TwoSourceFreshThirdFiber.lean:499-548`). Python fixes arm 0, names, indices, cap positions, and ignores the strict inequalities. Its `radius_squared=0` and `seed_count=1` are not the producer's multiplicity hypothesis, which is a bound for every positive radius (`TwoSourceFreshThirdResidual.lean:5303-5305`). Literal `2/2/4` counts and cap index 1 are also stronger/different than the source's actual `≤2`, `≥2`, and arbitrary `rowCap` facts (`:5318-5338`). | **UNSUPPORTED / FABRICATED INSTANCE** |
| `escape` (`:375-380`; checks `:662-668`) | The intrinsic fan requires an existential row escape and preserves the actual branch (`FreshThirdPinnedFanPacket.lean:141-160`). Neither producer nor fan identifies that witness as synthetic `row3`/`boundary3` or as one of six role strings. | **PARTIAL / SLOT FABRICATION** |
| `source_hashes` (`:385-387`; checks `:671-679`) | Hashes attest only to current file bytes. They do not attest that the packet was extracted from a Lean term; the listed source set (`:50-56`) even omits this generator and its test. | **PROVENANCE METADATA ONLY** |
| `metric_witness` (`:381-384`; validator `:463-515`) | Exact rational distances are checked against Python's own hard-coded coordinates, but there is no link to `D.A`, source supports, cap membership, deletion non-incidence, hmult, or Lean order predicates. | **CORRECTLY UNTRUSTED / SYNTHETIC** |

The central source boundary is explicit in `ofSource`: all actual identities and hypotheses are passed as arguments and copied into the packet (`TwoSourceFreshThirdResidual.lean:5345-5470`). The intrinsic fan likewise derives blocker rows from the actual source (`FreshThirdPinnedFanPacket.lean:87-113`); it is not a license to choose replacement blocker roles.

## Fixture and test verdicts

Both `endpoint` and `off_endpoint` outputs are **SCHEMA-SHAPED SYNTHETIC DATA**, not true source-faithful models. Their coordinates, roles, supports, cap placements, escape slot, and relation values are generated in `freshthird_firstnonhit_pinned_endpoint_fan_query.py:126-235, :249-399`.

The test is **VERIFIED: deterministic schema validation only**. `test_freshthird_firstnonhit_pinned_endpoint_fan_query.py:21-27` checks build/write/replay determinism; `:30-54` checks expected labels and hard-coded branch data; `:56-110` checks tamper rejection and JSON/rational handling. No test consumes an `ofSource` export, checks actual Lean source fields, or establishes source-field coverage. The spec correctly says this is a diagnostic/prospective design (`FRESHTHIRD-PINNED-FAN-QUERY-SPEC.md:3-17`) and requires a real source extractor with exact supports, omissions, cap indices, order, and metrics (`:43-66, :86-117`), but the implementation has not met those requirements.

## Smallest corrections before CEGAR

1. **Block CEGAR ingestion now.** Relabel all current `source_entitled` entries as `unverified/derived encoding` (or remove the claim) until each field has a source-export mapping. Keep `DIAGNOSTIC_STATUS`; do not treat `source_hashes` as evidence.
2. Add a real Lean exporter/adapter (or a theorem-backed durable serialization) for the actual arguments and fields of `ofSource`: `C`, `Q`, `B`, `qOutside`, `qBetween`, center/id, `DRow`, `freshCap`, `rowCap`, actual support points, and the terminal fan. Use the intrinsic `Fin 4` index rather than synthetic role slots.
3. Export derived blocker rows as `H.selectedAt`/`blockerRow` and export each actual hfan result: cap index/interior, deletion blocking, and the exact equal-support/nonrobust-or-distinct/intersection-`≤2` alternative. Do not encode overlap `=1`, slot ordering, or fixed cap indices unless a separate Lean theorem supplies them.
4. Preserve all four strict order alternatives and actual endpoint identities. Replace literal arm/name/index/count values with source values and proof-backed inequalities/cardinality bounds. Replace the fake radius-zero/count-one multiplicity with the actual positive-radius hmult statement and actual six-point seed cardinality.
5. Keep metric coordinates under `untrusted_proposal` until source extraction also carries support membership, exact equalities/non-incidences, cap facts, order facts, and deletion omissions. Extend tests with a checked source-export fixture and mutation tests against those source predicates.

Until the extractor plus replay/coverage theorem exists, the only safe use is schema/parser testing; SAT/CEGAR results from these packets must be labelled **DIAGNOSTIC**, not source-backed.
