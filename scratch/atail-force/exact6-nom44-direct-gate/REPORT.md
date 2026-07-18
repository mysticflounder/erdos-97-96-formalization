# Exact-six mutual direct `noM44` gate audit

Date: 2026-07-18

Status: **KERNEL-CHECKED NECESSARY GATE; NEITHER BLOCKER ARM PRODUCES THE
ALTERNATIVE SUPPORT TRIANGLE.  THE DISPLAYED PACKET HAS THE WRONG
CARDINALITY, AND AN ALL-PHYSICAL RETRIANGULATION HAS THE WRONG ANGLE
POLARITY.  NO DIRECT `False` AND NO PRODUCTION `sorry` CLOSED.**

This lane owns only
`scratch/atail-force/exact6-nom44-direct-gate/`.  It does not edit production
Lean, plans, proof-blueprint state, git state, `SurplusM44`, `ShellCurvature`,
or protected card-five/555/654 work.

## Target and retained surface

The audited target is the direct exact-six mutual theorem

```lean
M : FullParentExactFiveMutualData L profile
hcap : S.oppCap2.card = 6
-- goal: False
```

The indices retain the complete `F₀/R/B/L`, the common
`CriticalShellSystem H`, both large opposite-cap bounds, `R.minimal`, and

```lean
R.noM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44.
```

The question was whether the equal- or distinct-blocker arm already forces a
concrete alternate MEC support triangle which can be fed to `R.noM44`.

## Required theorem-bank preflight

Before theorem work, the lane checked the registries required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered exact-six mutual
blockers, alternate non-obtuse MEC support triangles, same-carrier `IsM44`
production, and physical-radius triples.  The ready production endpoint is

```lean
isM44Packet_of_capTriple_two_exact_of_card_gt_nine
```

and its three oriented variants.  They require a concrete non-obtuse
circumscribed MEC triangle, its actual `CapTriple`, and two cap-cardinality
equalities to four.  No banked theorem derives these fields from either
mutual blocker arm.

## Kernel-checked results

`ExactSixNoM44DirectGate.lean` proves six source-clean theorems.

### 1. The displayed packet cannot consume `noM44`

```lean
currentPacket_not_isM44_of_secondCap_card_eq_six
```

proves `¬ S.IsM44` directly from `S.oppCap2.card = 6`.  It does not use
`R.noM44`.  Thus applying the quantified negative hypothesis to `S` itself
has the wrong polarity: the current packet is already visibly outside the
`(m,4,4)` regime.

### 2. An all-physical support triangle is impossible

```lean
not_nonobtuse_of_three_distinct_physicalVertices
supportTriangle_has_nonphysical_vertex
```

prove that three distinct points of the exact-five physical radius class
cannot form a non-obtuse triangle.  All three are co-radial from
`S.oppApex2`.  Non-obtuseness would put that apex in their convex hull, while
the apex is a fourth distinct carrier point; convex independence excludes
this.

Every `SurplusCapPacket T` carries a non-obtuse MEC support triangle.
Consequently at least one of

```text
T.triangle.v1, T.triangle.v2, T.triangle.v3
```

lies outside `physicalVertices profile`.  In particular, the tempting
triangle made from the mutual physical pair and a third physical source can
never be the alternative support triangle.  Exact five supplies the third
point, but supplies the negation of the angle condition needed by the packet
constructor.

Applied to `S`, this theorem does prove that the **current** support triangle
already has a nonphysical vertex.  That is not the missing producer: the
current triangle has the displayed `(>= 5, >= 6, 6)` cap bounds and is already
not `IsM44`.  What `M/L` fails to force is a different support-triangle
selection whose cap partition has two exact four-caps, or an identification
of the unused source or either blocker with an MEC-boundary vertex of such a
selection.

### 3. Any alternative `M44` packet is much larger than `(5,4,4)`

```lean
alternativeM44_surplus_card_ge_nine
```

uses

```text
S.surplusCap.card ≥ 5
S.oppCap1.card ≥ 6
S.oppCap2.card = 6
```

and the two cap-sum identities.  They imply `D.A.card ≥ 14`.  Therefore any
same-carrier `T.IsM44`, whose opposite caps both have cardinality four, must
satisfy

