# Exact-13 quotient classification work matrix

Lane: `exact13-quotient-classification-20260905`.
Started 2026-09-05 Pacific time; updates may have UTC date 2026-09-06.
Parent plan: `2026-09-01-dr-two-radius-branch-closure.md`, Phase 4.
This is an execution matrix, not a theorem or a replacement closure plan.

## Scope and acceptance

Publish target: `Problem97.erdos97_rhs`. Anchored residual:
`false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen`.
The exact-13 arm is the immediate classification consumer; card greater than
13, row overlap, and adjacent-grid obligations remain separate.

An accepted classification must account for every candidate in an explicitly
defined source-faithful finite universe. Each candidate must end in an exactly
replayed cancellation or a rational dual exit. A dual exit means the tested
Kalmanson cancellation family is insufficient for that graph, not that a
Euclidean configuration exists. Proof progress requires a strictly smaller
set of admissible unresolved source leaves, not merely more sampled cuts.

## Work matrix

| ID | Obligation / deliverable | Owner | Status | Evidence / next check |
| --- | --- | --- | --- | --- |
| S1 | Identify current live source bundle and orientation split | Source-contract audit | AUDITED, SOURCE ONLY | Dispatch raw packet, other outer support, coarse signature, source-role witnesses; direct and mirror both live |
| S2 | Prove live bundle maps into finite role/incidence valuations | Existing source lane; contract audit here | OPEN | Global rows already have `Exact13GlobalRows.ofIngress`; the missing theorem is the full record/order projection, corrected in #16069 |
| C1 | Identify conservative finite record domain | KalmansonCartographer + source-contract audit | AUDITED, NOT COVERAGE | 13 labels, 2 orientations, 5 base rows, 11 global slots with 9 active, and 110 distinct non-apex blocker pairs; see contract JSON |
| C2 | Establish exhaustive branching/enumeration and deduplication rule | KalmansonCartographer | BLOCKED ON S2/C1 | No source-complete candidate denominator yet; no unproved symmetry quotient |
| Q1 | Reuse quotient construction and all 1,430 strict forms on 78 edges | Toolchain audit | AVAILABLE; REPLAYED IN F1 | Existing row closure and form generator; fixed-cell mirror forms checked |
| Q2 | Obtain and replay nonnegative rational cancellation | Toolchain audit | AVAILABLE; F1 COMPLETE | Existing exact weighted producer; F1 uses direct integer witnesses without solving |
| Q3 | Obtain and replay rational dual with every form at least 1 | Toolchain audit | PRECISE ADAPTER GAP | Reuse bounded `parse_piqd_get_values`; add normalized quotient inequalities and exact replay. No new parser/Gaussian framework needed |
| V1 | Differential/negative controls for the two exact exits | KalmansonCartographer | CANCELLATION CONTROLS PASS | Nine tests on F1; dual exit remains untested/unimplemented in this lane |
| R1 | Report cancellation / dual-exit / undecided / uncovered counts | KalmansonCartographer | F1 COUNT COMPLETE; ALL-SOURCE BLOCKED | Fixed-cell 495/495 below; no all-source denominator |
| F1 | Three-chain fixed order, all 495 pivot supports | KalmansonCartographer; independent Luna/API and code audits | EXACT FINITE REPLAY COMPLETE | Minimal row groups, nine links/ten gaps, 423 one-form + 72 two-form certificates; no source occurrence claim |
| F2 | Match F1's named providers to the current source charts | Source-contract audit + independent enumeration | NATURAL MATCH REJECTED | 0/4 cyclic/reflected maps pass necessary source conditions; other provider identifications are not ruled out |
| A1 | Apply affine miner to eligible surviving complete row tables | KalmansonCartographer | READY, NO ELIGIBLE INPUT | Miner/checker at 15ef84edc; previous seven-table cohort had no baseline survivor |
| P1 | Connect exhaustive coverage and certified leaves to live consumer | Existing Lean owners | BLOCKED ON S2/C2/R1 | No Lean promotion claimed by this lane |

Statuses are obligation states. READY is not PROVEN; an audit may establish
only that an interface or tool exists. A sampled SAT model is not a certified
survivor of all tested geometric inequalities.

## Coverage counters

