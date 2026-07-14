<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Global confinement probes

This package probes the open PIN-GENERAL producer behind
`U3FixedTripleAuditFrame.RowwiseConfinedQDeletedClasses`.

## Encoded rows

For an `(n - 5, 4, 4)` Moser-cap profile, the probes fix:

- the exact pinned class at center `v`;
- a deleted surplus-interior point `q` outside that pinned class;
- a blocker `p` and exact dangerous class `{q} ∪ T`;
- three auxiliary labels, giving six audit centers and the eight-point bounded
  support; and
- one selected four-class at every otherwise unrepresented ambient center.

The source-indexed layer additionally chooses, for every carrier source, an
exact four-shell through that source and its blocker center. Every selected K4
at that blocker center must contain the source. This is the finite-incidence
consequence of `CriticalShellSystem.no_qfree_erase_center_at`.

The row solver enforces the local L2/PROVEN cuts, the Moser-center Q3 joint
cuts, intersection cardinality at most two for distinct centers, cyclic
cross-separation when two classes share two points, and the global bound of
two distinct centers per point pair. Multiple rows at one center are allowed;
if either row is exact, the two supports must be equal or disjoint.

The three verdict families are intentionally separate:

- `q-critical`: an individual audit center can carry an exact four-shell
  through `q`;
- `survival`: all six audit centers simultaneously carry q-free four-classes;
- `confinement`: those six classes are also contained in the eight-point
  support.

## Epistemic scope

There are no coordinates or distance equations. Exactness is a declared row
constraint, not a metric proof that a radius class has no fifth point. A `SAT`
result is therefore only an incidence witness, never a Euclidean realization.
An exhaustive `UNSAT` result applies only to this declared shadow. A search
that reaches its node bound is `INDETERMINATE`.

The `results_n11_12` checkpoint fixes the first two surplus-interior labels as
the pinned source and deleted point. It is exhaustive for that canonical
adjacent labeled placement at each scanned cardinality, not for every cyclic
placement of the ordered pair.

`placement_results_n11_12` covers all 12 ordered surplus placements at
`n = 11` and all 20 at `n = 12`. The dangerous-row types `(0,0,2,2)` and
`(0,2,0,2)` have no full-center extension at every scanned placement and size.
`placement_zero_types_n13` repeats just those two types at all 30 ordered
placements at `n = 13`; all 600 and 1,200 respective scenarios are UNSAT, with
no capped search. The scans are still bounded evidence, not a general-`n`
theorem.

`critical_shell_results_all_placements_n11_12` selects one admitted packet per
dangerous-row type and placement: 177 packets at `n = 11` and 340 at `n = 12`.
All 517 admit every source shell individually, a joint source-indexed shell
system, and a compatible K4 at every center under the no-q-free linkage. No
search was capped. Thus this layer removes a model-fidelity gap but does not by
itself contradict the open PIN-GENERAL interface.

`shell_audit_results_all_frames_n11_12` couples those source-indexed shells to
every q-critical audit-center alternative and every six-center q-deleted frame.
After targeted retries at 1, 3, and 10 million nodes, all scenarios are
adjudicated: q-critical is 4,198 SAT / 795 UNSAT, and q-deleted survival is
12,894 SAT / 2,546 UNSAT across 15,440 frames. The shell constraints prune both
families but leave many incidence witnesses, so they do not prove rowwise
confinement. The earlier all-UNSAT confinement verdict remains valid by
monotonicity because this scan only adds constraints.

`metric_realizability_structural_complete` is the final deterministic
classification of the 1,325 saved SAT row systems. Equality closure finds
1,264 duplicate-center contradictions, 31 exact-off-circle contradictions,
20 perpendicular-bisector contradictions, 9 cyclic five-point
bisector/circle contradictions, and 1 cyclic rhombus/equilateral
contradiction. Thus all 1,325 saved systems are classified, with no remaining
metric UNKNOWN. The original 30-system Z3 frontier and its 60-second rerun are
retained as historical solver artifacts; independent cvc5 triage likewise
did not provide complete adjudication. Generic Lean consumers now prove all
five structural schemas. The saved-system partition is still bounded
artifact coverage, not a Lean proof that every arbitrary PIN-GENERAL frame
produces one of those cores. See
`docs/audits/2026-07-10-global-confinement-metric-core-audit.md`.

