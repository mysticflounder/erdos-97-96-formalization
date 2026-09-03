# D1 TriApex computational general-theorem mine

Date: 2026-09-02

Audit head: `64fc8d5d1b89b94c6f2a913a57e7f1632d32acdf`

Computational checkpoint: `92cb0b191`

Angle-form update: `1665a1391`

Lane: `d1-triapex-general-theorem-mine-20260902`

## Outcome

The current-wave data do not yield a new proof-bearing general theorem that
closes the TriApex leaf. They yield two strong **reuse** results, one useful
normalization candidate, and two firm negative results:

1. The same-arc two-circle obstruction and the generic strict Kalmanson-cycle
   consumer already exist in kernel-clean Lean source. The missing work is an
   occurrence/boundary-order adapter from the D1 packets, not another metric
   theorem.
2. All 111 target-cell residue patterns share a three-apex radius-collapse
   profile. This supports a small general normalization lemma for a future
   angle-form certificate route, but the profile is not yet produced from
   `J`, `G`, and `Q`, and it is not contradictory by itself.
3. The 14 Stage 2 member cores are mutually non-embedding and cover only 596
   of the 2948 capped Stage 1d target-cell survivors. They expose no uniform
   equidistance-only forbidden subconfiguration.
4. Every one of the 111 residue patterns satisfies the complete abstract
   linear boundary-order system. Adding all strict triangle inequalities does
   not change that result. A new four-point order lemma followed by `linarith`
   cannot refute this residue.

No Lean source theorem was added, and no closure credit is claimed.

## Scope and trust boundary