| Quantity | Current value | Meaning |
| --- | --- | --- |
| Coarse signatures | 100, per existing catalog | Not a count of full equality graphs or exhaustive terminals |
| Source-complete candidate universe size | NOT ESTABLISHED | Never substitute the number of retained models |
| Source-complete candidates decided by this lane | 0 | No exhaustive classification result yet |
| Fixed three-chain cell: candidate pivot supports | 495 | Exactly all four-subsets of 12 labels, conditional on its specific rows/order |
| Fixed three-chain cell: cancellation exits | 495 | 423 one-form, 72 two-form, all integer-replayed |
| Fixed three-chain cell: dual / undecided / uncovered exits | 0 / 0 / 0 | Cancellation already covers this whole conditional domain |
| Rational-dual exits produced by this lane | 0 | Awaiting exact-dual interface audit |
| New live leaves eliminated by this lane | 0 | No claimed reduction in the parent plan's measure |
| Previous affine regression cohort | 7 tables; 5 affine collisions; 0 baseline survivors | Historical, not the classification denominator |
| Later direct-cell bounded wave | 21 SAT models; 0 baseline survivors | Historical certificate b460c57f5, not exhaustive coverage |

## Current gate

The active source/coordinator build must finish before this lane pins its Lean
bytes as validated source. No build or solver wave was launched here, and no
source in that active graph was edited. Existing `Exact13GlobalRows.ofIngress`
and `ProviderRealizes` settle global-row existence at the inspected source
level. They do not themselves supply a theorem projecting the entire source
bundle into `validate_cell` and its order-dependent candidate predicate.

## Completed conditional cell F1

The external proposal #16061 fixes cyclic order (or its reverse)

`O,d1,d2,l2,bS,k2,k1,bD,l0,z,R,s2,s1`, with `R=l1`.

In these positional labels 0..12, the minimal equal-radius groups are
`4:{0,11,12}`, `7:{1,2,3,10}`, `0:{4,5,6,7}`, `0:{8,9,10}`.
These imply strict chains at pivot 10:

`[7,6,5,4]`, `[11,12,0]`, `[9,8,1,2,3]`.

EMPIRICALLY VERIFIED: all nine chain links replay as positive sums of the ten
specified Kalmanson gaps. The chains partition the other 12 labels. Every
four-subset therefore repeats a chain. A separate exhaustive scan and stored
integer replay covers all 495 supports, with 423 one-gap and 72 two-gap
certificates. The full four-row strengthening gives 447/48 in a diagnostic
scan; the retained certificate uses only the weaker minimal groups. The
proposal's 378/117 split describes its chosen bank, not a minimality bound;
our choice of first available one-gap certificate gives a different split.

This is a complete finite classification of F1's pivot-support domain, not a
classification of all source-entitled exact-13 row/order cells. Source
occurrence and comparison with existing fixed-cell Lean terminals are separate
obligations. In particular, no actual live leaf is counted eliminated here.

Replay and tests:

```bash
uv run --no-cache python -B scripts/check_exact13_three_chain_cell.py --verify docs/audits/2026-09-05-exact13-three-chain-cell.json
uv run --no-cache python -B -m pytest -q -p no:cacheprovider scripts/test_check_exact13_three_chain_cell.py
```

The input specification's local file SHA-256 is
`72cd80b44c5c047b6a50b965e0d17a2df7fe44b0a6dfd16a1a1d9649adca414f`.
Its needed finite data are retained in the script and certificate, so replay
does not depend on the external attachment remaining available.

## Next unblocked work

1. Find a source-compatible provider/order cell. Independent code and Luna
   audits confirm F1's finite calculation and its distinction from the older
   fixed cell, but the natural provider identification fails as recorded below.
2. With the source owner, state and prove the full finite-record/order
   projection, including mirror. Do not re-prove global-row existence.
3. Add the small exact-dual adapter only when a candidate needs that exit;
   F1 is completely canceled already. Preserve explicit undecided status for
   UNKNOWN or an unchecked/non-rational solver readback.

## Applicability audit F2

Assume O is the source second apex (raw 0), S/D are C0/C1 in either order,
and K/L are the source K/L. The full S,D,K supports cover every label except
position 9, so this position must be source z. Fixing O fixes the cyclic
rotation. The direct and mirror charts and their reversals give:

| Chart | bS | bD | z | Necessary source condition violated |
| --- | --- | --- | --- | --- |
| Direct | 8 | 11 | 1 | z is outside I2 |
| Direct reversed | 1 | 10 | 8 | bS is the first apex |
| Mirror | 1 | 10 | 12 | bS is the first apex |
| Mirror reversed | 12 | 9 | 1 | z is outside I2 |

Here I2 is raw labels {8,9,10,11,12}; blocker providers must be non-apex.
These four mappings were independently enumerated by the source-contract
auditor. This rejects this specific role-preserving application, not all
possible applications using other global rows or different provider roles.
F1 therefore contributes no established live-source coverage. Do not spend a
further formalization lane on this cell in anticipation of that failed match.
