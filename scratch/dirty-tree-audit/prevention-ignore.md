# Dirty-tree prevention: smallest safe ignore/layout policy

This is a read-only recommendation; `.gitignore` was not changed. The current
tree already ignores Lake/venv/oleans, many solver extensions, and a number of
named campaigns, but still exposes mixed-content campaign roots. The visible
untracked population is dominated by `scratch/` (about 9k files in the latest
sample), while `lean/scratch/` contains both temporary diagnostics and
potentially promotable `.lean` source.

## Recommended minimal `.gitignore` delta

Add only structural generated subtrees, not broad extensions:

```gitignore
# Every campaign keeps source, REPORT.md, manifests, and certificates at its root.
# Regenerable execution products live below these names.
/scratch/**/runs/
/scratch/**/out/
/scratch/**/artifacts/
/scratch/**/logs/
/scratch/**/cache/
/scratch/**/.work/

# Lean scratch diagnostics; leave .lean source visible for promotion review.
/lean/scratch/**/runs/
/lean/scratch/**/out/
/lean/scratch/**/artifacts/
/lean/scratch/**/*.errors
/lean/scratch/**/*.lock

# Frontier package solver products are regenerated from encoding.py + spec.
# Keep out/manifest.json, RESULTS.md, specs, scripts, and any explicitly
# promoted certificate visible; ignore only bulk solver payloads going forward.
/census/frontier-packages/**/out/**/*.cnf
/census/frontier-packages/**/out/**/*.drat
/census/frontier-packages/**/out/**/*.lrat
```

The existing `.lake/`, `*.olean`, cache, and many `scratch/**/*.log/.cnf/.drat`
rules should not be duplicated. Do not add global `scratch/**/*.json`,
`*.py`, `*.lean`, or `*.md` rules: the current untracked examples include
`REPORT.md`, replay scripts, Lean source candidates, manifests, and audit
notes. Do not add `/scratch/*/` or `/lean/scratch/**/` blanket rules for the
same reason.

The patterns above affect only future untracked files; already tracked files
remain tracked. If `out/` itself is ignored in a later cleanup, put the
manifest at the package root first rather than relying on negation through an
ignored parent.

## Artifact-layout contract

Use this shape for every new campaign:

```text
scratch/<campaign>/
  REPORT.md                 # durable human interpretation
  manifest.json             # durable machine record + hashes
  source/                   # only if not yet promoted to census/ or lean/
  certificates/             # only proof-carrying, reviewed payloads
  runs/<run-id>/             # ignored solver/CNF/log/model output
```

The root is the review surface. A manifest should record source/spec revision,
command, solver and checker versions, SAT/UNSAT status, variable/clause
counts, artifact filenames, SHA-256 digests, and (for UNSAT) proof-checker
status. A report should state the mathematical scope and whether the result
is diagnostic, empirical, or a promoted certificate. Raw search excerpts and
conversation dumps belong under `runs/`, not beside the report.

For Lean experiments, keep temporary `.lean` files visible until promotion or
explicit disposal; once promoted, move the source into the governed
`lean/Erdos9796Proof/...` tree. Build oleans, traces, copied package trees,
locks, and error logs belong under ignored `runs/`/`out/` subtrees.

## Frontier-package generated outputs

The tracked `census/frontier-packages/**/out/` population is 277 files in the
current index: approximately 118 CNF, 94 DRAT, 45 decoded model JSON, and 20
other JSON outputs. The package source/spec/RESULTS files are small and should
remain tracked. The current outputs are useful replay evidence, but they are
deterministic products of the encoders and are not imported directly by the
Lean proof spine.

Recommended retention split:

- Keep tracked: `encoding.py`, `run.py`, `smoke.py`, specs, `RESULTS.md`, and a
  compact `manifest.json` per package/run. Keep a selected decoded witness
  only when a test or report explicitly consumes it.
- Migrate to manifest-only plus external artifact custody: duplicate CNF
  smoke/base files, duplicate model JSONs, and bulk DRAT outputs. Store each
  artifact's digest, dimensions, verdict, command, and checker result in the
  manifest; retain the payload in the project artifact store or archive.
- Keep proof payloads in the repository only when a reviewed Lean theorem or
  certificate explicitly consumes them. Otherwise put DRAT/LRAT in the
  external certificate archive and record its immutable digest and retrieval
  pointer. A proof that is promoted into `certificates/` is durable and must
  not be hidden by a generic ignore rule.
- Do not delete or untrack the current 277 files solely by adding ignore
  rules. First make manifests complete and verify replay/checker coverage;
  then migrate in a separately audited tranche.

This policy removes recurring campaign noise structurally while preserving
the source/spec/report/manifest/certificate boundary that future staging can
review mechanically.