This mine inspects only the new D1 computational artifacts recorded by the
Stage 1d, Stage 1f, Stage 1g, Stage 2, and angle-form waves. The direct consumer
is
`Problem97.ATailFrontierLiveClosure.false_of_pairedCommonDeletion_fiveSurviveOneFail_triApexAllLarge_core`
in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TriApexEndpointRetainedOmission.lean:2874`.
The theorem still ends in `sorry`.

The Stage 1f long run is exhaustive for its generated target-cell formula:
the loop enumerated 387 survivors, representing 111 distinct metric patterns,
then certified the base formula plus 15,543 learned cuts plus all survivor
blocks as UNSAT. This does not by itself prove the mathematical target. In
particular, the 15,246 KS1 cuts have admission `DERIVED`, because the cap-data
to boundary-order adapter has not been compiled in Lean.

The Stage 1d counts are capped samples. The algebraic runs use one Singular
engine. Finite-field results do not establish characteristic-zero or real
claims. A timeout or missing dimension line gives no mathematical conclusion.

## Candidate and reuse ledger

### R1. Same-arc common-circle obstruction — reuse now

**Statement.** Let an injective counterclockwise boundary contain distinct
chord endpoints `q,v` and distinct points `u,y`, neither equal to an endpoint.
If `u` and `y` lie on the same open boundary arc of the chord, and

```text
dist q u = dist q y,
dist u v = dist y v,
```

then the configuration is impossible.

**Status:** PROVEN and already banked as
`Problem97.Census554.CyclicOrderDistanceCores.false_of_two_circle_same_arc`
at `lean/Erdos9796Proof/P97/Census554/CyclicOrderDistanceCores.lean:165`.
The lower-level increasing-order variants are the three
`false_of_four_ccw_*_bisect_*` theorems in
`lean/Erdos9796Proof/P97/ATail/CapCrossingKalmanson.lean:504` onward.

**Wave support.** Every one of the 2,941 distinct capped Stage 1d target-cell
patterns had such a probe witness. In the exhaustive Stage 1f target-cell
run, this motif and its equality-closure cycle extension generated 15,246 KS1
cuts, leaving 111 metric patterns.

**Immediate consumer.** A card-15 occurrence adapter beneath the open D1 core,
or a checked finite-census cut emitter used by that branch.

**First missing antecedent.** The source packets must produce the four boundary
indices, their same-arc placement, and the two distance equalities after
equality closure. For block-distinct witnesses the cap-block placement nearly
supplies the order, but the direct/mirror four-point adapter is still absent.

**Limitation.** This theorem explains rejected patterns. It cannot eliminate
the 111-pattern residue: all 111 survive the closure-level rule at global
scope.

### R2. Arbitrary strict Kalmanson comparison cycles — reuse now

**Statement.** A nonempty transitive path of source-valid selected-row
Kalmanson comparisons strictly increases its named distance value; therefore
a path returning to its starting value is impossible.

**Status:** PROVEN and already banked as
`Problem97.ATailOrdinalKalmansonCycle.value_lt_of_transGen` and
`Problem97.ATailOrdinalKalmansonCycle.false_of_transGen_cycle` at
`lean/Erdos9796Proof/P97/ATail/OrdinalKalmansonCycle.lean:92` and `:111`.

**Wave support.** Among the 15,246 KS1 cuts, 9,637 are two-quadruple comparison
cycles at scope `(two,two)`, 2,275 are block-distinct two-quadruple cycles,
123 use three quadruples, and the remaining cuts include immediate
cancellations and mixed-scope chains. Cycle lengths range from 2 upward.

**Immediate consumer.** A generic cut-to-`Relation.TransGen` certificate
emitter for the exact-15 branch.

**First missing antecedent.** D1 currently produces neither the boundary-order
facts nor a checked `SelectedRowOrdinalComparison` path from a KS1 record.
There is no need for a new cycle theorem.

**Limitation.** The full Stage 1g linear system is SAT for every residue
pattern, so even arbitrary positive combinations of these strict linear
inequalities do not close the residue.

### C1. Three-apex selected-radius collapse — hold as a normalization lemma

**Proposed statement.** For points `x,y,z` and selected radii `r₀,r₁,r₂`, if

```text
y,z lie in the selected class centered at x with radius r₀,
x lies in the selected class centered at y with radius r₁,
x lies in the selected class centered at z with radius r₂,
```

then

```text
r₀ = r₁,
r₀ = r₂,
dist x y = dist x z.
```

The conclusion is elementary distance symmetry plus selected-class
membership. Related transport is already available through
`Problem97.dist_eq_dist_of_mutual_bisector` and the context-specific
`Problem97.P5IndexedSourceScratch.mutualTriangleCrossCenterRadiusTransportSat`.
No project-wide declaration with this exact selected-class interface was
found.

**Wave support:** EMPIRICALLY VERIFIED, exhaustive inside the Stage 1f
target-cell residue abstraction. Each of the 111 patterns has the same
apex-class profile up to one of three label rotations, 37 patterns per
rotation. Each apex class also contains one neighbouring-cap interior point.

**Immediate consumer.** The angle-form normalization used by
`kal_angles.py`, followed eventually by an exact-15 metric certificate
consumer.

**First missing antecedent.** No Lean occurrence theorem extracts this
apex-class profile from `J`, `G`, and `Q`. The finite classifier supplies it
only after card-15 enumeration. The lemma itself gives no contradiction.

**Decision.** Do not add it in isolation. Add it only with either a checked
classifier bridge or a source-level occurrence theorem and a concrete metric
certificate consumer.

### R3. Unit-ideal certificate ingress — reuse if the metric route matures

**Statement.** If a checked sparse-polynomial cofactor combination of the
fact polynomials is `1`, then the fact polynomials have no simultaneous real
zero.

**Status:** PROVEN and already banked as
`Problem97.U5GramCert.false_of_unitIdealCertCheckerNormalized` at
`lean/Erdos9796Proof/P97/U5GramCertPoly.lean:789`.

**Wave support.** Four of the 20 dihedral angle representatives are raw-empty
over `QQ` on one Singular engine:
`0128294791aad010`, `0a55d4c3c9ce4aaf`, `3f5944d10bef23b7`, and
`6df4c7a8d7bf40b6`. Each angle script contains 40 equations in 26 variables.

**Immediate consumer.** Pattern-specific exact-15 certificate modules, if
Singular or another exact tool emits authenticated cofactors which the Lean
checker accepts.

**First missing antecedent.** There are no retained Nullstellensatz
certificates for these four patterns, no Lean translation of the angle facts,
and no occurrence bridge from `J`, `G`, and `Q`. Only four of 20 orbit
representatives are covered, so this route is not presently exhaustive.

### N1. Stage 2 equidistance cores — no new general theorem

The 14 recovered member cores use 6 to 9 points, 8 to 15 equidistance
equations, 2 to 4 shells, and 2 to 3 apex classes. No two cores embed into one
another. None contains an equilateral triple or a point equidistant from all
three apices. Each is deletion-minimal at the member level.

Coverage of the capped 2,948 Stage 1d target-cell survivors is 36 with the
first four cores, 592 with ten cores, and 596 with all fourteen. This is a
sample-specific family, not a bounded uniform obstruction. The raw empty
ideals say only that the named equations force the two pinned anchors to
coincide in their encoded systems. They do not supply a common smaller lemma.

The later chain 2b does not change that conclusion. It added three
full-pattern deletion-minimal systems and one additional member core at the
finite-field discovery layer; a fifth shrink was stopped after repeated
timeouts. No enlarged coverage count or new common-motif census was recorded,
so these results cannot be used to assert saturation of the core family.

Concurrent untracked `Census554/*InterlockCollision*.lean` files were excluded
from the reuse result. They belong to another dirty-worktree lane, have no
committed aggregate import here, and no injective embedding from a D1 member
core into one of those motifs was authenticated in this pass.

### N2. Linear boundary-order strengthening — ruled out for this residue

For each of the 111 patterns, Stage 1g used 78 abstract distance classes and
all 2,730 strict Kalmanson inequalities. Z3 and cvc5 both returned SAT on all
111. Adding 1,365 strict triangle inequalities produced 4,095 constraints per
pattern and Z3 again returned SAT on all 111.

This is an exhaustive negative result for the encoded 111-pattern abstract
linear systems. It does not construct Euclidean planar configurations, but it
does rule out an order-only contradiction obtained as a positive linear
combination of those constraints.

## Evidence table

| Evidence | Exact scope | Result | Rigor label |
|---|---|---|---|
| `stage1f-kalmanson-03/artifacts/summary-long-20260902T164754Z.json` | one complete generated target-cell formula | 387 survivors, 111 metric patterns; final survivor-blocked CNF UNSAT; KS1 semantic admission still `DERIVED` | EMPIRICALLY VERIFIED for generated CNF |
| `stage1g-farkas-01/artifacts/residue-all/summary-all-20260902T171017Z.json` | all 111 residue patterns; z3 and cvc5 | 222 SAT engine-results | EMPIRICALLY VERIFIED at abstract QF_LRA scope |
| `stage1g-farkas-01/artifacts/residue-all-triangle/summary-all-20260902T171120Z.json` | all 111; z3 | 111 SAT results with 4,095 constraints each | EMPIRICALLY VERIFIED at abstract QF_LRA scope |
| `stage1f-kalmanson-03/events/angle-char0-empty.log` plus four receipts | four orbit representatives over `QQ`; one engine | raw ideal dimension `-1` | EMPIRICALLY VERIFIED at encoded characteristic-zero scope |
| `stage1f-kalmanson-03/events/angle-slim-undecided.log` | six representatives over `GF(32003)` | zero-dimensional, vector-space dimension 1,536 to 3,072 | EMPIRICALLY VERIFIED finite-field result only |
| `stage1f-kalmanson-03/events/angle-char0-sat-empty.log` and `angle-char0-finite.log` | selected saturated/real-root attempts | timeouts or no dimension line | no mathematical conclusion |
| `stage2-probe-01` summaries and D1 plan core census | capped samples; one algebra engine | 14 non-embedding classes, 596/2,948 coverage | CONJECTURED as a route assessment |

All run paths above are below
`scratch/runs/d1-triapex-plan-20260901/`. The run manifests pin base head
`9a222da97112efc204a038ca2f71ff5a12078f94` and the source/input digests used
by the computations.

## Bounded reuse preflight

Every query was passed as one explicitly quoted shell argument.

```bash
proof-blueprint search "two circle same arc"
nthdegree docs search --lean "two common circle points same chord arc impossible" --kind theorem --limit 6

proof-blueprint search "strict Kalmanson comparison cycle"
nthdegree docs search --lean "directed cycle strict Kalmanson selected rows" --kind theorem --limit 6

proof-blueprint search "radius transport selectedClass membership"
nthdegree docs search --lean "selected class cross membership common radius transport" --kind theorem --limit 6

proof-blueprint search "unit ideal certificate checker normalized"
nthdegree docs search --lean "unit ideal certificate checker normalized polynomial contradiction" --kind theorem --limit 6
```

The first, second, and fourth searches found the exact existing consumers
recorded above. The radius-collapse search found related transport machinery
but no exact generic selected-class declaration. Source files were inspected
directly at audit head. The proof-blueprint kernel graph was stale, so cached
caller data were not used as promotion evidence.

## Recommendation

Do not start a new general metric-theorem proof from the Stage 2 cores. If the
finite exact-15 route continues, reuse `false_of_two_circle_same_arc` and
`false_of_transGen_cycle`; spend proof effort on the cap-block boundary-order
adapter and checked occurrence records. If the angle route continues, first
finish the 20-orbit characteristic-zero/real classification and extract exact
unit-ideal certificates. Only then rerun a wave-only minimal-core mine.

For the present open leaf, the strongest new mathematical target is not a
contradiction theorem. It is a source-level occurrence theorem that derives
the shared three-apex radius profile from `J`, `G`, and `Q`, or demonstrates
precisely why card-15 enumeration is essential. Until that antecedent exists,
the computational profile remains a classifier observation rather than a
Lean theorem about the live branch.
