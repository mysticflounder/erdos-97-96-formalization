# ATAIL LIVE-C retained-provenance audit (2026-07-13)

## Scope and verdict

This is a read-only mathematical/theorem-bank audit of the seven current
`LIVE-C` helper contracts.  It asks whether retaining the common
`CriticalShellSystem` used to construct the five `CriticalSourceRows` and the
additional `f2CriticalRow` can do either of the following:

1. produce a four-point row at `f2CriticalRow.center` which excludes the `f2`
   source; or
2. use the retained `f2Row_no_qfree` fact to close any complete LIVE-C center
   family.

The answer to both questions is **no** on the current hypotheses.

The retained provenance proves the opposite of item 1: every selected
four-class at the `f2` blocker center contains `f2`, and every such class has
exactly the existing `f2CriticalRow` support.  Thus a request for a new row at
that center excluding `f2` is not merely unsupported; it contradicts the
retained blocker fact.  The global-K4 deletion dichotomy consequently lands in
the `f2`-critical triple arm, not in a new `f2`-deleted K4 arm.

There is one useful positive consequence common to all seven LIVE-C center
branches: the `f2` support contains at least two points outside the dangerous
base `{q,t1,t2,t3}`.  This is now kernel-checked in both cardinality and
two-distinct-witness forms as
`two_le_f2Row_support_sdiff_dangerousBase` and
`exists_two_f2Row_support_off_dangerousBase`.  It is classified **LIVE-C only
/ partial**: it uses the sixth `f2CriticalRow`, which K-A-PAIR does not receive,
and it does not by itself close any complete LIVE-C family.

The finite incidence-only follow-up is also complete. After correcting the
model to retain the definitional facts `f := t2[0]` and `f5 := t2[1]` inside
the `t2` source row, `incidence_delta_census.py --check` validates an explicit
witness for every LIVE-C family. All 7/7 are `SAT_INCIDENCE_ONLY`, and none
forces the three modeled incidence sinks. This is exact only within that
finite abstraction; the witnesses are not Euclidean or convex configurations
and do not interpret the metric-consumer fields.

No Lean build was run by this audit agent and no Lean source was edited by it.
The q-critical adapter and the two off-dangerous declarations called
kernel-checked below were checked in the shared scratch lane by the
orchestrating agent. No claim presented only as a proof sketch is called
kernel-checked. Line references are to the live 2026-07-13 checkout inspected
for this audit and may drift under concurrent edits.

## Notation

Write

```text
f := rows.pointOfChoice { source := CriticalSource.t2, slot := 0 }
c := f2CriticalRow.center
S := f2CriticalRow.selected.toCriticalFourShell.support
B := {q,t1,t2,t3}
```

The row packet already gives `f ∈ S`, `S.card = 4`, `c ∈ D.A`, `c ≠ f`, and
every point of `S` lies at the row radius about `c`.  The new scratch
provenance packet records that this row and all five source rows came from one
common `CriticalShellSystem`.

## Exact retained-provenance API

The relevant source-clean declarations are in
`scratch/atail-force/live_critical_provenance.lean`:

| declaration | exact useful output | status |
|---|---|---|
| `U1Depth5.LiveCriticalRowProvenance` | one `system : CriticalShellSystem D.A`, constructor equalities for every `rows.rowAt source`, and a constructor equality for `f2Row` | source proof, not rebuilt by this audit |
| `LiveCriticalRowProvenance.f2Row_no_qfree P` | `¬ HasNEquidistantPointsAt 4 (D.A.erase f) c` | PROVEN in scratch source |
| `LiveCriticalRowProvenance.f2Source_mem_selectedFourClass P K` | for every `K : SelectedFourClass D.A c`, `f ∈ K.support` | PROVEN in scratch source |
| `LiveCriticalRowProvenance.selectedFourClass_support_eq_f2Row P K` | for every `K : SelectedFourClass D.A c`, `K.support = S` | PROVEN in scratch source |
| `LiveCriticalRowProvenance.f2Row_to_qCriticalTriple f2Row` | `S.erase f` is an `U5QCriticalTripleClass D f c` | KERNEL-CHECKED scratch theorem |
| `LiveCriticalRowProvenance.two_le_f2Row_support_sdiff_dangerousBase hfixed f2Row hcenter_ne_p` | `2 ≤ (S \ {q,t1,t2,t3}).card` | KERNEL-CHECKED scratch theorem |
| `LiveCriticalRowProvenance.exists_two_f2Row_support_off_dangerousBase hfixed f2Row hcenter_ne_p` | two distinct witnesses in `S`, both outside `{q,t1,t2,t3}` | KERNEL-CHECKED scratch theorem |
| `LiveCriticalRowProvenance.rowAt_support_eq_of_center_eq P s1 s2 hcenter` | equal blocker centers among the five source rows imply equal complete supports | PROVEN in scratch source |
| `LiveCriticalRowProvenance.f2Row_support_eq_rowAt_of_center_eq P s hcenter` | `c = (rows.rowAt s).center` implies `S = (rows.rowAt s).support` | PROVEN in scratch source |

The last two implications are conditional.  No LIVE-C helper supplies an
additional blocker-center equality to activate them.  In particular, if the
LIVE-C branch says `c = q`, then the row whose source is `q` cannot have center
`c`: `CriticalRowPacket.center_ne_source` says the `q` row's center is not
`q`.  The same observation applies to `t1`, `t2`, `t3`, and `u`.  Equal-center
support transport can still apply to some *other* source row, but no current
helper identifies such a row.

These scratch results are direct adapters around the imported current-source
theorems:

```lean
CriticalShellSystem.no_qfree_at
    (H : CriticalShellSystem A) (source : ℝ²) (hsource : source ∈ A) :
  ¬ HasNEquidistantPointsAt 4 (A.erase source) (H.centerAt source hsource)

CriticalShellSystem.source_mem_selectedFourClass
    (H : CriticalShellSystem A) (source : ℝ²) (hsource : source ∈ A)
    (K : SelectedFourClass A (H.centerAt source hsource)) :
  source ∈ K.support

CriticalShellSystem.selectedFourClass_support_eq_shell
    (H : CriticalShellSystem A) (source : ℝ²) (hsource : source ∈ A)
    (K : SelectedFourClass A (H.centerAt source hsource)) :
  K.support = (H.selectedAt source hsource).toCriticalFourShell.support
```

They are directly import-reachable in `U1LargeCapRouteBTail.lean` through its
`U1CarrierInjection` import.

## Why an excluding K4 cannot be the producer

Suppose an attempted producer returns

```lean
K : SelectedFourClass D.A c
hf : f ∉ K.support
```

Then `P.f2Source_mem_selectedFourClass K` immediately contradicts `hf`.
Equivalently, converting `K` into a radius-filter witness over `D.A.erase f`
would contradict `P.f2Row_no_qfree`.

Moreover,

```lean
P.selectedFourClass_support_eq_f2Row K : K.support = S
```

shows that global K4 cannot even supply a differently chosen four-subset at
the same center.  All choices at `c` collapse to the same complete critical
shell `S`, which contains `f`.

This makes the first missing antecedent completely explicit:

```text
needed for an excluding-row route:  HasNEquidistantPointsAt 4 (D.A.erase f) c
retained provenance supplies:       ¬ HasNEquidistantPointsAt 4 (D.A.erase f) c
```

So this is a **PROVEN impossibility for the proposed intermediate**, not a
mere failure to find a theorem.

## The global-K4 dichotomy lands in the critical arm

The current, import-reachable U5 producer is

```lean
U5QDeletedK4Class.exists_card_four_or_qCritical_of_globalK4
    {D : CounterexampleData} {q center : ℝ²}
    (hq : q ∈ D.A) (hcenter : center ∈ D.skeleton q) :
  (∃ B : Finset ℝ²,
      Nonempty (U5QDeletedK4Class D q center B) ∧ B.card = 4) ∨
    ∃ r : ℝ, 0 < r ∧ dist center q = r ∧
      ((((D.skeleton q).erase center).filter
        fun y => dist center y = r).card = 3)
```