`surplus_source_metric_core_results_n11_12` is an active, resumable follow-up.
It adds the theorem-facing requirement that the selected four-class at the
surplus apex contain the deleted surplus point, then asks for a full-center,
source-shell assignment avoiding the formalized metric cores. Five cheap cores
prune prefixes; equal-K4, equilateral-bisector collision, three-triad collision,
surplus-source collision, six-row-anchor collision, and seven-point-orbit
collision are checked at complete leaves. This probe starts from the 517
`critical_shell` representatives. It does **not** add the six rows of a
particular `U3FixedTripleAuditFrame`; a survivor therefore falsifies only the
proposed three-row-plus-global-shell eleven-core producer, not a producer that
genuinely consumes the full audit frame.

The ninth core is the direct, kernel-checked theorem
`EqualityCore.not_realizes_of_surplusSourceCollisionCore`. It excludes the
previously saved packet-54 assignment with
`(O,A,B,C,U,V,W) = (1,4,7,8,6,9,10)`, superseding the external unit-ideal
calculation for that assignment. It does not discharge packet 54 as a whole:
both the complete v4 scan and its v5 retry reached the 300,000-node cap and are
`INDETERMINATE`.

The tenth and eleventh consumers are
`EqualityCore.not_realizes_of_sixRowAnchorCollisionCore` and
`EqualityCore.not_realizes_of_sevenPointOrbitCollisionCore`. Their role
contracts require only `O != A`, and their axiom closures are the three core
axioms `propext`, `Classical.choice`, and `Quot.sound`. They respectively kill
the saved v4 assignments for packets 85 and 181. This invalidates those
particular witnesses, not the packet-wide `SAT` verdicts; v5 must search for
alternatives before either packet is classified.

The complete v4 checkpoint is archived as
`surplus_source_metric_core_results_n11_12_v4.json` with SHA-256
`d26afd7901bc72b80d212caad6c48d9aa088b653cca3ac7caeca7811ca3b0062`.
Its exact nine-core counts are 167 `UNSAT`, 250 `SAT`, and 100
`INDETERMINATE`. Schema v5 adds the two new consumers and records every inherited
legacy row with `legacy_resume.schema` and the `monotone-unsat` basis. The v5
run inherits exactly the 167 v4 `UNSAT` rows and retries the other 350 packets.
Its rolling output is not terminal until `complete` is true.

Schema v4 corrected two audit findings. The surplus-source detector now matches
the Lean core's role contract, which requires only `O != A` rather than seven
pairwise-distinct roles. Resume validates the input digest and packet scope,
reuses only terminal current-schema rows, and retries every `INDETERMINATE` row;
legacy schemas contribute only monotone `UNSAT` verdicts.

The v5 detector shares one precomputed equality-closure matrix across all core
checks. On the saved packet-177 witness, the prefix classifier fell from about
8.05 ms to 1.27 ms per call and the full classifier from about 45.05 ms to
6.77 ms per call on this host. All 72 global-confinement tests pass, and a
separate 250-system randomized differential check matched the reference
detectors exactly.

`equality_ideal_probe.py` reads either v4 or v5 saved `core_free: SAT`
assignments, fixes labels 0 and 1 to `(0,0)` and `(1,0)`, and asks Singular
whether the resulting squared-distance equality ideal over QQ is unit. `UNIT`
is exact for that gauge-fixed equality ideal; `NONUNIT` is only a proper-ideal
verdict and is not a real, distinct, convex, or exact-row realization. Packet
177 survives all eleven named detectors under direct replay but has a
Singular-confirmed seven-point unit-ideal core. The direct Lean `grobner`
formalization exceeded the 16 GB build cap, so that candidate is not yet a
proved twelfth consumer. This paragraph records the historical first attempt;
the obstruction was subsequently proved as
`EqualityCore.not_realizes_of_sevenPointCircleNetworkCollisionCore` using a
smaller argument.

