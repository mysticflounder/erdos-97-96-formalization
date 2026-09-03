# Skeptic audit: `SevenPointSixRowAnchorCollision`

Date: 2026-08-30  
Target: `lean/Erdos9796Proof/P97/Census554/SevenPointSixRowAnchorCollision.lean`

Citation abbreviations: `R` is the target path above; `E` is
`lean/Erdos9796Proof/P97/Census554/EqualityCore.lean`; `S` is
`scratch/runs/b1-exact12-structural-20260830/wave-8/artifacts/minimize-equality-only-c1ce07be0c4de9e71d5c/core-equality-only.smt2`;
`C` is the corresponding `core-result.json`; and `M` is the corresponding
`singular-equality-core-c1ce07be0c4de9e71d5c/summary.json`; `W` is the
corresponding `run_manifest.json`.

## Verdict

**CERTIFIED** for the claims made by the Lean source, with the scope boundary
below.  The exported geometric theorem and its equality-closure wrapper are
kernel-proven.  The finite Z3/Singular artifacts are discovery and provenance
evidence; they do not by themselves prove Lean or P97 coverage.  The source
does not make either of those latter claims.

## Claim labels and scope

| Claim | Classification | Justification |
|---|---|---|
| The file isolates an eleven-relation system on seven labels and packages an equality-closure core. | PROVEN/source-accurate | The module header states exactly this scope (`R:9-14`), and the structure has the seven fields `p,q,t,u,v,a,b` plus eleven closure fields (`R:121-140`). |
| The normalized eleven-relation system is inconsistent. | PROVEN in Lean | The private theorem squares each equality, expands squared distance in coordinates, simplifies the gauge points, and invokes `grobner` (`R:31-73`). The coordinate lemma is a proved alias of `Problem97.dist_sq_coord` (`R:23-26`; `lean/Erdos9796Proof/P97/Foundation.lean:25-29`). |
| The eleven original distance equalities force `p = q`. | PROVEN in Lean | The theorem is universally quantified over seven points (`R:75-88`); under `p ≠ q` it applies the normalizing similarity (`R:89-106`) and derives all normalized hypotheses (`R:108-118`), contradicting the normalized theorem. |
| A closure core has no injective planar realization. | PROVEN in Lean | `EdgeClosure.sound` validates row, flip, reflexive, symmetric, and transitive closure (`E:104-128`); the wrapper feeds all eleven sound equalities to the geometric theorem and contradicts injectivity against `h_pq` (`R:142-163`). |
| The finite run found this motif / a unit ideal. | EMPIRICALLY VERIFIED, discovery-only | `C` explicitly scopes itself to “bounded formula evidence” and excludes universal, geometric, Lean, and proof claims (`C:1-2`); it records 11 atoms and UNSAT after four gauge pins (`C:3-55`, `C:127-141`). The Singular/SymPy records report `UNIT`/`PASS`, 11 generators, and `1 = sum_i cofactor_i * generator_i` (`M:1`; `scratch/runs/b1-exact12-structural-20260830/wave-8/artifacts/singular-equality-core-c1ce07be0c4de9e71d5c/certificate.json:1`). |
| The motif settles a Census-554/P97 global consumer. | NOT CLAIMED / OPEN | The certificate scope expressly excludes “P97 closure claim” (`scratch/runs/b1-exact12-structural-20260830/wave-8/artifacts/singular-equality-core-c1ce07be0c4de9e71d5c/certificate.json:1`), and the target imports only `EqualityCore` (`R:7`) with no whole-bank consumer or coverage theorem. |

## Exact eleven-relation mapping

The artifact labels are mapped as

```text
0 ↦ p,  1 ↦ q,  2 ↦ t,  3 ↦ u,  4 ↦ v,  6 ↦ a,  7 ↦ b.
```

Label `5` is an unused eighth point in the finite artifact.  It occurs in the
declared variable list but in none of the 11 generator polynomials, so dropping
it leaves the displayed seven-label system unchanged.  The artifact's atom
list is explicit (`C:3-48`), and its gauge is `0=(0,0)`,
`1=(1,0)` (`C:50-55`, `M:1`).

The run manifest binds the same `core-result.json` digest used by the
certificate (`W:2-5`, `W:18-20`) and records the wave-8 root and owner
(`W:7-17`).  This authenticates retained run bookkeeping, not a Lean or
mathematical proof.

| # | Lean relation | Artifact atom / SMT assertion | Check |
|---:|---|---|---|
| 1 | `p-u = p-q` (`R:78`) | `(0,3)`, `S:30` | `0→p`, `3→u`, `1→q` |
| 2 | `p-v = p-q` (`R:79`) | `(0,4)`, `S:31` | `4→v` |
| 3 | `p-a = p-q` (`R:80`) | `(0,6)`, `S:32` | `6→a` |
| 4 | `q-t = q-p` (`R:81`) | `(1,2)`, `S:33` | `2→t` |
| 5 | `q-a = q-p` (`R:82`) | `(1,6)`, `S:34` | `6→a` |
| 6 | `q-b = q-p` (`R:83`) | `(1,7)`, `S:35` | `7→b` |
| 7 | `t-q = t-p` (`R:84`) | `(2,1)`, `S:36` | exact reversal/orientation |
| 8 | `u-t = u-p` (`R:85`) | `(3,2)`, `S:37` | exact |
| 9 | `u-v = u-p` (`R:86`) | `(3,4)`, `S:38` | exact |
| 10 | `v-b = v-q` (`R:87`) | `(4,7)`, `S:39` | exact |
| 11 | `b-a = b-p` (`R:88`) | `(7,6)`, `S:40` | exact |

