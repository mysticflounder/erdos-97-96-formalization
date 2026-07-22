# Original unique-four global coupling

Date: 2026-07-22

Status: **KERNEL-CHECKED GLOBAL TRANSITION AND EXACT COLLISION RESIDUAL;
NO DIRECT `False`; GLOBAL-ROW/KALMANSON SEARCH IS REOPENED AFTER CORRECTING
THE OLD FINITE REGRESSION.**

## Target

The owned target was the direct exact-four leaf

```lean
false_of_originalUniqueFourResidual
    (R : OriginalUniqueFourResidual F) : False
```

The work stayed in this scratch directory.  It did not edit production Lean,
shared plan documents, or proof-blueprint state.

## Bank and source preflight

Before deriving the transition, the required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered unique exact-four
classes, singleton minimal-deletion cores, strict-cap critical centers,
short-cap terminals, alternative Moser triangles, retriangulation, and
no-`IsM44`.  No indexed theorem consumes a critical shell centered at a
strict cap-interior point and constructs either a terminal outside-pair
collision or a new MEC-boundary support triangle.

## Checked global transition

`UniqueFourGlobalDeletionCoupling.lean` proves

```lean
exists_strictCap_collision_or_singletonCore_or_packedCore
```

from `R : OriginalUniqueFourResidual F`.

Let

```text
C = SelectedClass D.A S.oppApex1 radius
U = C union S.triangle.verts.
```

The exact-class and triangle-cardinality facts give `U.card <= 7`, while the
live carrier bound gives `10 <= D.A.card`.  Hence `D.A \ U` is nonempty.
Cardinal minimality says this proper convex subcarrier cannot retain global
K4, so some center in `D.A \ U` loses K4.  Shrinking `U` to a
cardinality-minimal blocking set `V` gives source-faithful restoration after
putting back any one member of `V`.

Because all three Moser vertices were deleted, the new center lies in one
strict physical cap.  The theorem then returns exactly one of:

1. two distinct members of `V` are co-radial at the new center; minimal
   restoration makes that ambient radius class have cardinality at least
   five, so the center is fully singleton-deletion robust;
2. `V.card = 1` and `V` carries a complete exact
   `MinimalDeletionCore`; or
3. `2 <= V.card`, the core shells are pairwise disjoint, the center is fully
   deletion-robust, and

   ```text
   2 * V.card <= (D.A \ S.capByIndex k).card.
   ```

In the two robust outputs, the theorem also proves the fixed-system fact

```lean
forall z hz, H.centerAt z hz != center.
```

Thus the new strict-cap robust center is omitted from the image of the actual
critical map.  This is a genuine joint consequence of minimality,
all-center K4, strict cap geometry, and the fixed `CriticalShellSystem`; it is
not a finite marginal or an arbitrary selected-row packet.

The repeated-radius strengthening is separately checked as

```lean
five_le_selectedClass_of_minimalDeletion_collision.
```

## Exact collision-arm classification

The collision arm has now been matched against the actual
`outsidePair_unique_capCenter` terminal, not just against blocker-map
pigeonhole facts.  The checked theorem

```lean
collision_sources_exact_cap_residual
```

classifies the cap index `k` of the fresh strict-cap center and the two
colliding deleted sources `source, partner`.

If `k != S.oppIndex1` and both sources lie in the exact first-apex class,
then `S.oppApex1` and the fresh center are distinct centers in the same
ordered cap.  If both sources were outside that cap,
`outsidePair_unique_capCenter` would give `False`.  Hence at least one source
is in the cap.  On the other hand, the endpoint one-hit theorem, transported
to the physical cap-index normal form as

```lean
firstApex_selectedClass_inter_otherCap_card_le_one
```

says that the exact first-apex class meets this adjacent cap in at most one
point.  Therefore **exactly one** collision source is in the cap.

The exhaustive surviving collision outputs are consequently:

1. `k = S.oppIndex1`;
2. at least one source is one of the protected Moser vertices but is not in
   the exact first-apex class; or
3. `k != S.oppIndex1`, both sources lie in the exact class, and exactly one
   lies in `S.capByIndex k`.

This proves that endpoint one-hit has the opposite polarity from the hoped
outside-pair closure: it leaves a named one-in/one-out residue.  No
conditional packet or new producer interface was introduced.

