# Variable-card Kalmanson connectivity / Farkas coverage audit

Date: 2026-07-17

Status: **SINGLE-INEQUALITY GLOBAL-QUOTIENT COVERAGE REFUTED AT FAITHFUL
CARD 11; SURVIVOR INDEPENDENTLY VERIFIED; SURVIVOR EXACT-LRA UNSAT BY A
KERNEL-CHECKED FOUR-INEQUALITY FARKAS CORE; FULL VARIABLE-CARD COVERAGE STILL
OPEN.**

No production file or plan document was edited, and no production `sorry` is
closed by this audit.

## The decision

The faithful structural surface consists of:

- one four-member non-self selected row at every cyclic carrier vertex;
- pairwise row intersection at most two;
- at most two row centers through any fixed carrier pair;
- the cyclic shared-pair alternation constraint;
- strong connectivity of the selected-row digraph; and
- a total fixed-point-free blocker map whose image omits the two apices and
  whose blocker row contains its source.

`global_equality_quotient_cegar.py` globally unions every distance term
identified by all selected-row equalities.  It rejects a row table whenever
either side pair of one strict K1/K2 inequality is the same multiset as the
diagonal pair modulo that quotient.  A cut contains only the row memberships
on shortest equality paths.  Its complete vertex set includes the four
Kalmanson vertices and every path vertex, and transport is only through
increasing embeddings and order reversal.

At `n = 9`, eight transported schemas exhaust the faithful structural solver
in 16.08 seconds.  This is bounded solver evidence, not a Lean proof.

At the live `n = 11`, second apex `4`, the same search finds an independently
verified survivor after:

```text
attempts                         6
transported quotient schemas   60
observed collision instances   67
embedding cuts              42,658
elapsed                     23.40 s
```

Thus the theorem

```text
faithful structure + global row-equality quotient
  -> one K1/K2 whose two term multisets coincide
```

is false.

The survivor is **not** a full-linear Kalmanson countermodel.  Exact replay
finds this deletion-minimized core:

```text
K2(0,1,3,4)
K1(0,3,4,10)
K2(1,2,3,4)
K2(1,2,4,5)

row 1 equates distances to 0,4,5
row 2 equates distances to 1,3,5
row 10 equates distances to 0,3,4
```

All four strict multipliers are `1`.  After the three row equality classes
are substituted, the four strict forms sum coefficientwise to zero.  Hence
their sum says `0 < 0`.

The hybrid `--full-linear` continuation ran for 180.01 seconds and ended
`UNKNOWN / wall budget` with:

```text
structural attempts             16
transported schemas             98
full-linear checks               5
genuine full-LRA cores           5
single-collision instances     100
embedding cuts              70,932
```

No exact full-linear SAT countermodel was found.

## Kernel-checked consumers

`VariableCardKalmansonConnectivity.lean` checks:

```lean
false_of_six_rows_single_kalmanson_equality_chain
false_of_three_rows_four_kalmanson_farkas_core
```

The first is the exact six-row global equality chain missed by row-local rank
implications.  The second is the all-weights-one four-inequality core above.
Both close over only:

```text
propext
Classical.choice
Quot.sound
```

The separate mathematical audit also isolated two useful staircase
statements, but did not put them in Lean.  Stable proposed names are:

```text
false_of_five_vertex_three_row_kalmanson_staircase
false_of_six_vertex_three_row_kalmanson_staircase
```

The first uses cyclic `a < b < c < e < d` and rows containing respectively
`{b,c}`, `{c,d}`, `{b,d}`.  The second uses cyclic
`a < b < c < x < y < z` and rows equating respectively
`(b,x,z)`, `(a,x,y)`, `(b,y,z)`.  These are prose-proved terminals only, not
kernel-checked declarations in this lane.  They do not establish coverage.

## Exact remaining theorem candidate

The honest variable-card target is now the full positive-dual statement:

> Every faithful whole-carrier four-row system has a finite nonnegative
> combination of strict Kalmanson inequalities, together with unrestricted
> selected-row equality multipliers, whose coefficient vector is zero and
> whose strict part has positive total weight.

Equivalently, every faithful row table reaches a
`KalmansonFarkasConsumer.HomogeneousFarkasCore`.  The useful normal form is

```text
Delta_(a,b)(t) = d(a,t) - d(b,t),
```

which is strictly decreasing beyond `b`; selected-row equalities splice
these comparisons into variable-length staircase/Farkas cycles.

This coverage theorem is **CONJECTURED**, not proved.  Strong connectivity is
only the source of global row closure; the missing load-bearing argument must
turn that closure into a positive Kalmanson dual.  The card-eleven survivor
shows that a bank containing only single-inequality quotient collisions is
not complete.

