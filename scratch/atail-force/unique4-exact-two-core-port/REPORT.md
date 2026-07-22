# Exact-two strict-cap-hit Kalmanson core port

Date: 2026-07-22

Scope: scratch-only audit and Lean port of the smallest new strict Kalmanson
schema found by the exact-two strict-cap-hit overlay.  This lane does not edit
the shared bank, search scripts, closure documents, or production Lean.

The six-round run ended `ROUND_CAP_REACHED_UNRESOLVED`.  Thus the overlay did
not close either fixed finite projection: every round still had SAT Boolean
survivors before the next exact cut.  It added ten exact-Farkas-verified
Kalmanson schemas and one source-proved U5 schema (catalog index 56) to the
shared search bank.

## Result

The exact-two run produced a genuinely new five-role terminal schema.  In
increasing boundary order

```text
i0 < i1 < i2 < i3 < i10
```

it needs only the following six selected-class memberships:

```text
center i0:  {i2, i10}
center i1:  {i2, i3}
center i2:  {i3, i10}.
```

[`ExactTwoKalmansonCore.lean`](ExactTwoKalmansonCore.lean) proves the
cardinality-generic consumer

```lean
Problem97.ExactTwoKalmansonCoreScratch
  .false_of_two_k2_three_selected_classes
```

from exactly those memberships and the shared convex-boundary contract.  The
proof uses the `K2` inequalities on `(i0,i1,i2,i3)` and
`(i0,i2,i3,i10)`.  The first inequality and the `i1` class give

```text
dist i0 i3 < dist i0 i2,
```

while the second inequality and the `i2` class give

```text
dist i0 i10 < dist i0 i3.
```

The `i0` class identifies `dist i0 i2` with `dist i0 i10`, producing a
strict cycle.

The Lean file passes warnings-as-errors elaboration.  The printed axiom
closure is exactly:

```text
propext
Classical.choice
Quot.sound
```

There is no `sorry`, `admit`, custom axiom, `native_decide`, or unsafe
declaration in the file.

## Exact source and normalization

The source is the exact-two round-three card-five artifact copied to
[`round3_opp1_5.full_lra.json`](round3_opp1_5.full_lra.json).  Its literal
core has seven constraints:

```text
kal2_0_1_2_3
kal2_0_2_3_10
row_0_2_10
row_1_0_2
row_1_0_3
row_2_1_3
row_2_1_10
```

The copied artifact was independently replayed with
`generic-biapex-kalmanson-cnf/verify_farkas_core.py`.  The durable output
[`round3_opp1_5.farkas.verify.json`](round3_opp1_5.farkas.verify.json)
records exact rational QF_LRA UNSAT, cancellation of every variable
coefficient, and SAT after every single literal-constraint deletion.

The Lean interface is smaller than that literal core.  A
`SelectedFourClass` directly equates any two of its support points, so the
reference memberships `i0 ∈ Row1.support` and `i1 ∈ Row2.support` are
not needed.  The six remaining memberships are recorded in
[`kalmanson_schema.proposed.json`](kalmanson_schema.proposed.json).

## Comparison with the existing ten kernel consumers

The round-three survivor was produced after all 38 then-banked Kalmanson
schemas had been installed and checked under every recorded order-preserving
and reflected embedding; ten of those entries had kernel-checked Lean
consumers.  The survivor passed all 11,800 installed embeddings.  Since the
six-membership normalized schema is a subset of that survivor's incidences, no
one of those ten consumers embeds into it.

The only earlier kernel consumer with fewer roles is
`false_of_one_k1_three_cyclic_selected_rows`.  Its four-role incidence graph
and its `K1` inequality are different.  Among the five-role entries,
`false_of_one_k2_two_k1_three_selected_rows` has a different six-membership
graph and uses one `K2` plus two `K1` inequalities.  The present two-`K2`
cycle is therefore a materially distinct terminal, not a renaming of an
existing one.

Round four rediscovered the same normalized five-role schema: its longer
fixed-first-pair `K2` path compresses to the first endpoint inequality above.
That is confirmation of the normalization, not a second theorem.

The complete literal-core size audit was:

| round | card-four core | card-five core | disposition |
|---:|---:|---:|---|
| 1 | 16 | 10 | new, but larger after normalization |
| 2 | U5 miss | U5 schema 56 | source-bank refinement |
| 3 | 12 | **7** | selected five-role terminal |
| 4 | 14 | 9 | card-five normalizes to the same terminal |
| 5 | 16 | 16 | larger |
| 6 | 16 | 15 | larger |

No round exposed a four-role schema or a consumer interface smaller than the
round-three six-membership pattern.

## Source-occurrence boundary

This theorem is a contradiction consumer only.  The exact-two overlay proves
that finite `n = 11` projections can exhibit this incidence pattern before the
corresponding cut is installed.  It does **not** prove that
`OriginalUniqueFourResidual`, at arbitrary carrier cardinality, must contain
an order-preserving or reflected occurrence of the pattern.

The remaining source theorem would have to produce five boundary-ordered
carrier points and selected classes with the six displayed memberships from
the exact-two first-apex class distribution plus the full parent data.  No
such occurrence theorem is claimed here, so this scratch port closes no
production `sorry` by itself.

## Shell-curvature follow-up

[`CURVATURE_AUDIT.md`](CURVATURE_AUDIT.md) replays the production
shell-curvature consequences against all 12 stored exact-two survivors.  The
exact rational result is:

```text
record_count = 12
all_scalar_ledgers_unsat = true
all_have_four_separated_arc_witness = false
all_have_four_turn_disjoint_arc_witness = true
```

Eleven records match the stronger production separated-arc terminal.  The one
exception has four quarter-turn arcs whose open edge-turn supports are disjoint
although adjacent endpoint intervals overlap by one vertex.  The
cardinality-generic theorem

```lean
Problem97.ShellCurvature
  .false_of_four_turnDisjoint_quarter_turn_arcs
```

is now kernel-checked in the sibling scratch lane
`unique4-turn-disjoint-curvature-terminal/` and consumes exactly that weaker
shape.

This does not change the source-occurrence boundary.  Eight of the 12 finite
records have no five-role Kalmanson embedding, and four need at least one
completion row whose center is outside the fixed blocker image.  The production
critical-shell curvature adapter therefore does not directly cover those four;
a selected-four-class adapter is routine but still unimplemented.  More
importantly, the finite records do not prove that an arbitrary-cardinality
`ExactTwoStrictHitDistribution` contains four turn-disjoint transported arcs.
That uniform aggregate occurrence theorem is the first mathematical gap.

## Validation commands

```bash
UV_CACHE_DIR=/private/tmp/codex-uv-cache uv run python \
  scratch/atail-force/generic-biapex-kalmanson-cnf/verify_farkas_core.py \
  scratch/atail-force/unique4-exact-two-core-port/round3_opp1_5.full_lra.json \
  --output \
  scratch/atail-force/unique4-exact-two-core-port/round3_opp1_5.farkas.verify.json

cd lean
lake env lean -DwarningAsError=true \
  ../scratch/atail-force/unique4-exact-two-core-port/ExactTwoKalmansonCore.lean
```
