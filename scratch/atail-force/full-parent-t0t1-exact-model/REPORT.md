# Source-faithful full-parent local-cell audit

Date: 2026-07-18

Status: **EXACT RATIONAL 26-POINT LOCAL COUNTERMODEL.**  One identity cell
simultaneously realizes the three complete period-three reverse rows, the
source-faithful unequal/disjoint T0/T1 surface, the retained frontier pair,
the exact-five continuation's unused critical row, and two origin-tagged
common-deletion sources, while all three reverse outside pairs remain
non-co-radial from the retained first apex.

This is not a counterexample to Problem 97 or to the production parent
theorem.  It does not construct total K4, a total `CriticalShellSystem`, the
critical rows at every source (in particular the frontier sources), global
minimality, or `noM44`.  It decides one local identity cell, not coverage.

The lane owns only
`scratch/atail-force/full-parent-t0t1-exact-model/`.  It did not edit
production Lean, shared plans, proof-blueprint state, `ShellCurvature`,
`SurplusM44`, or git.

## Theorem-bank preflight

Before the search, the required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries found the current production
packets (`FirstApexShellRolePacket`,
`LargeCapUniqueFiveUnusedCriticalRow`, and
`LargeCapUniqueFiveTwoCommonDeletionSources`) but no banked theorem deciding
their aggregate Euclidean surface.

## Exact role map

The distinguished support triangle is

```text
S.oppApex2  = o       (physical exact-five apex)
S.oppApex1  = right   (retained first apex)
surplusApex = left.
```

The exact physical shell and complete reverse rows are

```text
o  : {left,q0,q1,q2,right}
c0 : {q0,q1,x00,x01}
c1 : {q1,q2,x10,x11}
c2 : {q2,q0,x20,x21}.
```

The intended critical-map directions on this partial source set are

```text
q0 -> c2,
q1 -> c0,
q2 -> c1.
```

Every displayed reverse row is an exact four-point named radius class, and
deleting its origin-tagged source leaves no named radius class of cardinality
four at that blocker.  Each reverse outside pair has unequal squared distance
from `right`.

The source-faithful first-apex rows are

```text
T0 = {t0i0,t0i1,t0o,t0s}
T1 = {t1i0,t1i1,t1o,t1s}
frontier pair = {t0i0,t0i1}.
```

Both radii are positive and unequal, the supports are disjoint, and each row
has the honest cap profile `2I + O + S`: two strict first-opposite-cap points,
one physical-opposite-cap point, and one surplus-cap point.  Thus T1 survives
deleting both frontier sources.  The physical exact-five shell at `o` also
survives either frontier deletion.  The two frontier points are co-radial at
`right` but have unequal squared distances from `o`, as required by the
retained `CriticalPairFrontier` surface.

The exact-five continuation is mapped as

```text
unused source       = c1
actual blocker      = left
unused critical row = {c1,uI,uS0,uS1}
continuation.first  = q0
continuation.second = q1.
```

Here `c1` is in the closed physical opposite cap but outside the physical
exact-five radius class.  The actual blocker `left` is a point of the set and
is distinct from `o`.  Its displayed exact row contains `c1`; deleting `c1`
leaves no named K4 radius at `left`.  The row contains zero strict physical
exact-five members and omits both `q0` and `q1`.  Therefore deleting either
continuation source preserves a four-point row at `left`, while deleting it
from the physical exact-five shell leaves four points at `o`.  This is the
local metric content of the two common-deletion packets with the same center
pair `(left,o)`.

The exact common boundary word is

```text
uS0,uS1,t0s,t1s,
o,uI,t1i1,t0i1,t0i0,t1i0,x20,x01,x00,x21,
left,q0,t1o,t0o,c0,c2,q1,c1,q2,
right,x11,x10.
```

It gives closed cap sizes

```text
opposite right : 11
opposite o     : 10
opposite left  : 8.
```

Hence the designated surplus cap has at least five points and both opposite
caps have at least six.

## Exact verification

