# Five-point Kalmanson terminal bank adapter

Date: 2026-07-16

Scope: source adapter and producer-bank integration audit. The selected-row
consumer has since been promoted to production Lean.

## Result

The production theorem

```text
Problem97.CapCrossingKalmansonBridge
  .false_of_selected_rows_in_five_ccw_order
```

now lives in `Erdos9796Proof.P97.ATail.CapCrossingKalmanson`.
`KalmansonTerminalBankAdapter.lean` kernel-checks the same source-faithful
interface as a smoke adapter:

```text
false_of_selected_rows_in_five_ccw_order
```

It consumes:

- one `ConvexIndep carrier`;
- one shared injective CCW enumeration
  `boundary : Fin carrier.card -> R^2` whose image is `carrier`;
- five indices satisfying `iO < iA < iY < iE < iC`;
- actual `SelectedFourClass` rows centered at `O`, `A`, and `Y`; and
- the six direct support memberships

  ```text
  O,E in support(YRow)
  E,C in support(ORow)
  C,O in support(ARow).
  ```

Each pair of memberships is converted to one distance equality using only
`SelectedFourClass.support_eq_radius`. The resulting equalities are exactly
the inputs to

```text
Problem97.CapCrossingKalmansonBridge
  .false_of_five_ccw_three_shell_equalities.
```

Thus the adapter does not assume naked metric equalities and does not use
support omission, exact-class completeness, minimality, criticality, cap
membership, or a solver result.

## Existing-bank preflight

Before writing the adapter, the required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries were run for cyclic-boundary
selected rows, strict Kalmanson inequalities, and convex-polygon distance
equalities. No existing theorem with this normalized five-point three-row
statement was found. The new scratch consumer is therefore not a duplicate of
a registered bank theorem.

## Exact stored-prefix schema audit

`schema_audit.py` implements the proposed producer-bank matcher without
editing `census/atail_force/producer_bank.py`. It deliberately requires the
three direct support-pair incidences used by the Lean adapter; it does not use
the transitive distance-equality closure.

The checked input is

```text
scratch/atail-force/robust-all-center-marco/bank_cegar_checkpoint.json
sha256 b307fed8cf6c30508a615553f5a1caf8a836859f3d70f1907eb3f34b9196c8b9
```

and its recorded 14-label hull order. The exact replay reports:

```text
stored survivors                         101
forward direct-schema survivors          101
forward direct-schema embeddings         383
reverse direct-schema survivors          101
reverse direct-schema embeddings         418
```

The formerly bank-clean survivor 101 has the canonical forward embedding

```text
O = O, A = A, Y = Y, E = E, C = C.
```

Its stored rows directly contain

```text
YRow.support contains O,E
ORow.support contains E,C
ARow.support contains C,O,
```

and the stored hull order has `O < A < Y < E < C`. Exactly one of the 101
stored survivors currently has zero accepted producer-bank matches, namely
survivor 101, so this schema adds a new accepted reason there and is redundant
but valid on the other 100.

This is **EXACT WITHIN THE STORED CORRECTED 101-WITNESS PREFIX**. It is not an
exhaustive proof that every future corrected survivor contains the schema.

The later clean direct-schema-only corrected CEGAR confirms that caveat:
after 51 successive valid direct cuts, iteration 52 returns
`SAT_DIRECT_SCHEMA_AVOIDING_CORRECTED_SHADOW`.  Thus this theorem is a valid
bank improvement, not a coverage theorem; fixed-profile exhaustion still
requires the generic ordinal strict-cycle consumer or its compressed schemas.

## Proposed `producer_bank.py` integration

The normalized stage should be named along the lines of

```text
equality-convex-five-point-three-selected-row-kalmanson
```

and its core payload should contain exactly the five role labels
`{O,A,Y,E,C}`. A faithful matcher should:

1. validate the supplied cyclic order;
2. index the actual `MetricRow.support` sets by center;
3. scan every cyclic rotation and every increasing five-label subsequence;
4. require one direct row at `Y` containing `O,E`, one at `O` containing
   `E,C`, and one at `A` containing `C,O`; and
5. return the first canonical embedding.

The current `producer_bank.py` ordered loop automatically tests both the
forward and reversed order. The present Lean theorem justifies the **forward
CCW** match. Integration should therefore use a forward-only block until a
separate reverse-orientation/reflection consumer is kernel-checked. It must
not attach the forward theorem name to a reverse-order match merely because
the scratch audit also detects reverse combinatorial embeddings.

The matcher should ignore `MetricRow.exact`: the Lean theorem requires a
selected four-class, not that the chosen row is the complete ambient radius
class. It should also avoid `_row_equality_closure`; accepting a pair equality
assembled through other centers would exceed the present adapter's six direct
membership hypotheses.

The bridge and selected-row consumer now have a production, import-reachable
home. Recommended shared-bank tests are:

- one positive five-label fixture;
- one negative fixture for deletion of each of the three rows;
- one negative fixture where transitive equality closure, but no single row,
  supplies a required pair;
- canonical forward-orientation metadata; and
- replay of the pinned 101-survivor checkpoint hash above.

## Remaining producer and coverage gap

The metric consumer is now closed at the actual selected-row interface. What
is not yet proved on the live K-A-PAIR spine is the structural producer that
selects five live labels and one shared boundary enumeration with the exact
order and six memberships. In particular:

- the stored finite shadows already carry the named order and all selected
  rows, but this is theorem-discovery evidence rather than a Lean extraction
  from the live parent context;
- the current cap/global-index interface must still derive the five strict
  index inequalities from the live cap placement; and
- after adding the schema to the search, a fresh corrected CEGAR run must show
  whether a new schema-avoiding survivor exists. The 101-prefix replay alone
  is not a coverage theorem.

Therefore the consumer-side statement is production-closed exactly, but it
does not by itself close a production `sorry`.

## Validation

The bridge was compiled to a temporary olean and the adapter was then checked
against it from the Lake root. The focused result is success, with

```text
[propext, Classical.choice, Quot.sound]
```

as the complete axiom closure of
`false_of_selected_rows_in_five_ccw_order`. The adapter contains no `sorry`,
`admit`, `native_decide`, or unsafe declaration.

The schema audit was replayed with:

```bash
UV_CACHE_DIR=/tmp/uv-cache-atail uv run python \
  scratch/atail-force/kalmanson-terminal-bank-adapter/schema_audit.py \
  --check --summary
```

and passed every pinned count, schema, checkpoint-hash, and terminal-embedding
assertion.