It is in `U5GlobalIncidenceBasic.lean:430-452` and is reachable from Route-B
through `U3ToU5Terminal -> U5GlobalIncidenceSupport`.

Instantiate its deleted label with `q := f` and its center with `c`.  The
first arm is exactly the forbidden `f`-deleted K4 alternative.  The second arm
is positively realized by `S.erase f`: `S` has four points, contains `f`, and
is the full equal-radius shell about `c`; deleting `f` leaves exactly three
points at radius `dist c f`.

The following is therefore the correct small U5-facing adapter, not an
excluding-row theorem. It is now packaged and kernel-checked:

```lean
theorem f2Row_to_qCriticalTriple
    {D : CounterexampleData} {q t1 t2 t3 u : Plane}
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (f2Row : U1Depth5.CriticalRowPacket D
      (rows.pointOfChoice
        { source := U1Depth5.CriticalSource.t2, slot := 0 })) :
    Nonempty
      (U5QCriticalTripleClass D
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 })
        f2Row.center
        (f2Row.selected.toCriticalFourShell.support.erase
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 })))
```

The proof packages `f2Row.selected.toSelectedFourClass` as a
`U5QAllowedK4Class`, using support containment and `center_not_mem`, and then
applies `U5QAllowedK4Class.qCriticalTriple_of_mem_q` to the critical row's
intrinsic source membership. No retained-provenance hypothesis is needed once
the concrete critical row packet is present.

The last call has the exact current signature

```lean
U5QAllowedK4Class.qCriticalTriple_of_mem_q
    (K : U5QAllowedK4Class D center B)
    (hcard : B.card = 4)
    (hqB : q ∈ B) :
  Nonempty (U5QCriticalTripleClass D q center (B.erase q))
```

from `U5GlobalIncidenceSupport.lean:136-164`, already import-reachable in
Route-B. The adapter above is **KERNEL-CHECKED** in
`scratch/atail-force/live_critical_provenance.lean`.

A sibling-repo helper named
`U5QDeletedK4Class.exists_card_four_of_globalK4_not_qCritical` has the missing
negative-critical hypothesis as an explicit argument.  It is not a current
local/import-reachable declaration, and trying to supply its hypothesis here
would be circular: the retained row constructs the very `f`-critical triple
that the argument must exclude.

## Exact two-circle bounds

There are two relevant existing APIs.

The most direct one for the present row is in
`U1CarrierInjection.lean:479-482`:

```lean
SelectedFourClass.inter_card_le_two
    {A : Finset ℝ²} {x y : ℝ²}
    (Kx : SelectedFourClass A x)
    (Ky : SelectedFourClass A y)
    (hxy : x ≠ y) :
  (Kx.support ∩ Ky.support).card ≤ 2
```

The U5 dangerous-circle specialization is in
`U5GlobalIncidenceSupport.lean:633-672`:

```lean
U5QAllowedK4Class.inter_dangerous_p_circle_card_le_two
    {D : CounterexampleData} {q p center : ℝ²} {T B : Finset ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (K : U5QAllowedK4Class D center B)
    (hcenter_ne_p : center ≠ p) :
  (B ∩ insert q T).card ≤ 2
```

The q-deleted analogue, with otherwise identical arguments, is
`U5QDeletedK4Class.inter_dangerous_p_circle_card_le_two` at
`U5GlobalIncidenceSupport.lean:545-550`.

For the concrete LIVE-C row, use

```lean
Krow  := f2CriticalRow.selected.toSelectedFourClass
Kbase := dangerousBaseSelectedFourClass hfixed
```

where the existing local definition has exact support
`Kbase.support = {q,t1,t2,t3}`.  Every named LIVE-C center is different from
`p` by `hbase`; the fresh branch states `c ≠ p` explicitly.  Therefore all
seven branches satisfy

