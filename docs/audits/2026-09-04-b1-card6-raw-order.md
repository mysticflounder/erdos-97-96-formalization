# B1 card-six raw-order ingress custody audit

Status: candidate custody complete; NOT PROMOTED.

Lane: `luna-swarm-proofforge-b1-card6-raw-order-20260904`  
Owner: `luna-swarm-proofforge`  
Lane base head: `1e651efdae42220efdeb805d9be3245bbd45f069`  
Build head observed: `e89cc8e05340a0f8ddaa6fee3727ddea8601cdc7`

## Source custody and statement

The frozen ingress source is
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/B1CardSixRawOrderIngress.lean`.
It has 624 lines and SHA-256
`152fad607cec333337f82ab8617cb86713bc89328845a15cf4f5b3965acf342d`.
Its direct imports are
`B1CardSixPointConfigurationIngress` and
`B1LiveSharedPairNonalternationIngress`; it does not directly import the
RoleProjection ingress, the comparison-only Bridge module, or
`TwoDeletionCollision`.

The module defines the alias-collapsed `roleCarrier`, its inclusion into the
ambient carrier, the finite ambient role-index set, the ordered embedding and
its inverse transport, and the raw `SurplusCOMPGBank.btw` order transport.
The exact raw predicate is the negation of the conjunction of the two blocker
pair order-preservation propositions:

```lean
¬ ((btw apex uBlocker u0 ↔ btw apex uBlocker u1) ∧
   (btw apex vBlocker v0 ↔ btw apex vBlocker v1))
```

The declaration `b1LiveSlicesSameBoundaryArc_of_not_rawCardSixBad` constructs
the source-level `B1LiveSlicesSameBoundaryArc` witness from the raw-good
hypothesis.  Its immediate consumer is
`false_of_b1PhysicalClassFiveSixNormalForm_of_liveSlicesSameBoundaryArc` in
`B1LiveSharedPairNonalternationIngress`.  The exported source contradiction
is
`false_of_b1PhysicalClassFiveSixNormalForm_of_not_rawCardSixBad`.

The source marker scan was:

```text
rg -n '\b(sorry|admit|axiom|unsafe|native_decide|implemented_by|extern)\b' \
  lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/B1CardSixRawOrderIngress.lean
```

It returned no matches (exit 1, meaning no matching marker).  No solver or
PIQD run was used.

## Governed build

Command:

```text
LAKE_BUILD_NO_REFRESH=1 lake-build Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1CardSixRawOrderIngress
```

The command exited 0 and recorded `Build completed successfully (10862 jobs)`.
The retained log is
`scratch/runs/luna-swarm-proofforge-b1-card6-raw-order-20260904/run-0001/governed-build.log`
with SHA-256
`1261424a914a57867b2422caad7738c7e0d727fb154aa49b35a9128624b46ada`.
The target replay emitted one target-local pre-existing linter suggestion at
line 264 (`try 'simp' instead of 'simpa'`); it emitted no error.  The log also
contains inherited warnings from the wider replay.

## Kernel declaration and axiom receipt

The retained probe source is
`scratch/runs/luna-swarm-proofforge-b1-card6-raw-order-20260904/run-0001/axiom_probe.lean`
with SHA-256
`bf8676294ef1696ea42cc1954f1edee4c62beac9302810786af3bd5e642d8626`.
It imports the ingress module, runs `#check` on the carrier/index/order/raw
predicate/consumer declarations, and runs `#print axioms` on each.  The
post-build command exited 0 with no warning or error:

```text
lake env lean scratch/runs/luna-swarm-proofforge-b1-card6-raw-order-20260904/run-0001/axiom_probe.lean
```

The output receipt is
`scratch/runs/luna-swarm-proofforge-b1-card6-raw-order-20260904/run-0001/axiom_probe.log`
with SHA-256
`9a1bd92180fe851a0ae3ff1b9a5d36ca51e0eee3be4dec8f8648ec01b3bdcb08`.
Every theorem checked reports exactly `[propext, Classical.choice, Quot.sound]`;
`RawCardSixBad` reports no axioms.  No `sorryAx`, custom axiom, native-reduction,
unsafe, partial, implemented-by, or extern dependency was observed in this
probe.

## Custody records and hygiene

The lane checkpoint is
`.codex/worktree-checkpoints/luna-swarm-proofforge-b1-card6-raw-order-20260904.json`.
Its sorted `owned_paths` and retained `durable_paths` now pass the checkpoint
self-hash `0c27357160ea9fb6f9ea092ea742c08144cd0136c79554618da36d2211087f35`.
The generated-root manifest is
`scratch/runs/luna-swarm-proofforge-b1-card6-raw-order-20260904/run-0001/run_manifest.json`;
its valid self-hash is
`320a5f7509c0c5f086bd01759bc08a91aa0951483de5ecee9f3e3fd72cbf2a43`.
The manifest authenticates the ingress, its two direct imported modules and
`GeneralCarrierBridge`, plus the prototype input, all against the lane base
head above.

The final sparse hygiene command was:

```text
uv run python scripts/check_worktree_hygiene.py report \
  --lane luna-swarm-proofforge-b1-card6-raw-order-20260904
```

It validated the lane checkpoint and run manifest.  The report still lists
shared-worktree foreign dirty/unregistered paths; those were not modified.
The lane’s own paths are the checkpoint, this audit, the frozen ingress, and
the four retained run receipts listed above.

The independent semantic/circularity audit reported in convo #11132 found the
module kernel-clean and noncircular.  This custody lane has not imported the
module into `TwoDeletionCollision`, has not published a Lean-ingress binding,
and has not committed or pushed because foreign staged paths in the shared
repository must first be resolved by their owners.  The next residual after
ingress custody is the exported role-index compatibility/payload package on
`Fin (roleCarrier P).card`.
