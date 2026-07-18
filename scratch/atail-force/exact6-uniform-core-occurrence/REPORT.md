# Exact-six mutual uniform complete-row occurrence audit

Date: 2026-07-18

Status: **KERNEL-CHECKED BOUNDED COMPLETE-ROW MANIFEST AND SEVEN-ORBIT
SOURCE-IDENTITY QUOTIENT.  NO UNIFORM EMBEDDING OF THE PROVISIONAL
15-EQUALITY UNIT CORE IS FORCED.  NO PRODUCTION `sorry` IS CLOSED.**

This lane owns only
`scratch/atail-force/exact6-uniform-core-occurrence/`.  It does not edit
production Lean, closure documents, generated blueprint state, git state,
`ShellCurvature`, `SurplusM44`, or protected card-five/555/654 work.

## Kernel-checked occurrence

`ExactSixUniformCoreOccurrence.lean` proves

```lean
exactSixMutualCompleteRowManifest
exactSixMutualRoleOrbit
```

from exactly

```lean
M : FullParentExactFiveMutualData L profile
hcap : S.oppCap2.card = 6.
```

The manifest retains the concrete common `CriticalShellSystem H`; it does
not replace actual rows by anonymous selected representatives.  It proves:

1. the physical strict-cap set has cardinality three or four;
2. the whole strict physical cap has cardinality four;
3. `continuation.first`, `continuation.second`, `M.pair.source`, and
   `M.pair.target` all lie in that physical set, so their role set has
   cardinality at most four;
4. the continuation unused source lies outside the physical exact-five set;
5. the unused-source critical support is its complete ambient radius class,
   has cardinality four, meets the physical set in at most one point, and
   omits both continuation sources;
6. every physical source has its complete ambient four-point critical
   support, contains itself, and meets the physical set in at most two
   points;
7. the mutual source and target are distinct and omit each other from their
   actual critical supports;
8. their actual blockers are distinct; and
9. their two complete supports intersect in at most two points.

Thus the live exact-six sibling does force a bounded, source-faithful
complete-row object.  It is not the fourteen arbitrary literal rows of the
earlier finite fixture.  Its initially exposed equality rows are only:

- the complete exact-five radius filter at `S.oppApex2`;
- the complete unused-source critical row;
- the complete mutual-source critical row; and
- the complete mutual-target critical row.

The role theorem quotients the ordered continuation pair and ordered mutual
pair into exactly seven cases:

1. the same ordered pair;
2. the reverse ordered pair;
3. only `mutual.source = continuation.first`;
4. only `mutual.target = continuation.first`;
5. only `mutual.source = continuation.second`;
6. only `mutual.target = continuation.second`; or
7. four distinct roles, in which case those four roles are the entire
   physical vertex set.

This is the correct finite identity quotient.  A search should branch on
these seven constructors rather than repeatedly adjudicating literal label
assignments.

## Provisional 15-equality unit core

The sibling Euclidean-gate lane currently reports the following provisional
equality ideal as `UNIT` in msolve, in both variable orders, with every
single-equation deletion reported `NONUNIT`:

```text
c0 ref1 -> 2,5,7
c1 ref2 -> 3,8
c2 ref3 -> 4,7,9
c3 ref4 -> 5,8
c4 ref5 -> 9
c7 ref0 -> 8,9
c8 ref1 -> 9
c9 ref0 -> 2
```

Equivalently, the required same-row groups are

```text
0 : {1,2,5,7}
1 : {2,3,8}
2 : {3,4,7,9}
3 : {4,5,8}
4 : {5,9}
7 : {0,8,9}
8 : {1,9}
9 : {0,2}
```

with point `0` distinct from point `1`.  This is strong exact-CAS evidence
for a useful metric consumer.  Singular over `QQ` and a kernel-checked
certificate were not completed by this lane, so this report does not call
the algebraic statement a Lean theorem.

## Source-map result: no orbit forces the core

None of the seven live source-role orbits forces an embedding of that core,
including an alias quotient.  The reason is structural, not a failed search
budget:

- the orbit theorem decides only identities among four physical source
  points;
- the core needs eight row-center roles (which may alias where permitted) and
  fifteen positive co-radial incidences;
- the live mutual packet positively names only own-source membership in
  each actual critical row;
- the unused row contributes two negative omissions and a one-hit upper
  bound;
- the mutual rows contribute two reciprocal negative omissions and two-hit
  upper bounds; and
- the physical apex contributes one complete exact-five filter.

No constructor of `ExactSixMutualRoleOrbit` identifies any of the core's
eight geometric centers with an actual blocker, chooses a source whose
`H.centerAt` is that center, or puts the other core roles in that source's
support.  Source equalities cannot manufacture those positive row
memberships.

