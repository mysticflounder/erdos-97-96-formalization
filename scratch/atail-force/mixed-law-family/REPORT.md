# Mixed-law family: equalities AND disequalities (2026-07-25)

Lane for the anchor goal
`Problem97.ATailFrontierLiveClosure.false_of_frontierAllLargeCapsBiApexRobustResidual`
(`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:249`), profile
`(6,6,6)`, carrier cardinality `>= 15`, general in `n`.

## Why this lane exists

Every law mined in `lcap14-global-parent-surface/` is pure-equality, and that is
a property of the oracle, not of the mathematics.  `eqonly_direct.py:213` links
Boolean co-radiality atoms to real distances **one way**:

```text
ev(y,u,v)  ->  d(y,u) = d(y,v)
```

A false atom therefore constrains nothing, and a metric realization is free to
satisfy extra equalities the Boolean layer explicitly forbids — the layer's N
block caps each co-radiality class at four.  So no pure-equality bank, at any
support or atom count, can express a law of the form "these equalities FORCE a
further equality".  `lcap14-global-parent-surface/REPORT.md` identifies laws of
exactly that shape as the missing general-n content for the covering step.

The layer carries an `ev` variable for every (center, unordered pair) triple, so
a layer model fixes the **complete** equality pattern of the distance table.
The faithful oracle is therefore biconditional: assert an equality for every
true atom and a **disequality** for every false one.

## Result 1: no geometric forced-equality law exists at support 4 or 5

`pattern_family.py` decides every complete pattern on `k` points.  A complete
pattern is a tuple of set partitions, one per center, of the other `k-1` points;
deciding all of them is exhaustive at `k = 4` and `k = 5`.  Each UNSAT pattern
is classified by two further oracle calls:

- **equality-only UNSAT** — refuted by its equalities alone, so its
  disequalities are inert and it is already pure-equality bank content;
- **algebraic** — UNSAT under positivity alone, with triangle and Kalmanson
  dropped, so it is a consequence of equality-graph transitivity, which the
  Boolean layer's T block already enforces;
- **geometric forced-equality** — neither of the above: genuinely new content.

| k | raw patterns | dihedral classes | equality-only UNSAT | realizable | forced-equality | of those algebraic | **geometric** | unknown | seconds |
|---|---|---|---|---|---|---|---|---|---|
| 4 | 625 | 100 | 54 | 24 | 22 | 22 | **0** | 0 | 0.1 |
| 5 | 759,375 | 76,731 | 72,355 | 1,813 | 2,563 | 2,563 | **0** | 0 | 138.1 |

Both rows account exactly (54+24+22 = 100, 72,355+1,813+2,563 = 76,731).

Asserting the complete pattern is the strongest possible use of disequalities at
a given support, so this is not a sampling result: **the disequality half of the
oracle is provably inert below support 6.** Any forced-equality law the covering
step needs has support `>= 6`.

Gates, all clean (`--smoke`, 15 checks): the generic all-disequality pattern is
realizable, so the encoding is not vacuously UNSAT; the known two-atom Kalmanson
law is UNSAT with equalities only and stays UNSAT with the full complementary
disequality set; **minimizing that complete pattern discards every disequality
and recovers exactly the two equalities**, so `minimize` cannot manufacture a
fake forced-equality law; each single atom of that law is separately
satisfiable; the equilateral law classifies as algebraic and the Kalmanson law
as geometric, so the filter separates transitivity from geometry; partition
counts match the Bell numbers; the dihedral group has order `2k` and
canonicalization is invariant under it.

## Result 2: n = 10 is open on content, not on budget

`avoid_probe.py` is UNSAT at `n = 8` and `n = 9` and undecided at `n = 10`
(complete family, 29.4 M clauses, 400 s timeout).  A timeout leaves open whether
a bigger bank would flip it.  `probe_model_test.py` settles that without
deciding the big instance.

Every probe blocking clause comes from one source: a schema the support-local
axioms refute.  So if a probe model's complete pattern is realizable under those
axioms, no schema of that family — banked or not, any support, any atom count —
can embed in it, since an embedding would transport unsatisfiability into a
satisfiable system.

