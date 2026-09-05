# Math Skeptic Audit: planarity-audit-and-power-crossing

**Target**: `/tmp/planarity-audit-and-power-crossing.md` (258 lines).
**Target SHA-256**: `c3c237f648abc6eb1f0f6726f732c7ec03e4234e6ae8d5229cc41402a7ce11a2`.
**Date**: 2026-09-05.
**Historical verdict for the original target**: NEEDS WORK — missing replay artifacts and one omitted literature hypothesis; the local crossing and exposed-graph proofs pass.
**Claims audited**: 15 grouped mathematical claims, listed below.

**Disposition — superseded by the repaired note, 2026-09-05.** The
[maintained supporting note](erdos-97-power-crossing.md) replaces the unavailable
sixteen-point example with a complete, independently reconstructed rational
[certificate](../certificates/p97_power_crossing_control.json) and an
[exact verifier](../scripts/verify_p97_power_crossing.py). Independent hull,
distance-fiber, and construction checks pass. F2 and F3 are corrected there.
The findings below describe only the original external file at the recorded
hash; they are historical evidence, not outstanding repair assignments for the
maintained note. The original missing artifact has not been recovered or
retroactively verified.

This is a dated review of an external note, not a proof-status register or a list
of assigned proof obligations. The [atomic prose proof](erdos-97-descent-prose-proof-atomic.md)
remains authoritative for the project. No proof status is promoted by this audit.
The target was left unchanged.

## Summary

The circle-power crossing theorem is PROVEN by the supplied pen-and-paper
argument, including the zero-offset case and possible overlap of the two witness
pairs. An independent mathematical reviewer reached the same conclusion. The
conditional noncrossing/outerplanarity theorem also passes under its stated
distinct, convex-independent center and exposure hypotheses.

The regular 11-gon construction is independently reproducible from the text.
An exact calculation in the cyclotomic quotient checked all nine full two-point
fibers and their distinct centers. The sixteen-point construction cannot be
replayed from the supplied document: twelve coordinates, radii, and the named
JSON/verifier are unavailable in the locations searched. Its four displayed
centers do properly cross, as a separate exact rational calculation confirms.

The useful mathematical output is a constraint on strict containments at a
crossing. Applying it to the live branch still requires source-produced data
that turn those containments into a contradiction. No such implication is
established in the note, and the note explicitly acknowledges this boundary.

## Claim inventory

| # | Target location | Claim and supported classification | Audit result |
|---|---|---|---|
| 1 | §1, lines 21–25 | PROVEN, pen-and-paper: global four-witness incidence plus planarity gives an edge-count contradiction. | The graph is simple and bipartite, with 2n vertices and 4n edges. |
| 2 | §1, lines 27–33 | PROVEN, pen-and-paper: both physical rows exclude genus at most one; a four-row local packet alone has no such count contradiction. | Counts are 2n+1 vertices and 4n+4 edges globally, versus 16 edges locally. |
| 3 | §2, lines 37–67 | PROVEN, pen-and-paper: a regular 11-gon gives the stated subdivision of K₃,₃ using full two-point fibers. | Radial reflection establishes incidence; distinct midpoint indices give distinct row nodes. Exact finite replay also passed. |
| 4 | §2, lines 71–81 | PROVEN, pen-and-paper: the regular N-gon construction gives unbounded orientable genus for the weakened two-point setting. | The k² sums are distinct modulo N=k²+k+1; the subdivision of Kₖ,ₖ gives the claimed genus lower bound. No four-point extension is asserted. |
| 5 | §3, lines 85–107; §4 sign table | CONJECTURED in this audit: the reported sixteen-point full-fiber control and its power signs. | Reported exact finite evidence is unavailable; see F1. |
| 6 | §3, lines 90–105 | PROVEN by exact rational evaluation: the four displayed centers have properly crossing opposite segments. | The orientation signs are −,+,+,− for (0,2,1), (0,2,3), (1,3,0), (1,3,2). This does not verify the missing supports. |
| 7 | §4, lines 131–147 | PROVEN, pen-and-paper: the weighted power identity and its two restrictions. | The constant, linear, and quadratic coefficients agree; affine balance cancels the linear terms. |
| 8 | §4, lines 149–157 | PROVEN, pen-and-paper: crossing forces two distinct strict-containment witnesses. | Both nonzero signs and the zero case are complete; see the proof check below. |
| 9 | §4, lines 161–170 | PROVEN, pen-and-paper: the four oriented-area coefficients are positive and satisfy both balances. | Correct for counterclockwise order a,c,b,d and the usual signed determinant definition of orient. |
| 10 | §5, lines 188–195 | PROVEN, pen-and-paper: a strict exposed common point yields a strict two-site minimum along an interval of the radical axis. | Distinct centers make the equality locus a line; finiteness and continuity preserve the strict inequalities locally. |
| 11 | §5, line 197 | PROVEN, pen-and-paper: two weakly exposed common points yield a strict two-site minimum at their midpoint. | A third tied circle at both endpoints would put three centers on their common perpendicular bisector, forbidden by convex independence. |
| 12 | §5, lines 199–203 | PROVEN, pen-and-paper: the exposed center graph is noncrossing and outerplanar, with at most 2m−3 edges for m≥2. | Strict two-site minima at two crossing edges force opposite signs of the same constant. All vertices lie on the convex boundary. The single weak-witness warning is valid. |
| 13 | §6, lines 207–213 | PROVEN, pen-and-paper: the smaller concentric circle has no minimum-power cell when the larger circle is included. | Their power difference is the positive constant s²−r². Separate diagrams require a separate combination argument. |
| 14 | §6, line 215 | PROVEN, pen-and-paper: full-fiber omission gives nonzero power, without fixing its sign; selected-subset omission is weaker. | This follows directly from the meanings of full fiber and selected subset. |
| 15 | §8, lines 237–239 | PROVEN only with the cited theorems' hypotheses: power-diagram hidden sites and the distinction between lune and lens graphs. | CGAL supports the hidden-site statement. The lens no-avoiding-pair assertion needs a no-touching hypothesis; see F2. |

