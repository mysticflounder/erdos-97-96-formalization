# Global-K4 / critical-shell bridge audit

Date: 2026-07-15

Status: **SOURCE AUDIT + CHECKED IMPORT PROBES; NO CLOSING PRODUCER FOUND**.

This is a bounded audit for the live robust ATAIL/K-A blocker. It does not
modify production, `SurplusM44`, unique-row work, or shared closure docs.

## Verdict

The current bank does not contain a theorem that turns the live parent's
all-center global `K4` plus its total `CriticalShellSystem` into either:

1. two prescribed `q,w` hits (or an adequate bounded-support confinement) in
   rows centered on the two blocker shells; or
2. `CapFiveOppositeApexBlockerRole` for either actual robust blocker.

The first route is missing a genuine support-localization theorem. Global
`K4` supplies a selected row at every carrier center, but does not prescribe
members of those rows or confine them to a named finite support. The total
critical map supplies an unanchored blocker cycle, but does not anchor that
cycle at the frontier pair or localize it to either blocker shell/cap.

The second route is not merely absent for the two actual robust blockers: its
center equality has the wrong polarity. `RobustFourCenterPacket` says both
actual blockers differ from both `S.oppApex1` and `S.oppApex2`. A non-surplus
cap index is one of `S.oppIndex1,S.oppIndex2`, whose opposite vertices are
those two apices. Therefore a `CapFiveOppositeApexBlockerRole` cannot be
inhabited by either actual robust blocker. A viable use of that role would
first need to produce a *third* relevant center and identify it with a
non-surplus opposite apex.

## Exact live polarity

For the live robust packet `R : RobustFourCenterPacket P`, the imported
theorem

```lean
Problem97.ATailCriticalPairFrontier.
  cross_deletion_survives_iff_not_mem_selected_support
```

gives

```text
P.w notin shell(H.centerAt P.q)
P.q notin shell(H.centerAt P.w).
```

Thus the two actual blocker rows are exact *cross-omission* rows. The imported

```lean
Problem97.CriticalShellSystem.selectedFourClass_support_eq_shell
```

then says every global selected row at either actual blocker center is exactly
that same shell. There is no alternate global row at those centers that can
restore the missing cross source. The desired `q,w` pair rows must instead be
centered at additional points (for example, selected points of the blocker
shells), and global `K4` alone supplies no prescribed membership in those new
rows.

## Parent-import reachable results

`ImportReachabilityProbe.lean` imports exactly the two modules imported by
`parent-transport-extraction/ParentTransportExtraction.lean` and checks the
following declarations.

### Exact blocker-row locking

```lean
Problem97.CriticalShellSystem.source_mem_selectedFourClass
  (H : CriticalShellSystem A) (q) (hq : q ∈ A)
  (K : SelectedFourClass A (H.centerAt q hq)) :
  q ∈ K.support
```

```lean
Problem97.CriticalShellSystem.selectedFourClass_support_eq_shell
  (H : CriticalShellSystem A) (q) (hq : q ∈ A)
  (K : SelectedFourClass A (H.centerAt q hq)) :
  K.support = (H.selectedAt q hq).toCriticalFourShell.support
```

These lock a row to its own source shell. They do not put the other frontier
source into it. Under robust cross-survival, the other source is provably
absent.

### Blocked versus surviving deletion

```lean
Problem97.ATAILStageOnePrescribedApexDichotomy.
  source_mem_critical_support_of_no_qfree
  (C : CriticalSelectedFourClass A q center)
  (hwblocked : not (HasNEquidistantPointsAt 4 (A.erase w) center)) :
  w ∈ C.toCriticalFourShell.support
```

This would produce a cross hit only from a *blocked* cross deletion. The live
robust fields assert the opposite hypothesis: both cross deletions survive.

```lean
Problem97.ATailCriticalPairFrontier.
  cross_survival_unique_radius_and_exact_support
```

strengthens the surviving direction to exact erased support and unique
four-capable radius. It does not add a support hit.

### Total critical-source iteration

```lean
Problem97.CriticalShellSystem.exists_blocker_cycle
  (H : CriticalShellSystem A) (hne : A.Nonempty) :
  exists q k, 2 ≤ k and Function.IsPeriodicPt H.blockerVertex k q
```

