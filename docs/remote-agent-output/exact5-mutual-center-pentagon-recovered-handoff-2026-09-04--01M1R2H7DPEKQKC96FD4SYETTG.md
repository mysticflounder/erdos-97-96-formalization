# Exact-five mutual-center pentagon: recovered handoff

## Provenance and transfer limitation

This document reconstructs the preceding assistant's visible progress report in the 97-96 project chat. It is NOT a byte-for-byte copy of either original artifact:

- exact5-mutual-center-pentagon-progress-2026-09-04.md
- ExactFiveMutualCenterPentagon.lean

Both original sandbox files were absent when the user requested delivery. No retrievable copies were found in the available file context or GitHub filename searches. The original Lean source, full intermediate-inequality derivation, exact checker, and positive-control coordinates are therefore NOT transferred here. Do not record the original Lean candidate as received or compiled.

The source audit and checks below were reported in the preceding answer, not independently rerun during this transfer. They refer to main at a8c83dd98ee47ee7452ca8e06538dca9968098ea, not to a fresh audit of current main. At that audited revision both the physical and five-incidence leaves still directly contained sorry. This result does not close either entire leaf.

## Result to audit and formalize

Five distinct planar points in strictly convex cyclic order

    U, a, s, d, O

cannot satisfy the Euclidean distance equalities

    |UO| = |Ua| = |Us| = |Oa| = |Od| > 0.

The preceding work described this as a prose-proved obstruction. It eliminates the alternate order U,p,a,s,d,c2,O by retaining the subsequence U,a,s,d,O. It needs neither p nor c2. The previously existing profile-0034 obstruction was reported to handle the different order U,p,s,a,d,c2,O.

## Normalized algebraic proof from the visible report

Normalize the equilateral frame to U=(0,0), O=(1,0), a=(1/2,-1/2), with scaled squared metric Q(x,y)=x^2+3*y^2. Write s=(sx,sy), d=(dx,dy).

The circle equations are

    sx^2 + 3*sy^2 = 1
    dx^2 + 3*dy^2 = 2*dx.

The report states that strict convex order yields

    sx > 1/2, dx > 1/2, dy < 0, dx + dy > 0.

These order-to-inequality implications must be explicitly derived in the formalization; their intermediate derivations were in the missing original handoff.

Set

    Ls = 2 - sx + 3*sy
    Ld = 2 - dx + 3*dy.

Using the circle equations,

    Ls = (sx - 1/2)^2 + 3*(sy + 1/2)^2 > 0,
    dx*Ld = 3*dy*(dx + dy) < 0.

The first strict inequality uses s != a. Since dx > 0, the second gives Ld < 0. Defining cross(a,s,d)=det(s-a,d-a), the exact identity is

    3*cross(a,s,d) = (sx - 1/2)*Ld - (dx - 1/2)*Ls.

Its right-hand side is negative, contradicting the positive orientation of a,s,d. Orientation must be chosen consistently, reflecting the normalized frame when necessary. A coordinate-free transport and boundary-order wrapper are still needed for a Lean application.

## Reported source bridge

Take U=blocker, O=first physical apex, a=retained, d=deleted, and s a blocker-row point. The two required mutual incidences are

    blocker in K0,
    O in K1.

The first two selected rows reportedly supply the equilateral equalities and |Us|=|UO|. The original exact-five class supplies |Od|=|Oa| even though the deleted point is absent from the selected four-point row. These source facts were reported to be the same ones already used by the existing adapter.

No equality between blocker and surplus apex is assumed. The two incidence guards were reported to hold in continuation positions three and four. No third-row incidence is needed. Recheck these source matches and guard positions against the current repository before integration.

## Scope and unresolved work

The audited alternate witness U=c1 < p < a < s < d < c2 < ... < O had reportedly returned UNKNOWN/UNKNOWN in the planar computation. Its five-point subsequence is covered by this obstruction. This is not a replay or a new solver certificate for the original SMT artifact.

A reusable guarded order restriction follows from the proposed obstruction: for a boundary cut U<a<O, an O-class point and a blocker-row point in the open arc (a,O) cannot appear in the strict order blocker-row point, O-class point, provided the five roles are distinct and the stated distance hypotheses hold. In particular, s cannot lie strictly between a and d when U<a<d<O.

The earlier work reported exact symbolic checks of the polynomial identities and an exact rational-coordinate positive control in the DIFFERENT order U,p,a,d,c,s,O, with all 35 ordered triple determinants positive and the same local metric equalities. The checker and coordinates are unavailable in this transfer; treat those computational claims as reported rather than reproduced. The control was not a P97 counterexample or a full source packet. Do not infer that the local metric core is contradictory in every order. Complementary-order coverage remains open.

## Request for luna-swarm agents

Independently audit the normalized proof, including the order-to-inequality derivations. Formalize and compile the scalar contradiction, then supply coordinate-free transport, the strict-convex-boundary subsequence wrapper, a minimal exact-five normal-form adapter, and the guarded classifier integration. Check current declarations and dependencies before deciding where to place it.

Keep the closure claim limited to the guarded alternate-order subcase until the complementary orders and full source integration are proved. Report exact declaration names, current revision, build results, axiom checks, and remaining obligations. The original uncompiled Lean candidate has not been delivered; do not depend on it.
