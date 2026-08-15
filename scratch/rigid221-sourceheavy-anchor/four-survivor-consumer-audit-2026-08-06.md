# Four-survivor consumer audit (2026-08-06)

## Verdict

No proved theorem in the current target import closure or in the sibling
`p97-rvol` bank consumes **only** the requested data:

- a physical-class point `q` deleted from the five-point class at `O`;
- `K4` after deleting `q` at `O` and at three pairwise-distinct actual
  blocker centers whose source rows omit `q`;
- the distinct actual blocker of `q`, at which the same deletion fails; and
- exact directed-C5 physical traces for all five source rows.

Thus the pattern is not presently an actual contradiction.  There are two
small, proved, `sorryAx`-free terminal interfaces on the useful frontier:

1. **Mixed metric, already import-reachable:** one new row incidence plus two
   equal-side equations.
2. **Incidence-only, sibling theorem:** five new center-in-row incidences, plus
   porting/importing one clean sibling theorem.

The failing actual blocker of `q` proves its distinction from every surviving
center, but no checked terminal found in either bank uses that distinction by
itself.

## Normalized four-survivor packet

Write the physical C5 cyclically as

```text
C = {s₀,s₁,s₂,s₃,s₄},       trace(row sᵢ) = {sᵢ,sᵢ₊₁}.
```

For `q = sⱼ`, exactly the three source rows indexed by
`j+1,j+2,j+3` omit `q`.  Their injective actual blockers `c₁,c₂,c₃`
therefore survive deletion of `q`; the physical class also leaves a four-row
at `O`.  The actual blocker `bq` fails deletion of `q`, hence
`bq ≠ O,c₁,c₂,c₃`.

The live scratch producers were re-elaborated successfully:

- `pentagonOffClass_exact_physical_cycle_traces_probe`;
- `pentagonOffClass_physical_cycle_actualBlockers_injective_probe`; and
- the weaker `pentagonOffClass_exists_physicalDeletion_threeDistinctCenters_probe`
  (this last theorem supplies only `O` plus two blocker centers).

All three report only `[propext, Classical.choice, Quot.sound]`.  The stronger
four-survivor packet follows at the incidence level from choosing a physical
`q` and using the three C5 rows that omit it, but there is no existing named
consumer for that packet.

## Closest current-bank results

### Four-center survival-square split: clean producer, not a terminal