This is the closest imported theorem that genuinely uses the total critical
map. Its first missing field is **anchoring/localization**: the existential
cycle is not tied to `P.q`, `P.w`, either chosen shell, the surplus cap, or a
non-surplus opposite apex. Periodicity alone gives no selected-row incidence
beyond each source's membership in its own blocker shell.

### All-center global-row selection

```lean
Problem97.exists_faithfulCarrierPattern_of_globalK4
Problem97.exists_faithfulCarrierPattern_with_two_classes
```

Global `K4` can choose a row at every center and can preserve the two actual
critical shells in one `FaithfulCarrierPattern`. The first missing field is a
theorem forcing that otherwise arbitrary pattern to expose a named
obstruction, or forcing rows at chosen blocker-shell support points into a
bounded support containing prescribed anchors. The constructor itself has no
such field.

### Named record001 bridge

```lean
Problem97.U1Depth5.PacketLabelCenteredRows.
  record001QTShellSupport_ofGlobalK4
```

is parent-import reachable through `U1Depth5Prefix`, but it assumes seven
named q/t1 shell equalities:

```text
q-row:  t1, t2, selectedU
t1-row: baseP, q, t3, selectedU.
```

It packages those incidences; it does not derive them from global `K4`.
Before it can apply here, a producer must align the record001 labels with the
frontier packet and prove the seven radius equalities. The live robust packet
contains neither alignment nor equalities.

## Current-worktree results requiring extra imports

`AdditionalImportReachabilityProbe.lean` confirms that these declarations are
source-reachable in the current worktree, but
`ParentImportNonReachabilityProbe.lean` confirms they are absent from the live
parent's exact import environment.

### U5 selected-row existence and two-anchor counting

```lean
Problem97.U5QAllowedK4Class.exists_card_four_of_globalK4
```

supplies an exact four-point row at an ambient center. Its first missing field
is any containment or prescribed membership for that row.

```lean
Problem97.U5QDeletedK4Class.
  exists_card_four_or_qCritical_of_globalK4
```

supplies either a q-deleted row or a q-critical triple-circle alternative.
Its first missing input for a deterministic row producer is exclusion of the
q-critical alternative; after that, bounded-support confinement is still
missing.

```lean
Problem97.U5QAllowedAuditSupport.
  two_le_selected_inter_anchorSupport_erase_center_card
```

does prove a two-anchor conclusion, but assumes

```lean
H : U5QAllowedAuditSupport D q p T u.
```

The non-automatic producer field is already visible in

```lean
Problem97.U5QAllowedConfinedK4AuditPayload.confined_class_exists
```

and has the shape

```text
for every named audit center x,
  exists an exact q-allowed four-class B at x
  with B contained in U5QAllowedBoundedSupport(...).
```

`toAuditedSupport` only repackages that field. It does not derive it from
global `K4`. This is the same missing support-localization content as the live
robust route, expressed in the U5 audit vocabulary.

### Census554 carrier bridge

```lean
Problem97.Census554.GeneralCarrierBridge.blocker_row_support_eq_shell
Problem97.Census554.GeneralCarrierBridge.source_mem_blocker_row
```

require a `FaithfulCarrierPattern A` and a `CriticalShellSystem A`. A faithful
pattern is constructible from global `K4`, so their hypotheses are available
after an extra import. However, the conclusions merely restate exact shell
locking and own-source membership. They do not select a Census554 obstruction,
confine any non-blocker row, or add the other frontier source to a blocker row.

## Sibling-only / archived result

The closest specialized bank theorem is

```lean
Problem97.C5D3B.
  two_le_qAllowedSelected_inter_rowOffAnchors_card_of_sameSideTerminal
```

with hypotheses

```text
P : C5D3BSameSideTerminalPacket ...
H : U5QAllowedAuditSupport D q v3 {v1,qs,w} u
hz : z ∈ U5BoundedAuditCenters ...
```

and conclusion

```text
2 ≤ card(selectedRow(z) intersect {q,w,H.a0,H.a1}).
```