- The 21-schema support-`<=`5 bank plus `--cover --geometry` **reproduces the
  recorded UNSAT verdicts at `n = 8` and `n = 9`**, which validates the build
  path against the lane's results.
- At `n = 10` it is SAT (2,880 vars, 88,220 clauses, 1.0 s).  The model is
  audited in plain python, independently of the solver: all-center K4 holds, the
  maximum class is exactly 4, **all 10 centers are critical**, and the
  minimality cover is complete.  So it is the live structure, not a degenerate
  one.
- The biconditional oracle refutes that model's complete pattern in **0.0 s**.

So the family has real content at `n = 10` and the bank simply lacks it.  The
`n >= 10` frontier is a bank-completeness question, not a solver-budget one, and
refine-and-block is affordable at the probe layer where it was not at the
pure-equality cap layer.

## Result 3: probe-level CEGAR

`probe_cegar.py` runs the loop the previous two results justify: solve the
cardinality-free probe layer (all-center K4, minimality shell cover,
partition-level geometric families), read the model's complete equality pattern,
refute it with the biconditional oracle, mine a tracked core, minimize it over
atoms of **both** signs, and block every order-preserving placement.

Blocking matches `avoid_probe.build` exactly: for each `k`-subset image, both
reflections and all `k` rotations, a positive atom contributing `-eq` and a
negative atom contributing `+eq`.  `avoid_probe.py:200` already handles signed
atoms, so mined mixed laws feed straight back into the existing probe.

Gates, all clean (`--smoke`, 10 checks): the core extractor returns exactly the
two positive atoms of the Kalmanson law; `minimize_core` is idempotent on an
already-minimal law and strips the inert disequalities off a complete pattern;
the generic pattern is not refutable; `reindex` preserves cyclic order;
`placements` reproduces `avoid_probe`'s own count (`C(6,4) * 2 * 4 = 120`) and
polarity convention, and a mixed law yields a clause with a positive literal.

Verdicts: `LAYER-UNSAT` (probe layer plus mined laws contradictory at that `n`;
every law support-local, so the law SET is general-n while the UNSAT is at that
`n`), `DECISIVE-SAT` (a model no law of the family can refute, so the covering
route cannot reach that `n`), `BUDGET`.

## Scope limits, stated

- A `LAYER-UNSAT` verdict at one `n` is not the general-`n` terminal.  What is
  cardinality-free is the mined law SET, because each law is support-local.
  Closing the terminal needs a bounded local configuration that the live
  hypotheses force at **every** `n >= 15`; the all-center-K4 constraint is not
  inherited by a sub-configuration, so that forcing step is a separate
  obligation and is not established here.
- The support-local axiom family (positivity, strict triangle, both strict
  Kalmanson per cyclic 4-subset) is a **relaxation** of planar realizability.
  UNSAT is therefore a sound refutation at every `n`; SAT is not a realizability
  claim.
- The support-4/5 exhaustiveness above is exhaustive **for complete patterns at
  those supports**, under that axiom family.  It says nothing about support 6+,
  where `lcap14-global-parent-surface` found 11,245 pure-equality schemas up to
  6 atoms.

## Counting is closed on this terminal

Recorded here because it removes a whole family of attempts, using the repo's
own proven bounds rather than estimates:

- `Dumitrescu.perpBisector_apex_bound` (`P97/Dumitrescu/L1.lean:128`) gives
  bisector capacity `<= 2` per pair, so pair capacity is `2*C(n,2)` against a
  K4-at-every-vertex demand of `6n`: slack from `n >= 7`.
- `eq_of_equidistant_three_noncollinear` (`P97/U5GlobalIncidenceBasic.lean:129`)
  forces distinct centers' 4-classes to share `<= 2` points, so the classes form
  a pair-multiplicity-`<=`2 packing — the same `Theta(n^2)` versus `Theta(n)`
  slack.
- `docs/closure-plan-full-spec-2026-07-09.md:2294` already records the checked
  `4 * V.card <= D.A.card` (and the cap-local `2 * V.card <= (D.A \ cap).card`)
  as "a stronger packing boundary, not a cardinality contradiction for unbounded
  carriers", and line 5116 records `|A| <= 4 * |image(centerAt)|` with every
  `centerAt` fiber `<= 4` as "arithmetically slack at card 12 and even card 13".
