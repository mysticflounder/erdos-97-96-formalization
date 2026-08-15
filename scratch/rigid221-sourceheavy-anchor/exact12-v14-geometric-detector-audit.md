# Exact-12 normalized-v14 Rigid221 geometric-detector audit

## Verdict

The first usable source-entitled detector is the equality-closure
`equality-duplicate-center` family.  It consumes the decoded v14 row cube
without a boundary-order guess, has a generalized learned row nogood, and has
independent Python and Lean replay support.

Cell 0 is already detected by
`census/global_confinement/metric_realizability_probe.py:_formalized_metric_core`
as

```text
stage = equality-duplicate-center
centers = 2, 3
shared triple = 0, 1, 4
```

`cap_selected_nogood_certificate_probe.py:_certificate_for_detection` emits a
five-row certificate using rows 0--4 of
`scratch/rigid221-sourceheavy-anchor/exact12-v14-cell-0000-canary/model.json`;
`_validate_certificate(..., n=12)` returns true.  Its proof hash is
`c247b4f7ce8a4b64b74360e1c8e4c3661d4ed107af73ad27ea7135d9c33cf409`.

The resulting generalized CNF cut is the negation of those five selected
row-choice literals.  It is a finite learned cut, not universal closure.

## Detector comparison

### 1. Duplicate-center equality closure — recommended

* **Files/symbols:**
  `census/global_confinement/metric_realizability_probe.py:`
  `_duplicate_center_core`, `_duplicate_center_core_from_closure`,
  `_formalized_metric_core`; `census/global_confinement/cap_selected_nogood_certificate_probe.py:`
  `_certificate_for_detection`, `_validate_certificate`.
  Lean consumers are
  `lean/Erdos9796Proof/P97/Census554/EqualityCore.lean:`
  `DuplicateCenterCore`, `not_realizes_of_duplicateCenterCore`, and
  `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/GenericRowNogoodCertificate.lean:`
  `DuplicateCenterNogood`, `DuplicateCenterNogood.check`,
  `DuplicateCenterNogood.not_realizes_of_positiveCheck`.
* **Required facts:** four equality-closure paths witnessing two distinct
  centers equidistant from three pairwise-distinct labels; positive row
  memberships suffice, and the geometric consumer requires `Realizes` plus
  injectivity.
* **Supplied now:** the v14 decoder supplies all 12 row supports and cell 0
  supplies the required closure.  The source ingress supplies a faithful
  carrier pattern, frozen labeling, and source-realized rows through
  `ExactTwelveRigid221SourceSafeIngress.lean` and
  `ExactTwelveRigid221NormalizedV14Ingress.lean`.
  **Missing:** no adapter currently proves that the JSON/finite cell-0 labels
  are the same `Fin 12` row pattern produced by that source labeling.
* **Replay:** Python certificate hashing, closure-path replay, and exact
  `n=12` validation already work.  Lean has cardinality-generic checked
  `DuplicateCenterNogood` soundness and existing exact-12 pilot shards under
  `.../ExactTwelveDuplicateCenterMembershipPilotShards/`.
* **Smallest adapter:** emit a v14 `DuplicateCenterNogood (Fin 12)` record
  from the decoded certificate, check its four paths, and add one theorem
  matching its positive choices against `labeledRowPattern` (or a finite
  reflection lemma for the v14 row-choice encoding).  Then negate exactly the
  certificate's five row-choice literals.

### 2. Ordered `ConvexFivePointCore` / common-two-turn family

* **Files/symbols:** historical
  `scratch/sidecar-sourcefaithful-common-missing-20260807-a7f3c1/ordered_structural_cegar.py:`
  `common_five_point_cores`, `common_orientation_detection`,
  `replay_closure_certificate`, `ordered_coverage`; Lean
  `Census554/ConvexFivePointCore.lean:` `Core`, `false_of_core`; and
  `ATail/FrontierLiveClosure/ExactTwelveRigid221OrderedCoreConsumer.lean:`
  `FrozenBoundaryOrder.false_of_convexFivePointCore`, `false_of_orderedCut_706`,
  `false_of_orderedCut_707`.
