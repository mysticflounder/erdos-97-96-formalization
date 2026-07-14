# ATAIL certificate-bank generalization audit

Date: 2026-07-13

## Verdict

Three reusable theorem shapes are visible in the banked certificates, but only
the first two deserve near-term work:

1. **Generalize the fixed U5 Gram checker to arbitrary finite row and label
   types.**  This is the strongest new theorem suggested by the bank.  It is a
   contradiction **consumer/compiler**, not a live-data producer.
2. **Package the live critical-shell rows as a four-uniform incidence design.**
   Most of this mathematics already exists in current source or validated
   scratch: exact support locking at a common center, center-fiber cardinality
   at most four, distinct-center overlap at most two, and cap outside-pair
   uniqueness.  This is a genuine producer-side structural interface, but it
   does not force the required same-cap second center at cardinality twelve.
3. **Factor a cyclic equal-chord/order calculus out of the ATAIL metric cores.**
   The legacy chord-monotonicity theorem and the recent six-point cores support
   this direction, but the changing equality graph at round 20 shows that no
   single six-point circle-chain theorem currently covers the tail.

No banked theorem supplies the missing ATAIL placement/selection result.  In
particular, it would be circular to state coverage by the known metric cores
without independently proving that the live critical rows realize one of
their antecedents.

## Scope and rigor labels

This audit checked the required registries and their exhaustive JSON
companions:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

It also searched the indexed Lean corpus with `nthdegree docs search --lean`
for the U5 class/metric/scalar families, cyclic circle-chain geometry,
same-center support locking/fibers, and cap outside-pair uniqueness.  Those
searches found the declarations discussed below and no additional general
producer for the live ATAIL hypotheses.

The registry label `source-proved` means only that the declaration has no
source `sorry`; it is not a fresh kernel audit.  `Source-reachable` means the
declaration lies in the source repository's import closure.  Scratch results
are stated separately and are not promoted to imported production theorems.

## What the inventories actually contain

### Sibling `p97-rvol`

The sibling inventory covers 462 P97 modules, of which 430 are reachable from
`RVOL`.  It records 3,749 theorems/lemmas and 2,148 general-n candidate
instances.  Of those candidates, 2,143 are source-proved; 1,368 are
source-proved, reachable, and absent from the current repo by normalized
statement shape.

The sharpest cluster is `U5GlobalIncidence`:

| Surface | Reachable source-proved novel `False` consumers |
|---|---:|
| ambient-data/class | 96 |
| metric-point | 88 |
| scalar-algebra | 112 |
| **total** | **296** |

All 296 modules in that family are source-reachable.  The three surfaces are
mostly different presentations of the same proof pipeline:

```text
selected class incidences
        -> point-distance equalities and inequalities
        -> scalar/Gram algebra
        -> False
```

The class statements are not duplicates.  Ninety-five of the 96 use a
`U5DangerousTriple`; the exception is
`U5QDeletedK4Class.three_exact_classes_tetrahedron_incompatibility`.
Individual consumers use roughly three to six selected-class objects and four
to eighteen explicit support-membership atoms.  The modal signature is four
classes with eight membership atoms (17 families).  Thus the repeated object
is a small finite incidence language, not one statement that can simply be
renamed and imported.

Normalizing the locally novel `_incompatibility` names gives 108 conceptual
stems.  Sixty-six have class, metric, and scalar layers; 15 have class and
metric layers; 15 are class-only; seven have metric and scalar layers; and
five are scalar-only.  Of the 66 complete stems, 47 have exactly three
declarations and 19 have a fourth, separate algebra declaration.  This count
is a name/stem clustering of the exhaustive JSON, not a proof that all stems
instantiate one common theorem.

A representative three-level family is the q-critical antipodal auxiliary
center contradiction:

- class consumer
  `U5QCriticalTripleClass.qcritical_antipodal_aux_center_incompatibility`;
- its metric-point kernel in
  `lean/RVOL/P97/U5GlobalIncidenceQCriticalAntipodalAux.lean`; and
- its scalar kernel in
  `lean/RVOL/P97/U5GlobalIncidenceQCriticalAntipodalAuxScalar.lean`.

These are all recorded as source-proved, source-reachable, and absent from the
current repo by normalized shape.

### The two legacy P97 archives

The later `erdos/97` archive contributes 285 source-proved local-uniform
candidates in 233 normalized shapes: 4 ambient-set, 98 metric-point, and 183
scalar-algebra declarations.  The earlier `erdos-general-theorem/97` archive
contributes 297 in 244 shapes: 4 ambient-set, 98 metric-point, and 195 scalar
declarations.  Neither inventory contains a theorem quantified by an ambient
cardinality `n`; these are bounded-local geometry results, not an all-`n`
classification theorem.

The most relevant reusable geometry theorem in both archives is

```lean
pointChord_strictMono_of_angle_lt_radius
```

