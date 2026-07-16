# Symmetric opposite-apex continuation and deletion classifier

Date: 2026-07-14

Status: **SYMMETRIC FOUR-CENTER GLOBAL-K4 CONTINUATION KERNEL-CHECKED;
FORWARD/REVERSE ALTERNATING NORMAL FORMS KERNEL-CHECKED; CSS-ALIGNED
CROSS-DELETION CONSEQUENCES KERNEL-CHECKED; EXACT PRESCRIBED-DELETION/CSS
SELECTOR BOUNDARY KERNEL-CHECKED; NO CURRENT METRIC CORE FIRES; EXACT LOCAL
METRIC MODELS EXHIBIT THE MISSING GLOBAL COUPLING.**

## Verdict

The all-center `K4` continuation can be run symmetrically at both opposite
apices without using the retained frontier pair.  Choose selected four-classes
`K1` and `K2` centered at `oppApex1` and `oppApex2`.  The exact-radius covers
and adjacent one-hit bounds give at least two support points in each strict
opposite-cap region:

```text
K1.support ∩ (oppCap1 \ (surplusCap ∪ oppCap2))
K2.support ∩ (oppCap2 \ (surplusCap ∪ oppCap1)).
```

Global `K4` supplies a selected four-class centered at each of four named,
pairwise-distinct-within-side points.  This construction is proved in
`BiapexContinuationGrid.lean` by

```text
firstApex_support_strictInterior_card_ge_two
secondApex_support_strictInterior_card_ge_two
exists_twoOppositeApexContinuationRows.
```

For a strict first-side pair `a,b` and any selected row `Kz` centered at a
strict second-side point `z`, the strongest branch-complete consequence from
the current row/deletion APIs is:

1. `a,b` are both absent from `Kz.support`; then the same selected row proves
   K4 after deleting both `a` and `b` at `z`;
2. only `a` is present; then deleting `b` preserves K4 at `z`, so the chosen
   blocker of `b` is not `z`; or
3. only `b` is present; then deleting `a` preserves K4 at `z`, so the chosen
   blocker of `a` is not `z`.

The fourth Boolean branch, in which `Kz` contains both `a` and `b`, is
impossible.  The first apex and `z` are distinct centers of `oppCap2`, while
`a,b` lie outside that cap; the two rows would therefore violate
`CapSelectedRowCounting.outsidePair_unique_capCenter`.

This exact normal form is proved by

```text
first_strictPair_not_both_mem_secondContinuation
firstPair_deletion_membership_classifier
one_firstPair_blocker_ne_secondContinuation
firstPair_blocker_relocation_at_both_secondCenters.
```

The same-radius double-erasure theorem is also instantiated at the first
apex as `firstPair_sameRadius_doubleErase_classifier`.  Independently of the
continuation row, deleting `a,b` at the first apex either preserves K4 or the
first-apex radius is the unique K4 radius and its full class has cardinality
four or five.

The outside-pair terminal has also been proved in the reverse direction as
`second_strictPair_not_both_mem_firstContinuation`.  Thus the one-hit/zero-hit
classifier really applies symmetrically; the reverse arm is not being inferred
from prose symmetry.

These are genuine reductions, but they do not close K-A-PAIR.  In particular,
the new rows force blocker relocation, not a common pair in a continuation
row.  The decisive surviving incidence patterns and their strongest current
consequences are recorded below.

## Kernel boundary

The scratch file elaborates without `sorry`, `admit`, `native_decide`, or a
declared axiom.  Direct `#print axioms` probes report exactly

```text
propext, Classical.choice, Quot.sound
```

for every public theorem listed above and below.  The check was a deliberate
direct Lean validation of the unimported scratch file, not a project-wide
build.

## Exact prescribed-deletion/CSS selector boundary

The exact remaining selector boundary is now kernel-checked as follows:

