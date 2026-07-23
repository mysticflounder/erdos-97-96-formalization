# Exact-four six-role occurrence feasibility

Date: 2026-07-22

Scope: scratch-only audit of the source lift for
`false_of_two_k2_three_row_triangle`. This lane changes no production Lean or
shared closure document.

## Conclusion

Two claims must be separated.

1. **Specific mutual-center lift.** The currently exported fields of
   `MutualCompletionSourceIngress R Q` do not supply
   `MutualTailTriangleOccurrence P`. The first missing positive field is a
   later-boundary-tail point in

   ```text
   exactFourFirstApexRow R ∩ P.completionRow.
   ```

   The mutual blocker cycle supplies only

   ```text
   successor ∈ exactFourFirstApexRow R
   firstApex ∈ P.successorRow.
   ```

   Those are opposite center memberships, not a shared support point. Even
   after one exact/completion tail hit is found, two more pairwise row hits and
   their strict tail order remain necessary.

2. **Global selected-row-table lift.** The weaker claim that *some* three
   carrier centers and their concrete global-K4 rows always instantiate
   `false_of_two_k2_three_row_triangle` is **refuted from the documented
   incidence projection**. Exact SAT countermodels exist at cardinality 12 for
   both displayed-cap profiles 4 and 5. They avoid every cyclic or reflected
   six-role occurrence, not only the anchored `(firstApex, successor,
   completionCenter)` occurrence.

The first stored pair of countermodels omitted the already-proved exact-pair
bisector localization and happens to violate it. A second exact run adds that
source theorem as a clause family and is again SAT for both profiles. Thus
bisector localization removes the first literal tables but still does not
force a six-role occurrence at cardinality 12.

This is **not** a counterexample to `OriginalUniqueFourResidual F`, and it does
not refute a theorem that uses one of the omitted geometric/full-radius fields.
It does prove that the fixed-cardinality `n = 11` CEGAR occurrences do not lift
to arbitrary cardinality by row incidence, cap counting, blocker-image, or
selected-witness strong connectivity alone.

## Required theorem-bank preflight

The registries required by `AGENTS.md` were checked before deriving the
countermodel:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, especially the
  sibling `p97-rvol` bank;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered selected-row
pairwise-intersection triangles and the named source packets. The closest
banked consumers remain contradiction consumers: they do not produce the
missing positive row intersections. No existing indexed theorem proves either
the anchored occurrence or the global occurrence.

## Exact finite projection

[`audit_global_triangle_occurrence.py`](audit_global_triangle_occurrence.py)
encodes:

- one nonself selected four-row at every one of 12 carrier vertices;
- the selected-witness strong-connectivity cut for every nonempty proper
  carrier subset;
- the displayed cap row-hit-at-most-two bounds and endpoint one-hit bounds;
- a total fixed-point-free blocker map with every source in its actual
  blocker row;
- equality of the first-apex blocker fiber with the exact first-apex row;
- the anchored mutual blocker two-cycle;
- one completion center omitted from the entire blocker image;
- the exact first-apex row's `2+1+1` cap distribution;
- pairwise selected-row intersections of cardinality at most two; and
- the negation of every order-preserving, cyclically re-cut, or reflected
  embedding of the six-role row triangle.

Both models are exact SAT assignments for that CNF:

| profile | status | occurrence cuts | CNF SHA-256 |
|---|---:|---:|---|
| `opp1_card = 4` | SAT | 11,088 | `09e999818162f0df1ce9e635bf981e2c0b506484c2856b1e99a006b955b122b4` |
| `opp1_card = 5` | SAT | 11,088 | `873dd5651fada7f42c8a3789322c9f62f1e26e2ce223f11d37a68833f27d0f74` |

The artifacts are [`n12_p4.json`](n12_p4.json) and
[`n12_p5.json`](n12_p5.json). Their `--check` gate reconstructs the CNF,
checks the clause-block ledger, and verifies the CNF hash. Initial decoding
also checks every clause against the stored complete assignment.

The pinned mutual rows illustrate the precise failure:

```text
p4:
  exact row at 0      = {1,5,6,11}
  successor row at 1  = {0,3,6,7}
  completion row at 2 = {1,4,7,8}

p5:
  exact row at 0      = {1,6,7,11}
  successor row at 1  = {0,2,7,8}
  completion row at 2 = {1,4,7,9}
```

