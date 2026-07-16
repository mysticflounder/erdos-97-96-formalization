# Directed original-q generated-row bank audit

Date: 2026-07-16

Status: **NO COMPLETE BANK MATCH; NO ATOMIC DEFICIT-ONE MATCH. THE
SOURCE-FAITHFUL MISSING ANTECEDENT IS PRESCRIBED-DELETION CRITICALITY OR
BLOCKER-CENTER ALIGNMENT AT THE GENERATED CENTER.**

## Scope

This audit owns only this report. It changes no Lean source, closure document,
proof-blueprint state, protected file, or paused scratch lane.

The audited input is the checked F2 boundary in:

- `r-f2-live-mixed-handler/F2LiveMixedHandler.lean`; and
- `r-f2-directed-original-q-row/source-extraction/OriginalQSourceExtraction.lean`.

## Required theorem-bank preflight

Before classifying the missing producer, I checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`;
- current `U5GlobalIncidenceSupport.lean` and
  `U5GlobalIncidenceKernels.lean`;
- the prior F2 direct-match and three-row role-deficit audits; and
- focused `nthdegree docs search --lean` queries for original-`q`
  q-deleted/q-critical rows, prescribed-deletion criticality, blocker-center
  provenance, adjacent dangerous-center consumers, third-common-point
  consumers, and exact-row tetrahedra.

The legacy and older general-theorem registries contain no relevant
q-critical/q-deleted consumer. The sibling `p97-rvol` registry contains
additional source-proved U5 consumers, but none is present as a local module
or local statement-shape match in this checkout.

## Exact source-faithful packet

The retained critical system fixes the actual row sourced at the original
live point `q`:

```text
center = p
support = {q,t1,t2,t3}
q belongs to the support
deleting q destroys K4 at p.
```

For each named strict dangerous center `z` produced by the F2 reduction:

```text
z belongs to {t1,t2,t3}
z belongs to D.A
z != q
z belongs to the actual source-q row centered at p
p != z
```

and global K4 at `z` gives the exact original-`q` split:

```text
q-deleted:  an exact U5QDeletedK4Class D q z B, card B = 4
or
q-critical: the raw 4A critical alternative, packaged as
            U5QCriticalTripleClass D q z B, card B = 3.
```

The live-heavy branch supplies this split at both named dangerous centers
`x,y`. The mixed branch supplies it at its unique strict dangerous center
`x`.

The one directed generated-center incidence already known is:

```text
z belongs to the source-q row centered at p.
```

The needed bank direction is the reverse:

```text
p, another dangerous center, or another named source
belongs to the generated row centered at z.
```

No such reverse incidence follows from the current F2 packet.

## Current-bank consumers

All declarations in this section are source-current and visible after
importing `F2LiveMixedHandler`; no additional U5 import is needed at this
scratch boundary.

### `U5QCriticalTripleClass.two_triple_points_incompatibility`

Exact interface:

```lean
(htriple : U5DangerousTriple D q p T)
(K : U5QCriticalTripleClass D q center B)
(hcenter_ne_p : center ≠ p)
(ht1T : t1 ∈ T) (ht2T : t2 ∈ T) (ht12 : t1 ≠ t2)
(ht1B : t1 ∈ B) (ht2B : t2 ∈ B) :
False
```

For a generated q-critical row at `z ∈ T`, F2 supplies the class, the center
inequality, and the dangerous-triple roles. It supplies neither of the two
required memberships in `B`.

Classification:

- complete match: **no**;
- atomic directed-incidence deficit: **two**;
- aggregate conditional deficit: one proposition
  `2 ≤ card (B ∩ T)`.

The aggregate form must not be called a one-incidence producer. It packages
two distinct reverse incidences and is precisely the forbidden side of the
existing upper bound `card (B ∩ T) ≤ 1`.

### `U5QCriticalTripleClass.two_triple_centers_adjacent_incompatibility`

On the live-heavy branch, if both generated rows at `x,y` are q-critical, the
exact missing fields are:

```text
p ∈ Bx
p ∈ By
y ∈ Bx or x ∈ By.
```

All center/triple/distinctness roles are already available.

Classification:

- complete match: **no**;
- atomic directed-incidence deficit: **three**.

This is the nearest source-current terminal.

### `U5QCriticalTripleClass.two_triple_centers_third_common_incompatibility`

Using the coherent third dangerous label `r`, the exact missing fields are:

```text
p ∈ Bx
p ∈ By
r ∈ Bx
r ∈ By.
```

Classification:

- complete match: **no**;
- atomic directed-incidence deficit: **four**.

### `U5QCriticalTripleClass.qcritical_exact_qcritical_chain_incompatibility`

This consumer needs three separately typed rows and five directed support
memberships:

```text
p ∈ Bleft
mid ∈ Bleft
p ∈ Bmid
right ∈ Bmid
p ∈ Bright.
```

The F2 packet does not furnish the required three-row role assignment, so this
is strictly farther away than the adjacent-center terminal.

### `U5QDeletedK4Class.inter_dangerous_p_circle_card_le_two`

For a generated q-deleted row at `z`, this theorem gives:

```text
card (B ∩ ({q} ∪ T)) ≤ 2.
```

Since `q ∉ B` and `card B = 4`, it is a positive two-off-`T` producer, not a
contradiction. In particular it rules out treating a q-deleted generated row
as though three dangerous-circle hits were automatic.

## Sibling-only consumers

The closest sibling declaration is:

```lean
U5QDeletedK4Class.three_exact_classes_tetrahedron_incompatibility
```

If the live-heavy rows at `x,y` are both q-deleted and the actual middle row
at `oppApex2` is used as the third exact class, the middle-row incidences are
known. The remaining generated-row incidences are exactly:

```text
y,a ∈ Bx
x,a,oppApex2 ∈ By.
```

Thus even after promoting the sibling module, this route has a five-incidence
deficit.

The registry records this theorem and the nearby
`qcritical_exact_aux_*`, `qcritical_chain_extra_two_intersections_*`, and
`qcritical_exact_selected_circumcenter_*` declarations as:

```text
source_reachable = true          -- inside p97-rvol
local_module_basename = false    -- absent from this checkout
local_shape_match = false        -- no current local equivalent
```

They are not immediate import-reachable consumers for this repository and
none is closer than the current three-incidence adjacent-center terminal.

## Existing source-to-incidence bridges

The missing content should be stated as deletion criticality or blocker
provenance, not as an unexplained support membership.

### Prescribed-deletion criticality

Current production theorem:

```lean
ATAILStageOnePrescribedApexDichotomy.
  source_mem_critical_support_of_no_qfree

