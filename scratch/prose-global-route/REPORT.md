# Global prose/source route audit

## Verdict

No mathematically complete prose argument or checked source theorem currently
closes

```lean
Problem97.ATailFrontierLiveClosure.
  exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows
```

The declaration remains `by sorry` in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:5510`.
The strongest current evidence says that its displayed disjunction is not a
positive-incidence target at all: under the two exact collision packets and
disjoint source pairs, every disjunct is impossible.  A source-clean proof must
therefore derive `False` from genuinely global Euclidean/minimality data and
then eliminate it.

This was a read-only audit of the current tree and the ingested nthdegree
corpora.  No production file was edited and no build was run.

## The polarity obstruction

The current report
`scratch/triapex-global-bridge/REPORT.md`, section **“The displayed conclusion
is impossible”**, records a compiling scratch theorem

```lean
targetConclusion_impossible_of_exact_disjoint_collisionRows
```

in
`scratch/packet-contradiction-search/TargetConclusionImpossible.lean`.
Its two ingredients are exact:

- the three-hit alternative contradicts
  `criticalShell_inter_oppositeCapClassInterior_card_le_two_of_apexRich`;
- each named cross-hit contradicts
  `exact_disjoint_cap_pairs_force_cross_omission_and_two_outside`.

Thus attempting to construct one arm of the conclusion directly has the wrong
polarity.  Section **“Exact missing producer”** of the same report correctly
recasts the branch as a global contradiction obligation.

## What the global structures actually provide

### Minimality and the unique-four critical map

`Problem97.ATailMinimalUniqueFourCover.exists_isUniqueFourCenter_of_minimal`
(`lean/Erdos9796Proof/P97/ATail/MinimalUniqueFourCover.lean:101`) is a genuine
pointwise minimality theorem: every carrier source has a unique-four deletion
center.  But the target's hypothesis `hcriticalShellUniqueFourCover` can already
be assembled from the fixed critical-shell system `H` using
`isUniqueFourCenter_centerAt`, `centerAt_ne_source`, and
`uniqueFourClass_centerAt_eq_selectedAt_support`.  It supplies a row for each
source; it does not align two rows on named positive incidences.

The ingested/current report
`scratch/atail-force/unique4-global-coupling/REPORT.md`, section
**“Checked global transition”**, obtains the real joint bounds

```text
2 * V.card ≤ (D.A \ S.capByIndex k).card
```

and omission of a new robust center from the actual critical map.  Its
**“Exact collision-arm classification”** also records
`five_le_selectedClass_of_minimalDeletion_collision`.  These are genuine
minimality/K4/cap consequences, but neither localizes a critical row to the
named source pair or blocker shell.

That missing alignment is stated explicitly in:

- `scratch/atail-force/global-k4-css-bridge-audit/REPORT.md`, sections
  **“Verdict”** and **“Exact first missing producers”**: global `K4` selects an
  unanchored row, and the total critical map supplies an unanchored blocker
  cycle; neither gives prescribed `q,w` hits or bounded-support confinement;
- `scratch/atail-force/unique4-robust-global-terminal/REPORT.md`, section
  **“First missing source-level implication”**: minimality escape rows are
  centered at members of the finite support while critical-map rows are
  centered at chosen blocker values, with no theorem identifying the centers
  or transporting their positive incidences.

### All three rich Moser apices

`FrontierAllLargeCapsTriApexRobustResidual` carries three
`ApexRichClassStructure`s, the global inequality

```lean
D.A.card ≤ 4 * (notRobustCenters D).card
```

and `no_center_covers_all_apices`
(`FrontierLiveClosure.lean:4598-4634`).  The two latter fields are copied into
rotated residual data but are not consumed by a theorem that forces a named
incidence.

Richness itself gives the precise strict-cap `4` or `2+2` patterns, while
`criticalShell_inter_oppositeCapClassInterior_card_le_two_of_apexRich`
(`ApexRichClassStructure.lean:113-142`) gives an upper bound of two on the
relevant canonical-shell intersection.  It therefore rules out the advertised
three-hit arm rather than producing it.

The most direct prose audit,
`docs/audits/2026-07-25-triapex-uniform-geometric-obstruction-analysis.md`,
labels its **“Verdict”** **CONJECTURED, not proved**.  Its section
**“The actual missing bridge”** proposes an anti-cover statement such as
`exists_source_outside_uniqueFour_cover`, but notes that this is nearly the
live terminal unless proved independently of `R.minimal`.  Its concrete planar
projection also shows that cap richness and weak cover arithmetic alone are
compatible; a closure must materially use global K4, pointwise minimality, and
the fixed critical map.

## Complete geometric/Kalmanson results and why they do not close the leaf

### Shortest-side MEC geometry

`docs/shortest-side-biequidistance-exclusion-2026-07-24.md`, sections
**“Statement”** and **“Proof”**, gives a complete prose proof that the endpoints
of a shortest side of a non-obtuse MEC boundary triangle cannot share two
distinct equidistant carrier points.  Its **“Branch consequence”** sharpens a
common two-center overlap bound from `≤ 2` to `≤ 1` after rotating to the
shortest Moser side.

This is the closest complete global-MEC argument found, but its section
**“What this does not do”** is decisive: the conclusion is rigidity, not a
counting contradiction, and it does not close the all-large-caps terminal.

### Conditional Kalmanson terminals

The checked theorem
`Problem97.ATailCapCrossingKalmansonBridge.
false_of_two_selected_rows_shared_late_pair`
(`CapCrossingKalmanson.lean:427`) closes two selected rows only after they share
the same two late endpoints in the required cyclic order.  The live packet has
disjoint source pairs and only an outside-overlap upper bound; it does not
produce the required shared pair or its order.

Likewise,
`false_of_one_k1_three_cyclic_selected_rows`
(`UniqueFourKalmansonCores.lean:141`) assumes three rows, six prescribed
cross-memberships, and a compatible cyclic order.  None of those positive
cross-incidences is produced by the two-row/tri-apex packet.

`lean/Erdos9796Proof/P97/ATail/RetainedCollisionDifferentPairConsumer.lean`
is explicitly `COMPAT-ONLY/BANK`.  As summarized in
`docs/97-rvol-full-prose-proof-2026-07-13.md`, **“Part V — The open
obligations”**, it additionally needs a fresh `J`, a positive `K` in the
`J`-shell, and the placement

```text
O < J < C < A < X < K.
```

That order yields a valid strict Kalmanson cycle, but five acyclic placements
survive the weaker local equalities.  The parent geometry currently forces
neither the placement nor the extra cross equality.  The exact gap is also
recorded in
`docs/audits/2026-07-26-exact-four-post-card-eleven-robust-closure-plan.md`,
the discussion of the Kalmanson consumers at lines 317-336.

## Exact missing bridge

A terminal-grade new theorem must couple the *actual* two collision rows to
global minimality/MEC geometry and all three rotated apex structures.  It must
derive `False`, for example by proving one of:

1. the two critical-map rows share two named outside points with cyclic
   placement, enabling `false_of_two_selected_rows_shared_late_pair`;
2. three source-faithful rows have the six positive cross-memberships and order
   needed by `false_of_one_k1_three_cyclic_selected_rows`;
3. a refinement of the arbitrary minimal-deletion escape produces a named
   cross hit, a common center/radius covering all three apices, or an `IsM44`
   packet; or
4. a noncircular removable-vertex/descent contradiction from exactly the live
   packet.

No ingested prose source, current document, theorem bank, or imported Lean
declaration supplies this coupling.  Additional local row-slot, overlap-upper-
bound, or cap-cardinality lemmas do not cross the present bottleneck.
