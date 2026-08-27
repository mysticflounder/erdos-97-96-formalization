# P97 Rigid221 card-18 labeled-projection source custody (v1)

**Status: SOURCE CUSTODY FROZEN / NO SERIALIZER OR SOLVER AUTHORIZED.**

Lane: `rigid221-card18-labeled-projection-custody-20260827`.

Lane base: `a83fd4dbbb3233f5b99496ffde9885d4db095344`.

## 1. Purpose

The labeled Lean projection now supplies the exact `Fin 18` roles, supports,
memberships, overlaps, and arm profile used by the next finite-model design.
This checkpoint authenticates the repository-local Lean source bytes reached
by that projection's declarations.

It creates a new custody artifact. The historical leaf-export custody module
and its v1 receipt semantics remain unchanged.

## 2. Narrow source set

The sole root is

```text
Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18LabeledProjection
```

The source set is mined from the Lean kernel: begin at every declaration in
the root module, follow declaration references, and retain only the
repository-local modules supplying reached declarations. It is not the
transitive import closure.

The pre-freeze mine at the lane base found 363 root declarations reaching
27,066 declarations in 26 repository-local modules. Those counts are evidence,
not trusted configuration; the committed tuple and records must be reproduced
by a fresh `--compare` run.

## 3. Frozen configuration

The independent custody module freezes:

- its schema, lane metadata, root module, dependency-module tuple, validation
  policy, and authentication-scope flags;
- a canonical source record for every dependency module containing module,
  repository-relative path, byte count, and SHA-256; and
- a literal digest of the complete canonical configuration snapshot.

Runtime rebinding or mutation of any security-relevant constant must be
detected before a receipt is built, encoded, decoded, validated, or attested.
The old and new schemas, roots, configuration digests, and receipts are not
interchangeable.

## 4. Filesystem boundary

Source authentication must use descriptor-relative, no-follow traversal from
a resolved, nonsymlink repository root. Every path component and source leaf
must remain beneath that root. Every authenticated leaf must be a regular file
with exactly one hard link.

The implementation fails closed on malformed relative paths, symlinked roots,
ancestor or leaf symlinks, nonregular leaves, FIFOs, missing or unreadable
files, source drift, and inside- or outside-repository hardlink aliases.

No blanket `Path.resolve().read_bytes()` check is sufficient for this gate.

## 5. Receipt claims

The canonical receipt authenticates only the frozen Lean source bytes. It
records but does not authenticate:

- repository revision metadata;
- a Lean build or `.olean` tree;
- the declaration-level axiom audit;
- Python serialization or Lean/Python representation equivalence; or
- any solver input, execution, model, UNSAT result, or proof claim.

Every non-source authentication flag is the strict JSON Boolean `false`.
Receipt parsing is duplicate-free and canonical-byte exact; NaN and infinity,
unknown or missing fields, malformed source lists, non-Boolean substitutes,
and self-hash mismatch are rejected.

## 6. Durable evidence

The durable receipt is

```text
certificates/rigid221_card18_labeled_projection_source_custody_v1.json
```

It must be produced by the committed custody implementation, encoded to its
canonical bytes, decoded, revalidated against the live source tree, and
attested against the live tree in a separate invocation of the same fail-closed
API. This is process separation, not a claim of an independent validator. The
committed bytes and receipt self-hash must agree.

## 7. Acceptance gates

This checkpoint is complete only after:

1. the governed labeled-projection build remains green;
2. kernel mining with `--compare` reports the frozen module set unchanged;
3. the full focused filesystem/configuration/receipt security suite and Ruff
   pass;
4. the durable receipt passes canonical encode/decode/readback and live-tree
   attestation;
5. independent adversarial review confirms root scope, configuration
   immutability, filesystem defenses, strict parsing, and honest claim flags;
6. staged worktree hygiene reports no blocking issue; and
7. exact owned and durable paths are committed and pushed.

Passing these gates authorizes a separate predicate-coverage manifest
checkpoint. It does not authorize a source-faithful Python adapter or solver
canary. `CANARY AUTHORIZED` remains false.

## 8. Checkpoint evidence (2026-08-27)

- a fresh kernel mine reached 27,066 declarations from 363 root declarations
  and reported `UNCHANGED 26 modules` against the frozen tuple;
- all 26 frozen source byte counts and SHA-256 values match the live tree;
- the immutable configuration digest is
  `d40a946f5e33a0e7409240fc36e4d6abb3128517a756699e935edfea125d53dd`;
- the durable receipt is 8,496 canonical bytes, has self-hash
  `5afbd956e2a47b3a7e17f929edb534772b549c38bf1c5ea63e50f494cee0dbc0`,
  and passes separate live-tree parse, re-encode, and attestation;
- the new focused security suite reports 47 passing tests, the combined old
  and new custody suites report 86 passing tests, and Ruff passes; and
- independent adversarial review is **GO** for root scope, source records,
  configuration immutability, filesystem defenses, strict receipt handling,
  historical separation, and honest claim flags.

Only the source-byte claim is authenticated. Predicate completeness,
Lean/Python equivalence, and solver admission remain blocked.