```lean
(S ∩ {q,t1,t2,t3}).card ≤ 2.
```

Since `S.card = 4`, two points remain outside the dangerous base.

### Kernel-checked two-point extraction

The live scratch now contains the exact cardinality theorem

```lean
theorem two_le_f2Row_support_sdiff_dangerousBase
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    {rows : CriticalSourceRows D q t1 t2 t3 u}
    (f2Row : CriticalRowPacket D
      (rows.pointOfChoice
        { source := CriticalSource.t2, slot := 0 }))
    (hcenter_ne_p : f2Row.center ≠ p) :
    2 ≤ (f2Row.selected.toCriticalFourShell.support \
      ({q, t1, t2, t3} : Finset Plane)).card := by
  classical
  let Krow : SelectedFourClass D.A f2Row.center :=
    f2Row.selected.toSelectedFourClass
  let Kbase : SelectedFourClass D.A p :=
    dangerousBaseSelectedFourClass hfixed
  have hinter_le : (Krow.support ∩ Kbase.support).card ≤ 2 :=
    SelectedFourClass.inter_card_le_two Krow Kbase hcenter_ne_p
  have hsplit :
      (Krow.support ∩ Kbase.support).card +
          (Krow.support \ Kbase.support).card = Krow.support.card :=
    Finset.card_inter_add_card_sdiff Krow.support Kbase.support
  have hrow_card : Krow.support.card = 4 := Krow.support_card
  have htwo : 2 ≤ (Krow.support \ Kbase.support).card := by omega
  simpa [Krow, Kbase, dangerousBaseSelectedFourClass,
    CriticalSelectedFourClass.toSelectedFourClass,
    CriticalFourShell.toSelectedFourClass] using htwo
```

Its checked witness form is

```lean
theorem exists_two_f2Row_support_off_dangerousBase
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    {rows : CriticalSourceRows D q t1 t2 t3 u}
    (f2Row : CriticalRowPacket D
      (rows.pointOfChoice
        { source := CriticalSource.t2, slot := 0 }))
    (hcenter_ne_p : f2Row.center ≠ p) :
    ∃ x w : Plane,
      x ≠ w ∧
        x ∈ f2Row.selected.toCriticalFourShell.support ∧
        w ∈ f2Row.selected.toCriticalFourShell.support ∧
        x ∉ ({q, t1, t2, t3} : Finset Plane) ∧
        w ∉ ({q, t1, t2, t3} : Finset Plane)
```

The proof applies `Finset.one_lt_card` to the cardinality theorem and unpacks
the two `Finset.mem_sdiff` witnesses.  No U5 conversion is involved.

**Route classification:** `LIVE-C only / partial`.  The generic two-circle
lemma is shared infrastructure, but this concrete result consumes
`f2CriticalRow`, absent from K-A-PAIR.  It produces two points in one selected
support, not two points in the off-surplus intersection of the two full exact
radius filters required by K-A-PAIR.  It therefore does not advance the
K-A-PAIR producer contract.  It advances LIVE-C bookkeeping by giving a
uniform support invariant, but it is not a complete-family closure theorem.

There is also a weaker already-proved Route-B theorem for the ordinary `t2`
source row,
`exists_t2Row_support_offDangerous_of_center_ne_p`, which extracts one
off-dangerous support point.  That theorem demonstrates that this two-circle
use is established project technique; it does not couple the new `f2` row to
the two-apex K-A-PAIR full filters.

## Bank-consumer mapping and first missing antecedents

### U5 critical-triple incompatibility

The closest current, import-reachable terminal is

```lean
U5QCriticalTripleClass.two_triple_points_incompatibility
    (htriple : U5DangerousTriple D q p T)
    (K : U5QCriticalTripleClass D q center B)
    (hcenter_ne_p : center ≠ p)
    (ht1T : t1 ∈ T) (ht2T : t2 ∈ T) (ht12 : t1 ≠ t2)
    (ht1B : t1 ∈ B) (ht2B : t2 ∈ B) : False
```

