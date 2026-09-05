# Strict Kalmanson Wave 5 — first hybrid `n=12` CEGAR checkpoint

**Date:** 2026-09-04  
**Project:** Erdős 97–96 formalization  
**Scope:** selected-four-row systems on a fixed cyclic `n=12` carrier, exact quotient Kalmanson analysis, and source-neutral planar obstruction mining.  
**Status:** substantial exact progress, but **not an exhaustive `n=12` closure**.

## 1. Executive result

The first `n=12` hybrid wave confirms the phase transition seen at `n=11`.

A local monotone bank containing every complete Berge/Kalmanson obstruction and every single-Kalmanson collapse supported on at most five labels does not close `n=12`. Adding the full injective orbit of the already formalized three-equilateral-zigzag planar theorem still leaves structural row systems.

I then ran an exact CEGAR loop:

1. produce a structural row assignment avoiding the current monotone bank;
2. replay all installed clauses exactly;
3. quotient the 66 unordered distance edges by the selected-row equalities;
4. apply the exact Gordan alternative to all 990 strict Kalmanson comparisons;
5. if infeasible, retain a positive integer cancellation and its selected-membership core;
6. if feasible, retain an exact rational strict-Kalmanson metric;
7. on strict-Kalmanson survivors, search for exact planar equal-radius-circle consequences.

Across **48 distinct support systems**, independent exact replay found:

- **40** exact strict-Kalmanson contradictions;
- **8** exact strict-Kalmanson metric survivors;
- all **8** metric survivors eliminated by exact planar geometry:
  - 1 by the formalized three-equilateral-zigzag theorem;
  - 6 by affine equal-radius-circle combinations forcing two carrier points to coincide;
  - 1 by an affine combination forcing a midpoint relation incompatible with a positive selected radius.

This is strong evidence for a productive combined certificate language:

```text
strict Kalmanson cancellation
OR
planar equal-radius-circle affine contradiction.
```

It is not yet a proof that every `n=12` row system has one of those certificates. The current final clause bank still has a structural SAT assignment; exact quotient analysis rejects that assignment by a 27-comparison cancellation whose minimized positive core has width 35. Candidate generation was heuristic, not an exhaustive master over all 170 reflection-normalized row-zero cells.

## 2. Exact local bank

The first bank is generated deterministically from two source-neutral families.

### Complete three-row Berge family

For every cyclic six-subset, all 40 impossible fixed-order three-row Berge templates are installed. At `n=12` this gives

\[
40\binom{12}{6}=36{,}960
\]

clauses.

### Single-Kalmanson collapses on at most five labels

The authenticated Wave-4 pattern catalog contains 142 local records with support size at most five. Lifting each pattern to every injective label subset and deduplicating against the Berge family gives the base bank:

```text
clauses: 145,860
SHA-256: bbd9707afc4e0d6ae91ee58b9f1a660a99505378902986a60cf77b0e43cb22b0
```

Every clause is a monotone positive selected-membership no-good. No triangle inequality, floating-point solver verdict, or planar assumption enters this bank.

## 3. Exact extension barrier from the `n=11` survivor

The `n=11` phase-transition support system is not trivially extensible.

Let its eleven rows be kept fixed and add a twelfth center. Exact finite checks show:

1. **No unmodified extension:** none of the 330 possible rows at center 11 avoids the lifted `n=12` local bank.
2. **No one-row repair:** changing one old row and choosing row 11 gives no solution over all
   \(11\cdot330^2\) choices.
3. **First two-row repair before planar clauses:** changing old centers `0` and `9`, together with a new row at `11`, gives

```text
0  -> {1,2,6,11}
1  -> {0,2,3,10}
2  -> {0,1,4,6}
3  -> {1,5,7,9}
4  -> {2,5,6,10}
5  -> {3,4,7,10}
6  -> {0,2,4,8}
7  -> {3,5,8,9}
8  -> {6,7,9,10}
9  -> {3,7,8,11}
10 -> {1,4,5,8}
11 -> {0,3,6,9}
```

4. This repaired system is an exact strict-Kalmanson metric survivor, but it contains the source-neutral three-equilateral-zigzag obstruction.
5. After adding the complete injective zigzag orbit, **no two-old-row repair remains**, across all 55 pairs of old centers and all associated row choices.

This establishes a real structural barrier: passing from `n=11` to `n=12` is not achieved by a local one-row extension, and the nearest two-row repairs are already planar-obstructed.

## 4. Full three-equilateral-zigzag orbit

The formalized planar theorem consumes ten selected memberships on five distinct roles:

```text
A : {B,C,E}
B : {A,C}
C : {A,D,E}
D : {C,E}
```