## Pinned artifacts

- `../generic-biapex-kalmanson-search/global_equality_quotient_cegar.py`
- `../generic-biapex-kalmanson-search/verify_global_equality_quotient.py`
- `../generic-biapex-kalmanson-search/n11_a4_global_equality_quotient_survivor.json`
- `../generic-biapex-kalmanson-search/n11_a4_global_equality_quotient_survivor.verify.json`
- `../generic-biapex-kalmanson-search/n11_a4_global_equality_full_180s.json`
- `VariableCardKalmansonConnectivity.lean`

SHA-256 at handoff:

```text
7d81e96cf1a44d1d262104df6df2176ec66736ed1456bf54876c0646398f02e6  cegar.py
635e181d604b6b187378f334d63c7cdbf8e83b72e60f1f42404acc9f18f2a3ab  global_equality_quotient_cegar.py
443c02fe15873f48ea74d834a6d105913e6ad17521ee79ec161fbeece43a5d46  verify_global_equality_quotient.py
ef84e517bcceb1066e5f4afb6a0cb9576874faab874b7dd486f147fa2797efc7  n11_a4_global_equality_quotient_survivor.json
ddc0834be44dd3e7fbeed715692ada3a6b5c3935e318f69d0132ab3fc5f33c3c  n11_a4_global_equality_full_180s.json
70f7de1f498e0375547ed5e84807144112f223b50c2f1ad091f79270585c38d0  n11_a4_global_equality_quotient_survivor.verify.json
b56cb76c73f8c7d14bef46a2c08548156664ff7796cd6df3f567204e70e3edae  VariableCardKalmansonConnectivity.lean
```

The two Python source hashes above predate only the final backward-compatible
`--random-seed` / `--preload` handoff patch.  Recompute hashes before treating
them as a publication lock.

## Reproduction and portfolio handoff

Single-quotient decision:

```bash
UV_CACHE_DIR=/private/tmp/p97-uv-cache uv run python \
  scratch/atail-force/generic-biapex-kalmanson-search/global_equality_quotient_cegar.py \
  --n 11 --second-apex 4 --wall-seconds 180 \
  --outer-timeout-ms 60000 --summary-only \
  --output scratch/atail-force/generic-biapex-kalmanson-search/n11_a4_global_equality_quotient_survivor.json
```

Independent structural/quotient verification:

```bash
UV_CACHE_DIR=/private/tmp/p97-uv-cache uv run python \
  scratch/atail-force/generic-biapex-kalmanson-search/verify_global_equality_quotient.py \
  scratch/atail-force/generic-biapex-kalmanson-search/n11_a4_global_equality_quotient_survivor.json \
  --output scratch/atail-force/generic-biapex-kalmanson-search/n11_a4_global_equality_quotient_survivor.verify.json
```

Full-linear continuation / seeded portfolio member:

```bash
UV_CACHE_DIR=/private/tmp/p97-uv-cache uv run python \
  scratch/atail-force/generic-biapex-kalmanson-search/global_equality_quotient_cegar.py \
  --n 11 --second-apex 4 --full-linear --wall-seconds 120 \
  --outer-timeout-ms 60000 --metric-timeout-ms 15000 \
  --random-seed SEED \
  --preload scratch/atail-force/generic-biapex-kalmanson-search/n11_a4_global_equality_full_180s.json \
  --summary-only --output UNIQUE_SEED_OUTPUT.json
```

`--random-seed` is threaded through the structural solver, exact metric
solver, and metric-core minimizers.  `--preload` reconstructs every stored
increasing/reversed schema cut before solving and accepts repeated preload
arguments.  Preload construction time counts in reported elapsed time and can
consume a very small wall budget before the first solver call.

Lean validation:

```bash
cd lean
lake env lean -R .. -M 16384 -s 65536 \
  ../scratch/atail-force/variable-card-kalmanson-connectivity/VariableCardKalmansonConnectivity.lean
```

## Caveats

- Structural UNSAT and CEGAR exhaustion are bounded Z3 evidence, not Lean
  coverage proofs.
- The independently verified card-eleven payload is a countermodel only to
  the single-inequality global-quotient coverage claim.  It is full-LRA
  UNSAT, not Euclidean and not a counterexample to the project theorem.
- The 180-second hybrid run is unresolved; five Farkas cores are progress,
  not convergence proof.
- No triangle inequality appears in the displayed four-inequality core.
- The variable-card theorem remains conjectural until either a uniform
  staircase/Farkas coverage proof lands or an exact full-linear survivor is
  produced and independently verified.
