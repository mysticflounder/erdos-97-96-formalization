# Actual-blocker orbit census rule ledger

Status: scratch discovery lane. No rule here is registered in
`census/p97_search/rules.py`.

## Hard rules

| ID | Encoded content | Proved source | Scope |
|---|---|---|---|
| `R-CYCLE` | period at least two, distinct canonical sources, and blocker of source `i` is source `i+1` | `SourceExactMinimalActualBlockerCycle`, `two_le_period`, `source_injective` | source-exact minimal erased cycle |
| `R-PAIR` | each source has an independently chosen distinct mate co-radial at the fixed opposite apex | `SourceExactMinimalActualBlockerCycle.robustPairAt`; `AmbientRobustHistoryPair` fields | no mate or radius coherence across indices |
| `R-SHELL4` | the selected blocker shell is the exact distance class through the source and has cardinality four | `CriticalFourShell`; `source_mem_selectedFourClass` | positive-radius selected shell |
| `R-CLASSIFY` | `HIT` iff the mate belongs to that shell; otherwise `OMISSION`; a HIT carries the opposite-side literal and excludes strict surplus-cap interior | `actualBlocker_capMetricClassifier`; `pairFamily_someHit_or_allOmission` | chosen pair at one source |
| `R-CIRCLE2` | two distinct circle centers have at most two common points | `SelectedFourClass.inter_card_le_two`; `two_circle_third_point_eq` | equality-pattern consequence only |
| `R-EDGE-SYNC` | next blocker belongs to the current source shell iff the two adjacent blocker-edge lengths agree | `secondBlocker_mem_sourceShell_iff_edgeLengths_eq` | derived automatically from exact distance colors |
| `R-FIRST-NONBISECT` | the two named outside-fiber points cannot both belong to the second selected shell | `secondBlocker_dist_ne_of_freshOutsideFirstBlockerFiber` | **only** a `FreshOutsideFirstBlockerFiber P Pρ` with distinct retained blocker centers |

`R-FIRST-NONBISECT` is exercised by a separate probe. It is not imposed on
generic actual-blocker-cycle edges because those edges do not carry the
first-fiber theorem's telescope.

## Exact first-fiber packet

The separate packet additionally encodes both exact four-shells, their exact
first-cap intersections, total first-cap membership for represented points,
the partial blocker-fiber lower bounds `3` and `2`, distinct blocker colors,
and only source-level cross coincidences admitted by
`CrossBlockerCoincidence`. It derives at least three points of the second shell
outside the first cap. Together with `R-FIRST-NONBISECT`, this forces at least
one outside-cap point beyond `q,o`; the branch containing neither forces two.

This packet is not promoted to `R-CYCLE`: no theorem currently transports its
retained-pair/history hypotheses around an arbitrary actual-blocker orbit.

The robust-history, erased-source, and two-apex deletion-K4 fields are recorded
as opaque required witness atoms. The equality-pattern encoder does not
pretend to reconstruct their geometry.

## Sensitivity-only rule

`fixed_apex_radius` makes all independently chosen source pairs use the same
apex radius. This is **not proved** by the cycle family and is never enabled
silently. Runs with it are labeled separately.

## Excluded conjectures

The following are not hard constraints:

- a third common point in every HIT;
- exclusion of the all-OMISSION cycle;
- mate or radius coherence between consecutive sources;
- a named endpoint in every blocker row;
- endpoint spending, strict cap-rank decrease, or coherent no-wrap/lap
  progress;
- a `noM44` contrapositive;
- full convex, MEC, minimal-counterexample, or robust-deletion realization.

The first two alternatives are not merely unproved by this shadow:
`uniform_survivors.py` constructs hard-rule survivors for both for every
period at least eleven. Together with the checked finite witnesses for periods
six through ten and isolated-point extension, generic equality-shadow
enumeration cannot eliminate either branch.

An UNSAT verdict from Z3 is discovery evidence at the stated finite bound. It
is not promoted to proof evidence without a deterministic CNF, CaDiCaL proof,
and successful `drat-trim` replay.
