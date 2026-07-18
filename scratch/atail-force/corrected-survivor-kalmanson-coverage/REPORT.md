# Current corrected-survivor Kalmanson coverage

Date: 2026-07-18

## Verdict

The current corrected saved stream is ordinally inconsistent, but not by the
new two-row shared-middle-pair schema.

- The reported 101 records are the exact first 101 records of the newer
  143-record checkpoint.
- The newer stream has 143 records and 142 distinct row/blocker assignments;
  record 102 repeats record 101 at the resume boundary.
- All 143 assignments replay successfully against the **current** candidate
  domains and `Surface.verify_model`.
- The direct two-endpoint-row/shared-middle-pair matcher hits **0/143**.
- All **143/143** have a one- or two-step strict cycle using only the two step
  orientations already represented in production
  `ATailOrdinalKalmansonCycle.SelectedRowOrdinalComparison`.
- There are no ordinal residuals, so the promised exact full
  Kalmanson/Farkas LRA phase was not run.

The production-consumer cycle split is:

```text
cycle length 1     89
cycle length 2     54
ordinal residuals  0
```

Restricted back to the historically reported 101-record prefix, the same
production-only selection gives 69 one-step and 32 two-step cycles.

Each certificate is also replayed as a unit-multiplier integer Farkas sum:
the quotient coefficients cancel and the normalized right side is the
positive cycle length.

This is exact coverage of the saved fixed 14-role assignments.  It is **not**
an exhaustive live-parent coverage theorem and does not by itself close a
source `sorry`.  The remaining proof obligation is the producer/extraction
that maps every live parent instance to one of these selected-row cycle
packets (or proves the parent false directly).

## Authoritative input and stale-artifact handling

The authoritative raw stream used here is:

```text
scratch/atail-force/kalmanson-bank-cegar/coverage_checkpoint.json
SHA-256 9cb50339e32eeff34171a706edaec58ac26e21a5b9b1466ef2864e2bd6a7f652
```

It is newer than the 101-record checkpoint and stores current source hashes,
including the improved producer bank.  Its terminal status is
`WALL_BUDGET_FAIL_CLOSED`; this audit uses no claim of exhaustive search from
that status.

The older checkpoint

```text
scratch/atail-force/robust-all-center-marco/bank_cegar_checkpoint.json
SHA-256 b307fed8cf6c30508a615553f5a1caf8a836859f3d70f1907eb3f34b9196c8b9
```

has stale producer-bank provenance, so it is not independently accepted.
Instead, the audit checks byte-for-byte that its 101 raw survivors are the
exact prefix of the current 143-record stream.

The known-stale selection-id checkpoint is explicitly excluded and never
read as input:

```text
census/atail_force/producer_pattern_census_round2_checkpoint.json
SHA-256 d321885769b6e1759205cd49c1c6dade20b8bf3ac7c876337ae70a8ec6ab5d10
```

The current checkpoint's MARCO cuts, old producer-bank matches, and claimed
cut minimality are also ignored.  Only raw row/blocker assignments are used.

## Current semantic replay

For every record, `audit.py` reconstructs the current robust surface and
checks:

1. every named support is exactly the support at its current candidate index;
2. every named blocker is translated through the current role map;
3. `exact_from_blocker_image` agrees with the current blocker image;
4. the total row/blocker assignment passes current `Surface.verify_model`;
5. all stored row and blocker hashes replay;
6. the current `(8,4,5)` cyclic order, cap roles, full first-apex radius
   class, and distinguished labels agree with the stored semantics.

The ordinal checker uses only the selected four-row equality at each center.
It does not silently promote the selected `O` row to the ambient five-class.
The ambient five-class still participates in `Surface.verify_model`, as it
does in the current generator.

Distance variables are unordered endpoint pairs.  Row supports are treated
as unordered sets.  Among the 28 dihedral maps of the cyclic order, fixing
the two apices, `q`, `w`, all three cap sets, and the first-apex full class
leaves only the identity.  Thus there is no unquotiented nontrivial surface
symmetry hiding duplicate certificates.  The only repeated row/blocker
assignment is the explicit 101/102 resume duplicate.

## Direct schema versus generic ordinal consumer

The direct theorem checked in the preceding lane has the incidence shape

```text
a < b < c < d
row a contains b,c
row d contains b,c.
```

