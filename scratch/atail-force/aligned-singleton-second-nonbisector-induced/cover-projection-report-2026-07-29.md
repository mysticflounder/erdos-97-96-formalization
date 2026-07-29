# Named-carrier minimality cover projection probe

Date: 2026-07-29

## Scope

`cover_projection_probe.py` imports the live v8 `cegar.py` outer abstraction
without modifying it.  It adds one abstract minimal unique-four cover packet
for each named occurrence whose construction is explicitly certified to denote
a point of `D.A`.

The projection is deliberately non-recursive:

- its target set is exactly the provenance-certified names already in v8;
- a fresh cover center may be anonymous;
- unnamed points completing a selected K4 shell stay anonymous; and
- neither fresh centers nor fillers become new cover targets.

This is only a necessary finite incidence projection.  It is not a model of the
full carrier and it does not establish Euclidean realizability.

## Carrier provenance gate

The script has a literal, independent manifest for five source groups:

1. live base carrier witnesses;
2. the escape center and its selected K4 support;
3. minimality apex-cover centers and supports;
4. minimality cardinality-cover centers and supports; and
5. cap-cardinality carrier witnesses.

The active manifest depends on `--global-tier`.  Before adding any packet, the
script checks:

- every active outer role occurs exactly once in the manifest;
- no certified active role is absent;
- no unknown active outer role exists; and
- all five literal role lists still match the corresponding live `cegar.py`
  constants.

Any mismatch terminates as
`PROVENANCE_OR_CONSTRUCTION_FAIL_CLOSED`.  In particular, the robust-arm role
named `escape` is certified because v8 uses that name for a selected support
point of `be`; the raw robust leaf `escapePoint` is not inserted into the named
set.

## Encoded consequences

For every certified target `x`, the packet records a center `kappa(x)` and a
local row on the existing named quotient.  It enforces:

- `kappa(x) != x`, with zero distance exactly at names aliasing the center;
- compatibility with the live named row if `kappa(x)` aliases a named center;
- one selected radius for packets sharing a center;
- the fully-deletion-robust exclusions (all apices, and `be` in the robust
  arm);
- no packet center covers all three apices;
- selected-radius synchronization with already named unique-four shells; and
- at most two selected named points in common with a distinct known K4 shell.

Lazy validators add cuts for:

- five distinct named quotient points in a packet's selected row;
- four distinct named quotient points at an alternative radius; and
- three shared selected named quotient points for distinct packet centers.

Every lazy cut is evaluated in the current model and must be false there before
it is inserted.  Repeated violations, malformed model values, unstable
readback, solver `unknown`, and all iteration/cut/wall limits have distinct
fail-closed statuses.

## Verification

Syntax compilation and self-test:

```text
uv run python -m py_compile cover_projection_probe.py
uv run python cover_projection_probe.py --self-test
{"schema": "p97-named-carrier-minimal-cover-projection-v1", "self_test": "PASS"}
```

The self-test covers manifest cardinalities `31/43/62`, rejection of an
uncertified role, and the selected-five, alternative-four, and distinct-shell
overlap-three separators.  Each separator is checked to be false in its forced
bad model and to make that assignment UNSAT after insertion.

Bounded live-v8 smoke command:

```text
uv run python cover_projection_probe.py \
  --global-tier local --escape-arm robust \
  --solver-timeout-ms 5000 --wall-timeout-seconds 20 \
  --max-iterations 1 --max-cuts 128 \
  --output cover-projection-local-robust-smoke.json
```

Result:

```text
status: UNKNOWN_FAIL_CLOSED
reason: timeout
named occurrences / cover packets: 31 / 31
solver calls / lazy cuts: 1 / 0
elapsed seconds: 10.460453749867156
probe sha256: 8ad785507997db777a79217216b691d10a34cbb4cc31a995a87311342035b1db
cegar.py sha256: df1605b4aa851fcf7eda97d9081d8b45331bc65509d02c426d092b71dbc152aa
```

All provenance drift flags were false; the unknown-role and missing-role lists
were empty.  The bounded smoke result is therefore correctly terminal
`UNKNOWN`, not SAT or UNSAT evidence.

`uv run ruff check cover_projection_probe.py` was also attempted, but `ruff`
is not installed in the project environment.  Compilation and the purpose-built
self-test above are the completed checks.

## Trust boundary

Even a future `OUTER_UNSAT_SOLVER_EVIDENCE_ONLY` is uncertified Z3 evidence,
not a Lean theorem.  A future `OUTER_SAT_NAMED_COVER_PROJECTION` is only a
fixed point of this necessary named projection, not a full-carrier structure or
a Euclidean-coordinate realization.  Full-carrier alternative-radius
cardinality, anonymous K4 fillers, the minimality producer, and metric
magnitudes remain opaque.