(C : CriticalSelectedFourClass A q center)
(hwblocked :
  ¬ HasNEquidistantPointsAt 4 (A.erase w) center) :
w ∈ C.support
```

The implication direction is:

```text
deleting w blocks K4 at center
  -> w belongs to the exact critical shell at center.
```

It does not prove the blocking hypothesis.

For the raw q-critical arm, retain the raw 4A alternative and use
`U5QCriticalTripleClass.exists_criticalFourShell_of_qCritical` before applying
this bridge. The present `OriginalQDeletionSplit` packages only the
`U5QCriticalTripleClass` and discards the raw witness, so a future adapter
should preserve that raw witness or the resulting full shell.

For the q-deleted arm, the same elementary argument applies to any selected
four-row, but there is no current named adapter from
`U5QDeletedK4Class` plus prescribed-deletion failure directly to membership.
Adding that generic adapter would be mechanical; proving the deletion failure
is the mathematical producer.

### Blocker-center alignment

Current production theorems:

```lean
CriticalShellSystem.source_mem_selectedFourClass

center = H.centerAt w hw
  -> every selected four-class at center contains w
```

and:

```lean
CriticalShellSystem.selectedFourClass_support_eq_shell

center = H.centerAt w hw
  -> every selected four-class at center has the chosen exact shell support.
```

Thus an equality

```text
z = W.H.centerAt w hw
```

is a stronger, source-faithful producer than an isolated assertion
`w ∈ B`: it supplies the membership for either selected-row outcome and locks
the whole support.

The scratch-only
`CriticalShellSystem.selectedAt_support_eq_of_centerAt_eq` similarly gives
full support transport when two chosen blocker centers agree. It still
consumes, rather than produces, the center equality.

### Survival has the opposite polarity

Current production theorem:

```lean
ATailCriticalPairFrontier.
  cross_deletion_survives_iff_not_mem_selected_support
```

has the exact direction:

```text
K4 survives after deleting w at H.centerAt q
  <-> w is omitted from q's chosen shell.
```

Therefore a known survival statement is evidence against the desired
directed hit at that actual blocker. Mining must preserve this polarity and
must not reinterpret survival or support omission as a metric equality.

## Complete versus deficit-one verdict

| Target | Import status | Complete | Atomic missing incidences |
|---|---|---:|---:|
| q-critical two-triple-points | current / reachable | no | 2 |
| two q-critical adjacent centers | current / reachable | no | 3 |
| two q-critical centers, third common | current / reachable | no | 4 |
| q-critical/exact/q-critical chain | current / reachable | no | at least 5 plus role assignment |
| three q-deleted exact tetrahedron | sibling-only | no | 5 |

There is no complete consumer and no honest one-directed-incidence consumer.
The only apparent “deficit one” is the aggregate proposition
`2 ≤ card (B ∩ T)`, which encodes two distinct memberships and is already the
forbidden side of the q-critical two-circle bound.

## Recommended next theorem surface

The nearest current closure route is the both-q-critical live-heavy arm. Its
three missing memberships should be mined through the equivalent
source-indexed criticality packet:

```text
not K4 (D.A.erase p) at x
not K4 (D.A.erase p) at y
and
  not K4 (D.A.erase y) at x
  or
  not K4 (D.A.erase x) at y.
```

After the generic selected-row criticality-to-membership adapter, these give:

```text
p ∈ Bx
p ∈ By
y ∈ Bx or x ∈ By,
```

which closes through
`two_triple_centers_adjacent_incompatibility`.

If the criticality packet is false because one or more deletions survive,
the exact survival/omission theorem should be used to classify that residual;
the search should not continue asking for the corresponding impossible hit.

For implementation, the next adapter should therefore:

1. refine the generated q-critical arm so it retains the raw 4A critical
   witness or a `CriticalSelectedFourClass`;
2. add the mechanical q-deleted selected-row
   `no_qfree -> source membership` bridge; and
3. expose the three branch-specific deletion-criticality propositions above
   as the only mathematical producer fields for the nearest terminal.

This keeps the producer source-preserving and makes every requested incidence
the consequence of a named deletion-criticality fact.

## Validation

Two stdin Lean probes imported exactly `F2LiveMixedHandler` and successfully
`#check`ed:

- all four current U5 consumers listed above;
- `source_mem_critical_support_of_no_qfree`;
- `source_mem_selectedFourClass`;
- `selectedFourClass_support_eq_shell`; and
- `cross_deletion_survives_iff_not_mem_selected_support`.

The probes exited `0` with the repository-pinned Lean 4.27.0 environment. No
Lean source was changed and no full build was run.