The fresh-center robustness consequence does not close that residue through
the fixed blocker map.  Applying
`FullyDeletionRobustAt.exists_distinct_sources_same_blocker` gives only an
anonymous repeated fiber; it does not make its two sources co-radial at the
first apex or at the fresh center.  Moreover `CriticalFiberClosingCore` is
typed over `FrontierCommonDeletionParentResidual`, while the exact-four arm
is precisely the first-apex unique branch where double deletion at the first
apex fails.  It is therefore not a direct consumer of this leaf.

## Singleton consumer audit

The singleton branch was compared directly with the existing no-M44,
short-cap, and retriangulation consumers.

It does **not** match them:

- `false_of_shortCap_at_largeCapUniqueFiveApex` requires an alternative
  `SurplusCapPacket` whose short cap is physically opposite a retained
  unique-five **Moser apex**.  The new center is a strict cap-interior point,
  not a Moser vertex, and the unique-four branch has no unique-five profile.
- `containment_or_strictAdjacentEscapeAt_of_moserCapFormsAt` and the
  `MoserOnlyBlockers` family are likewise centered at indexed Moser vertices.
  They do not apply to an arbitrary strict-cap center.
- `isM44Packet_of_capTriple_two_exact_of_card_gt_nine` is only a constructor
  after a new nonobtuse MEC-boundary triangle, its complete `CapTriple`, and
  two exact four-cap cardinalities have already been supplied.  A singleton
  critical shell supplies none of those MEC data.
- Reorienting the displayed triangle cannot help: it only permutes the same
  three cap cardinalities.  A no-M44 argument needs a genuinely different
  MEC-boundary triple.

Installing the singleton shell into `H` is legal, but the existing selector
audits show that this merely starts an override/rebase loop unless a
well-founded geometric nonreturn fact is added.  No conditional adapter was
added here.

## First exact missing theorem for the singleton arm

The narrow terminal-grade producer is an outside-pair occurrence or a real
alternative packet.  In schematic Lean, with `K` the unique shell in the
singleton core and `center` its strict-cap center, it is:

```lean
singletonCore_outsidePair_or_alternativeM44
    (R : OriginalUniqueFourResidual F)
    (hcenterI : center in S.capInteriorByIndex k)
    (K : CriticalSelectedFourClass D.A source center)
    (hsourceU : source in
      SelectedClass D.A S.oppApex1 radius union S.triangle.verts)
    (hblocked : not HasNEquidistantPointsAt 4
      (D.A.erase source) center) :
  (exists i a b,
      a != b and
      S.oppApex1 in S.capByIndex i and
      center in S.capByIndex i and
      a notin S.capByIndex i and
      b notin S.capByIndex i and
      a in SelectedClass D.A S.oppApex1 radius and
      b in SelectedClass D.A S.oppApex1 radius and
      a in K.toCriticalFourShell.support and
      b in K.toCriticalFourShell.support) or
  (exists T : SurplusCapPacket D.A, T.IsM44)
```

The first output is consumed immediately by
`CapSelectedRowCounting.outsidePair_unique_capCenter`: the first apex and
`center` are distinct same-cap centers of the same outside pair.  The second
output contradicts `R.noM44` immediately.

This is **CONJECTURED / OPEN**.  It is not a reformulation of a known local
row lemma: it must relate a fresh strict-cap critical shell to either the
complete physical cap order or a genuinely different MEC support triangle.
No current declaration supplies that relation.

After the singleton arm, the two robust outputs need the analogous nonreturn
fact: a fresh robust strict-cap center omitted by `H` must produce an
outside-pair occurrence, an alternative packet, a proper witness-closed
subcarrier, or a strict well-founded cap/MEC descent.  Robustness and blocker
image omission alone have no current terminal consumer.

## Corrected regression boundary

Two existing regressions were rerun.

1. `verify_exact_local_boundary.py` exactly realizes the local Euclidean/MEC
   exact-four surface with cap profile `(6,4,5)`, no alternative M44 profile,
   and the second-apex double deletion.  It fails K4 at every non-apex center.
2. `UniqueFourIncidenceBoundary.lean` kernel-checks all-center rows,
   minimality-style row connectivity, critical-map incidence, and the same
   cap-count profile while avoiding the desired second common-pair row.  It
   is not a Euclidean realization.  More strongly, it is not compatible with
   strict Kalmanson order under the natural completion of its named cap
   roles, so it must not be cited as an ordinal-convex regression.

