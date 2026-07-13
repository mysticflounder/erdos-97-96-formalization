# ATAIL critical-row coupling checkpoint — 2026-07-13

## Result

The scratch certificates `critical_row_coupling.lean` and
`triple_relabel_adapters.lean` kernel-check the routine interfaces and the
T1/T3 orbit reduction without editing the concurrently owned Route-B source
file.

1. Two `CriticalRowPacket`s with equal centers and equal selected `l1` points
   have equal radii and therefore equal full exact four-shell supports.
2. The two comparison maps passed to
   `u1_largeCap_routeB_tail_liveData_false` consequently identify the entire
   sixth-row support with `rows.rowAt source` whenever `f2 := t2[0]` collides
   with that named source.
3. A card-at-least-two lower bound on the off-surplus intersection of the two
   full apex-radius filters extracts exactly the distinct pair and four radius
   equations consumed by the existing Route-B sink.
4. If the sixth-row source `f2 := t2[0]` collides with `t1`, permuting the
   dangerous triple from `(t1,t2,t3)` to `(t2,t1,t3)` turns the transferred
   `t1Row` into the existing pair consumer's `t2Row`. The full fixed-triple,
   five-row, live-data, and base-pairwise packets all transport.
5. The symmetric `(t1,t3,t2)` relabeling handles an `f2 = t3` collision.
   Thus the 24 LIVE-T1 and 24 LIVE-T3 textual leaves are not independent
   mathematical residuals: after these adapters are wired, all 48 depend on
   the single existing K-A-PAIR residual.

Validation command, from the Lake root:

```bash
lake env lean ../scratch/atail-force/critical_row_coupling.lean
lake env lean ../scratch/atail-force/triple_relabel_adapters.lean
```

This exited zero on 2026-07-13. The direct command is intentional for this
unimported scratch certificate; it reads the existing imported build and does
not run a repository-wide build.

## Scope

This is a normalization checkpoint, not the ATAIL producer theorem.

- It upgrades the live source-collision comparison from one label to the full
  exact shell, so future LIVE-Q/T1/T3 proofs should not re-enumerate shell
  membership merely to recover that equality.
- It does not contradict the surviving T1/T3 source-collision cells. Those
  cells can consistently have the common support with different slot
  permutations. Instead, the relabel adapters bypass those permutations and
  feed the common support to K-A-PAIR. The two-center cap argument remains
  load-bearing.
- It does not add the sixth row to
  `DoubleApexOffSurplusSharedRadiusPair`; the five-row pair and six-row live
  theorem surfaces remain distinct.
- The content-bearing open statement is still the card-at-least-two lower
  bound for the joint full-filter fiber, or an equivalent immediate
  contradiction from the same on-spine hypotheses.

`triple_relabel_adapters.lean` intentionally imports the current Route-B pair
consumer, so its two terminal theorems inherit the pair residual's `sorryAx`.
Their contribution is a checked dependency reduction, not a new proof of
False. Once K-A-PAIR is closed, they are ready to replace the entire T1/T3
slot-enumeration blocks; until then those 48 leaves remain open on the kernel
spine.

## LIVE-C contract audit

The seven named `liveData_C_*` helper statements were checked against the
actual `CriticalRowPacket` interface, the mandatory theorem-bank registries,
and:

```bash
nthdegree docs search --lean \
  "CriticalRowPacket center equals q t1 t2 t3 u contradiction source center collision"
```

The indexed matches are the existing `center = p` reductions already used by
the parent, not a generic consumer for the other center cases. The theorem
`CriticalRowPacket.center_ne_source` closes a subcell only after the blocker
center is also identified with the extra row's source `t2[0]`. None of the
seven helper contracts provides that source equality. Nor do they provide the
p-centered exact-dangerous `t2Row` center/support hypotheses consumed by
K-A-PAIR. Thus there is no direct whole-helper reduction on the current
contracts. This is a bounded negative audit, not a nonexistence result.

This session is anchored at LIVE-T1. The shared Route-B parent is owned by a
different live session, so this checkpoint makes no edit to that source.

## cvc5 cross-engine terminal

The released compute lease ran the same seven frozen full-inequality systems
through one sequential, effective-nice-10 cvc5 1.3.3 nonlinear-coverings
process. V1 was aborted when the live audit caught sandbox priority denial;
it wrote no result. V2 passed its priority and SAT/UNSAT smoke gates, then all
seven cases reached the exact statusless timeout diagnostic in 219.217
seconds.

The raw V2 parser labeled those signal exits `ERROR`. The solver-free
`cvc5_pilot_checkpoint.py` validates the immutable raw result and normalizes
only the exact `returncode = -6`, null status, 30--35 second elapsed, and
`cvc5 interrupted by timeout.` shape. Its mutation test rejects diagnostic
drift. Final histogram: 7 `TIMEOUT`, zero SAT candidates, zero UNSAT proposals,
and no mathematical claim.

## Order-fan kernel checkpoint

The blind full-system pilots were solver bottlenecks, so the next experiment
kept the frozen six-interior-point representative but reduced its order data.
The metric, disk, nonobtuse, and cap-side base is SAT. Adding the first seven
cyclic-order inequalities, the fan based at the oriented edge `v2 -> s1`, is
repeatably Z3-UNSAT across seeds 0, 1, and 2. Conservative deletion leaves 15
constraints involving the Moser frame and three support points.

