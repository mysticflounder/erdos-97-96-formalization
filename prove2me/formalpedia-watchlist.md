# Formalpedia reuse watchlist

Requested by Adam on 2026-09-12. The live baseline timestamp, exact statements,
statement hashes, environment, and theorem IDs are in
[formalpedia-watchlist.json](formalpedia-watchlist.json). Statuses are API
observations, not local kernel audits. This is an on-demand watchlist; no
scheduled task has been installed.

## Check for changes

From the repository root:

```bash
uv run --no-cache python scripts/check_formalpedia_watchlist.py
uv run --no-cache python scripts/check_formalpedia_watchlist.py --all
uv run --no-cache python scripts/check_formalpedia_watchlist.py --offline
```

The checker reads the existing API key from
`~/prove2me_workspace/credentials.json`, exchanges it for an access token in
memory, and compares live theorem statuses, names, and statement hashes with
the baseline. It does not change the baseline or credentials. `--credentials`
and `--watchlist` override the input paths. API errors must not be interpreted
as an unchanged result.

When a status or statement changes, fetch the accepted submissions via
`GET /api/v1/theorems/<id>/submissions?status=ACCEPTED,SKETCH_ACCEPTED`, then
`GET /api/v1/submissions/<id>/solution`. Inspect the actual proof, definitions,
dependencies, and hypotheses before updating the baseline. A new submission
that leaves the theorem's status and statement unchanged is not detected by
this checker. Repeat the saved keyword searches periodically to discover new
theorem IDs; the fixed watchlist cannot discover them itself.

## Priority obligations

| Theorem | Baseline | Why watch |
|---|---|---|
| [critical_cover_card_le_nine_of_tight_center](https://prove2.me/theorems/16aca7e9-8752-4631-9f2f-d2958d38a571) | Open | Bounds the convex, four-rich configuration by nine points under the exact critical-cover and tight-center hypotheses. |
| [critical_radius_cover_card_le_nine](https://prove2.me/theorems/c58343d6-7975-4a8c-8859-6a1043d5a09c) | Open | General critical-cover cardinality target. |
| [minimal_counterexample_removable](https://prove2.me/theorems/f03cf49e-3e3e-4cea-80fe-666a52629f3f) | Open | Potential deletion/minimality route; inspect the precise removable-vertex contract. |
| [finite_ten_exclusion](https://prove2.me/theorems/bbaf935e-32e1-4064-afaa-418647568fa9) | Open | Finite ten-point case. |
| [finite_eleven_exclusion](https://prove2.me/theorems/0c2105c8-40c2-4b5a-af9a-61f6237bd4b6) | Open | Finite eleven-point case. |

The JSON also tracks the mission's P97/P96/combined goals, its alternative
counterexample claims, and an open selected-class helper. Alternative claims
are explicitly classified separately: they do not support the current proof
direction. The first snapshot contains 21 entries, of which 12 are Open.

## Search findings and reuse limits

The search used the default platform environment, Lean v4.33.1 and Mathlib
`0df444a360eaa60ab8c11dca51a86af692955474`, which matches this repository.
It covered project names, isosceles/equidistant configurations, circles,
bisectors, convexity, incidence, and the current residual families. Other
platform environments were listed but not exhaustively searched.

The strongest P97-specific hits already have local counterparts:

- `three_triad_collision` in `Census554/ThreeTriadCollision.lean`;
- `equilateral_bisector_collision` in `Census554/FivePointCollision.lean`;
- normalized mutual-return contradiction and height bounds in
  `ATail/ExactFiveMutualReturnChord.lean`;
- the nine-point witness result in `K4WitnessDeletion.lean`.

Paths above are relative to `lean/Erdos9796Proof/P97/`. These results must not
be counted as new local progress. The JSON records six current local residual
targets for later searches; the API returned no Open hits for `Rigid221`,
`TriApex`, or `TwoSource` in the searched environment. Keyword absence does
not establish that no useful theorem exists under another name.

Three external supporting candidates are retained:

| Candidate | Possible use | First reuse obligation |
|---|---|---|
| [MetricGeometry.dist_eq_two_mul_sin_half_comparisonAngle](https://prove2.me/theorems/34b71b7e-0c9c-49b6-9f01-c35fb628acf7) | Converts equal radii into a chord-length sine formula. | Its angle is a platform `comparisonAngle`; connect that definition to the consumer's geometry. Accepted source imports two platform theorems, whose proof closures still need auditing. |
| [Perpendicular_Bisector_of_Chord_Passes_Through_Center](https://prove2.me/theorems/448883ee-ad29-469f-9b58-3cba46b2df3c) | Coordinate identity for two points on one circle. | Translate the consumer's distance equations into squared-coordinate hypotheses. Accepted source uses only Mathlib and a tactic search including `nlinarith`. |
| [euclidean_2d_sphere_midpoint_strict](https://prove2.me/theorems/1048b052-7922-4475-b2d9-edc31142fdd9) | Forces equal endpoints if both endpoints and their midpoint have the same squared radius. | Supply the midpoint-on-sphere hypothesis; this is not a general configuration contradiction. Accepted proof source has not yet been audited. |

All three were marked Proved by the API. No external result was identified
that discharges the current general-n deletion or critical-cover residual.
No candidate was imported or locally kernel-checked during this search.

Rejected title-only matches: `Conditions_for_Diameter_Perpendicular_Bisector`
has formal conclusion `True`; `Triangle_with_Two_Equal_Angles_is_Isosceles`
already assumes the sine-law equation. Neither supplies the missing geometry.

## Reuse across missions and the local graph

The platform guide permits importing an existing theorem directly:
`Theorems.Thm_<name with dots replaced by underscores>`. A proof or reduction
using it creates a dependency on the shared theorem; do not upload a duplicate
child. An Open child keeps the parent conditional until the required children
are proved. The imported theorem must be available in the target environment.

A mission captain can also attach an existing theorem ID to a milestone with
`PATCH /api/v1/milestones/<id>` and a `theorem_id` field. That is an attestation
that the existing theorem satisfies the milestone, not a proof adapter for
different hypotheses. Milestone membership and a proof dependency are
different operations. Nothing was linked or submitted by this search.

For the local Lean dependency graph, an API reference alone supplies no proof.
Bring the actual proof and its dependencies into an importable Lake dependency
or local module, adapt the hypotheses, and complete the repository's import,
axiom, and ingress checks. Do not import platform statement files containing
`sorry` as if they were kernel-checked proofs.

API workflow sources: `~/prove2me_workspace/references/discover.md`,
`references/prove.md` (Reductions and Lean environments), and
`references/mission_captain.md` (milestone linking), guide/server version 0.10.3.
