# P97 strict-Kalmanson Wave 6 — corrected local catalog and first exact `n=12` affine-CEGAR campaign

**Date:** 2026-09-04  
**Project:** Erdős 97–96 formalization  
**Status:** exact, reproducible progress; **no exhaustive `n=12` closure is claimed**.

## 1. Executive result

This wave did three things.

1. It repaired a provenance/completeness error in the inherited Wave 5 local Kalmanson bank.
2. It implemented and independently replayed a generic planar affine-certificate layer based on equal-radius two-circle intersections.
3. It replaced the earlier purely heuristic frontier with deterministic exact fixed-cell solvers and ran the first complete bounded 170-cell campaigns.

The corrected `n=12` bank now contains **524,844** monotone selected-membership no-goods and has SHA-256

```text
046ed0f020480cb8858f8cfec3f9388fb560e0602d1d434db07de40ce48a65eb
```

The bank contains the complete inclusion-minimal one-Kalmanson-collapse catalog on four and five exact roles, the complete three-row Berge family, the full five-role affine obstruction bank, and the exact CEGAR/cyclic clauses retained through round 194.

A heuristic source produced **134 distinct `n=12` support systems** during rounds 50–192. Every one was rejected by an independently replayed exact nonnegative Kalmanson cancellation. The latest independently replayed block, rounds 173–192, contains twenty exact cancellations with certificate sizes 8–30 and selected-membership cores of width 16–42.

The deterministic exact fixed-cell campaigns have not yet closed any `n=12` row-zero cell. Four full 170-cell campaigns, on progressively stronger banks, reached their per-cell state/time limits in every cell. A first campaign on the current 524,844-clause bank completed 26 cells before the aggregate command limit; all 26 also reached their exact search limit without returning SAT or UNSAT.

Therefore the current mathematical boundary is:

```text
- every displayed CEGAR candidate has an exact contradiction;
- the generic affine planar certificates replay exactly;
- the finite bank is much stronger and now has a correct local foundation;
- exhaustive n=12 UNSAT remains open.
```

## 2. nthdegree delivery

The Wave 5 prose checkpoint was successfully delivered as:

```text
file ID: 01M1PG422XH1AXRQMXVS7C1XN6
bytes:   13,952
SHA-256: 77223b57d3a2262d2a055971dd96ff283ed58b6e2f0fbbe49e096c67c1513fdc
```

It was attached to project message `#12123`.

An independent audit correctly noted that this was prose only: the five named payloads and replay commands were not included in that attachment. This curated Wave 6 bundle remedies that custody gap by including the actual bank bytes, generators, exact analyses, planar certificates, fixed-cell ledgers, manifest, and one-command verifier.

## 3. Correction: the historical 142-record catalog was not complete

Wave 5 described the old 142-record source catalog as containing every single-Kalmanson collapse supported on at most five labels. That description was too strong.

The historical file is valid, but it is only a subset. An exhaustive enumeration was rebuilt independently under this precise specification:

- the positive selected-membership atoms use an exact role set of cardinality four or five;
- a nonempty row contributes at least two members, so it generates a distance equality;
- at least one strict K1 or K2 comparison collapses after quotienting distance edges by all row equalities;
- the atom set is inclusion-minimal;
- every role in the exact role set occurs in some positive atom.

The complete catalog has **202** records:

| Exact roles | Core width | Records |
|---:|---:|---:|
| 4 | 4 | 4 |
| 4 | 6 | 8 |
| 5 | 8 | 90 |
| 5 | 10 | 60 |
| 5 | 11 | 40 |

Catalog identity, omitting only diagnostic elapsed time:

```text
dbbae6a503866379882765aab8bfacb9c8ec9c179a21d4a637ecac5b239daf37
```

The old 142 records are all members of this complete catalog. They omit exactly 60 records:

```text
40 of width 10
20 of width 11
```

They contain no false record.

The independent exhaustive verifier recomputes all 625 four-role row-pattern products and all 248,832 five-role row-pattern products, checks collapse, checks exact role coverage, and checks atom-by-atom irredundancy. It returns `PASS` with the same 202-record histogram and catalog identity.

### Correct complete `n=12` local bank

Lifting the 202 records to all injective order-preserving role embeddings at `n=12`, and adjoining the complete 40-template three-row Berge family, gives:

```text
Berge clauses:       36,960
four-role lifts:      5,940
five-role lifts:    150,480
--------------------------------
complete local bank:193,380
```

The canonical serialization is:

- variable for positive atom `(center,point)` is `center * N + point + 1`;
- variables are sorted within a clause;
- duplicate clauses are removed exactly;
- clauses are sorted by `(width, lexicographic tuple)`;
- header is `p97monotone N M\n`;
- each clause ends in ` 0\n`.