`direct_cap_selected_metric_core_residuals_n11` is the current proof-facing
finite checkpoint. Unlike the packet-stratified scans, it uses the
kernel-proved reduction to the single card-eleven `(6,4,4)` profile and the
kernel-proved exact selected-row cap-hit counts. It chooses one row at every
center, enforces the pinned and source-indexed blocker conditions, and checks
all 23 current formalized metric-core families (26 detector stages after the
three reversed-order variants) without either prose-only tuple exclusion.
All twelve ordered choices of distinct pinned and deleted strict-surplus labels
are `EXHAUSTIVE`; no placement is capped, the largest visits 299,801 nodes, and
the deduplicated residual bank is empty.

An earlier forward-only diagnostic reported three residual row patterns in five
placements. Each was an existing convex five-point core in the reversed cyclic
orientation. `_formalized_metric_core` and the exact-system probe now check both
orientations, and the regression suite includes that witness. The final
artifact SHA-256 is
`98b1ebe08279337e5dbded3ec1911edb7be505ec84506d6de7eadcf2300d247f`.
This is exact coverage of the declared finite model, not yet a Lean proof of
the target theorem: a verified classifier/certificate and a geometric
carrier-to-canonical-label soundness bridge remain open.

`zero_type_cores_n11_13` explains every one of the 2,888 node-zero rows for the
two stable zero-extension types. Exactly 1,444 rows fail because the fixed
pinned and dangerous classes already violate either the two-circle overlap
bound or cyclic cross-separation. The other 1,444 have an empty candidate
domain at Moser center 2; every candidate is rejected by a combination of the
same overlap/separation atoms and the pinned-row Q3 cuts. The blocker-region
signatures are stable across `n = 11,12,13`: `(0,0,2,2)` uses `O2` in the
fixed-pair branch and `O1` in the empty-domain branch, while `(0,2,0,2)` uses
`S` in both.

This core decomposition is proof guidance, not a general-`n` theorem. Lean
already has `SelectedFourClass.inter_card_le_two` for the overlap atom. The
`SurplusCOMPGBank.btw_sep` core now applies to an arbitrary `Fin n` CCW convex
enumeration. The remaining separation bridge must extract the actual carrier
enumeration and map concrete selected supports to its indices. The Moser-2
branch still needs a geometric selected-class-to-profile-code bridge. The
K-Q3-1 same-side two-circle kernel is already
`SurplusCapPacket.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex`;
the remaining adapter must establish its shared-cap/outside hypotheses from
concrete selected supports. The
normalized scalar K-Q3-5 core is now kernel-checked in
`P97/Q3SharedInterior.lean` as `q3_shared_interior_false_normalized`. Its full
indexed-cap adapter is now kernel-checked and core-only as
`SurplusCapPacket.q3_shared_interior_false_of_indexed_cap`. The adapter uses
`capFrameByIndex`/`capFramePacketByIndex` to rotate the MEC packet into the
support-chord frame and internally discharges disk, nonobtuse, orientation,
center-height, coordinate, radius-square, and normalized-side obligations.
Its source-facing wrapper
`SurplusCapPacket.q3_shared_interior_false_of_adjacent_selectedClass_membership`
consumes `z` in the indexed cap interior, `p`/`q` in the two adjacent cap
interiors, and shared `SelectedClass` radii at the two cap endpoints. The
orientation-free wrapper handles either cap orientation by reversing the frame
and swapping `p`/`q`; adjacent-cap membership supplies the signed-area products.
The remaining work is therefore to extract those three points and four class
memberships from the selected-class branch without using the target confinement
conclusion. The verified
L2/full LOCAL enumerator can
discharge finite code coverage only after that extraction.

## Commands