It is current-local at `U5GlobalIncidenceSupport.lean:197-203` and
import-reachable through `U3ToU5Terminal`.

There are two possible instantiations, and both stop at a concrete missing
membership producer:

1. Keep the original dangerous label `q`.  One first needs `q ∈ S` so that
   `S.erase q` is q-critical, and then needs two of `t1,t2,t3` in
   `S.erase q`.  No generic LIVE-C contract supplies these facts; in the
   `center_q` branch, `q ∉ S` follows from `center_not_mem`.
2. Use the `f`-critical packet above.  One first needs a dangerous packet with
   deleted label `f`, whose initial geometric requirement is that `f` lies on
   the dangerous `p`-circle (`dist p f = dist p q`, equivalently a suitable
   identification with `{q,t1,t2,t3}` under the exact-radius packet).  One then
   needs two remaining dangerous-circle points in `S.erase f`.  No LIVE-C
   helper supplies either requirement.

The two-circle conclusion points in the other direction: it says at most two
members of all of `S` lie on the dangerous circle.  It becomes contradictory
only after a new producer forces three named dangerous-circle members of `S`.

### U1 seven-equality obstruction

The sibling bank contains

```lean
U1LargeCapRouteBTailMetricResidualTarget.u1TwoLargeCapObstruction
    (a c d e f : ℝ²) (hac : a ≠ c)
    (h1 : dist c a = dist c d)
    (h2 : dist c a = dist c f)
    (h3 : dist d c = dist d e)
    (h4 : dist d c = dist d f)
    (h5 : dist f a = dist f d)
    (h6 : dist f a = dist f e)
    (h7 : dist e a = dist e c) : False
```

The registry marks this exact declaration `source_reachable: false` and
`local_exact_name: false`; it is not a current Route-B theorem that can simply
be called.  More importantly, retained provenance produces no instantiation
of its seven metric equalities.  A bank import/port without an equality
producer would add no closure content.

### Moser-cap exact-support theorem

`SelectedFourClass.support_eq_selectedClass_of_moserCap` has exact inputs

```lean
(S : SurplusCapPacket A) (hconv : ConvexIndep A) (i : Fin 3)
(K : SelectedFourClass A (S.oppositeVertexByIndex i))
(hcap : (S.capByIndex i).card = 4)
```

and returns support equality with the full selected class plus cap-interior
containment.  It lives in `EndpointCertificate/BridgeStaging.lean:61-66` and
is not on the current Route-B import path.  None of the LIVE-C helpers
identifies `c` with a Moser opposite vertex or supplies the required card-four
cap.  In `center_q`, `hqNonMoser` specifically rules out treating `q` as a
Moser vertex.  Importing the theorem alone would therefore not advance any
family.

### Mined U5/U1 incidence consumers

The required theorem-bank preflight confirms that the 96 sibling U5
class-level incidence incompatibility families are consumers after concrete
class centers and support memberships have been supplied.  The registry does
not contain a classifier that turns the present six critical rows into those
center/member patterns.  The 18 unimported U1 source-unit consumers likewise
need explicit row-slot equalities or placements.  Common-system provenance
adds source-in-own-blocker-row and conditional equal-center support equality;
it does not add the required placement classifier.

## Family-by-family result

Every family obtains `f ∈ S`, the `f`-critical triple `S.erase f`, and the
two-off-dangerous invariant.  The table lists what remains missing after those
facts are added.