`verify_exact_source_faithful_full_cell.py` rationalizes every angle by a
tangent-half-angle parameter with denominator at most 10,000, constructs all
coordinates using `fractions.Fraction`, and checks independently:

- pairwise distinctness and the displayed strict convex order;
- nonobtuse support triangle and containment in its circumdisk/MEC;
- the three exact cap-role domains and cap cardinalities;
- the exact physical five-point filter and uniqueness of its named K4 radius;
- all three exact reverse rows and their named deletion-criticality audits;
- positive unequal T0/T1 radii, exact four-point filters, and disjointness;
- unequal second-apex radii for the retained frontier pair;
- the exact unused-source critical row, its zero-hit polarity, and both
  continuation omissions; and
- nonreturn of every reverse outside pair at `right`.

The stable coordinate digest is

```text
ed4d4520d0b0a00e775ba05fe71cfacc1f2ccf2c4fc1dab65ec42d7294e59d8a
```

The independent replay command is

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run --no-project \
  scratch/atail-force/full-parent-t0t1-exact-model/\
  verify_exact_source_faithful_full_cell.py \
  --certificate scratch/atail-force/full-parent-t0t1-exact-model/\
  exact-source-faithful-full-cell.json
```

`ExactSourceFaithfulFullCell.lean` checks the same rational-coordinate Boolean
ledger.  Direct elaboration succeeds.  The aggregate ledger uses
`native_decide`, so its axiom report is compiler-reduced:

```text
propext,
Classical.choice,
Lean.ofReduceBool,
Lean.trustCompiler,
Quot.sound.
```

It is source-`sorry`-free but is not a trust-free kernel certificate.  The two
new frontier gates are separately proved with `norm_num`:

```text
exact_firstApex_radii_pos
exact_frontierPair_secondApex_sqdist_ne
```

Their axiom reports contain only `propext`, `Classical.choice`, and
`Quot.sound`; neither reaches `sorryAx`, `Lean.ofReduceBool`, or
`Lean.trustCompiler`.

The Lean check command used was

```bash
cd lean
lake env lean \
  ../scratch/atail-force/full-parent-t0t1-exact-model/\
  ExactSourceFaithfulFullCell.lean
```

## Decision for the closure route

The following local implication is exactly refuted in this identity cell:

```text
strict convex common order + support-triangle MEC/caps
+ physical exact five + three complete all-reverse rows
+ source-faithful T0/T1 + retained frontier metric split
+ one actual unused-source critical row
+ two common-deletion sources with their physical deletion rows
  -> a first-apex co-radial reverse outside pair or False.
```

Therefore another theorem using only these displayed local rows, cap order,
MEC, or continuation omissions cannot close the all-reverse branch.  A viable
aggregate producer must visibly use at least one omitted global ingredient:

1. the total common `CriticalShellSystem`, including the actual rows at the
   frontier and other currently unrepresented sources;
2. global K4 across every point and every relevant deletion;
3. deletion minimality/strong connectivity; or
4. `noM44` or another genuinely global full-filter constraint.

The model does not show which of those ingredients is sufficient.  It only
prevents the lane from mistaking the now-complete local row surface for a
contradiction.

## Artifact map

- `homotopy_complete_rows.py` and `homotopy-progress-1p4.json`: logged acute
  continuation of the complete reverse-row model to apex angle 1.4.
- `search_source_faithful_full_cell.py`: staged 24-core witness search for
  T0/T1, the unused row, and the joint cell.
- `t0t1-search.json`, `unused-row-c1-search.json`, and
  `full-source-faithful-search.json`: numerical discovery checkpoints.
- `verify_exact_source_faithful_full_cell.py` and
  `exact-source-faithful-full-cell.json`: independent exact rational replay.
- `ExactSourceFaithfulFullCell.lean`: source-`sorry`-free Lean ledger and the
  two trust-free kernel-checked frontier gates.

The older `search_extension.py` studies only the unequal `2I+2O` cell and is
not a source-faithful cap-role model; its no-hit result is not used.  The old
`unused-row-search.json` records the failed `unused=c0, blocker=left` bounded
search and is likewise not an infeasibility certificate.
