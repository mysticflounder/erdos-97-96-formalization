# Guarded one-boundary retained-model audit

Status: COMPLETE; INDEPENDENT REPLAY PASSED. This document records a bounded computational replay,
not a source theorem or an exhaustive all-center search.

## Scope and acceptance conditions

The input is the 6,001 retained model events under
`scratch/runs/exact13-witnessed-key-cegar-wave2-20260906/run-0001/events/models`.
The checker must authenticate the ordered event stream, each event seal,
and each referenced raw SAT assignment; reconstruct the key; and replay
the original root and key validity conditions before counting any result.

For every active global center c, and each (p,F) in (0,K), (0,L), (1,T),
the tested condition is: if p belongs to Gc, then Gc and F share at most
one support label. The apex-membership hypothesis is required. Inactive
global centers are disabled by the two blocker-role guards.

The clause schema, for each pair x < y, is:

```text
is_b0_c OR is_b1_c OR NOT m_Gc_p OR NOT m_Gc_x OR NOT m_Gc_y
  OR NOT m_F_x OR NOT m_F_y
```

The acceptance targets from the earlier read-only audit are 2,574 full
clauses, 1,815 nontrivial clauses, 4,432 rejected models, and 1,569 survivors.
Each survivor must separately exhibit a one-form zero projection after
reconstructing its row-equality classes. Counts are replay targets, not
assumptions used to infer cancellation.

The checker and tests are respectively
`scripts/check_exact13_guarded_boundary.py` and
`scripts/test_check_exact13_guarded_boundary.py`. The machine-readable
report will be `docs/audits/2026-09-06-exact13-guarded-boundary.json`.

## Claim boundary

This lane does not invoke a solver, modify a solver root, establish the
geometric entitlement of the guarded constraint, or edit Lean. It does
not claim exhaustive source coverage, UNSAT of a strengthened root,
or resolution of the general strict all-center conjecture.

## Validation

EMPIRICALLY VERIFIED on the pinned retained dataset:

| Replayed property | Result |
| --- | ---: |
| Model events, seals, raw assignments, root and Key validity | 6,001 pass |
| Full / nontrivial guarded clause families | 2,574 / 1,815 |
| Models rejected / surviving | 4,432 / 1,569 |
| Surviving models with independently reconstructed zero forms | 1,569 |
| Guarded center/target violations | 6,802 |

The model-hit counts by target are K: 2,198, L: 1,785, T: 2,127;
these counts overlap. The violation histogram (number of center/target
violations per model) is 0: 1,569; 1: 2,611; 2: 1,365; 3: 383;
4: 60; 5: 6; 6: 7. A center/target intersection of size three yields
one entry in this histogram, although it violates three pair clauses.

The ordered filename + NUL + event-byte stream has SHA-256
`a73108f3ca72f73e65f3c5ee033ccb728208129cb54c3d62a013d1dd8ab5e65a`.
The authenticated effective-root file has SHA-256
`22cf80c657d8444827893533f22975e0ac2cbc12f033cf4334125f6088da857a`.
The checker compares its regenerated clause body against that file, ignoring
only DIMACS comments. The similarly named original-root file has different
provenance comments and must not be substituted under the effective-root pin.

The saved report includes one zero-form index for each of the 1,569 survivors.
`--check` reruns the entire audit and compares every report field, including
the witnesses and source digests, rather than trusting the saved counts.
The report self-hash is an integrity check, not an external signature or a
proof of the checker's correctness. This remains finite Python-checked evidence.

```bash
uv run --no-cache python -B scripts/check_exact13_guarded_boundary.py --check docs/audits/2026-09-06-exact13-guarded-boundary.json
PYTHONDONTWRITEBYTECODE=1 uv run --no-cache pytest -q -p no:cacheprovider scripts/test_check_exact13_guarded_boundary.py
uv run --no-cache --with ruff ruff check --no-cache scripts/check_exact13_guarded_boundary.py scripts/test_check_exact13_guarded_boundary.py
```

The 22 tests pass, including exhaustive seven-literal guard truth tables,
both orientations, the missing-apex and inactive-center regressions,
blocker labels in intersections, malformed assignments, path escape,
duplicate JSON keys, and resealed counter/witness tampering. Lint passes.

## Original-root non-entailment

EMPIRICALLY VERIFIED countermodel: `imported-0003.json` satisfies the old
root and Key validity checks but violates the guarded condition. Its active
G3 row is {0,10,11,12}; L is {3,8,11,12}. Thus the apex 0 belongs to G3,
and the two rows share labels 11 and 12. This rejects an implication from
the old Boolean root to the new constraint; it does not challenge its
separate proposed geometric entitlement.

The terminal `model-6000.json` also violates the guarded condition and has
zero-form index 225. Neither that model nor any guarded survivor supplies
an uncancellable strict-Kalmanson witness.

## Independent audit and trust limits

The independent read-only auditor used a separate parser, converted positional
supports to raw labels, enumerated the full and reduced pair predicates, and
rebuilt a DSU on the 78 unordered pairs of 13 labels. It scanned all 1,430
Kalmanson forms for each surviving model. It confirmed every event seal,
schema, unique index and projected/translated support agreement, the pinned
model stream, the 4,432/1,569 split, and all 1,569 cancellations. Expanded
violating pair tuples number 6,894, versus 6,802 grouped center/target entries.
Its final report corrected an earlier description of the edge count as 105;
the calculation used 78 edges and no extra labels.

The checker and its saved-report replay both exit zero. The report seal is
`8e9f396777410a39d622d1e5a59d450387d972c0d4a4e471c3f2596ac6f9cbd9`;
the checker source digest is
`4d100815716e3683cf769430f6a1bd647d8a5f7bd68cc67043d898db0fc25d68`.

Two implementation boundaries were reviewed. Source hashes are bound by the
saved report and checked on replay, but are not an external attestation of
source correctness. Raw-assignment references are required to remain under
the retained run's `events/piqd`; model entries are authenticated by the
exact filename set and byte-stream pin, not a separate symlink prohibition.
No stronger filesystem confinement or cryptographic authorship is claimed.

No claim above is a Lean proof or a range-independent theorem. The finite
replay is complete; geometric entitlement and exhaustive strengthened-root
coverage are outside this lane.