Together with planar convex independence, these equalities force a forbidden collinearity. The complete injective orbit at `n=12` contains

\[
12\cdot11\cdot10\cdot9\cdot8=95{,}040
\]

clauses. Combining it with the local bank gives:

```text
clauses: 240,900
SHA-256: 35c5ff752d1157981cc3919163d251c1a73cb4df61747fd41b44ce29fb670eab
```

The first repaired `n=11` extension contains eight occurrences of this pattern.

## 5. Exact quotient-Kalmanson replay

For each structural candidate, selected-row membership identifies the incident distance edges at each center. Closing those identifications partitions the 66 unordered edges into quotient components.

Every strict Kalmanson comparison is then an integer vector in that quotient. Exact analysis returns one of two outcomes:

- a positive rational component assignment making all 990 comparisons strict; or
- a nonzero positive integer combination of comparisons summing to zero in the quotient.

The replay ledger contains 48 distinct support digests:

```text
exact contradictions:        40
strict-Kalmanson survivors:   8
minimum survivor slack:       1
replay status:                PASS
payload SHA-256:
029a8f22f989b825d0cadbeb287d62c793c05f15a41fd564bbf61cc8d3af470d
```

The contradiction certificates range from one collapsed comparison to 31 comparisons. Eight candidates have a one-comparison collapse that escaped the original five-label bank because the equality path uses a larger ambient support.

The final learned bank contains 1,272 additional exact no-goods beyond the base-plus-zigzag bank:

```text
final clauses: 242,172
SHA-256: e3053ed3c632443263cfe4ca5dc8ab401612226d5a20f510db0b55ad7279a5d7
```

The 1,272 clauses are the exact union recorded in `n12-final-bank-delta.json`. They come in 53 cyclic-dihedral orbit families of 24 images, with widths ranging from 8 to 43.

### Current frontier

The final bank remains structurally satisfiable. One exact clause-replayed witness is:

```text
0  -> {3,4,8,10}
1  -> {3,6,9,11}
2  -> {0,1,4,6}
3  -> {5,7,8,11}
4  -> {2,3,5,6}
5  -> {0,3,7,9}
6  -> {2,4,5,7}
7  -> {3,5,10,11}
8  -> {2,6,7,9}
9  -> {1,4,7,10}
10 -> {1,6,8,11}
11 -> {0,2,9,10}
```

It violates zero of the 242,172 installed clauses. Exact quotient analysis nevertheless gives a 27-comparison positive cancellation with a width-35 membership core. Therefore the bank is incomplete, not the mathematics.

## 6. New planar certificate language

### 6.1 Equal-radius two-circle affine relation

Suppose two distinct planar centers `a,b` and two distinct common points `x,y` satisfy

\[
|a-x|=|a-y|=|b-x|=|b-y|>0.
\]

The two equal-radius circles have common chord `xy`, and their centers are the two points on its perpendicular bisector at equal signed displacement. Consequently

\[
a+b=x+y. \tag{R}
\]

In the row system, (R) is available whenever equality closure places all four center-to-point edges in one selected-distance component.

### 6.2 Collision certificates

Integer combinations of relations (R) can force

\[
p_i-p_j=0
\]

for two distinct carrier labels. Six of the eight exact strict-Kalmanson survivors found in this wave die this way.

A representative three-relation certificate uses

```text
(centers 2,6; intersections 0,4)
(centers 2,11; intersections 0,9)
(centers 8,11; intersections 6,9)
coefficients: -1,+1,-1
```

and forces `p4=p8`. Its selected-membership proof core has width 14.

Other exact survivors require three or four rhombus relations and force collisions such as `p1=p6`, `p1=p5`, `p1=p8`, `p2=p6`, or `p1=p7`.

### 6.3 Midpoint-versus-radius certificates

The first survivor not killed by a collision certificate appears in CEGAR round 16. Five rhombus relations combine to give

\[
p_3+p_{11}=2p_1. \tag{M}
\]

But row 3 contains both points `1` and `11`, so

\[
|p_3-p_1|=|p_3-p_{11}|>0.
\]

From (M), `p_{11}-p_3=2(p_1-p_3)`, hence

\[
|p_3-p_{11}|=2|p_3-p_1|,
\]

contradicting the positive selected-radius equality.

The exact five relations are

```text
(0,6; 2,9)
(0,8; 7,9)
(1,5; 3,10)
(1,6; 2,11)
(5,8; 7,10)
coefficients: +1,-1,-1,-1,+1
```

and the selected-membership proof core has width 24.

This is strictly stronger than collision mining: an affine relation can contradict a row radius even when it identifies no two named carrier points.

