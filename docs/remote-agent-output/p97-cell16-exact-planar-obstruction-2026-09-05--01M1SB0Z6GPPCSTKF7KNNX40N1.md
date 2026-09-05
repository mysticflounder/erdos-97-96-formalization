# P97 n=12 cell 16: fresh support table eliminated exactly

Date: 2026-09-05. Counterexample-mining result, not a new Lean formalization assignment.

## Exact result

The fresh reconstructed cell-16 support table printed in section 8 of Adam's 2026-09-04 handoff has no realization by twelve distinct points in the Euclidean plane. Convex independence and the prescribed cyclic order are not needed for this contradiction. This eliminates the entire support table, not merely one rational metric witness.

Cell 16 remains OPEN: the historical run was time-limited, and the structural master was not available or resumed in this runtime. No radius-ten cell is certified closed by this work.

## Support table

```
0: 3,6,7,10
1: 3,5,8,11
2: 4,6,9,11
3: 0,1,4,5
4: 2,3,6,8
5: 1,3,7,9
6: 0,2,4,7
7: 0,5,6,9
8: 1,4,10,11
9: 2,5,7,10
10: 0,8,9,11
11: 1,2,8,10
```

The unchanged seed rows are {5,10}; the zero-based lexicographic combinations(range(12),10) index is independently confirmed to be 16.

## Five-rhombus certificate

Only rows 0,1,2,3,4,7,10 are required. Their radii coincide along the mutual-support links 0--3, 3--1, 3--4, 4--2, 0--7, 0--10. Thus each of these cycles has four equal sides:

```
(0,3,4,6)
(1,3,4,8)
(1,8,10,11)
(2,6,7,9)
(2,9,10,11)
```

Four distinct planar points a,b,c,d with four equal consecutive sides satisfy a+c=b+d. To prove this without an ordering assumption, translate a=0. The side equalities imply C dot B = C dot D = |C|^2/2 and (B+D) dot (B-D)=0. Both C and B+D are perpendicular to nonzero B-D. In the plane this perpendicular space is one-dimensional, and C is nonzero, so B+D=lambda*C. Taking its dot product with C gives lambda=1.

The five rhombi therefore give these zero vectors:

```
A = z0-z3+z4-z6
B = z1-z3+z4-z8
C = z1-z8+z10-z11
D = z2-z6+z7-z9
E = z2-z9+z10-z11
```

The exact cancellation is

```
-A+B-C-D+E = -z0+2*z6-z7 = 0.
```

Thus z6=(z0+z7)/2. But row 0 requires |z6-z0|=|z7-z0|, whereas the midpoint identity requires |z6-z0|=|z7-z0|/2. Hence z0=z7, contradicting distinctness.

## What was missed

The eight reconstructed cyclic rhombus relations have rank eight, agreeing with the handoff. The old screen checked direct collisions and whole-configuration rank-ten collinearity. It missed local affine relations. Seven midpoint relations occur in the rank-eight row span. The one above, combined with row equalities, gives a nonplanarity certificate.

## Computation and search integration

A newly reconstructed integer abstract metric passes all 990 strict Kalmanson inequalities, all 660 strict triangle inequalities, all selected equalities, and positivity, with minimum strict slack 1. The quotient has 43 distance components, including one 24-edge component of value 49. Numerical LP output was retained, and the promoted witness was independently replayed in integer arithmetic. This is not the missing historical witness.

An independent standard-library Python verifier checks the rhombus premises, integer cancellation, positive squared-distance collision factor 3/4, all learned cuts, and the metric. It also rejects a deliberately corrupted certificate.

Exhaustive testing of 3,302 row subsets of sizes zero through seven found 16 seven-row sets preserving one of the seven extracted midpoint certificates plus an equal-distance anchor; none of size at most six preserved these specific templates. This is NOT a global minimal-UNSAT-core claim. Each yields the clause: at least one of the seven specified selected rows must differ. Every cut was independently replayed using only its seven rows.

The new generic affine screen checks all three unoriented four-cycles on each four-label set, direct affine collisions, and rational strict-betweenness relations. It separates EXACT_NO_DISTINCT_PLANAR_REALIZATION, EXACT_NO_STRICTLY_CONVEX_REALIZATION, and PLANAR_UNRESOLVED_BY_AFFINE_SCREEN. It is incomplete and never treats unresolved as SAT or UNSAT.

Eight deterministic random relabelings of the target were correctly rejected. Two exact n=12 planar fixtures were not falsely rejected: the square grid remained unresolved, and the triangular grid was classified as non-strictly-convex, not nonplanar.

A standalone C++20 header containing the 16 seven-row cuts compiled with -Wall -Wextra -Wpedantic -Werror and passed 129 partial-assignment tests. Its interface accepts twelve completed 12-bit support masks, with zero for unassigned rows, and returns an offending cut index or -1. It has not been integrated into the missing original master.

When integrating, record the learned-cut hash and proof references. Exhaustion after adding these planar cuts must not be mislabeled exhaustion of the unchanged static/Kalmanson relaxation. The original raw JSON/output custody repairs and eventual exhaustive enumeration remain necessary.

## Custody and recovery

Only the uploaded handoff was initially mounted. Its SHA-256 is f296a2a7d6aca00362e37334284e4b55c24e37c2e3c69352a758864eeea1eceb. Original archive/master/analyzer recovery was requested in nthdegree message 15366. GitHub code searches for radius10_structural_master and radius10 found no matches.

The complete local durable bundle contains 34 files: inputs, cell map, sources, exact certificates, metric and numerical output, generated C++ header/test source, manifests, checksums, regression data and transcripts. The binary is omitted; source and compiler/test records are retained.

Bundle basename: p97-cell16-2026-09-05.tar.gz
Bytes: 35554
SHA-256: 3e6888bc8a2d18c2d0c4cabaa7b9d3978893f57de062aaf7432cc9a95dab1361

This note does not assert that the bundle has been transferred. It is separately available to Adam from the current session.

A later convo_responses read failed with network_error / Connection failed. The issue report was successfully delivered to #nthdegree as message 15380. No ambiguous write retry was performed.

## Immediate next operation

Recover and hash-check the original radius-ten master, integrate the certified cuts and improved affine screen, and resume reconstructed cell 16 with every raw result retained. A time limit or solution cap remains OPEN even if every survivor found so far is eliminated. Only an exhausted enumeration with all survivors exactly eliminated closes a cell. Global n=12 and the radius-ten shell remain open.