```lean
theorem prescribed_deletion_blocked_iff_exists_css_alignment
    (D : CounterexampleData)
    (hcritical : Nonempty (CriticalShellSystem D.A))
    {q center : ℝ²}
    (hq : q ∈ D.A) (hcenter : center ∈ D.A)
    (hcenter_ne_q : center ≠ q) :
    (¬ HasNEquidistantPointsAt 4 (D.A.erase q) center) ↔
      ∃ H : CriticalShellSystem D.A, H.centerAt q hq = center
```

Assumption and use audit:

- `D.K4` is the global all-center K4 hypothesis.  It is used in the forward
  direction to turn prescribed deletion failure at `center` into an exact
  critical four-shell.
- `hcritical` supplies one total critical-shell system, used only as the base
  selector for `overrideAt` after deletion failure is already known.
- `q` and `center` must lie in `D.A`, and they must be distinct.
- No strict-convexity, MEC, cap-order, or opposite-apex field is used by this
  equivalence.  Those fields would have to enter a producer of the missing
  prescribed failure/alignment, rather than being hidden inside this selector
  lemma.

The forward implication constructs an aligned system by overriding the base
system at `q`; the reverse implication is exactly the aligned system's
`no_qfree_at` field.  Therefore the available hypotheses

```text
global K4 + existence/totality of a critical-shell system
```

do not by themselves select an arbitrary hit continuation center as the
blocker of `q`.  The extra datum is exactly alignment at that center, or the
equivalent prescribed deletion failure.  In particular, overriding the
retained critical map is legitimate *after* that failure has been proved, but
is circular as a method of proving the failure.

For K-A-PAIR this sharpens the continuation target.  The apparently missing
second forward membership cannot simply be added: the two-hit branch is
already forbidden by `first_strictPair_not_both_mem_secondContinuation`.
Consequently the live producer must either

1. force the supplied retained critical map to select the hit continuation
   center (or prove the choice-independent prescribed deletion failure there),
   visibly using the omitted global geometry; or
2. derive a different terminal from the surviving one-hit/zero-hit arm.

Evidence label: the displayed equivalence and its K-A API consequence are
**PROVEN**.  This is not a model-theoretic independence result saying that all
global K4/CSS structures admit an unaligned survivor; it identifies the exact
additional proposition that the current hypotheses and adapters have not
produced.

The theorem's `#print axioms` output is exactly

```text
propext, Classical.choice, Quot.sound
```

with no `sorryAx`, custom axiom, `admit`, or `native_decide`.  The checked
source identity and command are:

```text
SHA-256 034feb2c798e90f6b3b7780c6cf3e9ce85b5753997fff848ef7d503d40e5f553

cd lean
lake env lean -M 16384 \
  ../scratch/atail-force/biapex-continuation-grid/BiapexContinuationGrid.lean
```

## Exact finite membership audit

`enumerate_membership_grid.py` exhausts the Boolean membership abstraction for
two strict continuation rows versus a two-point opposite pair.  A row may
contain neither point or exactly one point; containing both is the repeated
outside-pair terminal already ruled out by Lean.

Exact counts are:

```text
allowed row patterns                                  3
two-row matrices                                      9
matrices with no source omitted from both rows         2
permutation matrices                                  2
symmetric forward/reverse permutation grids            4
```

The two exceptional matrices are the alternating assignments

```text
z1 row hits a only; z2 row hits b only
```

and its transpose.  Thus one deletion-survival disjunction can choose `b`
while the other chooses `a`; there is no forced common relocated source.

This remains consistent after imposing a stronger condition not supplied by
the live theorem: every source chooses one of the two opposite continuation
centers as its critical blocker, and the blocker row contains its source.
Then the only solutions are precisely the two permutation matrices.  Applying
the same construction in both directions gives four symmetric incidence
grids, including a pair of reciprocal two-cycles.

For every finite number of anonymous continuation rows at least two, the
singleton-hit patterns can also be alternated.  Hence row-membership logic by
itself never forces a repeated pair merely by adding more rows.  A global
outside-pair capacity inequality could in principle add force, but the current
two-center continuation does not saturate the existing pair-count bounds.

