# P97 exact-17 DirectSix seeded-session qualification v1

## Purpose

This contract moves the authenticated exact-17 DirectSix aggregate from PIQD's
static job API into the persistent SAT-session API.  The first qualification is
custody-only: create a live session from the exact completed static job, verify
the seeded formula dimensions, and close it without appending clauses or
solving.

The qualification is observational evidence about PIQD transport.  It is not a
solver proof and does not close exact 17, the Rigid221 leaf, or P97.

## Frozen ingress

The adapter consumes the already authenticated artifacts:

- lane manifest SHA-256
  `e025d750cee5cddcb42dd42776df7c35106542f34bb7ee95d8eedc7875d64d1b`;
- aggregate CNF SHA-256
  `2aa85c2368c3f271caebe47c4a6b861cc7e64d177cd349e58697a724c4b43605`;
- aggregate dimensions: 74,813 variables and 4,254,176 clauses;
- static PIQD job `dfba235e-4833-45b2-a5a2-8a1a2b22aa30`;
- static receipt self-hash
  `0578f93b223f14a1ec8ed39e36c5548a37514affcc478335e81080aea5bb4033`.

Before making any HTTP request, the adapter reconstructs the frozen package,
replays the strict static-receipt validator against the durable attempt journal,
and requires the receipt to report `completed` / `SAT` / `STRUCTURAL_SAT`.  The
job's blob hash and dimensions must equal the reconstructed aggregate exactly.

## Session exchange

The default request is:

```json
{
  "solver": "piqd-satworker-cadical-3.0.0",
  "lane": "sat",
  "label": "P97 exact17 DirectSix authenticated seeded-session qualification",
  "seed_from_job": "dfba235e-4833-45b2-a5a2-8a1a2b22aa30"
}
```

The alternative `blob` mode sends the exact aggregate digest as
`seed_blob_hash`; the two seed fields are never sent together.

The create response must be a canonical PIQD session object with:

- SAT lane and live state;
- the requested solver and exact label;
- 4,254,176 clauses and maximum variable 74,813;
- zero solves and no last status;
- a canonical journal path below the explicitly configured PIQD data root.

The adapter then immediately deletes the session and requires the same identity,
formula dimensions, and counters in the closed response.  If a create response
exposes a canonical session UUID and any subsequent validation fails, deletion
is still attempted.

## Local receipt

The immutable qualification receipt binds:

- the packet, package-result, aggregate, and wave identities;
- the static receipt file hash, self-hash, job ID, and blob hash;
- the exact session seed field and value;
- the complete validated live and closed session records;
- a self-hash over the receipt.

The implementation is
`census/p97_search/phase3_piqd_exact17_seeded_session.py`.

## Trust boundary

Every qualification receipt states all of the following as false:

- source semantics checked;
- source entitlement;
- complete source coverage;
- aggregate order-case coverage;
- universal lift;
- theorem closure;
- daemon attestation.

Persistent PIQD sessions are a discovery and incremental-refinement transport.
Any terminal UNSAT candidate must still be exported as exact DIMACS and replayed
through the project's authenticated proof/certificate path before promotion.

## Tests and live gate

The focused test suite covers job seeding, blob seeding, exact-count validation,
unknown response fields, cleanup after failed validation, bounded preservation
of daemon error explanations, and rejection of a static blob mismatch before
HTTP:

```bash
PYTHONPATH=. uvx pytest -q \
  census/p97_search/tests/test_phase3_piqd_exact17_seeded_session.py
uvx ruff check \
  census/p97_search/phase3_piqd_exact17_seeded_session.py \
  census/p97_search/tests/test_phase3_piqd_exact17_seeded_session.py
```

The live qualification must use a PIQD build whose `/version` binary SHA-256 is
the separately announced session-seeding release.  It must not be run against
the older daemon SHA-256
`835c456052c080ccefca409d9ad4961d10b7416f695a9f4bf5f677eae811fc90`,
which predates seeded-session support.

## Live qualification result

The first live qualification passed against the session-seeding daemon with
binary SHA-256
`bd546adfd4bfb6e5de5af9fe5ca4ed5d99e568d2b26c3c2c309af726a9432734`.
PIQD created and closed session
`8124b7c0-a72b-492c-9c64-09f06189d546` with exactly 4,254,176 clauses,
maximum variable 74,813, and zero solves in both responses.  The registered
solver was `piqd-satworker-cadical-3.0.0`, with binary SHA-256
`0ee355934249f1b3f14a20928877391a87a0dd51326cf8c6135f75cba0b6b965`.

The immutable local receipt is
`scratch/p97-exact17-direct6-seeded-session-qualification-bd546adf-v1/qualification.json`.
Its file SHA-256 is
`e2f1b820ac317329c9069f045656f8f5d5ef7ed47415229ead6af1731ad27aab`,
and its self-hash is
`84fb1432e70f63a40db6481a51db0cf4dbe4a333d82609b37754ce8284bf2fa4`.
This is a custody/provenance qualification only; every closure claim in the
receipt remains false.