## 7. Exact planar replay

Every strict-Kalmanson survivor in this wave has an independently replayed planar terminal:

```text
three-equilateral-zigzag: 1
rhombus collision:        6
rhombus midpoint/radius:  1
all planar replays:       PASS
payload SHA-256:
bef3d96457f9f622486e139063fa38760395b5e85b62aca2d0f603ac1fb22998
```

The replay verifies that every relation is supported by one equality component generated from the selected hits, that the integer affine sum is exactly the advertised collision or midpoint vector, and that the terminal labels are distinct where required.

A numerical unit-distance search was also run on the midpoint survivor as a diagnostic. It repeatedly converged only to degenerate solutions. That numerical evidence is not used in the claim; the affine midpoint certificate is the exact proof.

## 8. A negative theorem-mining result

Two late candidates exposed width-eight selected-membership cores. It was tempting to interpret one as a general six-role cyclic theorem.

That generalization is false. Lifting the same abstract role order across arbitrary cyclic gaps produced a concrete image whose equality closure does **not** collapse the claimed Kalmanson comparison. The small core depends on the actual ambient gap positions through the selected-row equality paths.

Therefore:

- the exact witnessed embeddings are valid no-goods;
- arbitrary order-preserving role substitution is not valid;
- future compression must retain either gap data, explicit equality paths, or a checked weighted certificate.

This is an important guardrail against overgeneralizing finite CEGAR cores.

## 9. What has and has not been proved

### Exact results established

- deterministic construction of the 145,860-clause local bank;
- exact extension barriers for zero- and one-old-row repairs;
- exact first two-row repair and its planar zigzag occurrence;
- deterministic construction of the 95,040-clause zigzag orbit;
- exact replay of 48 full quotient-Kalmanson analyses;
- exact rational witnesses for all eight strict-Kalmanson survivors;
- exact planar elimination of all eight survivors examined;
- exact integrity of the 242,172-clause final bank and its 1,272-clause delta;
- an exact structural witness to the final bank, followed by an exact 27-comparison quotient contradiction.

### Not established

- exhaustive UNSAT of all `n=12` row systems;
- exhaustive coverage of all 170 reflection-normalized row-zero cells;
- a planar P97 counterexample;
- a source-faithful blocker/deletion/minimality realization;
- a general theorem saying every planar survivor has a rhombus certificate;
- arbitrary cyclic lifting of the small width-eight cores.

## 10. Recommended next computation

The next wave should continue at `n=12`, but its inner language should change.

1. Add a **generic exact affine-relation checker** to the CEGAR loop. Treat every equal-radius shared pair as the vector relation `a+b=x+y`.
2. Search for small integer combinations yielding:
   - carrier collisions;
   - midpoint/ratio relations incompatible with a selected positive radius;
   - three-point affine dependence, contradicted by convex independence.
3. Canonicalize these certificates under relabeling only after replaying the complete equality paths.
4. Add the resulting exact incidence cores lazily to the structural bank.
5. Replace heuristic min-conflicts with an exact row-zero-cell campaign once the planar bank stabilizes. Each of the 170 reflection-normalized cells should end in:
   - exact structural UNSAT under the bank;
   - an exact quotient-Kalmanson cancellation;
   - or an exact strict-Kalmanson survivor with an independently checked planar terminal.
6. Only if a survivor passes the affine layer should the computation escalate to Cayley–Menger/rank-two polynomial elimination or full planar coordinates.

The most valuable formalization target is the low planar lemma behind (R), followed by a checked finite integer-affine-certificate consumer. That would let the six collision certificates and the midpoint certificate become compact Lean-checkable data rather than seven bespoke geometry theorems.

## 11. Reproducibility identity

Core identities:

```text
base bank:
bbd9707afc4e0d6ae91ee58b9f1a660a99505378902986a60cf77b0e43cb22b0

base + zigzag:
35c5ff752d1157981cc3919163d251c1a73cb4df61747fd41b44ce29fb670eab

final learned bank:
e3053ed3c632443263cfe4ca5dc8ab401612226d5a20f510db0b55ad7279a5d7

exact analysis replay:
029a8f22f989b825d0cadbeb287d62c793c05f15a41fd564bbf61cc8d3af470d

planar terminal replay:
bef3d96457f9f622486e139063fa38760395b5e85b62aca2d0f603ac1fb22998
```

The curated bundle verifier regenerates the base and zigzag banks, replays every retained exact quotient analysis and planar terminal, verifies the final bank as the exact union of the base-plus-zigzag bank with its recorded delta, and checks that the final frontier assignment has zero installed-clause violations but an exact quotient contradiction.