That UNSAT proposal has an independent solver-free proof. The theorem
`Problem97.ATAILForceScratch.orderFanKernel` in `order_fan_kernel.lean`
normalizes the isosceles Moser frame, derives that the two ordered surplus
points lie below the base, compares their opposite-apex chord lengths, and
combines the resulting upper bound with the opposite-cap point's Cauchy lower
bound. The direct Lean check exits zero.

The geometric pattern is narrow: two ordered surplus points are respectively
shared with the two adjacent apex classes, and one member of the second class
lies in the indicated opposite cap. `order_fan_coverage.py` checks all six
simultaneous center relabelings and all 167,782 selected-four order
decorations. Exactly 39 systems in 21 joint classes match; 36 have one matching
relabeling and 3 have two. Thus 167,743 surface systems do not match this
kernel. This is exact combinatorial coverage of the current decision surface,
not geometric inventory coverage of a live leaf.

The analogous first-edge fan was also tried on the other six frozen support
sizes for five seconds each. All six returned `UNKNOWN`. This has no
realizability or impossibility content. The result is therefore a proved
narrow cut and a template for extracting further small order theorems, not a
full-filter producer and not closure of K-A-PAIR.

Reproduction, from the repository root:

```bash
PYTHONPATH=. .venv/bin/python scratch/atail-force/order_fan_minimize.py --timeout 1
PYTHONPATH=. .venv/bin/python scratch/atail-force/order_fan_coverage.py
PYTHONPATH=. .venv/bin/python scratch/atail-force/edge_fan_strata.py
```

Lean validation, from `lean/`:

```bash
lake env lean -M 16384 ../scratch/atail-force/order_fan_kernel.lean
```

No leaf-to-inventory bridge, full exact-radius-filter pair, or main-source
consumer is claimed.

## Complete m=6 edge-fan diagnostic

`m6_edge_fan_scan.py` exhausts the seven S3-representative classes with six
interior points, all 25 representative order decorations, and all nine
oriented polygon edges: 225 bounded edge-fan queries at 250 ms each. The
order-free base histogram was 7 `SAT`, 12 `UNKNOWN`, and 6 `UNSAT`; after an
edge fan was added, the histogram was 26 `SAT`, 155 `UNKNOWN`, and 44 `UNSAT`.
These are solver statuses, not classifications. In particular, many fan hits
inherit an order-free contradiction and no timeout is promoted either way.

The six order-free UNSAT rows are exactly the four decorations of class 2422
and the two decorations of class 2472. Both class-orbit proposals were then
minimized and proved independently; no longer timeout was used to classify
the remaining rows.

## Two order-free cap kernels

For class 2472, conservative deletion reduces the 45-constraint base to eight
hypotheses. `bisector_cap_kernel.lean` proves the resulting theorem
`bisectorCapKernel`: equal-radius data put both the Moser apex and a shared
opposite-cap point on the base perpendicular bisector, while the two strict
cap signs are additive inverses and cannot both be positive.

For class 2422, the solver retains twelve hypotheses. The explicit proof in
`two_circle_cap_kernel.lean` removes one further unused cap inequality and
proves an eleven-hypothesis theorem. The shared `p2` point forces the Moser
apex strictly left of the base midpoint; the `q2` two-circle equations and cap
signs force it strictly right. This proof uses a bounded 800,000-heartbeat
allowance for normalization and no solver, certificate importer, or new
axiom.

The exact simultaneous-S3 union matcher checks all 167,782 decorations:

- `orderFanKernel`: 39 systems / 21 classes;
- `bisectorCapKernel`: 66 systems / 18 classes;
- `twoCircleCapKernel`: 24 systems / 6 classes; and
- union: 129 systems / 45 classes, with no overlap between the three cuts.

Thus 167,653 selected-four systems survive all three checked kernels. The
order-free results are better theorem-bank seeds than the original fan, but
the exact union count rejects continued blind local-kernel mining as a closure
strategy unless a new forcing principle makes one of these patterns
unavoidable. The next primary target is the live full-filter/critical-row
producer.

Reproduction, from the repository root:

```bash
PYTHONPATH=. .venv/bin/python scratch/atail-force/m6_edge_fan_scan.py --timeout-ms 250
PYTHONPATH=. .venv/bin/python scratch/atail-force/m6_base_minimize.py --class-id 2472 --timeout 1
PYTHONPATH=. .venv/bin/python scratch/atail-force/m6_base_minimize.py --class-id 2422 --timeout 1
PYTHONPATH=. .venv/bin/python scratch/atail-force/kernel_union_coverage.py
```

Lean validation, from `lean/`:

```bash
lake env lean -M 16384 ../scratch/atail-force/bisector_cap_kernel.lean
lake env lean -M 16384 ../scratch/atail-force/two_circle_cap_kernel.lean
```

These are exact scalar implications and exact combinatorial decision-surface
counts. They do not establish live-leaf inventory coverage, the full-filter
shared pair, or an on-spine consumer.
