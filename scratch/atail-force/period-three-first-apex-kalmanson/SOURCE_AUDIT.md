# Source audit: quantified period-three T0/T1 + reverse-row decision

Date: 2026-07-17

Audited solver snapshot:

```text
7ae728ba226941bdfdb813e8156f73e84c2652969e531ac380c4050ed04977b0  decide_quotient.py
```

Status: **NOT A SOURCE-COVERAGE DECISION. THE FIXED-CELL LINEAR SYSTEM IS A
SOUND DIAGNOSTIC, BUT THE QUOTIENT OMITS LIVE ROLE, IDENTITY, AND PERIOD
BRANCHES. `EXACT_SAT_STOP` IS ONLY A SAT WITNESS FOR THE PROJECTED NAMED-ROW
KALMANSON RELAXATION; `COMPLETE_UNSAT` WOULD NOT CURRENTLY BE A VALID COVERAGE
CLAIM.**

This audit checked the theorem-bank registries required by `AGENTS.md` and
focused indexed Lean searches before comparing the formula with current
source. No bank supplies the missing quotient/coverage theorem.

## Executive verdict

The solver correctly fixes several bugs in the predecessor:

- it enumerates permutations inside the three cap blocks instead of using one
  inherited 16-letter boundary word;
- it imposes the full strict metric and strict Kalmanson system for each
  generated order;
- it keeps T0/T1 as selected rows rather than falsely making them critical;
- it uses exact reverse rows, pair cardinality two, and pair injectivity; and
- it projects away irrelevant auxiliary CSS blocker-map choices instead of
  declaring one pinned global map representative.

However, the live source is not the six cells produced by `cell`. The solver
still fixes one representative T0/T1 role and identity pattern for each of
`II/IO/OI`, on one 16-point universe. Those choices are not symmetries after
the exact-five roles, reverse rows, and boundary order are named.

Therefore:

- a returned **SAT** cell proves only compatibility of this reduced abstract
  distance system. It is not a Euclidean realization, a CSS extension, or a
  countermodel to the source theorem;
- a returned **UNSAT** cell is a valid contradiction for that fixed encoded
  cell; but
- exhausting the current loops would not exhaust the live period-three
  branch, so `COMPLETE_UNSAT` at lines 216-217 is presently overclaimed.

## Exact source mapping

| Encoded field | Exact source | Audit |
| --- | --- | --- |
| `first_apex = 0`, `second_apex = 1`, three contiguous cap blocks | The common `SurplusCapPacket S`; `oppApex1`, `oppApex2`, and the cap partition | **Supported as fresh label normalization**, provided no extra cross-surface identities are inferred from the numbers. |
| T0 contains distinct `q,w`, is centered at `oppApex1`, and has radius `r` | `CriticalPairFrontier.pair`; retained first-radius selected subrow in `FirstApexShellRolePacket` | **Sourceable, but the scratch packet extractor is not yet Lean-elaborated.** |
| T1 has four points, avoids `q,w`, is centered at `oppApex1`, and has radius `rho` | `R.common.firstApexDouble`, `OrientedPhysicalApexIngress.lean:239-247`; selected subrow extraction | **Supported.** |
| `rho = r` or `rho != r` | Exact radius split in `FirstApexShellRolePacket` | **Supported.** |
| `q,w` are off surplus and have roles `II`, `IO`, or `OI` | Frontier marginal/off-surplus facts plus the first-apex cap cover and adjacent one-hit theorem | **Supported as three outer cases. The points completing T0/T1 are not fixed by this split.** |
| `dist(second_apex,q) != dist(second_apex,w)` | `U2NonSurplusOneHit.oppCap2_escape_gen`, using distinct off-surplus `q,w` with the same first-apex radius | **Supported.** |
| exact five-point class at the physical second apex | `LargeCapUniqueFiveSecondApexRadius.class_card_eq_five`, `LargeCapUniqueFive.lean:30-36` | **Supported, but its five role identities are not fixed as in line 26.** |
| at least three physical strict-cap members | `three_le_capInterior_hits_of_largeCapUniqueFive`, `LargeCapUniqueFive.lean:59-103` | **Supported. It does not force exactly three.** |
| period-three cycle sources and all-reverse membership | `PhysicalActualCriticalOmissionCycle`, plus an explicit hypothesis `K.period = 3` and the all-reverse branch | **Supported only on the period-three subbranch.** All reverse alone gives periods 3, 4, or 5 (`ReverseMembershipClosure.lean:93-129`; `LargeCapUniqueFivePhysicalOmissionCycle.lean:385-398`). |
| each reverse center is strict physical-cap interior | `successor_actualBlocker_mem_physicalCapInterior`, `ReverseMembershipClosure.lean:133-180` | **Supported.** |
| reverse support consists of the adjacent cycle-source pair plus exactly two outside-cap points | `successor_actualCriticalSupport_inter_physicalCap_eq_pair` and `successor_actualCriticalSupport_outside_physicalCap_card_eq_two`, `ReverseMembershipClosure.lean:182-251` | **Supported.** |
| the three reverse centers are distinct | `reverseRowCenter_injective`, `ReverseOutsidePairProducer.lean:115-198` | **Supported.** This does not prove they are distinct from the third cycle source or every other named role. |
| the three reverse outside pairs are distinct | `reverseOutsidePair_injective`, `ReverseOutsidePairProducer.lean` | **Supported.** Pairwise intersection at most one follows automatically for distinct two-point sets. |
| strict triangle inequalities | `D.convex : ConvexIndep D.A`, hence distinct named vertices are noncollinear | **Supported for genuinely distinct role points.** Any identity quotient must merge variables before adding these inequalities. |
| both strict Kalmanson inequalities for every cyclic quadruple | `dist_add_dist_lt_diagonal_sum_of_ccw` and `complementary_dist_add_dist_lt_diagonal_sum_of_ccw`, `CapCrossingKalmanson.lean:240-302` | **Supported once one shared cyclic order and four distinct points are supplied.** |
| all other CSS values projected away | Formula lines 131-132 | **Safe relaxation for an UNSAT proof.** A SAT result does not prove that the named metric extends to the total CSS or `D.Minimal`. |