No current survivor contains this literal packet.  It therefore cannot be
advertised as coverage of the corrected stream.

The successful normal form is the existing generic production consumer:

```text
Problem97.ATailOrdinalKalmansonCycle.false_of_transGen_cycle
```

Only its two existing constructors are needed:

- audit `k1CancelC` maps to production `diagonalEqLastSide`;
- audit `k2CancelA` maps to production `diagonalEqSide`.

Their occurrence split across the chosen certificates is:

```text
k1CancelC steps  118
k2CancelA steps   79
```

The chosen constructor words are:

```text
k1CancelC                 59
k2CancelA                 30
k1CancelC + k1CancelC      5
k1CancelC + k2CancelA     49
```

Every link between consecutive strict steps includes an explicit path of
selected-row equalities between the corresponding unordered distance terms.
That is the finite bookkeeping a live producer must instantiate around the
already-kernel-checked cycle consumer.

## Orientation-complete regression

The earlier 101-record audit selected shortest cycles before asking whether
their cancellation orientation was represented by the production datatype.
That was an interface risk, even though the inequalities themselves were
sound.

`FullOrdinalKalmansonCycle.lean` checks all eight direct cancellation
orientations and a generic transitive-cycle contradiction.  Lean reports only
the standard trusted axioms:

```text
propext, Classical.choice, Quot.sound
```

The orientation-complete shortest-cycle split is 126 one-step and 17
two-step cycles.  This wider theorem is not needed for current coverage,
because the audit separately finds production-representable cycles for all
143 records.  No production edit is recommended on the basis of this audit.

## Artifacts and replay

- `validated_survivors.json`: current-verifier-derived survivor artifact,
  including normalized rows/blockers and the exact old-prefix relationship.
- `coverage.json`: production-cycle mapping and integer Farkas certificate for
  every record.
- `audit.py`: authoritative reconstruction and certificate generator.
- `verify.py`: independent semantic replay; it does not import `audit.py`.
- `FullOrdinalKalmansonCycle.lean`: orientation-complete scratch regression.

Artifact hashes at this checkpoint are:

```text
d0119ed09ab8e93406eb9bdca1e477f602e0a6ddacec1dd040ef013fba8477b7  FullOrdinalKalmansonCycle.lean
4b084d5708946f3712c28f930e76aa0155c337d8caf2632b42c182eaa26682ae  audit.py
43c685785c2a7570ec4161e5086ab31963630d17c72246a33c2860c740a6fd7a  coverage.json
f0549b114aa6764527b733ae7a5d87b9ad58321c1db998e93af1e8fc6ed3ce4e  validated_survivors.json
170083152fdd3ffcd4afe1d5276d2104373f7610107eabf6c00606dda2449b99  verify.py
```

Commands:

```bash
UV_CACHE_DIR=.uv-cache uv run python \
  scratch/atail-force/corrected-survivor-kalmanson-coverage/audit.py --check

UV_CACHE_DIR=.uv-cache uv run python \
  scratch/atail-force/corrected-survivor-kalmanson-coverage/verify.py

cd lean
lake env lean \
  ../scratch/atail-force/corrected-survivor-kalmanson-coverage/FullOrdinalKalmansonCycle.lean
```

The independent replay result is:

```text
current surface replays       143
production cycles replayed    143
integer Farkas replays        143
direct shared-middle hits       0
status                       PASS
```

Python syntax was also checked with `uv run python -m py_compile`.  The
project environment does not currently provide `ruff`, so no ruff result is
claimed.

## Theorem-bank preflight

Before adding the scratch regression, the registries required by `AGENTS.md`
were searched, including the sibling `p97-rvol` and both legacy general-n
banks.  Focused indexed Lean searches for ordinal selected-row Kalmanson
cycles and shared-middle pairs found the current production declarations
above.  They are reused here; no duplicate production consumer was added.

## Next proof step

Do not run more full-linear mining on these saved assignments.  The exact
residual set at the ordinal layer is empty.

The load-bearing next theorem is a source-faithful aggregate producer from
the large-opposite-caps parent that retains the complete parent packet and
constructs a production `SelectedRowOrdinalComparison` cycle.  The finite
artifacts here provide 142 distinct checked examples and explicit equality
paths for choosing the producer's normal form, but they do not replace the
uniform Lean extraction.
