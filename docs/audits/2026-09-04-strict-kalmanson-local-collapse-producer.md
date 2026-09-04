# Strict-Kalmanson local-collapse producer checkpoint

**Local date:** 2026-09-04

**Result:** a solver-free deterministic producer exhausts the inclusion-minimal
one-Kalmanson equality collapses on exact supports four and five. After
increasing-subset lifting and adjoining the source-backed complete Berge
family, its canonical `n=12` stream has 193,380 clauses and exactly reproduces
the corrected author-reported SHA-256.

This checkpoint does not reconstruct the later 42,504-clause `n=11` CEGAR/base
bank and makes no SAT, UNSAT, Euclidean, or general-`n` claim.

## Exhaustive local catalog

`scripts/generate_strict_kalmanson_local_collapse_bank.py` enumerates every
row choice on exactly four or five cyclically ordered roles after removing the
inessential singleton-row case. A singleton row generates no edge equality;
deleting its only atom leaves equality closure unchanged, so it cannot occur
in an inclusion-minimal collapse core. A separate unrestricted `2^12`
directed-atom enumeration at four roles reproduces the same 12 cores.

For each row assignment the producer:

1. closes all same-center selected-edge equalities;
2. checks both strict Kalmanson comparisons on every increasing quadruple;
3. retains the atoms when at least one comparison has the same two quotient
   edge components on both sides; and
4. rejects the atoms unless every one-atom deletion destroys all collapses.

No SAT, SMT, numerical geometry, or floating-point calculation enters this
enumeration.

| support | width distribution | row-profile distribution | patterns |
|---:|---:|---:|---:|
| 4 | `4:4, 6:8` | `(2,2):4, (2,2,2):8` | 12 |
| 5 | `8:90, 10:60, 11:40` | `(2,2,2,2):90, (2,2,2,2,2):30, (3,2,2,2,2):40, (4,2,2,2):30` | 190 |
| **total** | | | **202** |

The repository's diagnostic JSONL catalog is 41,163 bytes with SHA-256
`eb9d60d2541b8ce7ab646fc752afc9f74d0cca750ab30234efcfaef598ad63f6`.
That is an internal serialization pin, not the author-reported catalog identity
`dbbae6a503866379882765aab8bfacb9c8ec9c179a21d4a637ecac5b239daf37`.
The latter remains unreproduced because the exact hashed catalog byte schema
has not been delivered. The bounded artifact and serializer investigation is
recorded in
`docs/audits/2026-09-04-strict-kalmanson-catalog-identity.md`; the Wave-6
delivery is prose only despite referring to an absent replay archive.

## Correction to the historical 142-record subset

The author correction in nthdegree message `#12335` and its checkpoint receipt
states that the historical 142-record catalog was a valid subset, not the
complete local catalog. It omitted 40 width-10 records and 20 width-11 records.
Therefore the earlier width-10 deletion heuristic in this producer was false
and has been removed.

The old aggregate arithmetic remains useful only as a historical check. Under
one increasing-subset lift per record, 142 records producing 108,900 `n=12`
clauses force a support histogram of 12 four-role and 130 five-role records.
Those counts do not select the subset's record identities.

## Complete local bank replay

The producer lifts each pattern along every increasing label subset, imports
the existing complete 40-template three-row Berge classifier, verifies the
Lean-derived Berge patterns against its pinned classifier, rejects cross-family
overlap, and canonicalizes the union.

| n | four-role lifts | five-role lifts | complete Berge | union |
|---:|---:|---:|---:|---:|
| 11 | 3,960 | 87,780 | 18,480 | **110,220** |
| 12 | 5,940 | 150,480 | 36,960 | **193,380** |

The canonical `p97monotone` serializer uses:

- positive variable `center * N + point + 1`;
- increasing variables inside each clause;
- exact clause deduplication;
- clause order `(width, lexicographic atom tuple)`;
- header `p97monotone N M` followed by ASCII LF; and
- suffix ` 0` followed by ASCII LF on every clause.

The resulting streams are:

| n | clauses | bytes | SHA-256 |
|---:|---:|---:|---|
| 11 | 110,220 | 3,160,394 | `2204c11f66fa45eaf291b68541c94f20e1da85ec184113c280c5131699bd9862` |
| 12 | 193,380 | 5,744,962 | `93407f5da9298bc5385e4083310220b4a720b2f154d51c0cb15ff3f2cf228465` |

The `n=12` digest exactly matches the corrected author report. This is an
independent byte replay of the reported complete local-bank identity, not
custody of the author's original payload. The `n=11` total also explains the
previously observed 110,220-clause source-event count, but no external `n=11`
stream digest is asserted here.

## Claim boundary

| Claim | Status |
|---|---|
| 12 four-role and 190 five-role minimal local collapses | EMPIRICALLY VERIFIED by exhaustive reduced finite enumeration plus unrestricted four-role cross-check |
| every retained pattern collapses a strict comparison and passes one-atom deletion | EMPIRICALLY VERIFIED by exhaustive finite replay |
| complete Berge family agrees with the pinned classifier | EMPIRICALLY VERIFIED on every producer run |
| corrected complete `n=12` local-bank byte identity | EMPIRICALLY VERIFIED by independent generation and exact SHA-256 match |
| author catalog identity `dbbae6a5...` | NOT ESTABLISHED locally; serializer or payload absent |
| reconstruction of the later 42,504-clause `n=11` base | NOT ESTABLISHED |
| strict all-center Kalmanson impossibility at `n=10+` | CONJECTURED; this producer supplies clauses only |

## Reproduction

```bash
uv run python scripts/generate_strict_kalmanson_local_collapse_bank.py
uv run python scripts/generate_strict_kalmanson_local_collapse_bank.py \
  --mode bank --n 11 --include-berge --format p97monotone
uv run python scripts/generate_strict_kalmanson_local_collapse_bank.py \
  --mode bank --n 12 --include-berge --format p97monotone
uv run pytest -q scripts/test_generate_strict_kalmanson_local_collapse_bank.py
uv run --with ruff ruff check \
  scripts/generate_strict_kalmanson_local_collapse_bank.py \
  scripts/test_generate_strict_kalmanson_local_collapse_bank.py
```

The producer writes bytes only when `--output` is supplied and refuses to
overwrite an existing path. The commands above print summaries only.