at `lean/N9Geometry.lean:1427` in the later archive.  It says that for three
points on the same positive-radius circle, strict angular order about the
center gives strict chord-length order.  The inventory records it as
source-proved, reachable in the legacy Lake root, and absent here by shape.
This is useful evidence for a cyclic equal-chord calculus, but importing it
would not by itself resolve changing-center row networks.

## Candidate 1: a finite-type Gram-certificate checker

### Existing theorem

The sibling bank already contains the fixed checker

```lean
theorem u5_gram_cert_checker_sound
    {P : Fin 6 -> Finset (Fin 8)}
    (cert : U5GramCertificate)
    (h : u5GramCertChecker P cert = true)
    (R : U5QCriticalPatternRealization P) : False
```

at `lean/RVOL/P97/U5GramCertSound.lean:205`.  Its live adapter
`u5_qcritical_gramcert_pattern_incompatibility` is at line 242.  Both are
source-proved, source-reachable, and absent from the current repo by
normalized shape.

The interface is genuinely fixed:

- six rows, `Fin 6`;
- eight labels, `Fin 8`;
- the label vector is `p,q,t1,t2,t3,u,a0,a1`; and
- the row centers are the fixed labels selected by `u5PatternRowCenter`.

The checker was not a decorative wrapper.  The archived U5 run reports that
it discharged 37,278 of 37,350 targeted q-critical Gram-certificate patterns;
the remaining 72 required the convex/square-configuration route.  A larger
empirical finite U5 audit covered 16,181,520 patterns with no survivor.  These
archived run counts are empirical coverage evidence, not theorem statements.
They show that a certificate compiler can collapse a large family of
individually named class/metric/scalar consumers without weakening kernel
checking.

### General theorem now suggested

The natural new declaration should quantify the finite combinatorics instead
of fixing `Fin 6` and `Fin 8`.  Schematically:

```lean
theorem gramCertificate_sound
    {Label Row : Type*}
    [Fintype Label] [DecidableEq Label]
    [Fintype Row] [DecidableEq Row]
    (P : Row -> Finset Label)
    (center : Row -> Label)
    (cert : GramCertificate P center)
    (hcheck : gramCertificateChecker P center cert = true)
    (R : EqualityCore.Realizes P pointOf) : False
```

The exact certificate fields must include every positivity/nondegeneracy fact
used by the soundness proof; those facts must not be inferred from an
unchecked external solver result.

This theorem is **CONJECTURED / NEW**, but it is a direct abstraction of an
existing source-proved checker and its fact-evaluation lemmas.  It should be
implemented as a soundness theorem plus a small adapter from the current
`EqualityCore.Realizes` interface in `Census554/GeneralCarrierBridge.lean`.

### Why it matters for ATAIL, and what it does not do

The current common-system residual uses five rows and twelve labels.  Its row
centers are live blocker vertices; they are not the fixed six centers encoded
by `u5PatternRowCenter`.  Therefore there is no honest direct adapter from the
current ATAIL data to the fixed sibling theorem.

The generalized checker would accept the changing 5-row/12-label residuals
and future finite row networks.  It would also remove the need to mint one
Lean theorem name for every solver-found scalar certificate.

It would **not**:

- choose the live sources or labels;
- prove that a chosen finite pattern covers all live configurations;
- produce a same-cap second center or shared-radius pair; or
- turn an empirical census into a theorem without a checked realization
  adapter.

Rank: **1**.  Role: **consumer/compiler**.  This is the highest-leverage bank
generalization and the least likely to be invalidated by the next residual.

## Candidate 2: a critical-shell incidence design

The recurring live producer facts naturally form one structural object.  For
one common `CriticalShellSystem H`:

- every selected row is the full exact four-point support at its chosen
  center (`selectedFourClass_support_eq_shell` and the row constructors in
  `U1CarrierInjection.lean`);
- equal chosen centers give equal selected supports
  (`selectedAt_support_eq_of_centerAt_eq` in
  `scratch/atail-force/live_critical_provenance.lean`);
- every center fiber has cardinality at most four
  (`centerFiber_card_le_four` in the validated scratch file
  `scratch/atail-force/critical_system_fiber_count.lean`);
- selected four-classes at distinct centers intersect in at most two points
  (`SelectedFourClass.inter_card_le_two`); and
- within an ordered cap, a fixed outside pair belongs to at most one cap
  center (`outsidePair_unique_capCenter` in
  `P97/CapSelectedRowCounting.lean`).

The sibling `C5D3BPacket.lean` bank reinforces this interface rather than
supplying the missing placement theorem.  Its JSON candidates include 22
`two_rowOffProfile`, 110 `two_full_common`, eight `common_pair`, seven
`radical_axis`, 15 `same_witness`, and seven `overlap` declarations.  These
repeated two-center motifs compile already-chosen rows and witnesses into
radius facts, radical-axis facts, or exclusions.  They do not choose the two
centers or the common pair.