The exhaustive sibling registry marks it `source-proved` and reachable in the
sibling source graph, but `local_exact_name=false`,
`local_module_basename=false`, and `local_shape_match=false`; it is not
importable from this worktree. More importantly, it consumes the same audited
support/confinement payload rather than producing it. Even after porting, its
cardinality conclusion does not by itself force both `q` and `w`; one must
also exclude `H.a0,H.a1` from the selected row or use a stronger prescribed
pair theorem.

The sibling metric kernel

```lean
Problem97.U1LargeCapRouteBTailMetricResidualTarget.
  u1TwoLargeCapObstruction
```

is also source-proved but not source-reachable in the sibling registry and is
not local. It requires seven explicit distance equalities. The live parent
does not currently produce the common native-row point and reverse-center
equalities needed to instantiate them.

No bank or indexed Lean-corpus hit identifies a selected deletion blocker
with a non-surplus cap's opposite vertex.

## Exact first missing producers

For the robust route, the smallest honest next statement is one of:

1. **Prescribed pair-row producer:** choose distinct support points `zq,zw`
   from the two actual blocker shells, away from `S.oppApex1`, and supply a
   global selected row at each containing both `P.q` and `P.w`.
2. **Support-confinement producer:** confine selected rows at enough named
   blocker-shell support points to `baseShell ∪ anchors`, then prove the
   resulting two-anchor hits are specifically the frontier pair (or route all
   other anchor choices to existing contradictions).
3. **Anchored total-map obstruction:** strengthen `exists_blocker_cycle` to a
   theorem whose orbit is forced to meet the frontier/cap packet and whose
   selected shells instantiate a known obstruction core.

For the cap-role route, the first missing object is not a field on either
actual robust blocker. It is a new third center `c`, together with

```text
c = S.oppositeVertexByIndex j
(S.capByIndex j).card = 5
j != S.surplusIdx,
```

and a proof that the row/radius information at `c` couples back to the live
frontier. The nearest general parent theorem is exactly

```lean
Problem97.U1LargeCapRouteBTailMetricResidualTarget.
  exists_secondLargeCap_of_noM44
  (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
  (hCirc : exists h12 h23 h13,
    MT.toMoserTriangle.case_split = Or.inl ⟨h12,h23,h13⟩)
  (CP : CapTriple D.A M)
  (hM : M = MT.toMoserTriangle.toStructural hCirc)
  (hsurplus : 4 < (CP.capAt i).card)
  (hNoM44 : not (exists S : SurplusCapPacket D.A, S.IsM44)) :
  exists j, j != i and 5 ≤ (CP.capAt j).card
```

Its first missing fields relative to `CapFiveOppositeApexBlockerRole` are
`(CP.capAt j).card = 5` and `c = S.oppositeVertexByIndex j`; it does not select
or mention a blocker center.

## Surplus-heavy regression-scope correction

The structural regression in

```text
scratch/atail-force/non-equilateral-parent-producer/
  verify_cap_profile_regression.py
```

uses triangle `(z1,O2,z2)`, surplus cap `C3`, and

```text
oppCap2 = C2 = {z2,kR,kL,z1}.
```

Its strict `oppCap2` interior is `{kR,kL}`, while the native cap-row centers
are `z1,z2`, the cap endpoints. Consequently it is not a Euclidean
realization of the actual `TwoContinuationRows` / `NonEquilateralOutput` cap
placement. It is only a local-row plus structural-cap-profile coexistence
test and must not be used as a regression against a full parent producer.

The exact surplus-heavy deficit remains: two strict surplus-interior points
on the heavy row plus a second distinct `oppCap2` center equidistant from that
same pair. `outsidePair_unique_capCenter` would then close the configuration.
The current heavy arm supplies only one such center, and its two surplus hits
may include a shared cap endpoint rather than two strict outside points.

## Search and validation

Before deriving anything, the audit checked all Problem 97 bank registries
required by `AGENTS.md` and used focused `nthdegree docs search --lean`
queries for robust four-center pair hits, blocker/support confinement,
critical-source iteration, and opposite-apex blocker roles. No exact bridge
was returned.

Checked direct Lean commands (Lean 4.27, from `lean/`):

```text
ImportReachabilityProbe.lean             exit 0
AdditionalImportReachabilityProbe.lean   exit 0
ParentImportNonReachabilityProbe.lean    exit 0
```

No Lake build was run.