The complete local bank SHA-256 is:

```text
93407f5da9298bc5385e4083310220b4a720b2f154d51c0cb15ff3f2cf228465
```

Both the generator and an independent semantic verifier are included.

## 4. Generic planar affine certificate layer

For a planar realization, suppose two distinct centers `a,b` and two distinct common points `x,y` satisfy

```text
d(a,x)=d(a,y)=d(b,x)=d(b,y)>0.
```

Then the two equal-radius circles have common chord `xy`, and the centers are opposite equidistant points on its perpendicular bisector. Hence

```text
p_a + p_b = p_x + p_y.                    (R)
```

The Wave 6 miner constructs every relation (R) whose four edges lie in one equality component generated by selected-row memberships. It then performs exact rational/integer linear algebra on those affine relations.

The first exact miner searches for resultants supported on two or three carrier labels:

- support two forces two carrier points to coincide;
- support three, with coefficient sum zero, forces three carrier points to be affinely dependent and hence collinear.

Both contradict an injective convex-independent planar carrier.

An independent verifier replays:

1. each support table;
2. every selected-row equality component;
3. the four edges supporting each relation (R);
4. every integer coefficient;
5. the final collision or three-point affine resultant.

It passes on all eight strict-Kalmanson survivors retained from Wave 5. In the generic affine language, their smallest retained certificates divide into:

```text
5 carrier-collision certificates
3 three-point affine-dependence certificates
```

This is a different classification of the same exact survivors, not a revision of their earlier bespoke descriptions.

## 5. New five-role, nine-membership planar theorem

The affine miner found a particularly small source-neutral obstruction.

For five distinct planar carrier roles `A,B,C,D,E`, assume:

```text
row(A) contains {B,C,D,E}
row(C) contains {A,B,D}
row(E) contains {A,D}
```

The row equalities imply that centers `A,C` see common points `B,D` at one common radius, so

```text
A + C = B + D.
```

They also imply that centers `C,E` see common points `A,D` at one common radius, so

```text
C + E = A + D.
```

Subtracting yields

```text
2A = B + E.
```

Thus `A,B,E` are collinear, contrary to convex independence and distinctness.

The normalized nine positive atoms are:

```text
(0,1) (0,2) (0,6) (0,11)
(2,0) (2,1) (2,6)
(11,0) (11,6)
```

Its complete injective orbit at `n=12` has **95,040** clauses. The formalization request was posted as project message `#12182`.

No cyclic order, Kalmanson inequality, fixed cardinality, triangle inequality, or solver assertion is part of this planar theorem.

## 6. Exact CEGAR progression

Wave 6 retained exact analysis files for rounds 50–192. There are **134** distinct support systems, and every exact analysis returns:

```text
EXACT_STRICT_SYSTEM_CONTRADICTION
```

Certificate sizes range from 1 to 32 strict Kalmanson comparisons; selected-membership cores range from width 6 to 43.

The current correction-sensitive continuation began from the bank containing the complete 193,380-clause local catalog. Rounds 173–192 produced twenty further structural candidates. Independent rerun of the exact quotient analyzer reproduces all twenty certificates byte-for-byte at the mathematical `analysis` field:

```text
records:                20
certificate-size range: 8..30
core-width range:       16..42
status:                 PASS
```

One especially compact round-179 certificate uses eight strict comparisons and a width-16 membership core on nine ordered roles. Replaying that certificate over every cyclic-order embedding adds 3,936 new clauses after deduplication.

The resulting current bank is:

```text
clauses: 524,844
SHA-256: 046ed0f020480cb8858f8cfec3f9388fb560e0602d1d434db07de40ce48a65eb
```

It contains the complete corrected local bank and the earlier bank containing the full five-role affine orbit. An exact inclusion audit reports:

```text
complete local bank missing from final: 0
five-role affine bank missing from final: 0
additional clauses beyond their union: 140,064
```

The additional clauses are exact CEGAR, dihedral, and checked cyclic-embedding no-goods.

### Important logical boundary

Candidate generation in these CEGAR rounds is heuristic. Each candidate that appears is checked exactly, and every retained no-good is supported by an exact contradiction. Failure of the heuristic generator to find another candidate is not an UNSAT proof. No such failure is used as a theorem in this checkpoint.

## 7. Deterministic exact fixed-cell campaigns

`n=12` has 330 possible selected four-supports at each center and 170 row-zero supports up to reflection. Four exact solvers were developed or retained:

- a sparse clause-bitset DFS;
- a domain-filtering DFS that detects exact last-center empty domains;
- an experimental generalized-propagation DFS;
- a watched grouped-literal DFS.

