# Rigid221 S0 C3 two-row relational probe v1

**Date:** 2026-08-31
**Lane:** rigid221-s0-c3-two-row-relational-probe-20260831
**Status:** implementation in progress; no PiQD verdict

## Purpose and claim boundary

This is a bounded QF_NRA positive control for the literal-blocker-v,
source-row-heavy B3 branch. It adds two complete named-role four-point radius
fibers to the prior first-midpoint control:

- the source row is centered at v and has named fiber {u, xu, au, bu};
- the opposite row is centered at cv and has named fiber {v, xv, av, bv}; and
- the five named physical roles are {u, xu, delta, v, xv}.

The formula has no source-to-formula coverage proof, no complete ambient
carrier, and no decoder. A SAT result can establish only that the authenticated
named-role formula has the recorded exact rational realization. It does not
establish an S0 realization, a source counterexample, a Lean consequence, or
the absence of a B3 proof from stronger source data.

The probe has two fixed sign cells, forward and reverse. They distinguish the
two orientations of the first source-row midpoint relation. They are bounded
coordinate cells, not a derived translation of cap-index order.

## Named roles and normalization

The modeled carrier has the ordered roles:

~~~text
O, m1, m2, u, xu, delta, v, xv, au, bu, cv, av, bv.
~~~

The formula fixes:

~~~text
O  = (0, 0)
m1 = (8/5, -4/5)
m2 = (8/5,  4/5)
MEC center = (1, 0), MEC squared radius = 1.
~~~

It represents the actual source-row blocker by using v itself as the center of
the Ku radius fiber. There is no separate cu point role. The distinct role cv
is the center of the second named row. All named roles are pairwise distinct;
this is a bounded-cell control assumption because the live source interface
permits legal center and support coincidences.

## Formula inventory

Every square in the emitted SMT-LIB is explicit multiplication, so the bytes
remain portable QF_NRA and contain no exponent operator.

| ID | Formula content | Classification |
|---|---|---|
| ROOT_STATIC | Fixed Moser coordinates and closed MEC disk for every named role | bounded normalization and source-mapped geometry |
| ROOT_STATIC | Positive O-radius fiber contains exactly u, xu, delta, v, xv among named roles | named-role abstraction of the physical five-class |
| ROOT_STATIC | Positive v-radius fiber contains exactly u, xu, au, bu among named roles | named-role abstraction of the source critical shell under blocker v |
| ROOT_STATIC | Positive cv-radius fiber contains exactly v, xv, av, bv among named roles | named-role abstraction of the opposite critical shell |
| ROOT_STATIC | dist(v,u)^2 = dist(v,xu)^2 | source-entitled first midpoint relation; also implied by the named Ku fiber |
| ASSUMPTION_CONTROL | Strict C3 signs for u, xu, v, with delta and xv on the other side | fixed coordinate cell using the actual oriented-arc polynomial |
| ASSUMPTION_CONTROL | Forward or reverse strict turn signs | bounded sign-cell selection |
| ASSUMPTION_CONTROL | Pairwise distinct named roles | all-distinct control; not source coverage |

The C3 predicate is formed directly from:

~~~text
orient(point, m1, m2) * orient(O, m1, m2).
~~~

It is strictly negative for u, xu, and v, and strictly positive for delta and
xv. The formula does not use a manually assigned cap half-plane.

## Source provenance ledger

The live B3 packet is ExactFourRigid221PhysicalApexSourceEqUContext in
Rigid221Placement.lean:705. It supplies physical-class data, the source
identification u = source, the exact five-class field, and the source-blocker
branch input. The following source facts motivate, but do not cover, the
finite formula.

| Source fact | Relevant source | Use in this probe | Boundary |
|---|---|---|---|
| Literal source blocker is v | B3 hypothesis in Rigid221Placement.lean:899 | center of named Ku fiber is v | source fiber can contain carrier points outside this probe |
| Source-row partner, C3 interior, equal v distance, and strict cap-index betweenness | Rigid221SourceRowCapBetweenness.lean:191 | motivates u,xu,v C3 signs and midpoint equality | cap indices are not decoded into these coordinate sign cells |
| Source and contextual-peer/deletion data | JointDeletion/Types.lean:42 and :75 | explains the two-row names and excluded fields | no other, deletion, q/w survival, or common-deletion packet is encoded |
| Full critical-shell radius-class semantics | U1CarrierInjection.lean:638 and :1116 | named-fiber template | formula checks listed roles only, not the full source carrier |
| Source cap dispatcher | Rigid221SourceRowCapBetweenness.lean:525 | records the remaining source frontier | formula has no second opposite-row or next-blocker metric relation |

## Explicit omissions

The following omissions prevent source, abstract, and theorem claims:

- the complete finite carrier, convex independence, ambient K4, and full
  SurplusCapPacket;
- full ExactFourMutualOmissionSourceContext, including other, source survival,
  and source-omission fields;
- both CommonDeletionTwoCenterPacket inputs and all robust-surface fields;
- source-permitted equality and overlap cells beyond the all-distinct control;
- Moser endpoint identifications, all cyclic orders, cap cardinality, endpoint
  erasure, and any full cap construction beyond the encoded arc polynomial;
- a second source-entitled cross-row metric, order, or incidence relation; and
- R1--R4, F1--F7, decoder, survivor, source realization, and promotion
  evidence from the P97 CEGAR semantic contract.

In particular, the source theorem
blockerV_sourceRowHeavy_otherEqV_or_secondCap_card_ge_six is not encoded as a
false disjunction, and the source refutes the tempting relation
dist(v, other) = dist(v, source). This probe does not replace either fact.

## Exact reference controls

Both sign cells use exact rational coordinates. Common coordinates are:

~~~text
v     = (17/10, 0)
delta = (3/2, -4/5)
xv    = (3/2, 4/5)
cv    = (1, 1/4)
av    = (3/10, 0)
bv    = (5/4, -9/20).
~~~

For forward:

~~~text
u  = (1071/650, -136/325)    xu = (1071/650, 136/325)
au = (1139/650, -136/325)    bu = (833/650, -17/325).
~~~

For reverse, exchange the signs of the second coordinates of u, xu, au, and
bu. Exact Fraction replay must verify squared radii:

~~~text
O fiber:  289/100
Ku fiber: 289/1625
Kv fiber: 221/400.
~~~

## Required evidence and artifacts

Before a PiQD result is retained, the lane must produce every durable path
declared in its checkpoint below
scratch/runs/rigid221-s0-c3-two-row-relational-probe-20260831/piqd-v1/.
That includes the run manifest, source-session and normalized SMT-LIB bytes,
emitter report, necessity ledger, and driver receipt for each sign cell.

The driver first runs exact replay and a local Z3 smoke control that inserts
False into each formula. PiQD then receives fresh, reviewed session bytes for
each cell. A positive PiQD reply is accepted only when the direct exact replay,
byte hashes, and response status agree. Any timeout, unknown, serialization
mismatch, or replay failure is inconclusive.