* **Required facts:** four closure equalities forming a five-point core,
  source-realized rows, and a common cyclic orientation for `(a,x,b)` and
  `(b,c,y)`.  The historical v18 runner correctly uses the weaker two-turn
  condition rather than one five-label cyclic subsequence.
* **Supplied now:** source code can produce a `FrozenBoundaryOrder` via
  `FrozenRoleLabeling.exists_frozenBoundaryOrder_with_forced_secondCap`; the
  finite cube supplies equality closure.  The decoded survivor has no order
  object, and it does not match the hard-coded 706/707 row patterns.
* **Replay:** Python closure certificates and learned clauses replay.  Lean
  supports the generic core and two concrete cuts, but not a v14 JSON-to-order
  adapter or universal coverage.  The v18 epoch compiler
  `scratch/sidecar-sourcefaithful-common-missing-20260807-a7f3c1/compile_v18_arm_placement_epoch.py`
  also labels source coordinates as provenance only and explicitly does not
  supply a Lean label-renaming theorem.
* **Smallest adapter:** transport the decoded row pattern into the source
  labeling, attach the source-produced boundary order, then scan generic
  cores.  This is a second target after duplicate-center.

### 3. Two-triple six-point Euclidean obstruction

* **File/symbol:**
  `lean/Erdos9796Proof/P97/ATail/TwoTripleRowSixPointEuclideanObstruction.lean:`
  `false_of_six_ccw_two_triple_row_equalities`.
* **Required facts:** six strictly ordered boundary indices and four precise
  distance equalities from two triple rows.  The v14 row cube may provide
  individual equalities, but supplies neither the required ordered-index
  adapter nor a matching v14 certificate schema.
* **Replay/support:** the Lean theorem is available; current v14 Python
  certificate generation and replay do not encode this family.
* **Smallest adapter:** a new certificate carrying the six-label order and
  four equality paths, plus a source boundary-order transport theorem.  It is
  therefore not first.

### 4. Kalmanson / shell-equality families

* **Files/symbols:**
  `lean/Erdos9796Proof/P97/ATail/CapCrossingKalmanson.lean`,
  `KalmansonFourEqualitySchemas.lean`, and the historical optional path
  `scratch/sidecar-sourcefaithful-common-missing-20260807-a7f3c1/ordered_structural_cegar.py`
  (`include_kalmanson`, `detect_selected_row_kalmanson`).
* **Required facts:** strict Kalmanson inequalities, a compatible cyclic
  order, selected-shell/blocker placement, and the exact grouped equalities.
  Current source ingress supplies convexity and a forced second-cap order, but
  not the required blocker-position and equality bridge.  The prior Kalmanson
  audit found the natural `(u,c,xv,xu)` and shared-edge candidates blocked or
  refuted.
* **Replay/support:** historical Python detection is replayable when it fires;
  there is no current exact12-v14 certificate/Lean adapter for this survivor.
* **Smallest adapter:** prove the missing source theorem connecting decoded
  blocker rows to selected shell rows and Kalmanson positions.  This is a
  larger, currently negative target.

## Concrete implementation target

Add the v14 duplicate-center adapter first: certificate JSON/row-choice
emission in the card-head lane, an independently checked generalized CNF
nogood, and a small Lean ingress lemma matching its positive choices to the
source `labeledRowPattern`.  Reuse
`GenericRowNogoodCertificate.DuplicateCenterNogood.not_realizes_of_positiveCheck`;
do not start by generalizing the ordered 706/707 consumers.  This target is
already witnessed by cell 0 and has the shortest missing bridge from finite
replay to source-entitled geometric exclusion.

## Scope boundary

`exact12_v14_cell_run.py`, `exact12_v14_valuation.py`, and
`exact12_v14_bound_jobs.py` currently authenticate one finite cell and its
source-safe incidence constraints.  Their artifacts do not prove aggregate
12-cell coverage, source-to-decoded-cell identification, universal lift, or
terminal Lean closure.  The historical
`scratch/pentagon-offclass-exact12-v2/source_constraint_cegar_v4.py` adds
checked source-derived clauses, but records its source ingress as a Python
adapter and retains the same finite-only boundary.