| LIVE-C helper | extra current fact | strongest provenance/two-circle consequence | first missing antecedent for a current sink | result |
|---|---|---|---|---|
| `liveData_C_center_q_false` | `c = q` | `q ∉ S`; `f ∈ S`; at most two of `t1,t2,t3` lie in `S` | a second support/placement relation; original-q critical routing is impossible because q is the center and not in `S` | OPEN |
| `liveData_C_center_t1_false` | `c = t1` | `t1 ∉ S`; `f ∈ S`; at least two points of `S` are outside `B` | `q` plus two dangerous-triple memberships in `S`, or another forced blocker-center collision | OPEN |
| `liveData_C_center_t2_named_false` | `c = t2`; `f5,p,q` are named in `S` | the existing `t2ResidualHRows_of_f2CriticalRow_named` produces the three t2 residual hrows; `t2 ∉ S`; two-circle bound is consistent | `U1LargeCapRouteBTailBranch0CollisionExclusionTarget`, `U1LargeCapRouteBTailMetricBridgeTarget`, and the remaining q/t3/u metric equalities required by `false_of_f2CriticalRow_named` | OPEN; closest partial |
| `liveData_C_center_t2_rowFailure_false` | `c = t2`; one of the f5/p/q equal-radius rows fails | no-qfree only forces `f ∈ S`; it does not force f5, p, or q into `S` | membership/equal-radius for all f5, p, q would negate `hrowFailure`, but is not produced | OPEN |
| `liveData_C_center_t3_false` | `c = t3` | `t3 ∉ S`; uniform critical/off-dangerous facts | same missing placement or blocker-center collision as t1 | OPEN |
| `liveData_C_center_u_false` | `c = u` | `u ∉ S`; uniform critical/off-dangerous facts | same missing placement or blocker-center collision | OPEN |
| `liveData_C_center_fresh_false` | `c` is distinct from `p,q,t1,t2,t3,u,f` | cleanest application of two-circle; no named source row is automatically at `c` | any forced center collision, cap/apex identification, or support membership pattern feeding a bank consumer | OPEN |

The `t2_named` helper is worth separating from the rest.  Its three named
support placements are already consumed by
`t2ResidualHRows_of_f2CriticalRow_named` (`U1LargeCapRouteBTail.lean:2822-2885`).
The closing wrapper `false_of_f2CriticalRow_named`
(`U1LargeCapRouteBTail.lean:2893-2946`) needs substantially more data, including
the collision-exclusion target, metric bridge, and q/t3/u rows.  Retained
provenance does not fill those inputs.  Thus the bank-match result of “three
rows available” remains a partial match, not a hidden complete consumer.

## Circular and terminal directions

The following routes should not be redispatched without a genuinely new
antecedent.

1. **Ask global K4 for an `f`-excluding row at `c`.**  This contradicts
   `f2Row_no_qfree` and `f2Source_mem_selectedFourClass`.
2. **Apply a global-K4-not-critical helper.**  The retained row positively
   realizes the critical arm, so proving “not critical” is the substantive
   missing theorem, not a routine side condition.
3. **Use equal-center support transport with the source row named by `c`.**
   That source row has blocker center different from its source, so the needed
   center equality is false.
4. **Iterate the blocker map and use only a finite cycle/cardinality argument.**
   The project dead-end audit already records that the pure functional-blocker
   graph collapses to the original Q-style obstruction.  A cycle is useful
   only after adding new cap/order/full-filter incidence content.
5. **Run another blind selected-four or nonlinear bulk sweep.**  The existing
   ATAIL-Q3/equality and full-system pilots are terminal for those abstractions.
   The missing information is a placement/full-filter theorem on the live
   hypothesis surface.

## Ranked next directions

### 1. Preserve the U5 critical-triple normalization

**DONE as a kernel-checked scratch adapter.**

The two-off-dangerous cardinality and witness adapters are done and
kernel-checked, and `f2Row_to_qCriticalTriple` now exposes the other side of
the exact information ceiling in the existing U5 vocabulary. Keep this as
normalization for future bank matching; it is not itself a closure claim.

### 2. Finite incidence-delta census on the actual six-row surface

**DONE-NEGATIVE, exact within the finite abstraction; no geometry claim.**

`scratch/atail-force/incidence_delta_census.py` stores one explicit witness
for each of the seven center families. The model retains the six blocker
centers, source membership and support cardinality four, the actual
`f := t2[0]` and `f5 := t2[1]` placements in the `t2` source row, equal-center
support coupling, the conditional comparison maps, center/source separation,
all distinct-center two-circle overlap bounds, and the two special `t2`
branches.

