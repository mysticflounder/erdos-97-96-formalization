# B1 card-six projected PointConfiguration audit

Lane: `luna-swarm-slice-ingress-b1-card6-projected-point-configuration-20260904`

Base head: `e89cc8e05340a0f8ddaa6fee3727ddea8601cdc7`

The owned source is `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/B1CardSixProjectedPointConfiguration.lean`, importing the frozen raw-order ingress.  Its final SHA-256 is `1c72e862eae6a72505e1d90b88fe1b080ca13c404d915a11f7c2a6608c3aeae1`; it has 621 lines.  The source marker scan for `sorry|admit|axiom|unsafe|native_decide|implemented_by|extern` is clean.

The governed build receipt is `scratch/runs/luna-swarm-slice-ingress-b1-card6-projected-point-configuration-20260904/run-0001/governed-build.log`.  It reaches `[10863/10863]` and builds the target successfully.  The resulting `.olean` is `lean/.lake/build/lib/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/B1CardSixProjectedPointConfiguration.olean` with size 419792 bytes.

The build wrapper then attempted a best-effort proof-blueprint resync and reported an unrelated stale private declaration, `_private...B1CardSixRoleProjectionIngress...ambientRoleIndex_injective`.  This does not downgrade the successful Lean target build.

The run manifest is `scratch/runs/luna-swarm-slice-ingress-b1-card6-projected-point-configuration-20260904/run-0001/run_manifest.json`; its canonical manifest SHA-256 is `03150b2faaf1a1dcbcbfc9e0f32f4db281c239fbfbf14da8bf7f822e817dd8c2`.  The lane checkpoint is `.codex/worktree-checkpoints/luna-swarm-slice-ingress-b1-card6-projected-point-configuration-20260904.json` with SHA-256 `9cf282dcc86681816b0da5174b2055cf41b7766c232e5ef334c6db4c21db97a6`.

The axiom probe source is `scratch/runs/luna-swarm-slice-ingress-b1-card6-projected-point-configuration-20260904/run-0001/axiom_probe.lean` and its receipt is `scratch/runs/luna-swarm-slice-ingress-b1-card6-projected-point-configuration-20260904/run-0001/axiom_probe.log`.  All seven probed declarations report exactly `[propext, Classical.choice, Quot.sound]`; none reports `sorryAx`.

No PIQD launch, import, or commit was performed.  Monitor review remains pending.
