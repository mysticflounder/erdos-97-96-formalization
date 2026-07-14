# ATAIL joint-fiber functional producer assessment

Date: 2026-07-14

## Verdict

No current theorem turns the actual K-A-PAIR hypotheses into any of the three
functional conclusions which would close the leaf:

1. an upper bound of two on the other-apex distance image of a three-point
   first-apex marginal;
2. a repeated other-apex radius on that marginal; or
3. a finite partition with at most two cells whose cell labels determine the
   other-apex radius.

This is a **premise-mismatch result about the available interfaces**, not an
independence theorem for the full Euclidean K-A-PAIR hypotheses.  The full
hypotheses may be inconsistent; proving any one of the three displays above
from them would itself prove that inconsistency and close the leaf.

No Lean declaration is added here.  A conditional wrapper around the missing
field would only rename the open producer.  The smallest closure-sufficient
field, and the first absent atomic coupling inside it, are isolated below.
This note is a functional-interface addendum to the older apex-filter audit;
it does not repeat that audit's kernel proof or broad route ranking.

## Functional normalization

Fix the leaf packet `S` and a first-apex K4 radius `r`, and write

```text
T_r := (D.A.filter (fun x => dist x S.oppApex1 = r)) \ S.surplusCap
f(x) := dist x S.oppApex2.
```

The checked file `joint_fiber_upper_bound.lean` proves:

```text
exists r, 0 < r and 3 <= |T_r|,
f is injective on T_r,
|f '' T_r| = |T_r| >= 3,
and every fixed joint fiber has cardinality <= 1.
```

The relevant declarations are

- `exists_oppApex1_radius_three_le_sdiff_surplus` at lines 61--95;
- `doubleApexJointFiber_sdiff_surplus_card_le_one` at lines 38--56; and
- `exists_oppApex1_radius_three_le_oppApex2_distance_image` at lines
  226--251.

Consequently, on this marginal the following are equivalent ways of deriving
the required contradiction:

```text
|f '' T_r| <= 2;
exists x != w in T_r, f(x) = f(w);
exists a partition of T_r into <= 2 fibers of f.
```

They are not independent local geometry.  Each contradicts the already proved
injectivity of `f` on `T_r`.

## Required theorem-bank preflight

The registries required by `AGENTS.md` were searched before this assessment:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused indexed-corpus searches covered:

```text
three points fixed distance from one Moser apex two have equal distance to other apex under two large caps
opposite apex distance image card at most two no M44 critical shell
critical shell system blocker center equals Moser apex selected class
finite partition radius class other apex distance collision
```

The closest hits are all inapplicable or consumer-side:

- `long_apex_shell_card_le_two` assumes `IsM44` and the adjacent-distance
  upper bound; the live branch assumes `hNoM44` and supplies no such bound.
- `selectedFourClass_support_eq_shell` and
  `source_mem_selectedFourClass` give exact support rigidity at an already
  chosen blocker center; they do not identify that center with either Moser
  apex.
- the U2 one-hit/cover theorems produce the three-point marginal and its
  injective other-apex image, not an image compression.
- the banked `DoubleApexOffSurplusSharedRadiusPair` entry is the same open
  producer (or a sibling re-export), not a proof of it.
- the ten-entry K4-window bank has a proved algebraic contradiction consumer,
  but `docs/general-n-certificate-bank-mining-2026-07-09.md` explicitly leaves
  the geometric window-classification producer open.

No legacy or sibling-bank declaration supplies an apex-localized critical row,
a repeated other-apex radius, or an image-cardinality upper bound on `T_r`.

## Hypothesis-by-hypothesis mismatch

The production signature is
`DoubleApexOffSurplusSharedRadiusPair` at
`U1LargeCapRouteBTail.lean:2516`.  Its inputs reach the functional target as
follows.

