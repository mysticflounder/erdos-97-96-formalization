# P97 PIQD exact-17 v19 durable runner v1

> **Historical one-case runner (2026-08-10).** This runner remains valid for
> finite regression and PIQD transport tests. Its Python-pinned input identity
> is not Lean source entitlement and does not cover every exact-17 placement.
> The proof-producing successor must enter through
> `docs/specs/p97-exact17-cap9-lean-to-sat-route-v1.md`.

Status: additive finite-diagnostic infrastructure. The live proof anchor
`Problem97.ATailFrontierLiveClosure.false_of_criticalPairFrontier` remains open
and off-spine. This package does not edit, build, or claim closure of Lean.

## Frozen input identity

The package accepts only the production contract privately pinned by
`phase3_piqd_exact17_semantic.py`:

- manifest SHA-256:
  `19fe9d3ee8e24e9bdcefc2a0dfb62c81e484d784d3ff37fe5b291d8d7081d63a`;
- DIMACS SHA-256:
  `ebca3272a22c945a235a3f1141c1646f1a9780f39eefec6164f57e48bbe84c7c`;
- repaired provenance-sidecar SHA-256:
  `0d6aa93747da652a0fbb4517c1193fb643ef6e01bcaa978589fc133aded45378`;
- 74,813 variables and 2,875,629 clauses;
- nine producer source files and 45 manifest inputs.

Source labels are not supplied by a caller. The v19 adapter fixes the nine
production labels and requires their keys and byte hashes to agree with both
the manifest and repaired provenance sidecar. `capture_source_bundle` embeds
the exact manifest, sidecar, source, and input bytes. The canonical variable
map and semantic package are then rebuilt and revalidated from those bytes.
Every direct package-input read opens the repository root and every descendant
directory component with no-follow directory descriptors, then performs a
bounded stable-identity read of the final private regular file. A symlink in
any parent component is therefore rejected, not merely a symlink at the leaf.

The output package contains exactly:

- `discovery.cnf`;
- `upstream-manifest.json`;
- `producer-provenance.json`;
- `source-bundle.json`;
- `variable-map.json`;
- `semantic-package.json`;
- `producer-manifest.json`;
- `wave-manifest.json`;
- `package-result.json`.

The producer and wave manifests are deterministic v19 records. The wave uses
CaDiCaL's `sat` profile, shard 0/1, seed 97, and a requested core limit of one.
The package result binds every preceding artifact by SHA-256.

## Durable run protocol

The v19 runner loads the complete package through bounded no-follow reads and
recomputes every binding. It retains the generic `RunPacket`, strict bound-job
proxy, receipt format, and receipt validator, and directly invokes
`PiqdCegarDriver` with `DurableAttemptJournal` and the raw-DIMACS client
contract. The direct adapter is necessary because the frozen generic
`run_packet` interface reopens caller pathnames after its initial check and
therefore cannot accept a held directory capability. Only one prepare and one
confirm are permitted. A PIQD
`existing: true` response is acceptable only because the same path confirms
and revalidates the exact submitted DIMACS bytes and bound job identity.

The generic run occurs in a private staging directory. The adapter first takes
a bounded component-wise no-follow snapshot of the journal, seal, generic
receipt, archive directory, and every archive member. It rechecks file and
directory identities after the complete snapshot, then reconstructs those
bounded bytes in a private directory for the generic receipt and journal
validators. Thus those generic validators never extract an unbounded file from
an untrusted staging or final-output path.

No final run directory is retained unless the terminal outcome is
`STRUCTURAL_SAT`, the exact model response and solver log are present in the
content-addressed journal archive, and all byte hashes revalidate. The raw
daemon model bytes are preserved unchanged under their journal digest; they
need not use sorted-key canonical JSON. They are nevertheless strict-parsed
from that authenticated artifact, rejecting duplicate keys, nonfinite values,
wrong built-in types, missing or extra keys, and incomplete assignments. The
separately published `model-response.json` is the deterministic canonical JSON
encoding of that same validated object. It contains exactly `job_id`,
`result`, `num_assigned`, and `assignment`, with one literal for every
variable.