```lean
9 ≤ T.surplusCap.card.
```

The combined theorem

```lean
alternativeM44_exact_gate
```

records the exact normalized necessary condition:

```text
T ≠ S
T.surplusCap.card ≥ 9
at least one support-triangle vertex is outside the physical exact-five class.
```

This is not a new conditional producer interface.  It is a theorem about any
hypothetical witness of the existing terminal antecedent `T.IsM44`.

### 4. The immediately nonphysical retained roles are not enough

```lean
continuationUnused_not_mem_physicalVertices
```

proves that the origin-tagged unused continuation source lies outside the
physical exact-five class, using its complete negative radius filter.  This
meets only the weakest part of the gate.  Its retained row proves carrier and
physical-cap membership, but not membership on the MEC boundary, not a
non-obtuse support triple containing it, and not two exact four-cap counts.

The physical apex `S.oppApex2` is another retained nonphysical point and,
unlike the unused source, is already on the MEC boundary as one of the
current support vertices.  This leaves the natural mixed candidate

```text
S.oppApex2, M.pair.source, M.pair.target.
```

The parent proves that the last two points are distinct physical sources,
but does not put either on the MEC boundary, package the mixed triple as the
required non-obtuse circumscribed triangle, or give its two exact cap counts.
Thus even the best named nonphysical vertex does not complete the alternate
packet.

## Equal- and distinct-blocker verdict

The checked `FullParentMutualBlockerOutcome` split adds no support-triangle
data in either constructor.

### Equal blockers

The arm produces one actual critical fiber and locks two selected supports at
one common blocker.  It gives equidistance around a **critical-row center**,
not MEC-boundary membership of the source points and not a non-obtuse
circumscribed support triangle.  The two physical sources are specifically
ruled out as an all-physical non-obtuse completion.  Adding the unused source
would satisfy the nonphysical-role requirement, but no retained theorem puts
that mixed triple on the MEC boundary or proves the exact cap profile.

### Distinct blockers

The arm produces two source-faithful common-deletion packets and four
pairwise distinct deletion-surviving centers.  Those fields are K4 circle
data after one deletion.  They do not put either blocker on the carrier's MEC
boundary, select three support vertices, or construct a `CapTriple`.  Blocker
distinctness therefore has no path into
`isM44Packet_of_capTriple_two_exact_of_card_gt_nine`.

This is a source-interface audit, not a logical independence theorem.  A new
global geometry theorem could still construct the required packet.  What is
ruled out is the existing shortcut: neither constructor already contains, or
currently produces, the alternate support payload.

## Exact missing antecedent

For the `noM44` route to close internally, the direct proof must construct a
genuinely different non-obtuse circumscribed MEC support triangle and its
actual cap partition, with two caps exactly four.  The checked gate says this
construction must:

1. use at least one source outside the physical exact-five class;
2. produce a surplus cap of cardinality at least nine; and
3. establish MEC-boundary membership and cap exactness, not merely critical
   circle equalities or deletion survival.

Once those fields exist, the production `isM44Packet_of_capTriple_*`
constructor and `R.noM44` finish the branch.  Before them, another blocker,
row, or common-deletion packet is nonterminal.

## Validation and epistemic status

The scratch file was elaborated as a deliberate single-file check with
warnings as errors and a 16 GiB Lean memory cap.  It exited zero.  Every
printed theorem has axiom closure exactly

```text
propext, Classical.choice, Quot.sound.
```

The Lean source contains no `sorry`, `admit`, declared `axiom`, `unsafe`, or
`native_decide` escape hatch.

- **PROVED / KERNEL-CHECKED:** displayed packet is not `IsM44`; every
  alternative support triangle uses a nonphysical vertex; every hypothetical
  same-carrier `IsM44` surplus cap has cardinality at least nine; the unused
  continuation source is nonphysical.
- **SOURCE-GROUNDED NEGATIVE AUDIT:** neither current blocker-arm constructor
  produces MEC support-triangle or exact-cap fields.
- **OPEN:** construction of the mixed/nonphysical alternative support
  triangle, or a different direct nonlinear contradiction.
- **TERMINAL CLOSURE:** none.
- **PRODUCTION `sorry` CLOSED:** none.
