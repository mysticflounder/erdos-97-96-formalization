# Global-K4 five-row terminal: existing bank match

## Outcome

The retained `O,D,E,I,F` subsystem does not need a new 195 KB
Nullstellensatz consumer.  The live production matcher
`producer_bank.scan_all_formalized_cores` recognizes two orientations of the
already kernel-checked
`Problem97.Census554.FourPointTwoCircleBisectorOrderCore`.

The closure-facing route is the existing arbitrary-carrier bridge
`FourPointTwoCircleBisectorOrderBridge.false_of_three_rows_and_cyclic_subsequence`.
It uses only the retained rows centered at `I`, `O`, and `E`; the retained
`D`- and `F`-centered rows are unnecessary for this consumer.

The live producer selecting these named rows and memberships from K-A-PAIR
remains **OPEN**.  This artifact closes the consumer audit, not that producer.

## Exact roles and fields

The pinned numeric/name map relevant here is

```text
I = 12, O = 0, E = 8, J = 7.
```

Use the reverse boundary orientation and instantiate the bridge as

```text
q = I, u = O, y = E, v = J,
cyclic subsequence q,u,y,v = I,O,E,J.
```

The six required row-membership fields are:

```text
u_mem_q : O is in the I-centered row
y_mem_q : E is in the I-centered row
y_mem_u : E is in the O-centered row
v_mem_u : J is in the O-centered row
u_mem_y : O is in the E-centered row
v_mem_y : J is in the E-centered row
```

These are present verbatim in the retained supports:

```text
I-centered (12): [O(0), X(3), J(7), E(8)]
O-centered  (0): [A(1), C(2), D(6), J(7), E(8)]
E-centered  (8): [O(0), Y(4), J(7), F(13)]
```

The bridge constructs `IO = IE` directly from the I row.  It constructs
`OJ = EJ` by chaining `OJ = OE` from the O row with `EO = EJ` from the E row,
using distance symmetry and transitivity.  The reverse cyclic subsequence
supplies the negative same-side orientation used by
`FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg`.

The matcher also finds the forward core
`Q=I(12), U=J(7), Y=E(8), V=O(0)`, consumed by `false_of_core`.  The reverse
orientation is preferred here because the existing production
`ThreeRowSupportData` bridge exposes exactly the six fields above.

## Exact-CAS side result

For audit completeness, Singular produced a rational lift for the original
16-polynomial normalized subsystem.  An independent SymPy/QQ replay rebuilt
all 16 generators from the pinned rows, checked the polynomial-stream hash
`2a2968b306d27ed9f8b6f8be3b4ee19d7b438713456fa7949dcaa15131a1b5b0`,
verified the identity exactly, and rejected a deliberately mutated
coefficient.  Eleven columns are nonzero, with 2,421 multiplier terms and
maximum degree 6.

The attempted pure-kernel `by decide` replay did not reduce the large
certificate to `isTrue` after the bounded direct Lean run.  That failed
closed, and the generated scalar adapter did not validate.  No
`native_decide` fallback was pursued because the small production bank match
makes the large generated consumer redundant.  `FiveRowUnitReplay.lean` is
therefore an unvalidated experiment, not a theorem artifact and not a
production candidate.

## Validation

From the repository root:

```bash
UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run python \
  scratch/atail-force/global-k4-extension/analyze.py --check

UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run python \
  scratch/atail-force/global-k4-extension-unit-replay/verify_certificate.py

UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run python \
  scratch/atail-force/global-k4-extension-unit-replay/bank_match.py --check
```

The small Lean adapter is validated separately from `lean/`:

```bash
lake env lean -M 16384 \
  ../scratch/atail-force/global-k4-extension-unit-replay/ExistingBankAdapter.lean
```

Observed axiom closure for
`false_of_retained_I_O_E_row_memberships` is the ordinary Mathlib quotient
closure only: `propext`, `Classical.choice`, and `Quot.sound`; in particular,
no `sorryAx`, `Lean.ofReduceBool`, or `Lean.trustCompiler`.