The semantic layer then:

1. checks a total, duplicate-free assignment;
2. checks all 2,875,629 DIMACS clauses;
3. decodes the canonical variable map;
4. replays all ten pinned source predicates;
5. emits decoded evidence and a canonical semantic receipt;
6. independently reissues and validates that receipt.

The final pathname is reserved as a new empty directory before emission. An
adapter-owned partial emission or post-install validation failure removes that
reserved directory. Cleanup is refused, and the target preserved, if its
directory identity changes or any unrecognized, linked, symlink, or
non-regular entry appears; preexisting directories and symlinks are never
modified. Every existing output-parent component is opened no-follow before
PIQD preparation. Missing output-parent components are created only relative
to an already authenticated no-follow directory descriptor, so a symlinked
ancestor fails before any daemon request and its target is not modified.
The authenticated output-parent descriptor remains open for the complete run.
Both the private staging directory and final output reservation are created
relative to that descriptor. The adapter keeps the staging descriptor open and
derives a macOS `/.vol/<device>/<staging-inode>` capability whose complete path
is opened no-follow and revalidated against the held descriptor. The durable
journal uses only descendants of that rename-stable capability. After the
driver seals the journal, the adapter captures the journal, seal, lock, and
archive descriptor-relatively with fixed bounds and stable-identity checks,
reconstructs those authenticated bytes privately to issue the generic receipt,
and installs that canonical receipt descriptor-relatively with create-once
semantics. The complete tree is then captured again and passed through the
unchanged generic receipt validator. Ancestor replacement at driver entry can
therefore neither redirect writes nor leave stale state in the replacement
target. Platforms without an equivalent no-follow, descendant-capable
directory path fail closed before PIQD preparation; symlink-based fd aliases
are not accepted. Final installation also rebinds the caller pathname, and
staging cleanup is descriptor-relative and refuses changed or hostile trees.

The create-once final directory separately persists the generic journal, seal,
generic receipt, every content-addressed journal artifact (including the exact
raw downloaded model bytes), canonical published model response, exact
archived solver log, decoded object, semantic evidence, semantic receipt, and
a self-contained run-result binding. The generic receipt continues to bind the
raw model artifact through the authenticated journal. The run result binds both
that archive member and the canonical published response. Validation
strict-parses both, requires object and assignment equality, and requires the
published bytes to equal the canonical encoding of the raw object before
semantic replay. Readers use bounded no-follow reads and reject extra files,
missing files, substitutions, symlinks, noncanonical generated JSON, duplicate
keys, nonfinite numbers, and changed hashes. The only permitted names are the
eight fixed evidence names,
`run-result.json`, and exactly the `journal-artifact-<sha256>` names required by
the authenticated journal. Validation reconstructs the generic archive and
reruns the generic receipt validator, then requires the run-result
`job_identity` object and `piqd_existing_dedupe` Boolean to match that
authenticated receipt exactly. Job identity keys, scalar built-in types,
dimensions, backend/profile, core limit, and lowercase digest shapes are all
closed contracts. CLI failures identify the rejected custody/publication gate
but normalize whitespace and cap the displayed detail, so an untrusted payload
cannot produce an unbounded diagnostic.

## Interpretation

`STRUCTURAL_SAT` plus successful source replay is one finite diagnostic for one
normalized exact-17 order. A source-predicate replay failure is likewise a
finite diagnostic failure. Neither result is a theorem-level promotion.

The package, semantic receipt, and run result all state these claims as false:

- aggregate order/case coverage;
- universal lift;
- theorem closure;
- Lean checked closure.

No PIQD daemon defect was found while implementing this adapter. Tests use only
fake clients/transports; the live daemon and solver are not invoked.