Evidence label: this is **exact and exhaustive within the stated Boolean
membership/critical-map abstraction**.  It is not a geometric counterexample,
not a `CounterexampleData`, and not a Lean proof of satisfiability.

## Exact alternating-arm continuation

Write

```text
a = first1, b = first2, c = second1, d = second2,
Ka = classAtFirst1, Kb = classAtFirst2,
Kc = classAtSecond1, Kd = classAtSecond2.
```

After swapping labels within either pair if necessary, the nonterminal forward
permutation is exactly

```text
a ∈ Kc,  b ∉ Kc,
b ∈ Kd,  a ∉ Kd.
```

There are two structurally different reverse permutations.

The reciprocal arm is

```text
c ∈ Ka,  d ∉ Ka,
d ∈ Kb,  c ∉ Kb,
```

so the directed incidences are `a ↔ c` and `b ↔ d`.  The genuine four-cycle
arm is

```text
d ∈ Ka,  c ∉ Ka,
c ∈ Kb,  d ∉ Kb,
```

so the directed incidence cycle is `a → c → b → d → a`.  These two arms are
represented without conflation by `ReciprocalAlternatingMembership` and
`CyclicAlternatingMembership`.

For every directed hit, `selectedRow_hitOutcome` gives the branch-complete
global-K4 consequence:

```text
deleting the hit source preserves K4 at the row center
or
the deletion is blocked and the selected row is exactly the resulting
critical full four-shell.
```

The four-fold instantiations are
`reciprocalAlternating_four_hitOutcomes` and
`cyclicAlternating_four_hitOutcomes`.  Thus even making all four displayed
rows deletion-critical supplies four exact critical rows, not an unrecorded
stronger incidence.

The strongest metric residual differs by arm:

- `reciprocalAlternating_paired_radius_eq` proves
  `Kc.radius = Ka.radius` and `Kd.radius = Kb.radius`;
- `cyclicAlternating_directed_edge_radii` identifies the four row radii with
  the four directed edge lengths, but gives no equality between different
  edges.

Finally, `ReciprocalCSSAlignedArm` and `CyclicCSSAlignedArm` test the stronger
hypothesis that the four displayed row centers are the four blockers chosen by
a `CriticalShellSystem`.  Under that alignment, every displayed omission is
exactly a cross-deletion survivor by
`cross_deletion_survives_iff_not_mem_selected_support`.  The resulting four
survival statements are kernel-checked in
`reciprocalCSSAligned_cross_deletion_survivals` and
`cyclicCSSAligned_cross_deletion_survivals`.  CSS alignment therefore does not
turn an omission into a hit; it certifies the same alternating grid as a cycle
of blocker rows.

## Exact local metric models of both arms

`verify_alternating_geometric_model.py` constructs two exact rational
16-point models, one for each arm.  In both models:

- each displayed continuation support is the entire positive-radius class and
  has cardinality four;
- deleting its named source leaves every radius class at that center with
  cardinality at most three, so all four displayed rows are genuinely
  deletion-critical;
- every pair of displayed row supports has intersection cardinality zero; and
- exhaustive exact arithmetic finds no equilateral triple among the 16
  points.

For the genuine four-cycle the four squared radii are

```text
144, 64, 148, 100,
```

so they are pairwise distinct.  For the reciprocal arm the squared radii are
the two forced paired values `144` and `148`.  This proves, within the stated
local metric data, that neither the four-cycle nor reciprocal-radius equality
manufactures the shared pair, equilateral hinge, or multi-row overlap needed
by the nearest current metric cores.

Evidence label: **exact rational local metric/deletion-critical models**.
They are deliberately not convex independent and do not provide global K4 at
the twelve satellite points, a `CounterexampleData`, an MEC cap packet, or a
total `CriticalShellSystem`.  They are therefore countermodels to a purely
local metric/critical-row implication, not counterexamples to Problem 97.

