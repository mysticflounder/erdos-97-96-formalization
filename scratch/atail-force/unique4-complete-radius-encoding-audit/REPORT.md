# Unique-four complete-radius encoding audit

Date: 2026-07-22

Scope: the two complete-radius clause families in
`unique-arm-whole-carrier-source-audit/exact_four_outer.py`, their independent
semantic replay, and the two obsolete `n = 11` no-packing fixtures.  This lane
changes no shared encoder, verifier, or Lean source.

## Result

**PROVEN at the Boolean encoding level:** both clause families have the correct
implication polarity.

```text
four mutual-triangle row hits
  -> anchor and middle are equal-radius at blocker

blocker lies in the fixed critical-map image
+ the same four row hits
+ middle lies in the blocker row
  -> anchor lies in the blocker row
```

The first clause therefore has four negative antecedent literals and one
positive equality conclusion.  The second has six negative antecedent literals
and one positive row-membership conclusion.  Exhaustive truth tables confirm
that each clause is false only on its intended antecedent-true,
conclusion-false assignment.

The role audit is exact:

- `anchor`, `middle`, and `blocker` are pairwise distinct because the encoder
  uses `itertools.permutations(vertices, 3)`;
- the critical `source` is independent of those roles;
- `source = anchor` and `source = middle` are valid and are covered by the
  encoded support lock;
- `source = blocker` makes the blocker premise false by fixed-point-freeness.

At `n = 11`, the encoder emits exactly 990 ordered cross-center transport
clauses and 10,890 direct blocker-image closure clauses.  Swapping `anchor` and
`middle` leaves the transport clause unchanged, so the 990 entries contain 495
unique clauses.  This is a small encoding-efficiency opportunity, not a
soundness defect; the shared encoder was left untouched.

## Direct clause derivability

**PROVEN by exhaustive Boolean enumeration:** the direct membership clause is
redundant under the already encoded support-lock semantics and the transport
clause.  The regression removes the direct clause from the local premise set
and checks every Boolean assignment for all eleven possible critical sources.
There are zero countermodels.

For a source distinct from all three row roles, the exact derivation is:

1. blocker-row membership transports to membership in the source's critical
   support;
2. critical-support membership gives equality with the source at the blocker;
3. the mutual-triangle equality and partition transitivity give equality of
   the anchor with the source;
4. full-class closure returns anchor membership to the critical support; and
5. the support lock returns anchor membership to the selected blocker row.

The `source = anchor`, `source = middle`, and impossible `source = blocker`
cases are checked separately rather than hidden under a four-distinct-role
assumption.

This is the exact Boolean counterpart of the kernel theorem

```lean
Problem97.ATailUniqueFourCompleteRadiusPlacementAuditScratch
  .mem_blockerImageSelectedRow_of_twoStep_mutualTriangle
```

whose Lean proof uses the same equality chain and
`CriticalShellSystem.selectedFourClass_support_eq_shell`.

## Semantic verifier and source binding

**VERIFIED:** `verify_exact_four_outer.py` independently checks the same four
transport antecedents, the blocker-image and blocker-row guards, the positive
equality conclusion, and the positive reverse-membership conclusion.  The audit
parses the verifier and rejects a guard or polarity change.

**VERIFIED:** the CEGAR manifest source-binding set includes and hashes:

- the outer encoder;
- the independent semantic verifier; and
- `CompleteRadiusPlacement.lean`, the kernel producer justifying the direct
  blocker-image closure.

This is a source binding, not a kernel proof embedded in the SAT run.  The run
remains an exact finite-projection computation with the trust boundary already
stated by the CEGAR driver.

## Obsolete fixtures

**EXACT FINITE REPLAY:** both old no-packing fixtures are rejected:

| profile | complete-radius omission certificates |
|---:|---:|
| 4 | 1 |
| 5 | 1 |

In each fixture the six antecedents hold while the positive blocker-row
membership conclusion is recorded false.  The regression imports the existing
fixture audit, verifies both input hashes, and checks the conclusion polarity.

## Replay

```bash
PYTHONDONTWRITEBYTECODE=1 UV_CACHE_DIR=/tmp/uv-cache-p97 \
  uv run --offline --with z3-solver python \
  scratch/atail-force/unique4-complete-radius-encoding-audit/regression_complete_radius_encoding.py \
  --output \
  scratch/atail-force/unique4-complete-radius-encoding-audit/replay.json

PYTHONDONTWRITEBYTECODE=1 UV_CACHE_DIR=/tmp/uv-cache-p97 \
  uv run --offline --with z3-solver python \
  scratch/atail-force/unique4-complete-radius-encoding-audit/regression_complete_radius_encoding.py \
  --output \
  scratch/atail-force/unique4-complete-radius-encoding-audit/replay.json --check
```

## Epistemic boundary

- **PROVEN:** clause polarity and derivability inside the documented Boolean
  support-lock encoding.
- **VERIFIED:** independent semantic replay uses the same positive conclusions,
  and the CEGAR source manifest binds the encoder, verifier, and Lean producer.
- **EXACT FINITE REPLAY:** the two named obsolete fixtures are rejected.
- **NOT CLAIMED:** exact-four branch closure, Euclidean nonrealizability of a
  corrected survivor, or arbitrary-cardinality coverage.
