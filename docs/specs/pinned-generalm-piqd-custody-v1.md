<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Pinned general-m PIQD custody v1

## Status and scope

This lane is an **ACTIVE MANUAL DIAGNOSTIC** and an **OPEN-RESEARCH
OBSTRUCTION**, not a theorem producer.  It asks whether the currently proved
finite pinned-surplus interface and the relaxed singleton certificate leaves
exclude all admissible masks.  It does not test geometric realizability.  A
successful run does not close a Lean proof obligation.

The production default of
`scripts/pinned-generalm-certificate-coverage.py` is `--backend piqd`.  The old
in-process Z3 path is available only through the explicit
`--backend legacy-local` diagnostic switch.  A PIQD error, malformed transcript,
UNKNOWN result, response loss, or failed SAT replay never enters that legacy
path.

## Query contract

One run contains exactly 45 queries: the 15 incidence rows, in input order, at
cardinality floors 2, 3, and 4, in that order.  `--workers` accepts only `1`.
Each query uses the maintained public single-solver semantic API in
`census.p97_search.phase3_piqd_smt_source_adapter` with:

- solver `z3`, lane `smt`, and one exact positive integer timeout in
  `1..3600000` milliseconds;
- a fresh session, one state-journal assertion, one solve, and session close;
- no executable discovery probe and no local fallback;
- a state-only `QF_BV` journal with ten 10-bit mask variables; and
- all ten masks requested as `get-value` readbacks with a model included.

The producer constructs the complete SMT-LIB journal.  The generic adapter
performs execution custody only; the producer owns the meaning of the ten masks.

## Exact semantic binding

Every descriptor binds a canonical query context containing:

- query index, floor, incidence row index, the complete canonical row record,
  and the complete certificate leaf records sorted by certificate ID;
- `relaxed_id`, `sstar`, ordered labels, fixed masks, all derived nonfixed
  domains, and every derived cross-separation tuple;
- the pair-class limit, encoding version, and exact hashes of all source files;
  and
- the exact timeout/profile, normalized journal bytes, and descriptor bytes.

The run source packet captures exact bytes, paths, hashes, unique-file
identities, and every parent-component directory identity for the caller,
producer adapter, maintained generic adapter, shadow helper, required-facts
report, incidence report, certificate census, bank, and split probe.  Capture
is bounded, descriptor-relative, componentwise `O_NOFOLLOW`, regular-file only,
and requires link count one.  The embedded hash/path edges between those five
data artifacts are rechecked.  The certificate directory and external rvol
directory are recorded as provenance limits; they are not represented as
transitively captured source entitlement.

All sources are reopened before query construction and immediately before
publication.  Source drift, schema drift, wrong primitive types, duplicate JSON
keys, non-finite JSON, path escape, source replacement, or upstream hash/path
mismatch fails closed.

## Result semantics

The only positive semantic classification is:

- `SAT_FINITE_INTERFACE_COUNTERMODEL_REPLAYED`: all ten exact readbacks parse,
  each nonfixed mask belongs to its authenticated finite domain, both fixed
  masks match, every cross-separation constraint holds, every point-pair class
  is used at most twice, and every certificate leaf has a missing generator
  pair.

Other outcomes are deliberately weaker:

- `Z3_UNSAT_DIAGNOSTIC_NOT_PROOF_CHECKED`: Z3 returned UNSAT with terminal
  assumption-free provenance.  No proof object is checked.
- `UNKNOWN_INCONCLUSIVE`: Z3 returned UNKNOWN.
- `TRANSPORT_LOSS_INCONCLUSIVE`: no completed result could be reconciled from a
  durable receipt.
- semantic replay rejection/failure and every unsupported raw/effective status
  pair fail closed.

The expected historical diagnostic profile is 15 replayed SAT rows at floors 2
and 3 and 15 diagnostic UNSAT rows at floor 4.  A different profile makes the
CLI unsuccessful; it does not trigger fallback.

## Create-once publication and validation

`--piqd-data-root` selects the caller-owned parent and `--output-name` selects
one safe final child.  The final path must not exist.  Artifacts are written
with exclusive creation into a private sibling staging directory, fsynced,
inventoried, and published through an atomic platform no-replace rename.  A
held authenticated parent descriptor is used from reservation through rename
and final validation.  Cleanup is descriptor-relative and removes only the
authenticated staging inode; a hostile rebind makes cleanup stop and leave the
private staging tree rather than touch an untrusted replacement.

The publication contains archived sources, source packet, report, run manifest,
45 query directories, and a custody inventory.  Each query directory contains
the exact context, descriptor, original/normalized SMT-LIB, generic PIQD
lifecycle artifacts, exact engine record, and caller classification.

`--check PUBLISHED_DIRECTORY` is the standalone offline validator.  It contacts
neither PIQD nor a solver.  It opens the publication componentwise without
following links and verifies a bounded descriptor-relative complete tree
inventory containing file and directory identities as well as file byte counts
and hashes.  It verifies current and archived source entitlement and upstream
bindings, reconstructs all 45 contexts and journals byte-for-byte, recomputes
query metadata and classifications, validates every engine artifact, requires
45 unique sessions, checks the exported SMT journal, and reruns exact SAT
semantics from the stored readbacks.  Symlinks, hardlinks, non-regular entries,
empty-directory injection, same-byte inode replacement, parent rebinding,
oversize artifacts, or current-source tamper invalidate the publication.
