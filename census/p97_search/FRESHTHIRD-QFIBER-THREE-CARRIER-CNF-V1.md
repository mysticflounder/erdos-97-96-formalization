# FreshThird Q-fiber three-carrier structural CNF v1

## Status and scope

`freshthird_qfiber_three_carrier_cnf_v1.py` is a deterministic shadow adapter
for one intrinsic boundary-index cell of the existing FreshThird finite query.
It replaces neither the source query nor its replay checker.  The initial CNF
is an intentional relaxation, so a SAT result is theorem-mining data only and
an UNSAT result is not promotable without the later proof/replay route.

The adapter provides:

- deterministic DIMACS and a deterministic variable map;
- a manifest binding the source-query manifest, encoder-source bytes, DIMACS,
  variable map, boundary cell, and clause-family counts;
- a complete CaDiCaL-assignment validator;
- canonical decoding into the existing `model_signature` schema;
- fail-closed delegation to the existing fresh-session `replay_sat_result`;
- semantic-only exact-model blockers; and
- the first generalized CEGAR refinement, a seven-literal projection of
  `FreshThirdQFiberThreeCarrierFiniteAssignment.noAlternatingCap_ofView`.

The existing monolithic Z3 query and all historical wave artifacts remain
unchanged.

## Trust boundary

CaDiCaL is an untrusted discovery oracle in this tranche.  A candidate model
must first assign every CNF variable with a Boolean value and satisfy every
hard clause.  It is then decoded to the old finite-query signature and replayed
in a fresh source query.  Replay rejection remains rejection; it cannot be
turned into a source model or theorem claim.

The cap-alternation learner is narrower than full semantic replay.  It finds
four distinct represented point classes in increasing `Before` order whose
membership in one indexed cap is `1010` or `0101`.  Its learned clause negates
only those three order atoms and four cap-membership atoms.  All seven are
authenticated semantic variables, and the clause is exactly the finite
projection of the source-proved `noAlternatingCap_ofView` theorem.

Externally supplied refinement clauses are rejected if they contain zero or a
literal outside the encoder's variable range.  Result replay authenticates the
complete encoding manifest and conservative claim metadata before delegating
to the source-query replay checker.

Terminal UNSAT certification, local DRAT/LRAT replay, four-cell aggregation,
and Lean ingress are deliberately outside v1 and outside this implementation
tranche.

## Deterministic cell-0 smoke checkpoint

The initial cell-0 encoding has:

| Item | Value |
| --- | ---: |
| Variables | 11,359 |
| Semantic variables | 10,421 |
| Clauses | 625,696 |
| DIMACS bytes | 11,645,048 |
| DIMACS SHA-256 | `17031668d4ec9b07e64b2d526ac30f6e9f37d0f656f12c26912354eca1451797` |
| Variable-map SHA-256 | `ea6ca283d2e296861501ed07de71ea01c9f126adf117c304a640b38f520d0e20` |

CaDiCaL returned a complete SAT assignment.  The adapter validated and decoded
it, while independent source replay correctly rejected it as `unsat`.  This is
the expected behavior for a relaxation.  The first deterministic learned cut
was:

```text
cap = 1
roles = boundaryFanBlockerRowSource3_2, freshCenter,
        sourceCenter, freshSourceTwo
membership = 0, 1, 0, 1
clause = -6643 -2890 -2818 6964 -6796 6793 -6778
model-signature SHA-256 =
  c8d021cc8cd34e9b878614ba134983802e82d96572f86b98a763c6c7dc7c8f49
```

This smoke assignment and clause are diagnostic, not a stable terminal bank or
a closure result.  The stable contracts are the schema, deterministic encoder,
source theorem name, semantic-variable restriction, and fail-closed replay.

## Verification

Run:

```bash
uv run ruff check \
  census/p97_search/freshthird_qfiber_three_carrier_cnf_v1.py \
  census/p97_search/tests/test_freshthird_qfiber_three_carrier_cnf_v1.py
PYTHONPATH=. uv run pytest -q \
  census/p97_search/tests/test_freshthird_qfiber_three_carrier_cnf_v1.py
```

The focused suite checks deterministic DIMACS and variable-map generation,
the exact old-signature readback key sets, wraparound-safe cap contiguity,
semantic-only generalized cuts, fail-closed replay, and an actual CaDiCaL
model decode when CaDiCaL is installed.

## Next integration tranche

The next owner may place this adapter behind the existing authenticated
structural-CEGAR custody layer.  Each child must bind the source manifest, CNF
hash, variable-map hash, parent hash, decoded signature hash, and learned-clause
record.  A terminal child must still be rerun through the independent local
proof path before any promotion claim.