| Input | What is actually available | Missing functional consequence |
|---|---|---|
| `D.K4` plus the two opposite apices in `D.A` | A radius class of cardinality at least four at each apex.  After the surplus one-hit bound, each has an off-surplus marginal of cardinality at least three. | No relation between the radius selected at the first apex and the independently selected radius at the second apex. |
| `hsurplus`, `hj5`, `hjne`, `hNoM44` | A surplus cap of size at least five and a distinct cap of size at least five; `exists_secondLargeCap_of_noM44` is only a cardinality witness. | No membership of a marginal point, live source, live center, or selected support in the second large cap; no bound on the number of second-apex radii. |
| Convex/MEC/Moser cap geometry | The full first-apex class is covered by surplus, the other opposite cap, and its own strict interior; the first two regions have one-hit bounds. | Region equality does not imply equality of distance to the other apex.  Indeed the other-apex distance is injective even inside these regions. |
| `hcritical : Nonempty (CriticalShellSystem D.A)` | For every source, some chosen blocker center has an exact four-point support containing the source. | No blocker center is identified with `S.oppApex1` or `S.oppApex2`, and no two points of `T_r` are placed in one apex-centered selected support. |
| Restored common `LiveCriticalRowProvenance` | Equal blocker centers imply equal complete supports; the source lies in its own support. | It does not force two sources to have equal blocker centers, and equality at an arbitrary blocker center is not equality of distance to `S.oppApex2`. |
| `rows`, `hcenter`, `hsupport` | The `t2` row is the exact `p`-centered support `{q,t1,t2,t3}`. | No equality `p = S.oppApex2`, and no two members of this support are known to lie in `T_r`. |
| `hfixed`, `hlocalNoQFree`, `H`, `hbase` | The dangerous base is one exact `p`-circle; `u` is a distinct selected point off that circle; the six labels are distinct. | No label is identified with the K4 marginal chosen at an opposite apex, and no dangerous/live radius is an opposite-apex radius. |
| Additional `f2` row under common provenance | `two_le_f2Row_support_sdiff_dangerousBase` gives two same-`f2Row.center`-radius points outside `{q,t1,t2,t3}`. | “Off dangerous base” is neither “off surplus” nor membership in `T_r`; `f2Row.center` is not identified with `S.oppApex2`. |

The rows and `hcritical` are independent arguments in the current production
signature.  Restoring their actual outer common provenance is worthwhile, but
the stronger provenance still stops at the same apex-alignment boundary.

## Why the three natural partitions do not work

### Cap-region partition

After removing the surplus cap, the U2 cover leaves the other opposite cap and
the first apex's own strict interior.  This is a two-region cover, so at least
two of the three marginal points occupy one region.  But a cap region is not a
fiber of `f`.  The checked injectivity theorem says two distinct points of
`T_r` have different `f` values even when they occupy the same region.

Thus “two points in one cap cell” is not the required pigeonhole conclusion.

### Independently selected apex classes

Let `U_rho` be a three-point off-surplus marginal at the second apex.  A
two-point intersection `|T_r intersect U_rho| >= 2` would close immediately,
but the guaranteed cardinalities do not force it.

At card 12 the no-M44 profiles are `(5,5,5)` and `(4,5,6)`.  Since the chosen
surplus cap has size at least five, the off-surplus carrier has size six or
seven.  The only uniform lower bounds are

```text
|T_r| >= 3 and |U_rho| >= 3.
```

For subsets of a six- or seven-element universe, these bounds force neither
one common point nor two; two three-subsets can be disjoint.  To force two
common points by cardinality alone one would need

```text
|T_r| + |U_rho| >= |D.A \ S.surplusCap| + 2,
```

whose guaranteed left side is only six while the right side is eight or nine.
Above card 12 the off-surplus universe can grow while the marginal lower bounds
remain three, so this count does not become a `CARD-GE-12` argument at a higher
threshold.

### Blocker-center partition

Partitioning `T_r` by `CriticalShellSystem.centerAt` also fails twice:

1. there is no upper bound of two on the blocker-center image of `T_r`; and
2. even a repeated blocker center gives a common radius around that blocker,
   not around `S.oppApex2`.

The cap-local blocker-fiber bound goes in the opposite direction: a chosen
blocker center can receive at most two sources from one cap.  It does not bound
the number of blocker centers and does not align any center with a Moser apex.

The finite live-label set is not a fourth partition: no theorem says `T_r` is
covered by `{p,q,t1,t2,t3,u}` or by their row supports.

## Exact first missing field

