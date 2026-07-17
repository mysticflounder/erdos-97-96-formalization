# Robust large-radius center-localization checkpoint

Date: 2026-07-16

Status: **kernel-checked location producer; direct `False` remains open**.

Owned lane:

- `scratch/atail-force/robust-large-radius-center-localization/`

No production source, shared closure document, proof-blueprint state, or
sibling scratch lane was changed.

## Input and target

This lane consumes the exact singleton-core residual already produced by
`RobustLargeRadiusGeometry.lean`:

```lean
packet : SharedCriticalPairAtLargeSecondApex D S radius
```

Thus `packet.source` and `packet.partner` are distinct members of the strict
interior of `S.capByIndex S.oppIndex2`.  They lie on one physical-apex radius,
and both lie on the exact critical shell centered at `packet.center`.  The
fresh center is a carrier point distinct from the physical apex.

## Bank and indexed-corpus preflight

Before adding the local proof, the lane checked the required registries:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

It also ran targeted `nthdegree docs search --lean` queries for:

- two cap centers equidistant from one outside pair;
- outside-pair uniqueness on an ordered cap; and
- strict cap-interior disjointness from the other indexed caps.

The exact reusable sink is already in production:

```lean
Problem97.CapSelectedRowCounting.outsidePair_unique_capCenter
```

The older theorem banks contain no stronger directly applicable producer or
contradiction for this two-point shared-shell packet.  In particular, the
three-point common-center uniqueness entries require a third common point and
do not apply here.

## Checked location theorem

The main result is:

```lean
theorem sharedCriticalPair_center_mem_capInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    (packet : SharedCriticalPairAtLargeSecondApex D S radius) :
    packet.center ∈ S.capInteriorByIndex S.oppIndex2
```

The proof has two stages.

1. The physical apex and the fresh center both bisect the distinct pair
   `packet.source, packet.partner`.  If the fresh center lay in either indexed
   cap containing the physical apex, both shared points would lie outside
   that cap, contradicting `outsidePair_unique_capCenter`.
2. The two other Moser vertices are excluded by the production left- and
   right-endpoint distance inequalities for two selected strict-interior
   points.  The ambient cap partition then places the fresh center in the
   strict interior of the pair's own cap.

No cardinality hypothesis, minimality field, or solver abstraction is needed
after the shared packet has been constructed.

## Exact shell-cap profile

The lane also packages the strongest immediate cap-counting consequence:

```lean
theorem sharedCriticalPair_shell_inter_cap_eq_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    (packet : SharedCriticalPairAtLargeSecondApex D S radius) :
    packet.shell.toCriticalFourShell.support ∩
        S.capByIndex S.oppIndex2 =
      {packet.source, packet.partner}
```

The two named points give the lower bound.  The newly proved center location
and
`CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two`
give the matching upper bound.  Consequently, the other two exact-shell
members lie outside the pair's cap.

## Kernel validation

Both the predecessor and this lane were freshly elaborated with Lean 4.27,
an explicit 16 GiB memory cap, and new oleans under:

```text
/private/tmp/p97-root-robust-large-radius-center-localization-verify/
```

The axiom reports are:

```text
sharedCriticalPair_center_mem_capInterior
  depends on axioms: [propext, Classical.choice, Quot.sound]

sharedCriticalPair_shell_inter_cap_eq_pair
  depends on axioms: [propext, Classical.choice, Quot.sound]
```

There is no `sorryAx`, `admit`, custom axiom, `native_decide`, or unsafe
declaration in the lane.

## Remaining consumer

This location result is not itself a contradiction.  The exact remaining
packet now has the following normal form:

- three distinct strict-interior cap points: the fresh center and the shared
  pair;
- one exact critical four-shell centered at the fresh point;
- exactly the shared pair from that shell lies in this cap;
- the shell's other two members lie outside the cap;
- deleting either shared point blocks K4 at the fresh center; and
- deleting either shared point preserves K4 at the physical apex.

The next legitimate consumer must use the two outside shell members together
with the paired deletion failures, the retained critical map, or a global
cap/order/minimality transition.  A contradiction based only on the local
fact that an interior center has two co-radial points in its cap would be
overstrong: the production cap-counting theorem permits exactly two.
