# FreshThird FirstNonHit — same-blocker metric probe

This directory is a bounded, local QF_NRA feasibility probe for the
`data.sameBlocker × secondInteraction.sameBlocker` arm.  It is not a Lean
producer, a P97 counterexample, or a universal-cardinality result.

The model encodes only named local facts:

* four distinct points `Q1,Q2,C1,C2` on one exact circle about the common
  blocker center `Q`;
* `C1,C2` in a local strict first-cap half-plane, with distinct squared
  distances to a fixed `oppApex1`;
* two retained first-apex radius pairs `P1,P2` and `R1,R2` in that half-plane,
  with exact radii 2 and 3.

The fixed half-plane/frame is a local witness abstraction.  It does not encode
the full carrier, cyclic order, all K4 rows, minimality, exact cap boundary
membership, blocker transport, or the universal `n ≥ 15` ingress.  Therefore a
SAT result only shows that this named local geometry is feasible; it cannot
close `exists_freshThird_firstNonHit_selectedRow_overlap_card_ge_three`.

Run with:

```bash
UV_CACHE_DIR=$PWD/scratch/.uv-cache uv run --offline python \
  scratch/p97-consumer-first/freshthird_firstnonhit_sameblocker_metric_v1/probe.py \
  > scratch/p97-consumer-first/freshthird_firstnonhit_sameblocker_metric_v1/run.json
```
