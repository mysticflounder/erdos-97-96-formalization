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
