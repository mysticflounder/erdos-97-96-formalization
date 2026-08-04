# Exact-five short-cap terminal audit

Date: 2026-07-20

Status: **OPEN PRODUCER; EXISTING TERMINAL CONFIRMED; NO RETRIANGULATION
CONSTRUCTOR FOUND.**

## Live input and exact consumer

The live exact-five branch is

```lean
Problem97.ATailFrontierLiveClosure
  .false_of_frontierBiApexRobustExactFiveSecondCapProfile
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R)
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
```

The production profile theorem is source-clean and uses no cap-six premise:

```lean
nonempty_largeCapUniqueFiveSecondApexRadius_of_exactFiveSecondCap Q
```

The checked terminal is

```lean
ATailLargeCapUniqueFiveShortCapTerminal
  .false_of_shortCap_at_largeCapUniqueFiveApex profile T i hapex hcap
```

It requires a second `T : SurplusCapPacket D.A` with both of the following
geometric facts:

```lean
T.oppositeVertexByIndex i = S.oppApex2
(T.capByIndex i).card = 4
```

It then identifies the resulting exact-four radius at that physical apex with
the profile's unique K4 radius, contradicting the profile's exact cardinality
five.  Thus this is an immediate, source-clean consumer if and only if an
alternative packet is actually produced.

## Why the generic packet constructor does not supply it

The only generic construction located in the production source is

```lean
MEC.nonempty_surplusCapPacket_of_K4
```

from global `K4`, convexity, and `9 < D.A.card`.  It proves only existence of
some nonobtuse circumscribed Moser packet with some surplus cap.  Its result
does not identify any of its three triangle vertices with `S.oppApex2`, and
does not constrain a selected cap to have cardinality four.  Reindexing that
arbitrary packet cannot create either missing fact.

Conversely, the current exact-five profile describes a complete radius class
at the already selected physical apex.  It contains no new MEC-boundary
vertex, circumscribed-triangle witness, or cap partition.  Hence the profile
does not provide the fields required to construct `T`.

Targeted indexed-corpus search for an alternative Moser packet, short cap,
physical apex, and retriangulation found the existing short-cap terminal and
generic `SurplusCapPacket` infrastructure, but no source-reachable theorem
with these two controlled output fields.

## Adjacent scratch work

The promoted shell-curvature interface is not an alternate-packet producer.
Its exact-five continuation starts from an *unused* second-cap point, whose
construction requires `6 <= S.oppCap2.card`; that premise is false on this
exact-five-cap branch.  Its remaining chart and cap/block consumers are also
open.  It must not be imported or cited as a closure of this branch.

## Consequence for the live proof

The alternate-packet route remains a valid possible terminal, but it is not a
mechanical adapter and must not be represented by a conditional Lean
placeholder.  Any proof must establish new MEC/cyclic-cap geometry that
constructs the full `T` packet, including its nonobtuse circumscribed triangle
and cap partition, before calling the terminal.

Until that geometry is found, the honest active alternatives are:

1. a direct contradiction consuming `F`, `R`, `B`, `Q`, and `profile`; or
2. the aggregate full-parent route that chooses a favorable critical system
   late and returns a checked terminal core or `False` while retaining the
   complete cap/MEC/minimality context.

No source `sorry` is closed by this audit.