## Findings

### F1: The sixteen-point negative control is not independently replayable

- **Location**: `/tmp/planarity-audit-and-power-crossing.md:85`, also lines 99–107 and the sign table in §4.
- **Quote**: “`exact-crossing-witness.json` gives sixteen exact rational points in strictly convex position.”
- **Stated label**: exact geometric counterexample supported by a verifier.
- **Evidence present**: four center coordinates, proposed support sets and cyclic order, and a reported minimum determinant. The other twelve coordinates and radii are not printed.
- **Actual label**: CONJECTURED for this audit; exact finite verification is reported but has not been independently inspected or reproduced.
- **Verdict**: DOWNGRADE TO CONJECTURED until the evidence is supplied and checked.
- **Reason**: filename searches in `/tmp`, Downloads, and this repository found neither `exact-crossing-witness.json` nor `verify_regular11_incidence.py`. The scalar Lean candidate has no resolvable filename in the note. The regular-11 argument can be checked from its complete construction; the sixteen-point configuration cannot. This is an evidence gap, not a discovered counterexample to the construction.

### F2: The lens-graph citation omits the no-touching hypothesis

- **Location**: `/tmp/planarity-audit-and-power-crossing.md:239`.
- **Quote**: “Its stated lune-face theorem gives a bipartite planar center embedding; its lens graph instead forbids pairs of avoiding edges, not crossings in general.”
- **Stated label**: a cited general restriction on the lens graph.
- **Evidence present**: Pinchasi's cited paper, checked directly.
- **Actual label**: PROVEN, pen-and-paper, under the additional hypothesis that no two circles touch.
- **Verdict**: CLARIFY the required hypothesis; reject the unqualified formulation.
- **Reason**: the paper's abstract and introduction explicitly restrict the no-avoiding-pair statement to families without touching pairs, and explain that allowing touching can permit avoiding edges. Its lune theorem is a separate result. Add the qualification to preserve the citation's scope. This omission does not affect the self-contained power proof in §§4–5. [Cited paper, abstract and introduction](https://arxiv.org/html/2403.05270v1).

### F3: A banned proof connector obscures two explicit graph operations

- **Location**: `/tmp/planarity-audit-and-power-crossing.md:57`.
- **Quote**: “Equivalently, the incidence graph contains the one-subdivision of K_{3,3}, with 15 vertices and 18 edges.”
- **Stated label**: pen-and-paper deduction.
- **Evidence present**: the explicit nine distinct degree-two row nodes.
- **Actual label**: PROVEN, pen-and-paper.
- **Verdict**: CLARIFY; the conclusion is correct.
- **Reason**: project instructions prohibit this proof connector. State directly that the nine row nodes subdivide the nine edges, then that suppressing them produces K₃,₃. This is not a mathematical defect in the construction.

## Independent proof check

For the zero-offset case, two distinct points lying on all four circles would
put all four centers on the same perpendicular bisector. Proper crossing rules
that out. If one x-point is common to all four circles, the other x-point and
at least one y-point are not. At each of those points the weighted zero sum of
cross powers forces one strictly negative term. The two chosen points are
distinct, since a point in both witness pairs belongs to all four circles.

For the midpoint exposure argument, explicitly write
πₐ(m)=π_b(m)<0. Equality holds because the common chord lies on the radical
axis. Every other power is strictly greater there. At this witness the crossing
identity gives Δ<0 for an exposed ab edge; at an exposed cd witness it gives
Δ>0. Thus the contradiction uses power differences and remains valid although
the midpoint itself is inside the first two disks.

## Scope and source boundary

The note correctly distinguishes noncrossing of a prescribed drawing from
abstract planarity, two-point rows from full four-point rows, and a conditional
topological consumer from a geometric producer. Its suggested CEGAR use and
possible containment contradiction are HEURISTIC research applications, with
no proof weight assigned here.

The [dead-ends registry](dead-ends.md), §§3.7 and 6.2, supports the note's account
of previous limitations. Those entries leave metric information and other graph
constructions available for investigation. The cited [CGAL manual](https://doc.cgal.org/latest/Triangulation_2/index.html)
also supports its description of hidden weighted sites. Neither citation
provides the missing source exposure theorem.

## Lean and verification boundary

The source review was checked against working-tree files at HEAD
`2ce4991cce364ceb5544ba189d4527e5382fe16a`:

- [Rigid221Closure.lean](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Closure.lean), lines 1252–1268, still ends the named card ≥ 13 theorem with `sorry`. Its two selected rows share `S.oppApex2`, have distinct radii, and have disjoint supports.
- [CardGeThirteenOutcomeDispatcher.lean](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/CardGeThirteenOutcomeDispatcher.lean), lines 35–69, has four outcomes: `rowOverlap`, `uncovered`, `exactThirteenTight`, and `adjacentGrid`. The overlap hypothesis is merely non-disjointness of some pair; it gives neither two shared points nor a power sign. The grid arm carries its own grid rather than the three-center packet.
- [CardGeThirteenTerminalSplitV2.lean](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/CardGeThirteenTerminalSplitV2.lean), lines 43–73 and 175–195, retains source provenance and bounds pairwise intersections above by two. An upper bound of two does not supply two common points. The packet does not itself assert that its newly selected `z` differs from the prior frontier deletion; the note attributes that assertion to an earlier hand argument, which was not supplied for this audit.

These source facts support the note's narrow conclusion: neither double overlap
for two crossing center pairs nor exposure has been produced by the displayed
dispatcher. They do not establish that no later geometric argument can derive
such information from the full counterexample hypotheses.

No Lean file was changed, no candidate was compiled, and no root axiom audit was
run. The note already describes its scalar Lean candidate as uncompiled.
The hand proofs audited above have no Lean-formalized label in this report.

The following independent exact check was run with
`uv run --no-cache --no-sync python`. It represents powers of ζ modulo
1+ζ+⋯+ζ¹⁰ and compares all eleven distances at each of the nine selected centers:

```python
from itertools import product

def monomial(e):
    e %= 11
    return tuple(-1 if e == 10 else int(i == e) for i in range(10))

def d2(a, b):
    u, v = monomial(a-b), monomial(b-a)
    return tuple(2*int(i == 0)-u[i]-v[i] for i in range(10))

rows = []
for u, v in product(range(3), (3, 6, 9)):
    c = 6*(u+v) % 11
    assert c not in (u, v)
    assert [p for p in range(11) if d2(c, p) == d2(c, u)] == sorted((u, v))
    rows.append((c, u, v))
assert len({c for c, u, v in rows}) == 9
assert len({(u, v) for c, u, v in rows}) == 9
```

Result: all 99 comparisons passed; nine distinct full two-point rows supply
the explicit 15-vertex, 18-edge subdivision. This replay corroborates the
finite construction; the general k construction rests on the written argument.

## Required before CERTIFIED — superseded original target only

Supply the complete sixteen-point data and replay procedure; qualify the lens
citation by excluding touching pairs; replace the banned connector. Supplying
the scalar Lean candidate would make that auxiliary artifact inspectable, but
formalization is not required to certify the correctly labeled hand proofs.
Closing the live card ≥ 13 branch is a separate task and is not a certification
requirement for this limited note.
