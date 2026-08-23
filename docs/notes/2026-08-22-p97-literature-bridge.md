# Erdős 97 literature bridge — LB0–LB10

**Date:** 22 August 2026
**Status:** `ACTIVE_UNMERGED` research supplement; not a proof authority
**Authority:** the repository’s current canonical descent manuscript and its
cluster checkpoints remain authoritative. This note records candidate bridges,
not completed Lean theorems.

## Boundary and main observation

The useful external direction is ordered convex-cap witness geometry and strict
distance inequalities for two convex chains. These are possible replacements
for incidence-only arguments, but they become project-relevant only after a
source-faithful adapter supplies the required cap interval, side, and cyclic
order. A row center is a metric witness for every support pair in its exact
row; it is not automatically a literature cap witness.

## Internal derived claims

### LB0 — research observation

The cap-witness and ordered-distance-matrix methods are closer to the missing
strict cap-order potential than a direct global isosceles count. This is a
strategy assessment, not a theorem.

### LB1 — row pairs are witnesses

If an exact four-row is centered at `c` and contains `x,y`, then
`dist c x = dist c y`; thus `c` witnesses the pair `{x,y}`. If two exact rows
through distinct centers contain the same pair, both centers lie on its
perpendicular bisector.

### LB2 — shared-pair alternation

For four distinct carrier points in strict convex position, two centers
witnessing the same pair lie on opposite sides of that pair’s chord. This is
derived from the perpendicular-bisector line and convex independence, and is
already present in project-specific A5 arguments. It still needs a reusable
project-native API if used across clusters.

## External theorem candidates

### LB3 — cap-witness nesting

The Nivasch–Pach–Pinchasi–Zerbib cap-witness lemma gives strict boundary
nesting for witnesses of cap edges sharing an endpoint. Candidate targets:
Rigid221, A5, A7/A8, TriApex, and F3. **Status:** external theorem; exact
source statement and project-cap bridge are unverified.

### LB4 — five-point strict chord decrease

A five-point cap configuration forces a strict chord inequality. Iterating the
pattern would create a strict cycle of lengths, a possible global potential for
Rigid221/A7/A8. **Status:** external theorem; source-pattern producer open.

### LB5 — strict two-chain distance inequality

Aggarwal’s anti-Monge inequality for two convex chains forbids a suitable
ordered equality rectangle. **Status:** external theorem; an antipodal-cut
adapter and orientation of the relevant supports are open.

### LB6 — obtuse-angle forbidden matrices

Aggarwal’s forbidden small distance patterns may consume exact-row equalities
once the two-chain placement is proved. **Status:** external theorem;
project-specific specializations for TriApex, TwoSource, and F3 are open.

### LB7 — Pach–de Zeeuw scalable bound

The two-curve few-distance bound could apply to two fixed nonconcentric circles
only if a live unbounded packet first produces large subsets on those circles
and a sufficiently small cross-distance palette. **Status:** conditional
external tool; the prerequisite producer is absent.

## Adapter obligations and priority

1. Define a project-native `CapWitness` predicate from an exact row pair,
   including the cap interval, endpoint side, and cyclic order.
2. Prove the MEC/Moser-cap bridge (`moserCap_is_cap`) once at the cap layer;
   this should expose the closed half-plane and at-most-semicircle arc needed
   by LB3/LB4.
3. Prove LB3 nesting and LB4 chord decrease in project boundary language.
4. Prove the antipodal-cut adapter for LB5, then small LB6 forbidden patterns.
5. Re-run Rigid221, A5, TriApex, TwoSource, and F3 packets only after their
   source-to-cap/order adapters are proved.
6. Seek LB7 only after a large fixed-curve producer exists.

### LB10 — Moser caps satisfy the literature cap hypothesis

The intended bridge is that an MEC cap lies in the closed region bounded by
its endpoint chord and an arc of length at most a semicircle. The route uses
MEC containment, the non-obtuse Moser triangle, the cap half-plane predicate,
and the inscribed-angle theorem. This is a derived bridge plan, not a proved
Lean theorem. Once formalized, it should feed LB3 and LB4 rather than duplicate
cap geometry in every cluster.

## Source-verification boundary

LB1–LB2 are internal derived observations. LB3–LB7 depend on external theorem
statements and must not be marked closed until the exact cited sources,
hypotheses, and project-native adapters are checked. LB8–LB9 are planning
assessments. LB10 is an unproved bridge plan. No item in this note closes a
publish-spine `sorry`, proves the general non-`IsM44` contradiction, or supplies
a P97/P96 counterexample.

## Source accounting

This synthesis accounts for all three literature files in the 22 August archive:

| Archive source | Disposition |
|---|---|
| `erdos-97-literature-bridge-active-2026-08-22.md` | Clean LB0–LB10 extract; claims and statuses synthesized here. |
| `erdos-97-literature-bridge-closure-matrix-2026-08-22.md` | LB1–LB10 target/status matrix; represented by the sections and priority list above. |
| `erdos-97-descent-prose-proof-authoritative-literature-bridge-2026-08-22.md` | Hybrid manuscript: its old whole-manuscript body is superseded; its appended LB0–LB10 material is represented here, without copying the obsolete body. |

Existing project literature follow-up remains in
`docs/computational-closure-plan-2026-07-28.md` (§§13.24.1.22–13.24.1.23),
and the cited source PDFs remain under `docs/references/`. Those documents
provide context and source pointers; they do not relax the verification
boundary above.