As an independent read-only cross-check, the sibling scratch lane
`strict-oppcap-cross-classifier/directed-cycle-geometry` has an exact
kernel-checked strict-convex, nonobtuse circumscribed-triangle cap-local model
of the directed three-cycle.  It omits global K4/deletion-criticality/CSS.
Together the two negative models isolate the missing parent field: neither
cap order alone nor local exact critical-row geometry alone closes the
alternating arm; closure must couple those surfaces globally.

Pinned source identities:

```text
BiapexContinuationGrid.lean
034feb2c798e90f6b3b7780c6cf3e9ce85b5753997fff848ef7d503d40e5f553

enumerate_membership_grid.py
3ab44b434810dc31dc58c63f5553a6f310c9e7ac9602478f6a7f41feb6f601de

verify_alternating_geometric_model.py
63778ee296b14eedb9abd9448fddc1fff97c170c1467a4ada8f30bb16ffab237
```

## Theorem-bank audit

Before proving the scratch lemmas, the required current and legacy registries
were searched, along with the indexed Lean corpora via `nthdegree docs
search --lean`.  The nearest reusable declarations are:

- `outsidePair_unique_capCenter`, which closes the forbidden two-hit branch;
- `actual_blocker_ne_of_deletion_survives`, which turns an omitted support
  point into blocker relocation;
- `sameRadius_double_erase_survives_or_unique_class_card_four_or_five`, which
  gives the independent first-apex erasure split;
- `cross_deletion_survives_iff_not_mem_selected_support`, which is stronger
  when the continuation center is already the chosen blocker of a named
  source, but then confirms the alternating omissions as cross-deletion
  survivors; and
- the U5 q-critical/bisector incompatibilities, which consume additional
  exact-triple, equilateral, auxiliary-center, or reciprocal incidence data
  not produced by this four-center construction.

The current production cores do not match either survivor:

- the common-two-point/FourPoint cores need two shared support points for two
  centers, while each alternating row has only one named cross hit;
- the FourRow perpendicular-bisector core needs two repeated point-pairs
  across four rows, absent from both incidence grids;
- the SixPoint collision and equilateral-hinge cores need additional equality
  closures not implied by a directed cycle; and
- the nearest U5 q-critical consumer also needs a dangerous triple together
  with common auxiliary points/centers.  Paired reciprocal radii do not supply
  those fields.

The same-cap rank/lap banks also start after the missing step: they require an
already-built same-cap incompatible edge, endpoint equality, rank inclusion,
or strict lap.  No banked theorem turns the one-hit/zero-hit normal form above
into one of those inputs.

## Remaining mathematical ingredient

The alternating one-hit pattern is now fully classified at the current API
boundary.  A closing producer must add a genuinely global coupling and do at
least one of the following:

1. force one continuation row to contain both strict opposite-side points,
   immediately firing the outside-pair terminal;
2. add a second shared point, dangerous triple, or auxiliary-center incidence
   that turns one alternating arm into an existing U5/metric payload; or
3. use boundary order/rank information to send every zero-hit and one-hit
   branch into a same-cap edge, strict inclusion/lap, or another current
   contradiction consumer.

Pure support counting, prescribed-deletion splitting, reciprocal paired-radius
equality, and CSS alignment do not supply that ingredient.  The exact models
show that a successful theorem must visibly consume at least one omitted
global parent field: convex/MEC cap coupling, global K4 away from the four
rows, or total critical-map structure.  The frontier's retained `q,w` should
not be substituted for `a,b`: their `oppCap1` placement is not part of the
current production type.

## Reproduction

From the repository root:

```bash
.venv/bin/python \
  scratch/atail-force/biapex-continuation-grid/enumerate_membership_grid.py

.venv/bin/python \
  scratch/atail-force/biapex-continuation-grid/verify_alternating_geometric_model.py

cd lean
lake env lean -M 16384 \
  ../scratch/atail-force/biapex-continuation-grid/BiapexContinuationGrid.lean
```

Only files under `scratch/atail-force/biapex-continuation-grid/` were created
or changed by this lane.
