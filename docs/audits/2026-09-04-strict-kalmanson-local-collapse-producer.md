# Strict-Kalmanson local-collapse producer checkpoint

**Local date:** 2026-09-04

**Result:** a solver-free deterministic producer now reconstructs the local
count structure behind the reported Wave-4 and Wave-5 banks; source identity
with the unavailable author catalog is not established.

## Outcome

`scripts/generate_strict_kalmanson_local_collapse_bank.py` exhausts a reduced
row-choice space on exactly four or five cyclically ordered roles. A row with
one retained membership generates no edge equality; deleting that membership
leaves the closure unchanged, so it cannot occur in an inclusion-minimal
collapse core. The producer therefore enumerates row widths zero and at least
two. A separate unrestricted `2^12` directed-atom enumeration at four roles
reproduces the same 12 cores.
For every core it:

1. closes all same-center selected-edge equalities;
2. checks both strict Kalmanson comparisons on every increasing quadruple;
3. retains the core only when some comparison has the same two quotient-edge
   components on its two sides; and
4. checks that deleting any one membership destroys every such collapse.

No SAT, SMT, numerical geometry, or floating-point calculation enters this
enumeration.

The complete independently generated catalog has:

| support | width distribution | row-profile distribution | patterns |
|---:|---:|---:|---:|
| 4 | `4:4, 6:8` | `(2,2):4, (2,2,2):8` | 12 |
| 5 | `8:90, 10:60, 11:40` | `(2,2,2,2):90, (2,2,2,2,2):30, (3,2,2,2,2):40, (4,2,2,2):30` | 190 |
| **total** | | | **202** |

Its canonical catalog serialization has 41,152 bytes and SHA-256
`b197f71c170d35f42c3deb9e881561647b1d43e94c160005a78f2dfbb01053bb`.

## Wave-5 count reconstruction

The external Wave-5 checkpoint has authenticated delivery digest
`77223b57d3a2262d2a055971dd96ff283ed58b6e2f0fbbe49e096c67c1513fdc`.
It reports a 142-record support-at-most-five catalog and an n=12 base of
145,860 clauses, including 36,960 complete-Berge clauses. It does not include
the catalog or its serializer.

Under one increasing-subset lift per record, the non-Berge count is

\[
145{,}860-40\binom{12}{6}=108{,}900.
\]

If the records have exact support four or five, their histogram is uniquely
forced:

\[
a_4+a_5=142,
\qquad
a_4\binom{12}{4}+a_5\binom{12}{5}=108{,}900,
\]

so `a4=12` and `a5=130`. The independent catalog has exactly 12 four-role
patterns. Among its 190 five-role patterns, exactly 60 have width 10. Removing
that width class gives one count-matched `12+130` catalog. The arithmetic does
not distinguish this choice from another 130-element subset of the 190
five-role candidates.

This count-selected catalog reproduces both reported aggregate sizes:

| n | local four/five-role clauses | complete Berge | union |
|---:|---:|---:|---:|
| 11 | 64,020 | 18,480 | **82,500** |
| 12 | 108,900 | 36,960 | **145,860** |

There is no cross-family overlap because every local clause has exact support
at most five and every complete-Berge clause has exact support six. The n=11
total also matches the older 82,500-clause local-bank count recorded in the
artifact-forensics handoff. The n=11 and n=12 totals are two aggregate
consistency checks under the same local-catalog and increasing-subset lift
model. They make width-10 deletion a concrete reconstruction candidate, but
do not identify the external catalog membership.

That conclusion remains **inferred**, not source-authenticated. Neither the
Wave-5 prose nor the prior handoff states that width 10 was excluded or gives
the reason for doing so.

## Independent stream identities

Using the already established `p97monotone` convention—one-based variable
`1+n*center+member`, sorted IDs in each clause, global lexicographic clause
order, ASCII LF, and terminal zero—the count-selected banks are:

| n | clauses | bytes | SHA-256 |
|---:|---:|---:|---|
| 11 | 82,500 | 2,242,441 | `42ee48f37d5fb3f0fb4b47289730071fa068db2358e52d61bad200df183fcef6` |
| 12 | 145,860 | 4,103,362 | `c829492de992b5b91cdf409fd17077a10defa68910843a0806c84926342b536b` |

The count-selected 142-record catalog itself has 28,612 bytes and SHA-256
`24f9e0a6a5a028bd058a37b26eca5f558a6ef53ef944dcb6ce20b4d932ae56d1`.

The independent n=12 stream hash does not match the reported external hash
`bbd9707afc4e0d6ae91ee58b9f1a660a99505378902986a60cf77b0e43cb22b0`.
The discrepancy may come from a different catalog membership, clause encoding,
header, or ordering. A matching clause count is not byte custody.

## Relation to the missing 42,504-clause n=11 base

This producer does **not** reconstruct the later 42,504-clause base. It
reconstructs a mathematically checked local-collapse candidate whose n=11
aggregate is 82,500. Therefore the later 42,504 stream used a materially
different family mix, compression, orbit scope, or retained CEGAR bank. The
missing nine-role ladder, later motif definitions, merge order, and original
serialization are still required.

The producer is nevertheless useful at that custody boundary: any delivered
142-record catalog can now be checked record by record against equality
closure, compared with the independently exhaustive 202-pattern catalog, and
lifted under an explicit deterministic convention.

## Evidence labels

| Claim | Label |
|---|---|
| 12 four-role and 190 five-role minimal local collapses | EMPIRICALLY VERIFIED, exhaustive reduced finite enumeration with singleton-deletion argument; unrestricted four-role cross-check |
| every retained pattern has a collapse and passes every one-atom deletion check | EMPIRICALLY VERIFIED, exhaustive finite replay |
| `12+130` and the 82,500/145,860 aggregate counts | PROVEN arithmetic from the stated lift model; implementation replayed |
| external catalog excludes exactly width 10 | HEURISTIC reconstruction candidate from aggregate consistency; author source absent |
| identity with external n=12 bytes | NOT ESTABLISHED; hashes differ |
| reconstruction of the 42,504-clause n=11 base | NOT ESTABLISHED |

## Reproduction

```bash
uv run python scripts/generate_strict_kalmanson_local_collapse_bank.py
uv run python scripts/generate_strict_kalmanson_local_collapse_bank.py \
  --mode bank --n 11 --catalog-policy wave5-count-matched \
  --include-berge --format p97monotone
uv run python scripts/generate_strict_kalmanson_local_collapse_bank.py \
  --mode bank --n 12 --catalog-policy wave5-count-matched \
  --include-berge --format p97monotone
uv run pytest -q scripts/test_generate_strict_kalmanson_local_collapse_bank.py
uv run --with ruff ruff check \
  scripts/generate_strict_kalmanson_local_collapse_bank.py \
  scripts/test_generate_strict_kalmanson_local_collapse_bank.py
```

The producer writes an artifact only when `--output` is supplied and refuses
to overwrite an existing path. The commands above print summaries only.
