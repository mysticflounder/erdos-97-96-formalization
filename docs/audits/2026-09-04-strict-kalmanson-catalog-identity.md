# Strict-Kalmanson catalog identity custody audit

**Local date:** 2026-09-04

**Target:** author-reported catalog identity
`dbbae6a503866379882765aab8bfacb9c8ec9c179a21d4a637ecac5b239daf37`.

**Result:** the 202-record semantic catalog is independently reproduced, but
the target catalog byte identity is not locally reproducible. The inspected
Wave-6 delivery is prose only. It contains no catalog payload, generator,
verifier, manifest, or replay archive. A durable bounded reconstruction of
plausible record and serializer formats found no target match.

The smallest missing item is either the exact bytes hashed to obtain the target
or the generator/verifier code defining those bytes after diagnostic elapsed
time is removed.

## Evidence already closed

The repository producer independently exhausts all inclusion-minimal
one-Kalmanson equality collapses on exact supports four and five:

| support | width histogram | records |
|---:|---:|---:|
| 4 | `4:4, 6:8` | 12 |
| 5 | `8:90, 10:60, 11:40` | 190 |
| **total** | | **202** |

Its increasing-subset lift, joined with the source-backed complete Berge
family, produces 193,380 `n=12` clauses. The canonical bank stream has
5,744,962 bytes and SHA-256
`93407f5da9298bc5385e4083310220b4a720b2f154d51c0cb15ff3f2cf228465`,
exactly matching the corrected author report. This authenticates the complete
local bank semantics under the published bank serializer without authenticating
the separate catalog object.

The repository's own diagnostic 202-record JSONL serialization has 41,163
bytes and SHA-256
`eb9d60d2541b8ce7ab646fc752afc9f74d0cca750ab30234efcfaef598ad63f6`.
It is intentionally labeled as a repository-local identity.

## Delivered files and conversation record

The locally delivered Wave-6 checkpoint is:

```text
/Users/adam/Downloads/p97-strict-kalmanson-wave6-n12-corrected-checkpoint-2026-09-04--01M1PND1ZBD4G92E648AE0R9FV.md
bytes:   14,905
SHA-256: fb73898e6ba280504f7d0096568fd990925792fafbb4c88b445dedca3238c47b
```

The file reports the target catalog identity and claims a full replay archive
with SHA-256
`76af03910f8ab519111a17baf569da1bd186ca5ca0582c61e912ca5eae13f7c6`.
No such archive or archive attachment was found in the inspected repository,
`/Users/adam/Downloads`, or nthdegree delivery/conversation records. Message
`#12335` in JSON form names only the prose checkpoint file and the claimed
archive digest. This is an inventory of those delivery locations, not a claim
about every filesystem or remote storage location.

The Wave-5 delivery is also prose only:

```text
/Users/adam/Downloads/p97-strict-kalmanson-wave5-n12-checkpoint-2026-09-04--01M1PG422XH1AXRQMXVS7C1XN6.md
bytes:   13,952
SHA-256: 77223b57d3a2262d2a055971dd96ff283ed58b6e2f0fbbe49e096c67c1513fdc
```

Relevant nthdegree messages are:

- `#12278`: announces the corrected 202-record catalog and target identity;
- `#12335`: delivers the prose-only Wave-6 checkpoint and claims an absent
  archive;
- `#12340`: requests the exact hashed schema or catalog payload;
- `#12368`: publishes the completed local-bank replay while leaving the
  catalog identity unclaimed; and
- `#12539`: requests the catalog payload, verifier, or multipart replay bundle
  after confirming the custody gap.

No author response supplying bytes or code had arrived at this checkpoint.

## Bounded serializer reconstruction

`scripts/audit_strict_kalmanson_catalog_identity.py` durably encodes two fixed
serializer families derived from the exact 202 local records. Its full replay
made 11,960 attempts spanning 5,520 distinct payload digests across:

- atom lists, support-tagged atoms, support/width-tagged atoms, and row lists;
- global, directed, label-relative, and row-compact bit masks;
- collapsed-comparison witnesses using source, `K1`/`K2`, and numeric tags;
- native, support/width, width/support, atom, row, and mask orderings;
- bare arrays and objects named `catalog`, `records`, `patterns`, `cores`, or
  `minimal_collapses`;
- compact and default JSON, sorted and insertion key order, JSON Lines, Python
  representation, and optional terminal LF; and
- count-bearing wrappers and metadata-header variants.

None matched `dbbae6a5...`. The self-hashed result is retained at
`docs/audits/2026-09-04-strict-kalmanson-catalog-identity-scan.json` with report
SHA-256
`e74c891696b9e5d4ffc50ad8014d13a3bcc81cf6eaee24cb2938566e70668fbb`.
An independent read-only lane separately tested natural catalog encodings and
also found no match. These are bounded negative results, not a claim that no
undisclosed serializer can produce the target.

A partially delivered older Kalmanson archive exposes the author's historical
canonical-byte convention as compact sorted-key JSON followed by LF. Its replay
comparators remove `elapsed_seconds` and `payload_sha256` before semantic
comparison. Applying that byte convention to plausible new catalog records
still does not determine the Wave-6 object field names, schema string, witness
layout, metadata, or exact ordering. The phrase “omitting only diagnostic
elapsed time” therefore points most strongly to a field-rich external result
object whose schema was not delivered.

## Acceptance protocol for a later delivery

A future delivery starts with one of two ingress branches:

- **Payload branch:** hash the received bytes before parsing and record their
  size and SHA-256.
- **Generator/verifier branch:** preserve and hash the delivered source and its
  declared runtime inputs, execute it without modifying its byte rules, and
  hash its deterministic catalog output before parsing. Any undeclared network,
  time, random, or host-dependent input is a blocker.

After either branch produces catalog bytes, all of these common checks must
pass:

1. run the delivered identity procedure without modifying its byte rules;
2. independently parse every record into `(support_size, canonical atoms)`;
3. reject duplicates, diagonal atoms, labels outside the support, and inexact
   support coverage;
4. replay equality closure and one-atom deletion minimality for every record;
5. compare the normalized record set with the repository's exhaustive 202
   patterns; and
6. regenerate the complete `n=12` local-plus-Berge bank and require the known
   193,380-clause SHA-256.

Until then, the status is:

| Claim | Status |
|---|---|
| semantic 202-record catalog | EMPIRICALLY VERIFIED by exhaustive independent enumeration |
| complete `n=12` local-bank identity `93407f5d...` | EMPIRICALLY VERIFIED by independent byte replay |
| author catalog identity `dbbae6a5...` | EXTERNAL REPORT; NOT AUTHENTICATED LOCALLY |
| claimed Wave-6 replay archive `76af0391...` | NOT FOUND IN THE INSPECTED DELIVERY LOCATIONS |

## Reproduction

```bash
.venv/bin/python3 scripts/audit_strict_kalmanson_catalog_identity.py
.venv/bin/pytest -q scripts/test_audit_strict_kalmanson_catalog_identity.py
.venv/bin/ruff check \
  scripts/audit_strict_kalmanson_catalog_identity.py \
  scripts/test_audit_strict_kalmanson_catalog_identity.py
```