Let `P` retain a common critical-shell system, and choose the checked radius
`r` with `3 <= |T_r|`.  The smallest common-system field that is both
structural and immediately closure-sufficient is the following named
interface:

```text
ApexAlignedTwoHit(P,S,r) :=
  exists source (hsource : source in D.A),
    P.system.centerAt source hsource = S.oppApex2 and
    2 <=
      |T_r intersect
        (P.system.selectedAt source hsource).toCriticalFourShell.support|.
```

The selected support is one exact positive-radius class at its center.  After
rewriting that center to `S.oppApex2`, any two distinct members of the displayed
intersection have:

- the common first-apex radius `r` by membership in `T_r`;
- a common second-apex radius by membership in the selected support; and
- off-surplus membership by the definition of `T_r`.

They therefore form the forbidden joint fiber and `oppCap2_escape_gen` closes
the branch.  At the interface level the complete implication is

```text
ApexAlignedTwoHit(P,S,r)
  -> exists x != w in T_r, dist x S.oppApex2 = dist w S.oppApex2
  -> False.
```

The first arrow is finite-set extraction plus the selected support's
same-radius field; the second is exactly the checked double-apex joint-fiber
sink.  No additional counting, cap classification, or solver certificate is
needed after `ApexAlignedTwoHit`.

The dependency order inside this field matters:

1. **First absent atomic coupling:**

   ```text
   OppApex2InBlockerImage(P,S) :=
     exists source (hsource : source in D.A),
       P.system.centerAt source hsource = S.oppApex2.
   ```

   No current critical-system, common-provenance, cap, or live-row theorem
   proves `OppApex2InBlockerImage`.
2. **Second absent incidence:** that apex-centered support contains two members
   of `T_r`.

Neither is produced by the current hypotheses.  Stating only the combined
field is not a new theorem; it is the exact producer interface to be proved by
new convex/MEC/cap/critical-row coupling.

For the existing `f2` row the same cut specializes to

```text
f2Row.center = S.oppApex2 and
2 <= |T_r intersect f2Row.support|.
```

The current positive theorem supplies only
`2 <= |f2Row.support \ {q,t1,t2,t3}|`.  To use those witnesses one must still
prove both

```text
f2Row.center = S.oppApex2,
f2Row.support \ {q,t1,t2,t3} subset T_r.
```

The second inclusion contains two independent geometric facts: off-surplus
placement and co-radiality from `S.oppApex1`.

## Recommended next proof target

Do not add a generic image-cardinality lemma or run another marginal census.
The next theorem must visibly consume a full K-A-only field and establish one
of these equivalent load-bearing couplings:

- an apex-aligned critical support with two hits in `T_r` (the display above);
- direct membership of two live-row support points in `T_r` together with row
  center `S.oppApex2`; or
- a direct contradiction from the two-large-cap/common-critical-row packet,
  bypassing the apex pair.

The K4-window bank remains a valid alternate only after a geometric theorem
classifies a live four-point window into one of its ten dead classes.

## Epistemic ledger

- **PROVEN / previously kernel-checked:** the off-surplus marginal lower bound,
  joint-fiber upper bound, opposite-radius injectivity, cap cover/one-hit facts,
  and common-provenance support rigidity cited above.
- **PROVEN by finite cardinal arithmetic:** the card-12 two-marginal
  intersection bounds are insufficient.
- **PROVEN applicability boundary:** the M44-only long-shell/image squeeze is
  unavailable under `hNoM44`, and current cap/blocker/live partitions do not
  have cells that determine the other-apex radius.
- **NOT PRODUCED:** an apex-aligned two-hit support, a repeated other-apex
  radius, an image-card upper bound, or a closing finite partition.
- **NOT CLAIMED:** a model of all K-A-PAIR hypotheses or an independence theorem
  for their full Euclidean conjunction.
- **OPEN-PROOF:** derive the apex-aligned two-hit field, a banked live-window
  classification, or `False` directly from genuinely load-bearing K-A
  geometry.

## Validation note

No Lean or Lake command was run for this assessment because the shared compile
lane remained occupied.  This file adds no Lean declaration and makes no new
kernel-closure claim.
