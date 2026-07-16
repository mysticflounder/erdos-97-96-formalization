# Global critical continuation audit

Date: 2026-07-14

Status: **TOTAL `CriticalShellSystem` IS NOT LOAD-BEARING; ALL-CENTER `K4`
IS THE FIRST ISOLATED MISSING LAYER; ITS SMALLEST ONE-STEP CONTINUATION IS
KERNEL-CHECKED IN SCRATCH.**

## Verdict

The 29-point exact local regression originally omitted two total live layers:

1. a `CriticalShellSystem` for every carrier source; and
2. all-center `HasNEquidistantProperty 4`.

These omissions are now separated.  Six exact rational-rotation points extend
the model to 35 strict-convex vertices.  The extension preserves the unique
MEC, cap packet, no-`IsM44` split, local robust blocker packet, failed direct
two-hit target, and failed row-confinement target.  Every one of the 35 sources
now has an exact deletion-critical four-shell, so all fields of a total
`CriticalShellSystem` can be chosen.  Global `K4` still fails at 24 centers.

Therefore total criticality is not the missing force.  The first isolated
omitted live hypothesis is all-center `K4`.

This is an exact symbolic regression inside the listed abstraction.  It is not
a `CounterexampleData` or K-A-PAIR counterexample precisely because it fails
global `K4`.

## Live `CriticalShellSystem` audit

The live structure in `U1CarrierInjection.lean` has exactly two mathematical
fields:

- `shellAt` chooses, for each source `q ∈ A`, a blocker center and a named
  `CriticalSelectedFourClass A q center`; and
- `no_qfree` says the chosen center has no four-point radius class after
  deleting `q`.

There is no cross-source injectivity, cap-order, monotonicity, or coherence
field.  The derived API proves useful local facts:

- every selected four-class at a chosen blocker contains its source;
- its support equals the chosen critical shell;
- the source-to-blocker map has a nontrivial finite cycle; and
- `overrideAt` and `overrideExactSelectedClass` can change choices while
  retaining the same pointwise deletion certificate.

The override API does not add a new geometric constraint.  Consequently an
exact per-source deletion-critical assignment is sufficient to realize the
entire structure-level content tested here.

## Exact 29-point total-CSS audit

`analyze_total_css.py` imports the pinned 29-point verifier, reruns its exact
regression, and enumerates every exact deletion-critical blocker candidate for
each source.  A candidate row is required to:

- be an exact four-point radius class;
- contain the source;
- have a different carrier center; and
- leave no radius class of size at least four at that center after source
  deletion.

Exactly two sources are uncovered:

```text
J, t1
```

The other 27 sources already have at least one exact candidate.  Thus the
29-point model does not itself admit total CSS, but its deficit is completely
localized.

## Exact 35-point completion

`search_css_completion.py` discovered two small rational-rotation triples:

```text
source J  around center F_k4_1  with parameters (1,3,5)/20000
source t1 around center C       with parameters (1,2,3)/20000
```

`verify_total_css_completion.py` replays the result symbolically from the
pinned 29-point source and checks all of the following exactly:

- all 35 points are distinct vertices in the listed strict hull order;
- the unique MEC boundary remains `{A,C,O}`, and every added point is strictly
  inside its disk;
- the cap cards are `(8,11,19)`, with the correct pointwise boundary
  multiplicities, so no permutation is `IsM44`;
- the first-apex class, second-apex double survivor, actual blocker shells,
  reciprocal cross-deletion survival, and local K4 rows at `A,F,I,X,Y,Z` are
  unchanged;
- the direct two-hit target still has maximum intersection one;
- the q-row confinement target is still false; and
- every one of the 35 sources has an exact deletion-critical blocker
  candidate.

The last point supplies a deterministic total `CriticalShellSystem` assignment
within the exact finite metric abstraction.  Nevertheless all-center global
K4 is false at exactly these 24 centers:

```text
E,
F_k4_2, F_k4_3,
G,
I_k4_1, I_k4_2, I_k4_3,
J, J_css_1, J_css_2, J_css_3,
K,
X_k4_1, X_k4_2, X_k4_3,
Y_k4_1, Y_k4_2, Y_k4_3,
Z_k4_1, Z_k4_2, Z_k4_3,
t1_css_1, t1_css_2, t1_css_3
```

Pinned identities:

```text
29-point verifier source:
98a069a5d763436c11f93dafb51bf7173a1909873abaeef7b74a96a451389698

35-point coordinate payload:
c5289a5ded63bca9c2c56b40211c2ec53009a83df66f9594815b9c5681db7dce

35-point exact verifier source:
adbc3583b5bfefc0d2cf80af45b3a09a2a0d47ede836168d9bb61683083e1ff7
```