The exact missing occurrence field for this consumer is therefore:

```lean
-- Architectural shape only; deliberately not introduced as another open
-- conditional structure in this scratch lane.
point : Fin 10 -> ℝ²
anchor_ne : point 0 ≠ point 1

source : (c : Fin 10) -> c ∈ {0,1,2,3,4,7,8,9} ->
  CriticalShellSystem.CarrierVertex D.A
center_eq : H.centerAt (source c hc).1 (source c hc).2 = point c

row_memberships :
  point 1, point 2, point 5, point 7 ∈ selectedAt(source 0) ∧
  point 2, point 3, point 8          ∈ selectedAt(source 1) ∧
  point 3, point 4, point 7, point 9 ∈ selectedAt(source 2) ∧
  point 4, point 5, point 8          ∈ selectedAt(source 3) ∧
  point 5, point 9                   ∈ selectedAt(source 4) ∧
  point 0, point 8, point 9          ∈ selectedAt(source 7) ∧
  point 1, point 9                   ∈ selectedAt(source 8) ∧
  point 0, point 2                   ∈ selectedAt(source 9)
```

The notation above abbreviates membership in the complete
`toCriticalFourShell.support`.  Core point roles and row-source witnesses may
alias wherever the final metric theorem permits; the occurrence theorem must
still derive every displayed `center_eq` and positive membership from the
same live `H`.

That packet is the actual producer obligation.  Merely proving the 15
equalities inconsistent for the literal fourteen-row fixture does not supply
it.

## Smallest correct CEGAR object

The next source-faithful CEGAR pass should start from the kernel manifest,
not from fourteen preselected rows:

1. quotient by the seven `ExactSixMutualRoleOrbit` constructors;
2. retain the exact six-point physical cap, its four-point strict interior,
   and the complete five-point `S.oppApex2` radius filter;
3. retain exactly the unused/source/target actual critical rows, including
   their full-support equalities and all currently forced positive and
   negative memberships;
4. retain the three actual blockers and their forced inequalities;
5. add another actual row only with a concrete source in `D.A` and its
   actual `H.centerAt`, never as an anonymous row center; and
6. accept a cut only when the accumulated rows construct the complete
   occurrence packet above or feed another already-kernel-checked metric
   consumer.

For equality discovery, each critical row contributes at most three new
support labels beyond its own source, so this starts with a small bounded
equality skeleton.  Full critical-row exactness also asserts that every
other carrier point is off that circle; those inequalities must be added
lazily when a candidate uses another carrier point.  Dropping those
full-filter guards would return to selected-representative mining and repeat
the earlier source-map bug.

This CEGAR object is smaller and source-faithful, but the current surface does
not yet provide the progress rule that must select the additional actual row
witnesses for the provisional eight-center-role core (at most five beyond the
three initial critical rows, with reuse allowed).  Pure selected-row closure
is not that rule: the corrected survivor bank already satisfies it.

## Theorem-bank preflight

Before formalizing the manifest, the required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered exact-six mutual
rows, source-faithful complete supports, shared outside pairs, and the U5
mutual families.  The closest consumers remain
`outsidePair_unique_capCenter`,
`false_of_two_cap_centers_equidistant_outside_pair`, the same-cap collision
cores, and `U5QCriticalTripleClass.mutual_no_p_exact_center_obstruction`.
Every one consumes positive cross-row/shared-pair membership absent from the
manifest.  No indexed theorem supplies the provisional 15-equality
occurrence.

## Validation and epistemic status

The owned Lean file was checked with warnings treated as errors:

```bash
cd lean
lake env lean -M 16384 -DwarningAsError=true -R .. \
  ../scratch/atail-force/exact6-uniform-core-occurrence/\
ExactSixUniformCoreOccurrence.lean
```

It exits zero.  Every printed declaration has axiom closure exactly

```text
propext, Classical.choice, Quot.sound
```

The file contains no `sorry`, `admit`, custom `axiom`, `native_decide`, or
`unsafe` declaration.

- **PROVEN / KERNEL-CHECKED:** the bounded complete-row manifest, cap/role
  cardinality bounds, all forced membership facts, and the seven role
  orbits.
- **EXACT EXTERNAL CAS EVIDENCE FROM THE SIBLING LANE:** provisional
  15-equality msolve `UNIT` in two variable orders plus deletion mutation
  checks.
- **NOT PROVED:** a Singular/kernel certificate for that metric core.
- **NOT FORCED:** an embedding of that core from any of the seven exact-six
  source-role orbits.
- **OPEN:** the source-indexed occurrence theorem or a different direct
  global contradiction.
- **PRODUCTION `sorry` CLOSED:** none.