The exact checker

```text
verify_unique4_incidence_kalmanson.py
```

uses the explicit cap completion

```text
C0 = {0,1,2,3,4,5}
C1 = {5,7,8,6}
C2 = {6,9,10,11,0},
```

where the strict cap blocks have sizes four, two, and three.  It enumerates
all `4! * 2! * 3! = 288` within-cap cyclic orders.  Every order is killed by
one strict Kalmanson inequality after quotienting distance terms by the
`globalRowFour` shell equalities.  The five first-core signatures occur with
counts `72,72,72,36,36`; for example cyclic order `0 < 1 < 5 < 7` is killed
by rows centered at `0,1,7`.

This completion is the natural one matching the named roles (`0,5,6` are
the Moser vertices and `7,8` are the stipulated strict first-opposite-cap
points), but the old Lean fixture itself records only `C0`, the two-point
set `{7,8}`, and the profile `(6,4,5)`.  It does **not** encode `C1` or `C2`.
Thus the exact result corrects this completion, not the bare fixture
intrinsically.  Other source-faithful endpoint choices must be checked or
quotiented in a genuine search.

The two old boundaries are still not models of `OriginalUniqueFourResidual`,
but their former symmetric interpretation is invalid.  The local Euclidean
model shows that local MEC/cap data without all-center K4 is insufficient.
The finite incidence fixture does **not** show that an ordinal-convex
all-center continuation can survive.  This correction reopens global-row plus
strict-Kalmanson CEGAR as a credible exact-four closure route.

## Next terminal-grade search

The next useful computational object is a source-faithful global-row search,
not another fixed local collision packet.  It should quantify over:

- the complete three cap blocks and all within-cap orders;
- a four-point selected row at every carrier point, with the source-specific
  fixed critical-map constraints retained;
- strict Kalmanson inequalities for every cyclic quadruple; and
- the exact-four first-apex class, retained-pair, second-apex double-deletion,
  minimality/row-closure, and no-M44 fields of
  `OriginalUniqueFourResidual`.

An UNSAT result needs a coverage certificate over all cap-role completions
and row choices.  A SAT result must retain its full cap membership and order
so it can serve as the next geometry-aware regression.  The old single table
cannot decide that quantified problem, but its 288/288 failure shows that the
strict-order layer has real pruning force here.

## Validation

The new module was elaborated from `lean/` with warning-as-error enabled:

```bash
env LEAN_PATH=../scratch/atail-force/unique-arm-route-audit:\
../scratch/atail-force/unique-row-producer:\
../scratch/atail-force/unique4-global-coupling:\
./.lake/build/lib/lean \
  lake env lean -R .. -M 16384 -DwarningAsError=true \
  ../scratch/atail-force/unique4-global-coupling/UniqueFourGlobalDeletionCoupling.lean
```

The printed axiom closure of the main theorem is exactly:

```text
propext
Classical.choice
Quot.sound
```

The exact local Python regression, finite Lean regression, and corrected
strict-Kalmanson checker all exited successfully in this session.  There is
no `sorry`, `admit`, declared axiom, `native_decide`, or unsafe declaration in
the new Lean module.

## Epistemic status

- **PROVEN / KERNEL-CHECKED:** the strict-cap three-way global transition,
  repeated-radius five-class strengthening, robust-center conclusion,
  blocker-image omission, cap-complement packing, endpoint one-hit transport,
  and the exact collision one-in/one-out residual.
- **EXACT WITHIN THE EXPLICIT FINITE ORDER COMPLETION:** all 288 within-cap
  orders for the old `globalRowFour` table are strict-Kalmanson impossible.
- **SOURCE-GROUNDED NEGATIVE AUDIT:** no existing singleton/noM44/short-cap
  consumer matches the new endpoint; anonymous repeated blocker fibers and
  `CriticalFiberClosingCore` do not match this unique-arm surface.
- **CONJECTURED / OPEN:** the displayed singleton terminal producer and the
  robust-center nonreturn theorem, plus coverage of all source-faithful global
  row/cap-order choices.
- **NOT CLAIMED:** `False`, satisfiability of the full residual, a new
  counterexample, or closure of a production `sorry`.
