# ATAIL Stage-I bisector-producer assessment

Date: 2026-07-13

## Verdict

The published K-A-PAIR fields do **not currently produce either additional
carrier center** on the perpendicular bisector of the separated outside pair.
This is a bounded negative field-map and theorem-bank audit, not a proof that
no such producer theorem exists.

The exact source-row route is now kernel-checked in
`stage1_bisector_producer_boundary.lean`.  If the separated pair is `z,w` and
`H : CriticalShellSystem D.A`, then:

1. the blocker row sourced at `z` automatically contains `z`;
2. the single cross-incidence
   `w ∈ (H.selectedAt z hzA).toCriticalFourShell.support` makes
   `H.centerAt z hzA` equidistant from `z,w`;
3. symmetrically,
   `z ∈ (H.selectedAt w hwA).toCriticalFourShell.support` makes
   `H.centerAt w hwA` equidistant from `z,w`; and
4. if those two centers and `rows.uRow.center` are pairwise distinct, the
   existing `URowTripleBisectorAlternateFields` consumer gives `False`.

Thus the first missing antecedent for **one** extra center is exactly one
cross-row membership plus center separation:

```text
w ∈ selectedAt(z).support
rows.uRow.center != centerAt(z).
```

For the full triple-bisector contradiction the symmetric cross-membership and
the remaining two center inequalities are also needed:

```text
z ∈ selectedAt(w).support
rows.uRow.center != centerAt(w)
centerAt(z) != centerAt(w).
```

No radius equality or carrier-membership premise has to be produced after
those incidence fields: the critical rows supply them automatically.

## New proven boundary

The scratch module proves the following endpoints with only
`propext`, `Classical.choice`, and `Quot.sound`:

- `criticalSystem_center_bisects_of_pair_mem_support` converts two row
  memberships into the required equal-distance equality;
- `extraBisectorCenter_not_mem_commonCap` proves that any additional center
  for the surviving pair lies outside its common cap;
- `mutualCriticalSourceBisectors_to_tripleBisectorAlternate` packages the two
  source-specialized cross-incidences into the existing alternate;
- `centerCollision_of_mutualCriticalSourceIncidence` proves that reciprocal
  incidence without center distinctness forces one of the two new blocker
  centers to equal `uRow.center`, or forces the two new centers to coincide;
- `supportCollision_of_mutualCriticalSourceIncidence` upgrades each of those
  center collisions to equality of the corresponding complete exact supports;
- `false_of_separatedPair_mutualCriticalSourceBisectors` is the direct
  separated-pair consumer;
- `confinement_of_mutualCriticalSourceBisectorProducer` is the one-call return
  from the exact producer property to the checked confinement branch; and
- `criticalSource_extraBisector_not_mem_commonCap` records the cap exclusion
  directly for a critical-system row.

The named producer property is
`URowSeparatedPairMutualCriticalSourceBisectorProducer`. It quantifies only
over points satisfying the checked separated-pair escape, rather than over
equal or unrelated support pairs.

The cap-exclusion theorem is important polarity information.  The separated
packet already proves that `rows.uRow.center` is the unique point of the common
cap equidistant from `z,w`.  Hence `p` cannot be an extra center (the packet
contains the explicit unequal-distance fact), and no other point known only
through membership in that common cap can be one either.  A successful
critical-row producer must locate both new blocker centers outside the cap.

## Actual K-A-PAIR field map

Let `c := rows.uRow.center`.  The separated packet supplies

```text
c,z,w ∈ D.A
z != w
dist c z = dist c w
p,c ∈ one indexed cap C
z,w ∉ C
dist p z != dist p w.
```

The remaining K-A-PAIR binders contribute as follows.

| Binder family | Positive information | Missing pair-specific information |
|---|---|---|
| `MT,hCirc,CP,i,j,hM,hqCap,hsurplus,hjne,hj5,hNoM44,hcard` | MEC/cap geometry and two cap-cardinality lower bounds | no row centered outside `C` containing both `z,w` |
| `hcritical : Nonempty (CriticalShellSystem D.A)` | a blocker row for every carrier source; every row contains its own source | no cross-incidence between the `z`- and `w`-source rows |
| `hlocalNoQFree,hfixed,H` | the exact dangerous `p`-circle and selected point `u` off it | no equality at `p` for `z,w`; the separated packet proves the opposite |
| `hcenter,hsupport` | the `t2` row is the exact dangerous row centered at `p` | no membership of `z,w` in a second row |
| `hbase,hqNonMoser` | named-label separation and cap placement of `q` | no blocker-center incidence for `z,w` |

At the residual theorem signature, `rows` and `hcritical` are independent
arguments.  The outer Route-B constructor originally obtains `rows` from one
critical system, but even restored same-system provenance gives only the
automatic diagonal facts

```text
z ∈ selectedAt(z).support
w ∈ selectedAt(w).support.
```

It does not give either cross-membership. Equal blocker centers are also
allowed. The checked collision trichotomy makes this exact: reciprocal
incidence forces

```text
c = centerAt(z)
or c = centerAt(w)
or centerAt(z) = centerAt(w),
```

unless the branch is already contradictory. Same-center rigidity then
identifies the corresponding complete supports and does not create a new
bisector center. Thus a successful proof must either exclude all three
support-collapse branches or send one to a different consumed obstruction.

## Theorem-bank preflight

The required current and archived registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed Lean searches were run for outside-pair bisectors, mutual critical
source rows, pair-containing blocker rows, and cap-local extra centers.

The closest banked consumers do not supply the producer:

- Dumitrescu / `PerpBisectorCore` consumes three distinct carrier centers on
  one pair; the live separated packet supplies exactly one.
- `u1TwoLargeCapObstruction` consumes a five-point, seven-equality row pattern;
  the separated packet supplies only its first one-center row fragment.
- `U5QCriticalTripleClass.mutual_no_p_exact_center_incompatibility` consumes
  several mutual dangerous-source incidences, including both directions of a
  row coupling.  None is a consequence of the separated packet.
- The legacy `three_common_equidistant_centers_eq` is a rigidity consumer for
  two centers sharing three noncollinear points, not a theorem producing a
  second center for one pair.
- The existing `DangerousRowSameCapSecondCenter` route uses a different pair:
  it needs two dangerous-row points in the `u` row outside the common cap.
  The separated packet has an explicitly off-dangerous escape point and does
  not produce those two cross-hits.

The searches therefore found no already-proved theorem which derives even
the first cross-membership from the live K-A-PAIR fields.

## Epistemic status

- **PROVEN / kernel-checked:** the source-specialized cross-incidence reduction,
  the mutual-source adapter to the triple-bisector alternate, the final
  contradiction, the center/support-collision complement, the one-call
  confinement adapter, and exclusion of every additional center from the
  common cap.
- **OPEN-PROOF:** production of
  `w ∈ selectedAt(z).support` or any equivalent first extra-center field.
- **OPEN-PROOF:** production of the symmetric cross-incidence and pairwise
  center separation needed for the second extra center.
- **NOT CLAIMED:** independence of these fields from the complete Euclidean
  K-A-PAIR hypotheses, or a target-faithful counterexample.

## Validation

The dependency-order direct single-file check compiled
`stage1_common_cap_confinement_boundary.lean`, then
`stage1_separated_pair_classifier_boundary.lean`, then the new module against
temporary oleans. All printed endpoints have exactly

```text
propext, Classical.choice, Quot.sound
```

as axioms.  The new source contains no `sorry`, `admit`, named axiom, or
`native_decide`.