The normalized slack `>= 1` used for positive distances, strict triangles,
strict Kalmanson inequalities, and disequalities is sound for each finite
homogeneous fixed cell: a genuine strict solution can be scaled by the
smallest positive slack. This is not a source issue.

## Coverage failures

### 1. Same-radius roles: 3 cells are not the 31 assignments

`enumerate_same_radius_roles.py` checks 31 labelled assignments for the six
named points

```text
{q,w} union T1.support.
```

The solver's equal-radius cells at lines 65-73 use only one assignment per
frontier role:

- `II`: T1 has role vector `(2 strict, 1 surplus, 1 physical)`;
- `IO` and `OI`: T1 has `(3 strict, 1 surplus, 0 physical)`.

It misses the other legal vectors and every labelled placement of those roles
on the four T1 points. Those permutations are not automatically symmetric:
the same numeric points are also distinguished by the physical exact-five
class, reverse-pair eligibility, and boundary position.

Required repair: generate all 31 labelled named-six role assignments, then
quotient only by a permutation proved to preserve every other named field.

### 2. Equal-radius T0/T1 overlap is fixed to its maximum

In every equal-radius cell, lines 65-72 make the two T0 completion points be
two T1 points. Thus `|T0 support inter T1 support| = 2`.

Source only proves that T1 avoids `q,w`. The T0 completion pair may meet T1 in
zero, one, or two points. Moreover, the ambient first-apex radius class may
have more than the named six points, so a T0 completion can be a fresh
same-radius point outside `{q,w} union T1.support`.

Required repair: enumerate overlap cardinalities 0, 1, and 2, including fresh
completion roles. Do not declare the ambient class exact six.

### 3. Unequal-radius completion roles are represented by one extremal cell

Lines 61-64 fix:

```text
T0 = two strict + one surplus + one physical,
T1 = two strict + one surplus + one physical.
```

The source permits more strict points. For example:

- with `q,w` both strict, the T0 completion pair can be `II`, `IS`, `IO`, or
  `SO`, with labelled variants;
- with exactly one frontier point physical, T0's completions can be `II` or
  `IS`, with labelled variants; and
- independently, T1 can have role counts `4I`, `3I+S`, `3I+O`, or
  `2I+S+O`, again with labelled variants.

The only uniform unequal-arm facts are disjoint T0/T1 supports, their exact
row cardinalities/equalities, and the adjacent-cap one-hit bounds.

Required repair: enumerate all legal completion-role assignments for both
rows, not only the minimum-strict representative.

### 4. Numeric labels silently choose unsupported F0/exact-five identities

The original frontier `F0` and the exact-five cycle frontier are independent;
`PhysicalOmissionCycleParentResidual.lean` gives no equality between their
pairs, radii, or selected rows.

Nevertheless, `cell` fixes cross-surface identities. Examples include:

- in `II`, frontier point `w = 8` is a non-cycle member of the physical
  exact-five class;
- in `IO/OI`, one frontier point is cycle source `12`; and
- multiple T0/T1 completion points are fixed as physical-class points,
  cycle sources, or eligible reverse targets.

These are possible identity patterns, not consequences or canonical
representatives. The fully disjoint pattern and all partial identifications
are absent.

Required repair: enumerate the equality partition of F0/T0/T1 roles against
the exact-five sources, non-cycle exact-five points, reverse centers, and
outside-target roles, rejecting only identities contradicted by source
membership or distinctness.

### 5. The physical exact-five profile is fixed to `3 strict + 1 + 1`

Line 26 uses cycle sources `11,12,13` as the three strict physical points and
places the two other exact-five points at `5,8`, one in each adjacent cap.

Production proves **at least** three strict physical hits. The remaining two
points may instead give the legal profiles:

```text
3 strict + one hit in each adjacent cap,
4 strict + one adjacent hit,
5 strict.
```

When the cycle has period three, additional strict physical points need not
belong to the chosen cycle. They can also interact with reverse centers and
T0/T1 roles. These branches are absent.

### 6. Six distinct physical source/blocker labels are not fully justified