- The terminal's own hypothesis `N` gives all three caps `>= 6`, i.e. a **lower**
  bound `|A| >= 15`, which loosens every packing inequality it touches.

So the closing content is a forced law, not a count.

## Result 4: order-free placement (2026-07-25)

`avoid_probe.build` places every schema **order-preservingly**, over
`C(n,k) * 2k` images.  That convention is forced by the axiom family: the strict
Kalmanson inequalities are asserted per cyclic 4-subset and so presume the
support sits in that cyclic order.  A law refuted in **every** relabeling of its
support carries no such presumption and may be placed over all `k!` images.

`order_free.py` measures this by deciding each law under all `k!` relabelings.
(Dropping Kalmanson is NOT the right test — see the gate below.)

| k | complete family | **order-free** | order-dependent | mean relabeling coverage |
|---|---|---|---|---|
| 4 | 7 | **0** | 7 | 0.619 |
| 5 | 398 | **96** | 302 | 0.758 |

Clause content per law, order-preserving vs order-free: `k=4` is 3x at every n;
`k=5` is 12x — at `n = 15`, 30,030 vs 360,360.  So the 96 order-free support-5
laws afford roughly 2.9 M clauses at `n = 10` against 761 K for the remaining
302 placed order-preservingly: about 3.7 M total, an order of magnitude under
the 29.4 M that the complete support-6 family costs at the same n.  **Not yet
run** — this is the next experiment.

### `u1TwoLargeCapObstruction` is stronger than this lane's oracle

The registry-named sibling theorem (`lean/RVOL/P97/U1TwoLargeCapObstruction.lean`)
is 5 points, 7 equality atoms, conclusion `False`, with **no** convexity or
cyclic-order hypothesis:

```text
(h1 : dist c a = dist c d)  (h2 : dist c a = dist c f)
(h3 : dist d c = dist d e)  (h4 : dist d c = dist d f)
(h5 : dist f a = dist f d)  (h6 : dist f a = dist f e)
(h7 : dist e a = dist e c)  : False
```

- The relaxation refutes it in **120/120** relabelings, so it is certifiably
  order-free, consistent with the theorem having no order hypothesis.
- It is **SAT under positivity + strict triangle**, so it is a PLANAR fact, not
  a metric-space one.  This is why the first version of the classifier was
  wrong: "survives dropping Kalmanson" is not order-freeness, and the gate
  caught it — a Lean-proven order-free law was being rejected.
- Consequence: no amount of mining against a metric relaxation produces this
  law.  It is content the lane's oracle cannot reach.

`proven_probe.py` runs the probe layer against it, order-free versus an
order-preserving control so any flip is attributable to placement rather than to
the law.  Result: `n = 8` UNSAT and `n = 9` UNSAT under both placements;
`n = 10` **SAT under both** (+30,240 order-free clauses, 118,460 total), with the
model auditing as all-center K4, all 10 centers critical, cover complete — and
its complete pattern still oracle-refuted.  So one order-free law, at 12x
content, does not flip `n = 10`; the bank is still incomplete there.

### Candidate pool of proven laws

`proven-metric-laws.json` extracts 150 declarations from
`certificates/p97_rvol_general_n_mining.json` whose statement concludes `False`,
mentions `dist`, and binds no carrier/convexity structure.  **Caveat, stated:**
these are candidates, not 150 usable schemas — the pool includes area, disk and
lane hypotheses, and a naive binder count identifies only `u1TwoLargeCapObstruction`
itself as being in the pure equality-atom shape.  How many are usable as
order-free schemas is not determined here.

## Route arithmetic, as measured

The covering route needs the complete support-6 family at the residual's
cardinality.  Measured costs: 29.4 M clauses at `n = 10` (timeout, per
`lcap14-global-parent-surface/REPORT.md`) and `C(15,6) * 12 * 11,245 = 675 M`
clauses at `n = 15`.  Lazy mining does not avoid this — `probe_cegar.py` at
`n = 10` mines support-6 3-atom laws one at a time, i.e. it re-derives members of
an 11,245-law family, and the per-iteration cost is dominated by the CaDiCaL
solve (12.5 s at 1.05 M clauses, >100 s as clauses accumulate).  This is an
instrument limit, not a budget question.

