# Crossed-arm deterministic CNF export acceptance audit

Date: 2026-08-01

## Verdict

**ACCEPT** the corrected crossed-arm exporter as a deterministic, complete
Booleanization of the validated bounded checkpoint input.

All formerly blocking acceptance findings are fixed:

- historical checkpoints that omit `critical_no_K4_representation` default to
  `triple-clauses`;
- explicit `compact-pb` records are accepted and exported through the
  equivalent canonical triple-clause representation;
- conflicting, unsupported, noncanonical, or duplicate representation/cut
  records fail closed;
- package verification regenerates the variable registry, complete clause
  provenance (including aliases), and DIMACS clauses from the packaged
  canonical learned-cut keys, rather than trusting mutually consistent
  digests;
- coordinated CNF/manifest, variable/registry, alias/provenance, and
  learned-cut/digest tampering is rejected;
- authenticated verification requires an external `Path`, rereads its bytes
  through the strict checkpoint loader, and compares both the raw source
  digest and reconstructed cut package;
- caller-constructed `FrozenCheckpoint` objects and string path surrogates are
  rejected for authentication; and
- regeneration is byte-deterministic and path-independent for every package
  artifact. No absolute path, `scratch/` path, or temporary-directory path is
  embedded in the package.

The bounded regression suite passed 22/22 tests. Independent adversarial probes
also confirmed that changed raw bytes, changed cut ledgers, and fabricated
checkpoint objects cannot receive authenticated status.

## Reproduced production package

The accepted compact-source checkpoint is
`source-at-common-compact-source-semantic-replay-one-candidate-300s-critical-k4-compact-pb/result.json`.
Authenticated regeneration reported 89,152 variables and 1,217,857 unique
clauses.

| Artifact | Bytes | SHA-256 |
|---|---:|---|
| `start.cnf` | 31,304,211 | `e00fc35916ad54f6c0a24bf2b81ea1f0cdd2de8d6bc0e42c05f6a4b271e3bd27` |
| `variables.json` | 13,894,233 | `8e0fa52b2df909eaa78b4a26f17ccd71a1eff011b6fc2c22a56dc3312209bd8f` |
| `clause-provenance.json` | 66,566,008 | `9fa221d3bfc85447466f3a463e0110359539229a81c27f930ed57d953dcab377` |
| `learned-cuts.json` | 23,835,729 | `110a1d33eb0d9ff07eb76d956328621d12073b0792fca993d92aad160a801f29` |
| `manifest.json` | 18,914 | `29e391b8b7513d6a6c1f7846ed2b290d0914763f7423727845c59d8ef861c886` |

The earlier legacy checkpoint regenerated to 1,224,020 clauses with CNF
SHA-256
`6a6257624904869b908980f6548825418efa71a2e67ec62b8878a383ab73cc88`.
Both packages have the identical 1,023,270-clause canonical base, including the
371,280-clause critical no-K4 phase. The 6,163-clause total difference is
entirely learned-cut normalization and later cut content, not a weakening or a
different base encoding:

- 38,707 `reversed_second` keys are exact rotated aliases of present `first`
  keys and add no unique legacy clauses;
- 2,222 `five_kalmanson_three_selected_rows` and 3,973
  `six_sparse_two_selected_rows` clauses are redundant in the presence of
  their stronger raw-equality subsumers, removing 6,195 unique clauses;
- the compact-source checkpoint adds 26 unique theorem clauses and three
  `raw_btw_sep` keys, which emit six structural clauses.

Thus `1,224,020 - 6,195 + 26 + 6 = 1,217,857`. Every removed legacy key has
its exact canonical key or stronger subsuming key in the compact-source
checkpoint.

## Trust boundary

This acceptance is for an **input-formula exporter**, not for a contradiction
or theorem closure.

- Standalone package verification establishes deterministic internal
  self-consistency and reports
  `PACKAGE_OK_SELF_CONSISTENT_UNAUTHENTICATED_SOURCE`.
- Source authentication requires an external checkpoint `Path`; successful
  verification reports
  `PACKAGE_OK_AUTHENTICATED_SOURCE_INPUT_FORMULA_ONLY`.
- No SAT solver was invoked, no UNSAT result is claimed, no DRAT/LRAT proof was
  checked, and no Lean kernel theorem was produced or checked.

Accordingly, this audit does not promote the package to SAT-certified,
LRAT-certified, or Lean-closed status.