The watched implementation was regression-tested against the certified `n=10` 9,280-clause bank. It proves all 66 reflected row-zero cells UNSAT:

```text
cells:       66
UNSAT:       66
total nodes: 14,746
```

This validates its exact clause semantics and reflection-cell enumeration on a known-answer instance.

### Full bounded `n=12` campaigns

The following complete 170-cell campaigns were run:

| Campaign | Cells | Result |
|---|---:|---|
| sparse, earlier bank, 1 s/cell | 170 | 170 `LIMIT_EXHAUSTED` |
| domain, earlier bank, 1 s/cell | 170 | 170 `LIMIT_EXHAUSTED` |
| domain, 461,556-clause bank, 1 s/cell | 170 | 170 `LIMIT_EXHAUSTED` |
| domain, corrected 509,340-clause bank, 1 s/cell | 170 | 170 `LIMIT_EXHAUSTED` |

A first current-bank domain campaign completed 26 cells before the aggregate command limit terminated the campaign process. All 26 returned `LIMIT_EXHAUSTED`; none returned SAT or UNSAT. The partial output is retained and explicitly labeled partial.

The strongest individual earlier cell run also hit its exact limit. Thus no row-zero cell is counted as closed.

## 8. What is now proved computationally

The bundle establishes, by included exact bytes and replay:

- the 202-record complete inclusion-minimal one-Kalmanson-collapse catalog on exact role sets of size four and five;
- the correction that the prior 142-record catalog is a valid but incomplete subset;
- the 193,380-clause complete `n=12` local bank and its exact canonical hash;
- the affine certificate construction and independent replay on eight prior strict-Kalmanson survivors;
- the five-role, nine-hit affine obstruction and its 95,040-image `n=12` orbit;
- 134 exact quotient-Kalmanson contradictions for displayed `n=12` support systems;
- independent exact reproduction of the twenty newest cancellations;
- the 524,844-clause final bank hash and inclusion relations;
- exact bounded campaign ledgers, including the `n=10` known-answer regression.

## 9. What is not proved

This wave does **not** establish:

- exhaustive UNSAT of all `n=12` selected-row systems;
- SAT of the final 524,844-clause bank;
- UNSAT of any of the 170 `n=12` row-zero cells;
- a planar P97 counterexample;
- a source-faithful blocker/deletion/minimality realization;
- that every planar survivor admits a short affine relation certificate;
- that a heuristic no-candidate outcome is a proof;
- that every gap-preserving relabeling of a finite CEGAR core is valid.

The last warning is important: cyclic/general relabeling is applied only when the full mapped Kalmanson certificate and mapped equality closure are independently replayed.

## 10. Recommended next computation

The exact fixed-cell solver, not the Kalmanson analyzer, is now the bottleneck. Repeated CEGAR candidate generation continues to find only exact cancellations, but one-second exact DFS campaigns do not penetrate deeply enough.

The next computation should therefore be one of these two tightly scoped upgrades:

1. **Proof-producing SAT/CP-SAT compilation of the current monotone row-domain problem.** Encode one-hot row choices and every no-good as a clause over support-choice implications, use an independently checkable SAT proof for UNSAT cells, and retain exact decoded-model replay for SAT cells.
2. **Stronger exact constraint propagation in the custom solver.** Maintain support domains and propagate every no-good whose all but one center requirements have become unavoidable; add memoization under canonical remaining domains, then rerun the 170-cell campaign.

In parallel, the affine layer should be generalized from two-/three-label resultants to small convex-combination certificates. An exploratory exact miner already finds four-/five-label convex-dependence resultants, but those have not yet been installed as a complete monotone theorem family.

The next Lean target remains the low planar identity behind relation (R), followed by the five-role selected-row/convex-independence adapter. A generic checked affine-certificate consumer would then allow future exact integer relation proofs to be imported as compact data rather than bespoke geometry lemmas.

## 11. Reproduction

From the extracted curated bundle:

```text
python3 verify_bundle.py
```

The verifier:

- checks every file against `manifest.json`;
- exhaustively regenerates and verifies the 202-record catalog;
- regenerates and verifies the 193,380-clause local bank;
- checks the historical 142-record subset comparison;
- replays all eight affine certificates;
- independently recomputes the twenty round-173–192 quotient analyses;
- checks final-bank inclusion and SHA-256;
- checks every campaign ledger and its stated status boundary;
- recompiles the watched exact solver and replays all 66 certified `n=10` cells.

A `PASS` result validates the claims in this checkpoint. It does not convert bounded `LIMIT_EXHAUSTED` records into an `n=12` theorem.
