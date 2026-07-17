# Robust second-apex minimal-deletion reduction

Date: 2026-07-16

Status: **KERNEL-CHECKED THREE-WAY PARENT REDUCTION; NO TERMINAL ARM CLOSED.**

## Checked result

`RobustSecondApexMinimalDeletion.lean` composes the live
`SurvivorPairRelocationPacket` with the stopped, read-only
`global-minimal-deletion-core` checkpoint.  It retains:

- `D.Minimal`;
- the concrete `CriticalShellSystem D.A` carried by the survivor pair;
- the no-`IsM44` branch hypothesis;
- the first-apex non-card-four arm;
- the directed critical-row cross hit;
- `14 ≤ D.A.card`;
- `6 ≤ S.oppCap2.card`; and
- `FullyDeletionRobustAt D S.oppApex2`.

The routine theorem

```lean
robustSecondApexMinimalDeletion_reduction
```

returns exactly one of three source-faithful endpoints:

1. `RobustSecondApexMinimalDeletionCollision`;
2. `RobustSecondApexMinimalDeletionMultiCore`; or
3. `RobustSecondApexMinimalDeletionInstalledSingleton`.

The motive-valued theorem

```lean
false_of_robustSecondApexMinimalDeletion
```

isolates one direct-`False` consumer for each endpoint.  No new `sorry`,
`admit`, axiom, or native computation is used.

## Why this is the correct exported predecessor

The applicable stopped-lane theorem is

```lean
SurvivorPairRelocationPacket.
  exists_strictCapFresh_collision_or_nontrivialCore_or_installedSingleton
```

rather than the weaker four-role or unlocalized trichotomy.  The live bound
`14 ≤ D.A.card` immediately supplies its `6 < D.A.card` hypothesis.  Deleting
the frontier pair, the actual `q` blocker, and all three Moser vertices forces
the new center into one strict cap interior and returns the global
`4 * V.card ≤ D.A.card` shell-packing inequality on the multi-core arm.

The other required premise,

```lean
H.centerAt P.q P.q_mem_A ≠ S.oppApex1,
```

is routine on the current branch: equality would make deletion of `P.q`
critical at the first apex, and the checked first-apex lemma would force the
excluded exact-card-four class.

The stopped extractor was imported and consumed unchanged.  Nothing in
`scratch/atail-force/global-minimal-deletion-core/` was edited or
reimplemented.

## Exact strengthened endpoints

The robust second-apex hypothesis does not immediately refute any of the
three outcomes.  It does supply useful positive data to each consumer:

- collision: the pair is provably not `(P.q,P.w)` in either orientation, and
  deleting either collision source preserves K4 at `S.oppApex2`;
- multi-core: every source in the minimal deletion core can be deleted while
  preserving K4 at `S.oppApex2`, alongside its disjoint exact shell at the
  fresh center and the global packing bound;
- installed singleton: the installed fresh blocker and `S.oppApex2` both
  preserve K4 after deleting the same named frontier target.

Every endpoint also carries the exact robust-radius classification:

```lean
SecondApexDeletionRobustRadiusClassification D S
```

so its future consumer may split between a five-point radius and two
support-disjoint K4 radii without reconstructing that reduction.

These are genuine routine advances, but none is a contradiction by itself.
In particular, the singleton outcome is a two-center common-deletion packet
in substance, not yet a terminal: feeding it back into the current uniform
consumer can return full robustness again.

## Exact remaining direct-False consumers

### 1. Collision consumer

It must eliminate a co-radial pair among the six prescribed deletion roles,
excluding the already-refuted frontier pair.  It may use the fresh strict-cap
location and simultaneous deletion survival at the physical second apex.

### 2. Multi-core consumer

It must eliminate a cardinal-minimal deletion set with at least two sources,
pairwise-disjoint exact four-shells at one fresh strict-cap center,
`4 * V.card ≤ D.A.card`, and physical-second-apex survival after deleting
every core source.

### 3. Installed-singleton consumer

It must eliminate or monotonically advance an overridden critical system in
which one frontier target is omitted by the fresh exact blocker and deletion
of that same target preserves K4 at both the fresh center and the physical
second apex.  A literal override loop without a decreasing invariant would
only repackage this obligation.

## Smallest production signature refactor

The only current production caller already has the needed minimality proof:

```lean
-- RemovableVertexAxiom/Continuation.lean
have hmin : D.Minimal := ...
```

It is dropped when calling the route-B tail.  The smallest signature change
is therefore:

```lean
theorem u1_largeCap_routeB_tail_false
    (D : CounterexampleData)
    (hmin : D.Minimal)
    (hcard : 9 < D.A.card)
    ... : False
```

and the sole current call becomes, schematically,

```lean
u1_largeCap_routeB_tail_false D hmin hDcard hnoRem hcritical hNoM44D ...
```

Current source search finds exactly one declaration and one call site.  If
the new parent theorem is invoked before the legacy slot enumeration, `hmin`
does not need to be threaded through the LIVE-Q/C helper tree.  A larger
signature refactor would therefore be premature.

### Post-checkpoint integration

That two-file refactor is now applied: `u1_largeCap_routeB_tail_false`
retains `hmin`, and `removableVertexOfLarge_of_nonIsM44` passes the proof it
already constructs.  K-A-PAIR and the LIVE-Q/C helper signatures are
unchanged.

## Validation

The file was compiled as an isolated scratch module against freshly checked
temporary oleans for its two predecessor lanes.  The focused command exited
zero.  Its three printed declarations have axiom closure exactly:

```text
propext, Classical.choice, Quot.sound
```

The compiled output is:

```text
/private/tmp/p97-robust-second-apex-minimal-deletion/
  RobustSecondApexMinimalDeletion.olean
```

No full project build was run, and no production file, closure document,
proof-blueprint state, or other scratch lane was modified.
