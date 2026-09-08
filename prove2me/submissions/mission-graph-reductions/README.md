# Upper mission-graph reductions

This packet fills the three missing reduction layers above the already-published
mission milestones:

    Erdos9796Mission.combined
    ├── Erdos9796Mission.problem97
    │   ├── Erdos9796Mission.counterexample_card_ge_nine
    │   ├── Erdos9796Mission.finite_nine_exclusion
    │   └── Erdos9796Mission.minimal_counterexample_removable
    └── Erdos9796Mission.problem96
        ├── Erdos9796Mission.problem97
        └── Erdos9796Mission.linear_bound_of_problem97

The Problem 97 reduction reproduces the strong-induction assembly from
lean/Erdos9796Proof/P97/UniversalProblem97.lean in the mission's
self-contained vocabulary. The counting theorem forces a counterexample to
have at least nine points. The finite theorem rules out exactly nine points.
Above nine points, the strong-induction hypothesis gives minimality and the
removable-point theorem produces a smaller counterexample, a contradiction.

The counting input follows the isosceles-count route of Dumitrescu, *On
Distinct Distances from a Vertex of a Convex Polygon*, Discrete &
Computational Geometry 36 (2006), 503–509,
DOI [10.1007/s00454-006-1262-y](https://doi.org/10.1007/s00454-006-1262-y).
The cap-witness refinements are attributed to Nivasch, Pach, Pinchasi, and
Zerbib, *The number of distinct distances from a vertex of a convex polygon*,
Journal of Computational Geometry 4 (2013), arXiv
[1207.1266](https://arxiv.org/abs/1207.1266). These citations document the
counting route's provenance. The Lean strong-induction reduction is this
project's own formalization.

The Problem 96 reduction applies the already-proved
linear_bound_of_problem97 bridge to the Problem 97 theorem and takes its
Problem 96 conclusion. The combined reduction pairs the two headline results.
These imports are what create the missing upper edges in Prove2Me's theorem
graph.

Run the local, network-free validation:

    uv run python submissions/mission-graph-reductions/upload.py --dry-run

After reviewing and committing the packet, submit in the fixed dependency
order with:

    uv run python submissions/mission-graph-reductions/upload.py --execute

Execution reads the API key from ~/prove2me_workspace/credentials.json.
The uploader verifies every target ID, exact target statement, dependency ID,
and theorem name before submitting. It writes receipt.json atomically. Each
multipart body has a package-derived boundary, and its digest is saved as a
POST intent before the request. A rerun polls a recorded submission ID and
skips accepted work. If interruption leaves an intent without a submission
ID, the uploader refuses to repeat that POST while the target remains open.
If the target is already proved, it records that remote state and sends
nothing.

Local validation completed on 2026-09-08 used Prove2Me's Lean v4.33.1 / Mathlib
0df444a360eaa60ab8c11dca51a86af692955474 workspace. An isolated exact
proof-body probe compiled all three reductions and reported only the declared
child theorems plus core axioms. A second validation compiled the exact six
published theorem stubs into an isolated object tree and then checked all three
solution files through their actual `Theorems.Thm_*` imports. All three direct
module-import checks succeeded. validation.json records the source, log,
object hashes, and trust classification. The generated objects are retained under
`scratch/runs/prove2me-upper-reductions-20260907/run-0001/artifacts/olean/`.

No Prove2Me request was made while preparing this packet.
