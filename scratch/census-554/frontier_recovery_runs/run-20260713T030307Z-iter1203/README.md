# Census-554 frontier iteration 1203 recovery

Status: **CERTIFIED, NOT PUBLISHED TO THE LIVE BANK**

The source cube is the frontier printed at
`scratch/census-554/frontier_loop.log:14687`. The recovery used an immutable
5,884-row bank snapshot with SHA-256
`0d5ef140da27c709d21392db4fdc090ea7ef613585d0257d9a5bde8556c0cafe`.
It did not acquire the live driver lease, use the shared worker queue, modify
`bank.jsonl`, or write into `certs/`.

## Recovered motif

```json
{
  "0": [2, 3, 5],
  "10": [0, 3, 4, 5],
  "2": [4, 10],
  "3": [2, 4],
  "5": [2, 3, 4]
}
```

- minimum induced support size: 6;
- support: `{0, 2, 3, 4, 5, 10}`;
- equality generators: 9;
- profile-orbit size: 12;
- novel against the exact 5,884-row snapshot: yes;
- deletion-minimal under the exact deadness oracle: yes;
- certificate kill: `multi_pair`;
- Rabinowitsch pairs: `(4,5)` and `(5,10)`;
- certificate generators: 11 (nine equality generators plus two
  Rabinowitsch generators);
- exact rational identity verification: passed.

The certificate proves that the equality system forces at least one of the
two listed point-pair squared distances to vanish. Candidate cubes require
distinct points, so the motif is impossible in a valid realization.

## Lean formalization

The recovered motif now has a generic, kernel-checked formulation in
`lean/Erdos9796Proof/P97/Census554/SixPointTwoPairCollision.lean`. Under the
role map

```text
A = 0, B = 2, C = 3, D = 4, E = 5, F = 10,
```

its nine equality generators imply `D = E ∨ E = F`; the consumer
`Problem97.Census554.EqualityCore.not_realizes_of_sixPointTwoPairCollisionCore`
therefore rules out every injective planar realization containing the closure
core. The theorem is generic in the label type and does not depend on the
finite Census-554 search or trust the external Singular certificate.

`GeneralCarrierBridge` includes the new core, and the working-tree structural
oracle exposes it as `equality-six-point-two-pair-collision`. Exact replay on
the recovered cube finds roles `(0,2,3,4,5,10)`, nine replayable closure paths,
and all 12 profile-orbit images. The focused theorem and aggregate bridge
builds pass. Axiom audits of both the core consumer and aggregate bridge report
exactly `propext`, `Classical.choice`, and `Quot.sound`.

This completes the mathematical formalization and runtime detector. It does
not publish a Nullstellensatz-bank row or change an already running oracle:
the live process remains bound to its launch-time oracle snapshot until a
separate preservation-safe transition.

## Evidence

- `frontier_cube.json`: durable source cube and original log provenance;
- `bank.snapshot.jsonl`: exact bank boundary used for novelty;
- `dead_supports.json`: the recovered six-point induced support;
- `shrink_progress.json`: completed deletion-minimality checkpoint;
- `mine_worker_output.json`: resumable exact-miner output;
- `mined_candidates.json`: validated candidate inventory;
- `cert_worker_output.json`: raw Singular certificate-worker output;
- `verified_certificate.json`: exact-checker-approved certificate, SHA-256
  `955f41b1cd04f07ab7d3ddfac7b6e47dd4ce2216f98cec2caf4b4d90ab9b0360`;
- `result.json`: non-publishing terminal summary.

Selection used `intracap.pattern_dead3`, the exact iterated Singular saturation
oracle. Certification used the independent Singular lift in
`miner.certify_pattern`, followed by `verify_certs.verify_cert`, which rebuilt
the generators from the pattern and checked the full identity over exact
`Fraction` coefficients.

Publishing this motif is a separate operation. It should go through the normal
bank transaction and canonical-deduplication path only after rechecking that
the live bank still has the recorded digest or explicitly reconciling any rows
added since this snapshot.