All sign, equality, squared-distance, hull, disk, cap, incidence, K4, and
deletion-critical checks are exact SymPy computations.  The printed floating
hull margin is diagnostic only.  This certificate is exact within its stated
finite abstraction but is not Lean-kernel checked.

## First all-center continuation theorem

The 35-point regression identifies where global K4 first adds force.  Let

```text
K : SelectedFourClass D.A D.packet.oppApex2
I₂ := D.packet.oppCap2 \
  (D.packet.surplusCap ∪ D.packet.oppCap1).
```

Then the exact-radius cover and the two adjacent one-hit theorems imply

```text
2 ≤ (K.support ∩ I₂).card.
```

Indeed, `K.support` has four points; at most one lies in the surplus cap and at
most one lies in the other non-surplus cap; the three-region cover puts every
remaining support point in `I₂`.  No `IsM44` cardinality assumption is needed.

Global K4 now has a new, branch-complete use:

```text
∀ z ∈ K.support ∩ I₂,
  Nonempty (SelectedFourClass D.A z).
```

Together these say that at least two distinct strict-opposite-cap support
points carry new selected global rows.  This is the smallest honest one-step
producer beyond K4 at only the six local blocker-support centers.

`GlobalCriticalContinuation.lean` kernel-checks the combined theorem as

```text
secondApex_two_globalK4_continuations
```

and also exposes the independent counting lemma as

```text
secondApex_support_strictInterior_card_ge_two.
```

The scratch source contains no `sorry`, `admit`, `native_decide`, or declared
axiom.  A live `#print axioms` probe reports exactly `propext`,
`Classical.choice`, and `Quot.sound` for both public scratch theorems.  It is
not yet wired into production.

## Why the audited legacy banks do not already finish the continuation

The following nearby banks are consumers of stronger data, not producers from
`CriticalShellSystem` or K4:

- `SameCapIncompatibleEdge` already assumes a source and blocker center in one
  ordered cap, a chosen endpoint side, and the relevant endpoint-radius
  equality.
- `source_pushout_left` and `source_pushout_right` consume that edge, a
  `MinorCapChainModel`, and rank inequalities to place the source in a
  `RankInterval`.
- `rank_drop` consumes a strict inclusion of rank intervals and turns it into
  a cardinal drop; it does not construct the strict inclusion.
- `StrictLapPacket` already carries its three cyclic strict pushes, while
  `strictLapPacket_nonreturn` merely refutes that supplied packet.
- `ArcBlockContiguity` translates cap/arc membership into boundary-index
  intervals once a convex boundary enumeration is supplied.  It does not
  manufacture a metric row or a same-cap incompatible edge.

Accordingly the new two-center continuation rows are the correct input to the
next producer search.  The next missing theorem must turn one or both rows
into either a same-cap incompatible edge, a strict rank inclusion/lap packet,
or a direct pair-bisector contradiction.  Replaying the existing consumers
without that adapter would only restate their antecedents.

## Promotion recommendation

Keep the theorem in scratch until the next row-classifier consumer is proved.
The result is kernel-clean and its arbitrary-`S` generalization is routine,
but no production theorem currently consumes the two new rows.  Promoting it
into `CriticalPairFrontier` now would choose an API and module placement before
we know whether the consumer needs raw cardinality, two named distinct centers,
boundary ranks, or chosen rows.  It is also structurally a U2 cap-row lemma,
not intrinsically a critical-pair theorem.

Once the classifier is known, promote the narrow formulation it actually
uses—preferably with an arbitrary `SurplusCapPacket A`/explicit convex-K4
input—and put the cap counting fact at the U2 layer, with only the
frontier-specific adapter in `CriticalPairFrontier`.  This avoids another
production signature churn while losing no proved mathematics.

## Reproduction

From the repository root:

```bash
UV_CACHE_DIR=/tmp/uv-cache-atail uv run python \
  scratch/atail-force/global-critical-continuation/analyze_total_css.py

UV_CACHE_DIR=/tmp/uv-cache-atail uv run python \
  scratch/atail-force/global-critical-continuation/verify_total_css_completion.py

cd lean
lake env lean \
  ../scratch/atail-force/global-critical-continuation/GlobalCriticalContinuation.lean
```

Only files under `scratch/atail-force/global-critical-continuation/` were
created or changed by this lane.  No production source, closure document,
`SurplusM44`, unique-row, `(6,5,4)`, or census file was touched.