The normalized Lean hypotheses preserve this same order and orientation
(`R:33-42`), while the application supplies them one-for-one (`R:106-118`).
The certificate entry names and polynomial generators independently record the
same center/target pairs (`scratch/runs/b1-exact12-structural-20260830/wave-8/artifacts/singular-equality-core-c1ce07be0c4de9e71d5c/certificate.json:1`).

## Normalization and Groebner argument

The contradiction branch first assumes `p ≠ q` (`R:89`).  `normSim` sends
`p` and `q` to `(0,0)` and `(1,0)` and scales every distance by the same positive
factor's reciprocal, using `normSim_dist_image`, `normSim_fst`, and
`normSim_snd` (`R:90-102`; `lean/Erdos9796Proof/P97/U2/SimilarityNormalization.lean:69-81`,
`lean/Erdos9796Proof/P97/U2/SimilarityNormalization.lean:91-129`).  `map_dist_eq`
cancels the common factor and transports each original equality (`R:103-105`).

The normalized theorem uses only implications that are valid in the needed
direction: equality of nonnegative distances is squared by `congrArg`
(`R:44-54`), then each squared distance is expanded (`R:66-72`).  No
unsound square-root converse or inequality assumption is used.  The final
`grobner` call is part of the Lean proof term (`R:73`), so its result is
kernel checked.  The external certificate reports a QQ unit identity with 11
generators, 596 cofactor terms, and maximum cofactor degree 6, and its recorded
fresh-process replay is `PASS` (`M:1`; `scratch/runs/b1-exact12-structural-20260830/wave-8/artifacts/singular-equality-core-c1ce07be0c4de9e71d5c/certificate.json:1`).  That
external identity is not imported by the target: the target's only import is
`EqualityCore` (`R:7`); it is corroborating finite evidence, not the Lean
proof ingress.

## Equality-closure wrapper soundness

`Realizes` requires exactly row-wise equidistance and injectivity
(`E:51-56`).  The `row` constructor of `EdgeClosure` requires
both support memberships, and `EdgeClosure.sound` discharges it from
`Realizes.equidist`; `flip` uses `dist_comm`, and `symm`/`trans` compose equality
(`E:106-128`).  Therefore each supplied closure field in the
core structure yields the corresponding metric equality.  The wrapper invokes
the collision theorem for all eleven fields (`R:148-162`) and obtains a
point equality, which injectivity contradicts with `core.h_pq` (`R:163`).
There is no exact-row, convexity, cardinality, or distinctness premise hidden
in this wrapper; none is needed for this equality-only obstruction.

The sibling `lean/Erdos9796Proof/P97/Census554/SevenPointSixCircleCollision.lean`
uses the same independently checked architecture—normalized coordinate
contradiction (`lean/Erdos9796Proof/P97/Census554/SevenPointSixCircleCollision.lean:24-73`),
similarity transport (`lean/Erdos9796Proof/P97/Census554/SevenPointSixCircleCollision.lean:76-118`),
and closure wrapper (`lean/Erdos9796Proof/P97/Census554/SevenPointSixCircleCollision.lean:120-163`)—but it is not an import dependency of the audited target. It is useful as a consistency comparison, not as evidence for the target's theorem.

## Actual transitive sorry/axiom graph

I ran an import-based Lean `#print axioms` check against the current target
module.  The results were:

```text
Problem97.dist_sq_coord                                      [propext, Classical.choice, Quot.sound]
Problem97.normSim_dist_image                                [propext, Classical.choice, Quot.sound]
Problem97.normSim_fst                                       [propext, Classical.choice, Quot.sound]
Problem97.normSim_snd                                       [propext, Classical.choice, Quot.sound]
Problem97.Census554.EqualityCore.seven_point_six_row_anchor_collision
                                                               [propext, Classical.choice, Quot.sound]
Problem97.Census554.EqualityCore.not_realizes_of_sevenPointSixRowAnchorCollisionCore
                                                               [propext, Classical.choice, Quot.sound]
```

Thus the transitive closure of both exported target declarations contains no
`sorryAx`, custom axiom, `Lean.ofReduceBool`/native trust marker, `unsafe`,
`partial`, or external certificate axiom.  The source files inspected also
contain no `sorry` declaration (`R:1-167`, `E:1-388`).  This is an axiom-closure check of the compiled
Lean declarations; a fresh `lake-build` of the target was not run in this
audit.  It does not establish reachability from a P97 aggregate consumer.

## Bottom line

The theorem labels are accurate and the target is **CERTIFIED** as a
kernel-proven, generic seven-label equality obstruction.  The finite solver
artifacts accurately identify the same 11 relations after the explicit
seven-label map, with one irrelevant unused artifact label.  The result remains
a local theorem/wrapper milestone only: no finite miner coverage, arbitrary
P97 consumer, or global Problem 97 closure follows from it.