Order-free placement is the one lever that raises content without raising the
law count, and the 96 order-free support-5 laws are the untried configuration.

## Result 5: the order-free configuration is RUN, and negative (2026-07-25)

`orderfree_probe.py`, complete support-`<=`5 bank (405 schemas) on the probe
layer, with the 96 order-free laws placed over all `k!` images against an
order-preserving control differing in nothing else:

| configuration | placement clauses | total clauses | verdict | build | solve |
|---|---|---|---|---|---|
| order-preserving control | 235,620 | 1,286,480 | SAT | 6 s | 86 s |
| **ORDER-FREE** | **1,413,720** | 2,464,580 | **SAT** | 17 s | 49 s |

Both models audit as all-center K4, maximum class exactly 4, all 10 centers
critical, cover complete — the live structure — and **both complete patterns are
still refuted by the biconditional oracle**.  So 6x the placement content from
the same laws does not flip `n = 10`, and the missing content is genuinely at
support `>= 6`.

## The covering route cannot reach this terminal

Stated unequivocally, with the measurement behind each step:

1. Pure-equality cap layer at `n = 15` `(6,6,6)`: stalls at 30–36 laws /
   ~2.5 M clauses under eager, lazy and hybrid blocking, and an `n = 15`
   verdict would not close a general-`n` obligation regardless.
2. Biconditional oracle: the disequality half is **provably inert below support
   6** (exhaustive at support 4 and 5, accounting closing exactly).
3. Probe-layer lazy CEGAR: mines support-6 3-atom laws one at a time, i.e.
   re-derives an 11,245-law family, solve-dominated (12.5 s at 1.05 M clauses,
   >100 s as clauses accumulate).
4. Complete support-`<=`5 bank, order-preserving: SAT at `n = 10`.
5. Complete support-`<=`5 bank, **order-free** — the maximal placement any
   support-5 law admits: SAT at `n = 10`.
6. Therefore the required content is support `>= 6`, whose cost is 29.4 M
   clauses at `n = 10` (measured timeout) and
   `C(15,6) * 12 * 11,245 = 675 M` at `n = 15`.

Step 5 is the load-bearing one: it exhausts the placement axis, which was the
only lever that raises content without raising the law count.  Steps 2 and 5
together mean no support-`<=`5 law of any polarity, under any placement, refutes
the `n = 10` layer — while the terminal needs `n >= 15`.

This is an instrument limit, not a budget question.  The terminal's closing
content is a forced geometric law at support `>= 6`, or the positive-incidence
facts the closure plan names on the minimal-deletion arms
(`docs/closure-plan-full-spec-2026-07-09.md:2307-2317`): physical-second-apex
co-radiality of the collision pair; one repeated outside pair at a second
same-cap center; a rank or nonreturn theorem for the installed-singleton arm.

## Result 6 — the Lean-proven support-6..8 family does not force

Result 5 concluded that the closing content must live at support `>= 6`, and
that mining it from the support-local relaxation costs 29.4 M clauses at
`n = 10`.  It does not have to be mined: the sibling banks already contain
proven laws at that support, and they were missed because of two shape
conventions rather than any mathematical difference.

`mine_support6.py` scans all six census files named by the repo's mandatory
theorem-bank registry — 2,930 unique declarations — for the pure equality-atom
shape.  Under a strict reading it finds exactly **one**, at support 5:
`u1TwoLargeCapObstruction`, the law already known to this lane.

`mine_radius_laws.py` relaxes two conventions that carry no content:

* **implicit point binders.**  `{p q a b c u x y : R^2}` states the same law as
  the explicit form; implicit-vs-explicit is elaboration, not mathematics.
* **the scalar radius witness.**  The large `p97-rvol` families bind
  `{r : R} (hr : 0 < r)` and write `dist p q = r`, `dist p a = r`,
  `dist p b = r`.  That says exactly that `q, a, b` are equidistant from `p` —
  center atoms at `p`, with `r` eliminated by transitivity.

`r` is eliminable **iff** its `= r` edges share a common vertex.  A star at `p`
gives center atoms; a non-star family such as `dist p q = r` together with
`dist t1 t2 = r` asserts a unit-distance equality between two edges with no
shared endpoint, which the probe layer's `eq_{center}_{left}_{right}` variables
cannot express.  Those are reported and **not** emitted — 98 of them.

