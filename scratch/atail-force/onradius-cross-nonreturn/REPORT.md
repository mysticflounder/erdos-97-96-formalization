# On-radius cross nonreturn checkpoint

Status: **kernel-checked exact split; neither result constructor closes**.

This lane owns only the conjunction of
`onRadiusSurplusPairedCommonDeletion` and
`normal.directed.crossMembership` under the production
`FrontierCommonDeletionRefinedNormalForm`.  All parent/frontier/critical-map,
source, and physical-center origins are retained.

## Theorem-bank preflight

Before deriving a new packet, this lane checked the registries required by
`AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- `nthdegree docs search --lean` queries for two-center/common-deletion,
  outside-pair, and double-apex statements.

No banked terminal consumes two distinct common-deletion sources at the same
two physical centers.  The closest consumers require an additional row or
incidence packet.  In particular, three-center deletion survival is not an
existing contradiction.

## Kernel-checked results

The scratch file is
`OnRadiusCrossNonreturn.lean`.  Its two headline theorems are:

1. `Problem97.ATailOnRadiusCrossNonreturnScratch.rootedTwoBisectorAlternation`
   records the two alternating bisector chords forced by the branch:
   the surplus/marginal pair is equidistant from both physical apices, and the
   frontier pair is equidistant from the first apex and the actual blocker.
2. `Problem97.ATailOnRadiusCrossNonreturnScratch.physicalSecondApexReturn_or_thirdCenterCommonDeletionNonreturn`
   applies the existing third-center classifier to the marginal companion's
   actual blocker and proves the exhaustive split below.

The split has exactly two constructors:

- `PhysicalSecondApexReturn`: the actual blocker is the physical second apex,
  and the complete selected support at the marginal companion is exactly the
  stored row `B₂`.
- `ThirdCenterCommonDeletionNonreturn`: one of the original frontier sources
  `q` or `w` survives deletion at the first apex, second apex, and a third
  center.  The third center is the actual blocker of the marginal companion
  and is proved distinct from both physical apices and from the original
  deleted source's blocker.  The result carries both physical and third-center
  `CommonDeletionTwoCenterPacket`s.

Validation command, run from `lean/`:

```text
lake env lean -R .. ../scratch/atail-force/onradius-cross-nonreturn/OnRadiusCrossNonreturn.lean
```

Both `#print axioms` results are exactly:

```text
[propext, Classical.choice, Quot.sound]
```

There is no `sorryAx` dependency.

## Negative verdict

Neither constructor is terminal with the present consumer bank.

- The physical-return branch gives a stronger exact row lock, but no existing
  theorem contradicts that row together with the current cap/order facts.
- The genuine-third-center branch gives a source surviving at three distinct
  centers, but the audited theorem bank has no geometry-aware consumer that
  makes this contradictory.  Feeding it back into a generic common-deletion
  classifier would merely recurse and is intentionally not done here.

The exact rational checker `local_projection_model.py` also verifies a
strictly convex seven-point projection satisfying the two equal-radius chord
patterns, the physical second-apex return, and the stated surplus/complement
placement.  It is not a model of `CounterexampleData` or global K4; it only
shows that the extracted local metric/cap/order packet alone is realizable.

Validation:

```text
UV_CACHE_DIR=/tmp/uv-cache-atail uv run python \
  scratch/atail-force/onradius-cross-nonreturn/local_projection_model.py
```

Output: `PASS: exact rational local projection is strictly convex and realizable`.

## Smallest production promotion

If this boundary is promoted, the smallest useful unit is:

- result structures `PhysicalSecondApexReturn` and
  `ThirdCenterCommonDeletionNonreturn`; and
- theorem
  `physicalSecondApexReturn_or_thirdCenterCommonDeletionNonreturn`.

`rootedTwoBisectorAlternation` is sound and kernel-checked, but is not currently
load-bearing and need not be promoted until a consumer uses it.

The next mathematical target should therefore be a direct consumer of one of
the two exact constructors, not another weakening or generic recursive
common-deletion packet.  This checkpoint closes no production `sorry` by
itself.