`Problem97.ATailFrontierLiveClosure.exactFour_fourSurvivingCenters_survivalSquare_split`
at
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoDeletionCollision.lean:360`
is structurally the closest current result.  Given its much richer
`ExactFourMutualOmissionJointDeletion` and `CommonDeletionTwoCenterPacket`
context, it says that either `q` equals one of three blocker centers or one of
the four surviving centers forms a bidirectional deletion-survival square
with `bq`.

It is reachable through the target's sole import
`Rigid221Placement -> TwoDeletionCollision`, and its axiom closure is clean:

```text
[propext, Classical.choice, Quot.sound]
```

It does not conclude `False`.  Its two downstream contradiction arms are:

- `...fourCenterCommonDeletion_blockerCoincidence` at line 595;
- `...fourCenterCommonDeletion_survivalSquare` at line 669.

Both, and their coordinator at line 768, report `sorryAx`.  Consequently this
route is not a proved consumer.  The requested packet also does not itself
exclude the three alternatives `q = cᵢ`.

### Five-center exact-row boundary: clean normalization only

`Problem97.ATailFiveCenterDeletionBoundary.fiveSurvivorExactRowsBoundary`
at `lean/Erdos9796Proof/P97/ATail/FiveCenterDeletionBoundary.lean:90` is
import-reachable and clean, but it requires five surviving centers and merely
packages five exact q-deleted rows and blocker inequalities.  It supplies no
contradiction, and duplicating a fourth center to fill its fifth slot does not
create one.

### Pairwise overlap bound is saturated, not violated

`Problem97.U5QDeletedK4Class.inter_card_le_two` at
`lean/Erdos9796Proof/P97/U5GlobalIncidenceSupport.lean:412` is reachable and
clean.  Exact C5 traces naturally saturate its bound for the row at `O` and
each blocker row; this is compatible data, not a contradiction.

An abstract incidence shadow makes the obstruction explicit.  For the cycle
`q-a-b-c-d-q`, take

```text
B_O = {a,b,c,d}
B_1 = {a,b,x₁,y₁}
B_2 = {b,c,x₂,y₂}
B_3 = {c,d,x₃,y₃},
```

with all auxiliary points and all centers distinct.  Every required C5 trace
and every pairwise intersection bound holds.  This is not a Euclidean
`CounterexampleData` model, but it proves that cardinality/trace/overlap facts
alone cannot close the leaf.

## Smallest proved extra interfaces

### A. Mixed metric route: 1 incidence + 2 metric equalities

Use the already imported and clean theorem

`Problem97.u5_equilateral_circumcenter_on_p_circle_incompatibility`
at `lean/Erdos9796Proof/P97/U5GlobalIncidenceKernels.lean:2183`.

Suppose one of the three surviving centers is the distinguished off-class
blocker `x`, and its exact C5 trace is `{a,b}`.  Choose any third surviving
physical point `c`.  The physical selected class already supplies

```text
dist O a = dist O q,
dist O b = dist O q,
dist O c = dist O q,
0 < dist O q.
```

The exact trace supplies `a,b ∈ Bx`; distinct physical vertices supply
`0 < dist a b`; and `x` being an actual center in `D.A` but outside the
physical selected class supplies `dist O x ≠ dist O q`.

The only extra hypotheses are therefore

```text
O ∈ Bx,
dist a b = dist a c,
dist a b = dist b c.
```

These make `{a,b,c}` equilateral while `x` is its off-circle circumcenter;
the imported theorem gives `False`.  The exact adapter
`Problem97.fourSurvivor_offClass_equilateral_bridge` was checked in
`FourSurvivorCurrentAxiomAudit.lean` and has no `sorryAx`.

This is the smallest mixed interface found, but the C5 trace does **not** force
an equilateral triple or the incidence `O ∈ Bx`.

### B. Incidence-only route: 5 center-in-row incidences

The sibling theorem

`Problem97.U5QDeletedK4Class.three_exact_classes_tetrahedron_incompatibility`
at
`/Users/adam/projects/math-projects/p97-rvol/lean/RVOL/P97/U5GlobalIncidenceQCriticalExactTetrahedron.lean:29`
is source-proved and has axiom closure

```text
[propext, Classical.choice, Quot.sound].
```

Take the exact row `B_O = C.erase q` at `O` and two adjacent surviving C5
rows `Bᵢ,Bᵢ₊₁`, centered at their blocker centers `cᵢ,cᵢ₊₁`.  If `a` is the
shared physical endpoint of those adjacent traces, C5 already gives

```text
a ∈ B_O,   a ∈ Bᵢ,   a ∈ Bᵢ₊₁.
```

Instantiating the tetrahedron theorem with
`x=O`, `y=cᵢ`, `b=cᵢ₊₁` leaves exactly these five hypotheses:

```text
cᵢ   ∈ B_O,
O    ∈ Bᵢ,
cᵢ₊₁ ∈ Bᵢ,
O    ∈ Bᵢ₊₁,
cᵢ   ∈ Bᵢ₊₁.
```

The checked scratch theorem
`Problem97.fourSurvivor_adjacentC5_tetrahedron_bridge` proves `False` from
exactly the three C5-supplied memberships plus these five extras, and has no
`sorryAx`.

This is the smallest incidence-only multi-exact-class terminal found in the
sibling census: the tetrahedron interface has eight positive memberships,
three of which C5 supplies.  The next comparable generic kernels require nine
or ten positive memberships and additional metric data.

This theorem is **not** reachable from the current target import.  Under
`import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Placement`, Lean
reports:

```text
Unknown constant
`Problem97.U5QDeletedK4Class.three_exact_classes_tetrahedron_incompatibility`
```

It is directly reachable and clean under the sibling import
`RVOL.P97.U5GlobalIncidenceQCriticalExactTetrahedron`.  Using it in production
would first require a current-tree port/import; no such edit was made.

## Search and verification record

Searches covered:

- the current indexed Lean corpus and direct source uses of four-center
  survival, five-survivor boundaries, C5/pentagon traces, exact q-deleted
  classes, and blocker centers;
- `certificates/p97_rvol_general_n_mining.json`, including every sibling
  `False` theorem mentioning multiple `U5QDeletedK4Class` inputs; and
- the live sibling `p97-rvol` Lean corpus and source files.

The sibling registry independently marks the tetrahedron, bisector, and
circumcenter kernels `source-proved` and `source_reachable=true`.

Fresh elaboration from the two Lake roots:

```text
current: lake env lean -M 8192 ../scratch/rigid221-sourceheavy-anchor/FourSurvivorCurrentAxiomAudit.lean
result: exit 0

sibling: lake env lean -M 8192 <absolute-path>/FourSurvivorSiblingAxiomAudit.lean
result: exit 0

negative current reachability check:
lake env lean -M 8192 ../scratch/rigid221-sourceheavy-anchor/FourSurvivorCurrentReachabilityNegative.lean
result: expected exit 1, unknown sibling tetrahedron constant

producer probe:
lake env lean -M 8192 ../scratch/PentagonOffClassProducerProbe.lean
result: exit 0
```

The current and sibling audit files print standard Lean axioms only for both
proposed adapters.  The current four-center terminal arms and coordinator are
the only relevant checked declarations in this audit whose printed closures
contain `sorryAx`.

## Recommendation

Do not route the leaf into the existing four-center coordinator: its terminal
arms remain load-bearing `sorryAx`.  For a metric closure, target the compact
three-premise package `O ∈ Bx` plus an equilateral physical triple.  For a
pure incidence closure, target one adjacent pair of survivor rows and the five
listed center-in-row incidences, then port the clean sibling tetrahedron
theorem.  Without one of these additions, the four-survivor/C5 packet is
empirical structural progress, not closure.

No production file was edited.