Lines 27-28 make the three cycle sources and three reverse centers six
different points. Source proves the centers pairwise distinct and proves each
row center differs from the two source endpoints in its own row. It does not,
from the audited declarations alone, rule out a reverse center being the
third cycle source or an additional physical exact-five point.

Required repair: either cite a theorem proving the full six-point
distinctness, or include the legal cross-identification branches.

### 7. Reverse outside points are forced into six pre-existing labels

Line 29 computes

```text
eligible_outside = (1,3,6,7,9,10).
```

It is sound to exclude the physical cap and the two other physical-radius
points: a reverse row already shares its two adjacent cycle sources with the
physical-apex circle, so a third common point is impossible. It is not sound
as coverage to assume every outside target is one of six already named
vertices. `D.A` may be larger than 16, and a reverse outside target may be a
fresh surplus/first-cap point.

Required repair: introduce outside-target roles first, then enumerate their
identifications with existing eligible roles. Reuse the 53 pair-partition
quotient from `cycle-three-rows-kalmanson` for cross-row target sharing.

### 8. One 16-point universe is a projection, not the live carrier

The live wrapper gives lower bounds, not `D.A.card = 16`. Restricting strict
Kalmanson equations to a named subset is safe, but exact support exclusions
at lines 147-153 and the finite outside-target domain are coverage claims
about the whole represented role universe. Extra carrier points are harmless
for an UNSAT projection only after all required row targets have been named;
they cannot be used to avoid introducing fresh completion/outside roles.

### 9. Shared boundary order and reflection

`compatible_orders` now permutes every private block for the fixed labels and
checks the three `between` constraints. This is materially better than the
old fixed word.

Two qualifications remain:

1. Current Lean scratch provides `ReverseRowCyclicRoles` separately for each
   row. `cycle-three-rows-pruning-adapter/REPORT.md` records that no current
   theorem assembles those cuts into one `AnchoredPeriodThreeReverseBoundaryOrder`.
   The solver is therefore conditional on this mathematically natural but
   unbuilt common-order adapter.
2. Lines 42-44 explicitly say reflection is quotiented only for finding SAT,
   not asserted as source coverage. That is adequate for a SAT stop. It is
   incompatible with the unconditional `COMPLETE_UNSAT` print at lines
   216-217. For UNSAT coverage, either enumerate both orientations or prove
   that reversing the boundary preserves the complete labelled constraint
   set. The earlier chiral-row audit deliberately did not use a reflection
   quotient.

### 10. Periods four and five remain live

The decision is explicitly period three. That is a valid scoped branch, but
it cannot be reported as closure of all reverse membership: production only
proves `3 <= K.period <= 5`. Period-four and period-five decisions or separate
consumers remain required.

## Blocker-map assessment

The predecessor's fixed total map was unsupported. The new solver correctly
removes it: only the three actual reverse centers participating in named row
equalities remain.

This has asymmetric evidentiary consequences:

- **UNSAT of a correctly covered projected system would be strong enough.**
  Removing CSS/minimality constraints enlarges the model set.
- **SAT is not a source countermodel.** It may fail to extend to the total
  `CriticalShellSystem`, source-by-source deletion failure, `D.Minimal`, MEC,
  or a planar Euclidean realization.

Accordingly the solver's line-214 wording should be read narrowly: one SAT
cell refutes forcing by the encoded named-row linear Kalmanson equations, not
forcing by the full live parent.

## Acceptance checklist for a coverage-grade revision

- [ ] Explicit `hperiod : K.period = 3`; no claim about periods four/five.
- [ ] All 31 labelled same-radius named-six role assignments.
- [ ] Equal-radius T0/T1 overlap sizes 0, 1, 2, including fresh T0 completion
      points and ambient class cardinality greater than six.
- [ ] All legal unequal-radius T0 and T1 completion-role assignments.
- [ ] All legal physical exact-five role profiles: 3, 4, or 5 strict hits.
- [ ] Equality-partition quotient between F0/T0/T1 roles and the independent
      exact-five source, non-cycle, blocker, and outside roles.
- [ ] Fresh reverse outside-target roles and all legal cross-row sharing
      partitions; no fixed six-point target domain.
- [ ] Proof or enumeration for reverse-center/cycle-source cross-identities.
- [ ] One common boundary-order adapter, or an explicit hypothesis recording
      it.
- [ ] Both reflections, or a proved reflection invariance of the complete
      labelled formula.
- [ ] Exact rational replay of every UNSAT certificate or SAT ledger.
- [ ] Result labels distinguish fixed-cell UNSAT, quotient coverage UNSAT,
      projected SAT, Euclidean SAT, and source-theorem consequences.

## Final decision on the current solver

`decide_quotient.py` is useful as a **SAT-first discovery probe**. It is not a
quantified source decision and must not be used to promote either the
occurrence theorem or its negation.

The earliest decisive repair is not more CSS encoding. It is the role and
identity quotient: enumerate the actual T0/T1 cases and their identifications
with the independent period-three exact-five surface. Only after that quotient
is complete does enumerating shared boundary orders answer the intended
linear Kalmanson question.