The result is **29 laws in the exact shape `avoid_probe.build` consumes, 21 of
them at support `>= 6`**: nine at `k = 8`, four at `k = 7`, eight at `k = 6`,
carrying 9 to 18 atoms each.  All nineteen source files exist in the sibling
`p97-rvol` tree and are free of `sorry` and of `axiom`.  The census records them
`source-proved`; per its own note that is not a kernel axiom audit, and none was
run here.  None carries a convexity or cyclic-order hypothesis, so each is
order-free **by the theorem** rather than by this lane's relaxation oracle, and
admits placement over all injective images `P(n,k)`.  Injective placement also
discharges each law's distinctness hypotheses, since distinct indices are
distinct points.

Placed into the probe layer (`proven6_probe.py`):

| laws placed | n | placement clauses | total | verdict |
|---|---|---|---|---|
| support 6 (8 laws) | 8 | 161,280 | 179,496 | UNSAT |
| support 6 (8 laws) | 9 | 483,840 | 525,312 | UNSAT |
| support 6 (8 laws) | 10 | 1,209,600 | 1,297,820 | **SAT** |
| support 6+7 (12 laws) | 10 | 3,628,800 | 3,717,020 | **SAT** |

The `n = 8` and `n = 9` rows reproduce the recorded verdicts, so the placement
is calibrated.  Note the direction: the layer is UNSAT at 8 and 9 and SAT at 10,
so **added points give added freedom**.  Raising `n` toward the terminal's
`>= 15` makes the layer more satisfiable, not less; no larger-`n` run can
recover an UNSAT the `n = 10` run lost.

Placing the support-8 block would cost `P(10,8) = 1,814,400` clauses per law,
16.3 M for the block.  `embed_check.py` decides the question without spending
it.  Placement is only a way of asserting "no model contains this pattern", so
instead: solve the **base** layer, take a model, and search each proven law for
an injective embedding directly.  No embedding for any law means that model
avoids the whole family, and no placement budget can change that.

The search is backtracking with propagation over the atom list, not brute force
over `P(n,k)`; it is smoke-tested on all 21 laws against their own atom sets
(positive), against the empty pattern (negative), and for injectivity and
per-atom satisfaction of every embedding returned.

| n | base model | proven laws embedding |
|---|---|---|
| 10 | SAT, all-center K4, max class 4, cover complete | **0 of 21** |
| 15 | SAT, all-center K4, max class 4, cover complete | **0 of 21** |

`n = 15` is the terminal's own cardinality.  A base-layer model at that
cardinality avoids the entire Lean-proven support-6..8 family, so placing those
laws cannot refute the layer at any budget.

The avoidance is not a coarse structural mismatch.  The `cover` block forces
every center's largest radius class to be exactly 4, and a law needing a class
of size `>= 5` at some center could never embed in any cover-complete model at
any `n`.  Measured per law, **0 of 21 require a class of size `>= 5`** — every
one has max class exactly 4 or 3.  The patterns are therefore compatible with
the layer's structure and simply are not forced to occur.

### Scope of Result 6