The bank JSON does not itself contain a named center-fiber theorem.  The
stronger center-only result depends on the `CriticalShellSystem` and selected
class uniqueness; it must not be generalized to arbitrary collections of
circles sharing a center.  Its current evidence is the no-sorry validated
scratch theorem, whose printed axioms were `propext`, `Classical.choice`, and
`Quot.sound`.

A useful package would expose:

```text
source -> center
source -> exact four-element support
equal centers -> equal supports
center fibers <= 4
distinct-center support intersections <= 2
cap-local outside-pair injection
```

This is mostly **PROVEN / PACKAGING**, provided the common-system provenance
is retained.  It is a producer-side abstraction because it turns the live
`CriticalShellSystem` into finite incidence data suitable for a checker.

It is not the missing ATAIL producer.  The current count theorem gives
`|A| <= 4 * |centerImage|`; at cardinality twelve this forces only three
centers, not a desired cap placement.  The cap outside-pair inequalities are
also numerically slack for both card-12 profiles.  In the worst cap-complement
case of size six, the simple `4 * (outside centers + 1) < |A|` pigeonhole does
not become available until roughly cardinality 29.  Consequently no honest
card-12 same-cap-center theorem follows from these incidence bounds alone.

Rank: **2**.  Role: **structural producer/front end**.  Package it to feed
Candidate 1 or a finite incidence census; do not advertise it as closure.

## Candidate 3: a cyclic equal-chord/order calculus

The current ATAIL probe has repeatedly found a small family of geometric
contradictions.  Across the accepted cuts for the `(4,5,6)` and `(5,5,5)`
profiles, the stage counts are:

| Metric-core family | Accepted cuts |
|---|---:|
| exact off-circle | 7 |
| nested equal chords | 9 |
| MEC straddling | 1 |
| six-point two-circle order | 3 |
| six-point nested-center order | 3 |
| six-point circle-chain order | 1 |
| six-point circle-chain wrap order | 2 |

Production now contains `NestedEqualChordCore`,
`SixPointTwoCircleOrderCore`, `SixPointNestedCenterOrderCore`, and
`SixPointCircleChainOrderCore`.  The wrap-order scratch theorem reuses the
same circle-chain equality core with the opposite boundary orientation.  The
legacy `pointChord_strictMono_of_angle_lt_radius` supplies the obvious local
lemma behind several of these arguments.

There is therefore a plausible general library theorem saying that equal
chords on a positive-radius circle cannot occur in a strictly nested cyclic
order, together with orientation-reversal adapters.  Such a theorem could
consolidate the positive/negative nested-chord consumers and the round 17--19
circle-chain wrappers.

This candidate is only **CONJECTURED / CONSUMER**.  It must not be stated as a
single theorem covering all ATAIL residuals.  The current round-20 residual
changes the equality graph: it drops the old circle-chain shared point and
instead presents a seven-point two-bridge network.  Its apparent equalities
are, with cyclic order `O,A,D,E,C,U,W`,

```text
OA = OC = OD = OE = AC = AU
DA = DE = DU
CD = CW
EA = EW.
```

No existing six-point bank core has this antecedent.  Applying the old
circle-chain theorem would therefore be antecedent-missing, not a
generalization.  A generic Gram checker can absorb this changing graph more
reliably than an ever-growing disjunction of hand-named cyclic cores.

Rank: **3**.  Role: **geometric consumer library**.  Port the common-circle
chord monotonicity lemma if it simplifies existing proofs, but do not make
this the primary closure route.

## Negative conclusions that should remain explicit

1. The 96 U5 class consumers do not constitute a hidden placement theorem.
   They start after the selected classes and incidence atoms have already been
   produced.
2. The metric and scalar banks are contradiction back ends.  Their abundance
   supports a generic checked compiler, not an inference that every live
   configuration is covered.
3. Same-center support locking and fiber cardinality at most four do not force
   two chosen centers into one prescribed cap at card 12.
4. `outsidePair_unique_capCenter` gives an injection after an outside pair is
   attached to a cap center; it does not produce the repeated/shared pair.
5. A theorem whose hypothesis is merely `MetricCoreAlternative` is a useful
   consumer wrapper but no mathematical progress toward producing that
   alternative.
6. The round-20 graph is positive evidence for a parameterized certificate
   checker and negative evidence for freezing the tail into one six-point
   theorem.

## Recommended next move

Specify Candidate 1 first, with the smallest certificate language needed by
the current 5-row/12-label round-20 pattern.  Prove checker soundness over
arbitrary finite row/label types and write one explicit adapter from
`EqualityCore.Realizes`.  In parallel, promote the already validated
common-system provenance and center-fiber facts into the Candidate 2 incidence
package.  The only remaining empirical obligation should then be certificate
generation; the live placement obligation must remain a separate theorem and
must not be smuggled into checker coverage.