In the p4 model, the exact/completion intersection is only the earlier
successor center `1`, so neither constructor of
`MutualTailTriangleOccurrence` can even choose its first later-tail witness.
The p5 model has repeated intersections but no three distinct witnesses in the
required strict cyclic order. The exhaustive global cuts show that choosing
different centers does not rescue the six-role occurrence in either model.

### Source bisector-localization overlay

The optional `--bisector-localization` gate adds the direct finite translation
of `R.bisector_center_mem_interior`. Because the first-apex row has exactly
two strict hits, every other selected row containing both forces its center
into the same strict first-opposite-cap interior. The translation is the
four-literal clause

```text
not firstRow(x) or not firstRow(y) or
not row(center,x) or not row(center,y)
```

for every strict pair `x,y` and every carrier center outside that strict cap.
It is opt-in so the original artifacts remain exactly reproducible.

The corrected results are still exact SAT:

| profile | status | localization clauses | CNF SHA-256 |
|---|---:|---:|---|
| `opp1_card = 4` | SAT | 9 | `b727800041423358d246ef176852062455c8dc7ff8ef388bab1eec5535a0c2aa` |
| `opp1_card = 5` | SAT | 24 | `83508a243251d6aaf3b2007f19f6d0509fbe5fb188716a0f0ec85d1e7ae4eb8b` |

The artifacts are [`n12_p4_bisector.json`](n12_p4_bisector.json) and
[`n12_p5_bisector.json`](n12_p5_bisector.json). The independent
[`unique4-occurrence-metric-audit`](../unique4-occurrence-metric-audit/REPORT.md)
proves that neither assignment is full-linear Kalmanson feasible:

- corrected p4 has two later centers whose rows share an earlier pair and is
  refuted by production
  `Problem97.false_of_two_centers_equidistant_pair_after`;
- corrected p5 has two separated centers whose rows share their middle pair
  and is refuted by production
  `Problem97.false_of_two_centers_equidistant_pair_split`.

Thus the localization-aware tables sharpen the incidence-level
non-occurrence boundary but are not Euclidean or even full-linear survivors.
No new metric consumer is needed; a future outer should pre-seed all cyclic
transports of this existing four-role two-center family.

### Combined existing-terminal coverage

The optional `--two-center-parity` gate adds all 1,980 nonalternating
four-role shared-pair cuts justified by the two production consumers above.
With both source localization and this complete four-role family installed,
the negation of every six-role triangle remains SAT at `n = 12`:

| profile | status | CNF SHA-256 |
|---|---:|---|
| p4 | SAT | `d1a6dd9ea01db57cf92fa4c0726b1f2dee5ca772dff7c5b8fe11590c40cb1378` |
| p5 | SAT | `650df2bcf999920bef8c2c30b023260fa0fe7a1f4a3f4a6e9feac9e97ded3d07` |

The artifacts are
[`n12_p4_terminal_coverage.json`](n12_p4_terminal_coverage.json) and
[`n12_p5_terminal_coverage.json`](n12_p5_terminal_coverage.json). Their
tracked full-linear replays are again UNSAT, now on three-center
multi-inequality cores. Those raw cores are preserved in the neighboring
`.full_linear.json` files but have not been promoted or counted as new generic
consumers. The result is a negative source-coverage boundary: bisector
localization plus the four-role and six-role terminal families still do not
force one another at arbitrary cardinality from the encoded incidence data.
Continuing literal schema mining here would not supply the missing source
occurrence theorem.

## Lean replay

[`OccurrenceProjectionCountermodel.lean`](OccurrenceProjectionCountermodel.lean)
records both full row tables and blocker maps. Verified Lean checkers prove:

```lean
p4_blockerRowProjection
p5_blockerRowProjection
p4_no_globalSixRoleTriangle
p5_no_globalSixRoleTriangle
p4_exactRow_distribution
p5_exactRow_distribution
```

The first four use the project's permitted `native_decide` boundary because
the direct kernel evaluator exceeds the default recursion/heartbeat limits.
Their exact axiom closure is:

```text
propext, Classical.choice, Lean.ofReduceBool, Lean.trustCompiler, Quot.sound
```

for the blocker projections, and:

```text
propext, Lean.ofReduceBool, Lean.trustCompiler, Quot.sound
```

for the no-occurrence checks. The two cap-distribution theorems use kernel
`decide` and close under:

```text
propext, Quot.sound
```

The module passes warnings-as-errors elaboration and contains no `sorry`,
`admit`, custom axiom, or unsafe declaration.

## What the countermodels do not encode

The following omitted source information could still force a global
occurrence. Ranked by proximity to the missing positive incidence:

1. **Complete ambient radius partitions plus critical support locking.**
   `CriticalShellSystem` carries exact complete four-classes and `no_qfree`,
   not only one row and one blocker edge. Existing complete-radius transport
   lemmas can turn a co-radiality conclusion at a blocker-image center into a
   forced support membership. This is the closest plausible source of a new
   cross-row hit.

2. **The retained frontier pair and its second-apex double-deletion witness.**
   `CriticalPairFrontier F` contributes a further concrete radius-class row
   surviving deletion of both retained class members. It may provide the
   fourth row or shared point absent from the three-row incidence projection.

3. **Full minimality over all witness choices and blocking subsets.**
   The projection enforces strong connectivity for the displayed selected-row
   table. `D.Minimal` is stronger: every way of choosing witnesses is strongly
   connected and blocking-deletion normal forms retain complete restored
   classes. A lift must visibly use that extra choice-independent content.

4. **Nonlinear Euclidean/MEC and `noM44` geometry.**
   The projection has the proved cap-counting bounds but no coordinates, full
   distance equalities, MEC boundary status, nonobtuse support-triangle
   contract, bisector localization, or alternative-triangle exclusion. These
   can rule out a finite incidence model, but no current theorem turns them
   into the required pairwise row-intersection cycle.

## Correct next theorem boundary

Do not try to prove either

```lean
MutualTailTriangleOccurrence P
```

from the fields already packaged in `MutualCompletionSourceIngress`, or a
cardinality-generic global occurrence from the current incidence surface.

The next source theorem must consume at least one ranked omitted field and
produce a **new positive cross-row membership**. The most local useful first
target is:

```text
some later-tail carrier point belongs to both
the exact first-apex complete row and a concrete completion/critical row,
with that second row's center in the fixed blocker image or tied to the
retained second-apex deletion witness.
```

Only after that first shared point is source-proved should the lane ask for the
remaining two pairwise intersections and their cyclic order. Separately, the
fixed `n = 11` Boolean exhaustion may be certified as a cardinality-specific
leaf, but it must not be used as arbitrary-card occurrence evidence.

## Validation

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run \
  scratch/atail-force/unique4-occurrence-feasibility/audit_global_triangle_occurrence.py \
  --cnf /tmp/unique4_global_triangle_n12_p4.recheck.cnf \
  --output scratch/atail-force/unique4-occurrence-feasibility/n12_p4.json \
  --check

UV_CACHE_DIR=/tmp/uv-cache uv run \
  scratch/atail-force/unique4-occurrence-feasibility/audit_global_triangle_occurrence.py \
  --cnf /tmp/unique4_global_triangle_n12_p5.recheck.cnf \
  --output scratch/atail-force/unique4-occurrence-feasibility/n12_p5.json \
  --check

UV_CACHE_DIR=/tmp/uv-cache uv run \
  scratch/atail-force/unique4-occurrence-feasibility/audit_global_triangle_occurrence.py \
  --cnf /tmp/unique4_global_triangle_n12_p4_bisector.recheck.cnf \
  --output scratch/atail-force/unique4-occurrence-feasibility/n12_p4_bisector.json \
  --check

UV_CACHE_DIR=/tmp/uv-cache uv run \
  scratch/atail-force/unique4-occurrence-feasibility/audit_global_triangle_occurrence.py \
  --cnf /tmp/unique4_global_triangle_n12_p5_bisector.recheck.cnf \
  --output scratch/atail-force/unique4-occurrence-feasibility/n12_p5_bisector.json \
  --check

UV_CACHE_DIR=/tmp/uv-cache uv run \
  scratch/atail-force/unique4-occurrence-feasibility/audit_global_triangle_occurrence.py \
  --cnf /tmp/unique4_global_triangle_n12_p4_terminal.recheck.cnf \
  --output scratch/atail-force/unique4-occurrence-feasibility/n12_p4_terminal_coverage.json \
  --check

UV_CACHE_DIR=/tmp/uv-cache uv run \
  scratch/atail-force/unique4-occurrence-feasibility/audit_global_triangle_occurrence.py \
  --cnf /tmp/unique4_global_triangle_n12_p5_terminal.recheck.cnf \
  --output scratch/atail-force/unique4-occurrence-feasibility/n12_p5_terminal_coverage.json \
  --check

cd lean
lake env lean -DwarningAsError=true \
  ../scratch/atail-force/unique4-occurrence-feasibility/OccurrenceProjectionCountermodel.lean
```