All 7/7 witnesses validate as `SAT_INCIDENCE_ONLY`. None forces a second
blocker-center collision, `q` plus two dangerous points in one support, or five
distinct source labels in one support. The witnesses choose `f` distinct from
the packet sources, so the conditional comparison maps are satisfied
vacuously. Their pinned digest is
`78d6ea82c294e8dd2943f1dec50e9bf51a6de88bbef91c34f649c2f28a115a3e`.

This bounded negative does not decide antecedents containing cap, order,
Euclidean, full-filter, or metric fields; those are explicitly not modeled.
It terminates only the incidence-only route on the enumerated interface.

### 3. Target one genuinely geometric forcing statement

**Implementer computation: only after writing the theorem target and its
immediate consumer.**

The useful outputs are now sharply delimited:

- force an `f`-deleted K4 at `c` (which would immediately contradict retained
  no-qfree, but must come from new geometry rather than global K4 alone);
- force three dangerous-circle memberships in `S` (immediate two-circle
  contradiction);
- force enough blocker-center collisions that common support contains five
  distinct sources; or
- directly force the full-filter joint-fiber lower bound / seven metric
  equalities / `False` from the convex-cap hypotheses.

The first three are LIVE-C-only producer targets.  A theorem intended also to
advance K-A-PAIR must avoid the sixth-row provenance and instead target its
actual five-row/full-filter contract.

### 4. Keep `t2_named` as a separate focused residual

**Implementer computation: NO broad search.**

Map the remaining inputs of `false_of_f2CriticalRow_named` to the current
cap/full-filter hypotheses.  Work on this only if one of those hypotheses has
an immediate derivation; no-qfree does not provide the missing metric bridge.

## Rigor ledger

| claim | classification |
|---|---|
| every selected K4 at `c` contains `f` and has support `S` | PROVEN in the retained-provenance scratch source from imported `CriticalShellSystem` theorems |
| an `f`-excluding K4 at `c` contradicts the retained blocker fact | PROVEN |
| `S.erase f` forms an `f`-critical U5 triple | KERNEL-CHECKED in the retained-provenance scratch module |
| every LIVE-C branch has at least two f2-support points outside `{q,t1,t2,t3}` | KERNEL-CHECKED in cardinality and two-distinct-witness forms in the retained-provenance scratch module |
| the two-point adapter advances K-A-PAIR | FALSE: K-A-PAIR lacks `f2CriticalRow` and requires a two-full-filter intersection, not two points in one selected support |
| the two-point adapter closes a LIVE-C family | FALSE on current consumer inventory; it is LIVE-C-only partial information |
| a cap/order/full-filter theorem could force the missing memberships or center collisions | CONJECTURED direction, not a theorem |
| the enumerated incidence facts force one of the three modeled sinks | REFUTED EXACTLY WITHIN THE FINITE ABSTRACTION: 7/7 explicit witnesses, pinned digest; not a Euclidean completeness result |

## Preflight and validation record

The audit read the required theorem-bank registry and concise/exhaustive
inventories, including the sibling `p97-rvol`, legacy `erdos/97`, and older
`erdos-general-theorem/97` banks.  It also searched the indexed Lean corpus via
`nthdegree docs search --lean` for critical-shell blocker rows, source-excluding
K4 extraction, selected-class support equality, fixed-triple rows, Moser-cap
support, q-critical consumers, and global-K4 alternatives.

The search found no legacy/general-archive producer that supplies the missing
row-center or support-membership antecedent.  The relevant current-local hits
are precisely the critical-shell uniqueness facts, the U5 K4/critical
dichotomy, the q-critical triple consumer, and the two-circle bounds analyzed
above.

The audit also checked the authoritative ATAIL-FORCE plan, the sixth-row scope
audit, the K-A route-scoping audit, and the blocker-cycle / selected-four dead
ends.  It did not touch `U1LargeCapRouteBTail.lean`, did not touch LIVE-T1, and
did not run Lean or Lake builds, as required.