```bash
UV_CACHE_DIR=.uv-cache uv run python -m census.global_confinement.probe \
  --n-min 11 --n-max 12 --workers 8 --max-nodes 200000 \
  --out census/global_confinement/results_n11_12.json \
  --markdown census/global_confinement/results_n11_12.md

UV_CACHE_DIR=.uv-cache uv run python -m census.global_confinement.placement_scan \
  --n-min 11 --n-max 12 --workers 8 --max-nodes 200000 \
  --out census/global_confinement/placement_results_n11_12.json \
  --markdown census/global_confinement/placement_results_n11_12.md

UV_CACHE_DIR=.uv-cache uv run python -m census.global_confinement.placement_scan \
  --n-min 13 --n-max 13 --workers 8 --max-nodes 300000 \
  --row-type '(0, 0, 2, 2)' --row-type '(0, 2, 0, 2)' \
  --out census/global_confinement/placement_zero_types_n13.json \
  --markdown census/global_confinement/placement_zero_types_n13.md

UV_CACHE_DIR=.uv-cache uv run python \
  -m census.global_confinement.zero_type_core_probe \
  census/global_confinement/placement_results_n11_12.json \
  census/global_confinement/placement_zero_types_n13.json \
  --out census/global_confinement/zero_type_cores_n11_13.json \
  --markdown census/global_confinement/zero_type_cores_n11_13.md

UV_CACHE_DIR=.uv-cache uv run python \
  -m census.global_confinement.critical_shell_probe \
  --n-min 11 --n-max 12 --all-placements --per-type 1 \
  --workers 8 --max-nodes 300000 \
  --out census/global_confinement/critical_shell_results_all_placements_n11_12.json \
  --markdown census/global_confinement/critical_shell_results_all_placements_n11_12.md

UV_CACHE_DIR=.uv-cache uv run python \
  -m census.global_confinement.shell_audit_probe \
  --n-min 11 --n-max 12 --all-survival-frames \
  --workers 8 --max-nodes 300000 \
  --out census/global_confinement/shell_audit_results_all_frames_n11_12.json \
  --markdown census/global_confinement/shell_audit_results_all_frames_n11_12.md

UV_CACHE_DIR=.uv-cache uv run python \
  -m census.global_confinement.resolve_shell_audit \
  census/global_confinement/shell_audit_results_all_frames_n11_12.json \
  --workers 8 --max-nodes 1000000 \
  --out census/global_confinement/shell_audit_results_all_frames_n11_12.json \
  --markdown census/global_confinement/shell_audit_results_all_frames_n11_12.md

UV_CACHE_DIR=.uv-cache uv run python \
  -m census.global_confinement.resolve_shell_audit \
  census/global_confinement/shell_audit_results_all_frames_n11_12.json \
  --workers 8 --max-nodes 3000000 \
  --out census/global_confinement/shell_audit_results_all_frames_n11_12.json \
  --markdown census/global_confinement/shell_audit_results_all_frames_n11_12.md

UV_CACHE_DIR=.uv-cache uv run python \
  -m census.global_confinement.resolve_shell_audit \
  census/global_confinement/shell_audit_results_all_frames_n11_12.json \
  --workers 2 --max-nodes 10000000 \
  --out census/global_confinement/shell_audit_results_all_frames_n11_12.json \
  --markdown census/global_confinement/shell_audit_results_all_frames_n11_12.md

UV_CACHE_DIR=/tmp/uv-cache uv run python \
  -m census.global_confinement.surplus_source_metric_core_probe \
  --workers 7 --max-nodes 300000 --resume \
  --out census/global_confinement/surplus_source_metric_core_results_n11_12.json

UV_CACHE_DIR=/tmp/uv-cache uv run python \
  -m census.global_confinement.equality_ideal_probe \
  --input census/global_confinement/surplus_source_metric_core_results_n11_12_v4.json \
  --packet-index 177 --timeout-s 120 \
  --out census/global_confinement/equality_ideal_results_packet177.json

UV_CACHE_DIR=/tmp/uv-cache uv run python \
  -m census.global_confinement.direct_cap_selected_metric_core_probe \
  --workers 8 --max-nodes 1000000 --enumerate-residuals \
  --out census/global_confinement/direct_cap_selected_metric_core_residuals_n11.json

UV_CACHE_DIR=.uv-cache uv run python -m unittest discover \
  -s census/global_confinement/tests -t . -v
```
