# Math Skeptic Audit: reassigned exact13 chain family

Target: `docs/audits/2026-09-05-exact13-reassigned-chain-family.json`.
Date: 2026-09-05 Pacific.
Verdict: CERTIFIED for the stated finite computational scope only.
Claims audited: 6.

## Summary

The target is a computational report, not a Lean theorem or live-source
closure claim. Its full JSON, producer/checker, and finite validator were
read. Exact replay succeeds. The family fixes K,L,T,G10 in the direct chart;
it does not cover every exact13 source configuration. No theorem promotion
is implied by this audit verdict.

## Findings

All six claims below have supported label EMPIRICALLY VERIFIED, verdict OK.
Evidence is `scripts/check_exact13_reassigned_chain_family.py`, specifically
`enumerate_family`, `check_transport`, and `verify_report`.

| Location in target | Exact quoted field | Check and scope |
| --- | --- | --- |
| line 178 | `"support_partitions": 60` | Exhaustive four-subset enumeration of the complement of K and z, with fixed-core validator constraints |
| line 8 | `"base_blocker_records": 2340` | All ordered distinct non-apex blockers avoiding their own supports and center 10; canonical completion of every record passes the validator |
| line 175 | `"role_records": 13572` | Sum of all admissible s0,s1,d witness choices, not just canonical witness count |
| lines 34,57,61 | `"checked_links": 9`, `"gap_instances": 10`, `"pivot_supports_excluded": 495` | Transported gap vectors belong to the direct chart, replay to strict comparisons, and three chains partition the 12 nonpivot labels; four-support coverage is finite |
| line 10 | `"baseline_one_form": 2340` | Every base/blocker record has a zero projected strict form using its five base rows and G10; no arbitrary filler globals used |
| lines 181-182 | `"baseline_one_form": 3084`, `"baseline_two_form": 36` | Enlarged 3120-record family drops G10 entirely, allows blocker10, and exhausts one/two-form projected vectors using five base rows only; independent enumerator agrees |

The complete-table count at line 35 is the role count times 495 raised to
the eighth power. This counts unordered four-subset choices in each of eight
remaining independent global slots under this validator; it is not a count
of realizable metrics or geometries.

## Scope conflation

None in the audited report. The explicit scope excludes live-source
projection and Euclidean realization; `live_source_leaves_eliminated` is zero.
The report makes no claim that its certificates are absent from an existing
published bank. All records in the G10 subfamily pass the one-form rejection
test; all records in the enlarged family pass the one-or-two-form rejection
test. The three-chain method has no incremental rejection benefit here.

## Weasel words

No automatic proof-context flags in the target.

## Upgrade drift

New finite artifact only. No empirical result is upgraded to a general or
Lean-formalized theorem.