This eliminates the sibling proven bank as a source of the covering step's
closing content, at the terminal's own cardinality.  It says nothing about
whether the terminal is true, and it does not shrink the `sorry` at
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:249`.  What it removes
is the assumption that a support-`>= 6` forced law already exists in the mined
banks and merely needed wiring: it does not, and the 21 that come closest are
avoidable at `n = 15`.

## Result 7 — the robustness field closes n = 10 and nothing above it

Results 5 and 6 exhausted the law axis: no support-`<=`5 law under any
placement, and no Lean-proven support-6..8 law, refutes the layer.  So the
closing content must be a FIELD the layer abstracts away rather than a law it
fails to contain.

`FullyDeletionRobustAt` is the strongest field the terminal carries, and at
`FrontierLiveClosure.lean:249` it holds at BOTH opposite apices:

    lean/Erdos9796Proof/P97/ATail/DeletionRobustness.lean:27
    structure FullyDeletionRobustAt (D : CounterexampleData) (center : R^2)
      survives : forall z in D.A, HasNEquidistantPointsAt 4 (D.A.erase z) center

Deleting any single carrier point still leaves a 4-point equidistant class at
that apex; equivalently the apex carries a class of size `>= 5` or two disjoint
classes of size `>= 4`.  The `cover` block encodes the opposite property — a
critical center whose shell is its ONLY `>=4` class — and says nothing about
robust centers, so this is new content, not a re-encoding.

`robust_apex_probe.py` transcribes the Lean structure quantifier for quantifier:
for each deleted point `z`, some 4-subset of the survivors is pairwise co-radial
at the apex.  No paraphrase, so a verdict is about the terminal's own field.

The encoding is smoke-tested against a known result in both directions.  At
`n = 5` a center has four others and any deletion leaves three, so robustness is
unsatisfiable on its own clauses; at `n = 6` five others survive any deletion
with exactly four remaining, so it is satisfiable.  **The smoke test caught a
real bug**: the first version skipped the obligation when fewer than four
survivors remained instead of asserting it unsatisfiable, and reported SAT at
`n = 5`.  Every verdict below is post-fix.

| n | robust centers | verdict | model max class |
|---|---|---|---|
| 10 | 0 | SAT | 4 |
| 10 | 1 | **UNSAT** | — |
| 10 | 2 | **UNSAT** | — |
| 11 | 2 | SAT | — |
| 12 | 2 | SAT | — |
| 13 | 2 | SAT | — |
| 14 | 2 | SAT | — |
| 15 | 0 | SAT | 4 |
| 15 | 1 | SAT | 5 |
| 15 | 2 | SAT | 6 |

This is the first field in this lane that refutes the `n = 10` layer at all —
every law-based route left it SAT.  The threshold is sharp at 10/11.

At `n = 15` the model escapes by growing a radius class to size 5, then 6.  That
suggests a class-size cap as the missing content, so it was tested directly: an
added constraint forbidding any radius class larger than 4, at `n = 15` with
both apices robust, is **still SAT** (4,339,122 clauses).  Capping class size
does not close it either; the escape at `n = 15` is simply room.

### Scope of Result 7

The `n = 10` UNSAT is not transferable to the terminal.  `all_center_K4` and the
shell cover are NOT hereditary — a 10-point subset of a 15-point configuration
need not have each of its ten centers holding four co-radial points *within the
subset* — so UNSAT at `n = 10` does not restrict `n = 15`.  And the layer's
direction is the wrong one for scaling: it is UNSAT at `n = 8, 9` and SAT at
`n = 10` even before robustness, so added points give added freedom.

Taken with Results 5 and 6, everything encodable in this layer has now been
tried at the terminal's own cardinality — all-center K4, the shell cover,
bisector capacity, interleaving, circle-pair, the complete support-`<=`5 bank
under maximal placement, 21 Lean-proven support-6..8 laws, full deletion
robustness at both apices, and a class-size cap — and `n = 15` remains SAT under
all of it.  The closing content is not cardinality-free and not pattern-local.

What the layer structurally cannot see is `D.Minimal`: it is a statement about
the non-existence of a smaller counterexample, not a constraint on this
configuration's radius pattern, so no amount of clause content in this encoding
can express it.  That is the remaining field, and it is where the terminal's
proof has to come from.

### Result 7 addendum — the robust-count sweep returned no verdict

A sweep at `n = 15` over 3, 5, 8, 11 and 15 fully-robust centers was run to
locate how much robustness the terminal's cardinality would need.  It was killed
at its 3000 s timeout **without completing the first point**, and wrote no
results file.  So `n = 15` with three or more robust centers is UNMEASURED here:
not SAT, not UNSAT, no verdict.

For contrast, at `n = 15` the same layer with two robust centers solves in 1 s
(SAT).  That gap is suggestive but is not evidence — SAT solving times are not
monotone in instance difficulty, and a timeout is not a verdict.  Recorded so a
later session does not mistake the gap for a measurement.

An independent incidence-level measurement of the "all three apices robust"
configuration is recorded at
`docs/audits/2026-07-24-all-large-caps-terminal-route-inventory.md:452` as SAT.
That is a different and weaker encoding than this one; it is cited here because
it bears on the same question, not because it settles this run.
