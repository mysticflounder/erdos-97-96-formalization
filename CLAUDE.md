# Agent Instructions

## Existing P97 Theorem Banks

Several large corpora of prior lean work are available in the
already-mined theorem-bank registry.

The canonical registry consists of:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Search this repository's indexed Lean source corpus before reproving a
candidate. Agentic searches accept plain-language queries and save context
compared with repeated direct searches.

```bash
nthdegree docs search --corpus erdos-97-96-formalization-lean "<mathematical statement or theorem name>"
nthdegree docs search --corpus erdos-97-96-formalization-lean --agentic "<mathematical statement or theorem name>"
```

Use `--lean` instead only when a cross-project search across every configured
Lean corpus is intentional, for example when looking for a sibling theorem:

```bash
nthdegree docs search --lean "<mathematical statement or theorem name>"
nthdegree docs search --lean --agentic "<mathematical statement or theorem name>"
```

Treat this as one bounded reuse preflight per concrete theorem candidate, not
a recurring checkpoint during ordinary proof work. Record the candidate,
immediate consumer, first missing antecedent or circularity, and relevant
source/import revision. Separately, after every completed CEGAR wave, mine
only that wave's new solver data for general theorems. Search the Lean corpus
again only if that mine produces a concrete new candidate or the reuse-search
key materially changes.

For the dated sibling-bank census and its trust/reachability qualifications, see
`docs/general-n-certificate-bank-mining-2026-07-09.md`. Treat its counts as a
snapshot and verify candidate statements, imports, and trust state before reuse.

## Bank source manifests

A `census/card_head` bank authenticates the Lean source its proof-carrying
claim rests on through a `source_manifest` of per-file SHA-256 digests, and
pins the result in `EXPECTED_BANK_SHA256`.  That file set is the frozen
`LEAN_DEPENDENCY_MODULES` tuple: the repository-local modules supplying a
declaration the bank's root modules transitively depend on, mined from the
Lean kernel.  It is deliberately NOT the transitive import closure, which was
about a hundred times larger and made unrelated commits break every
downstream pin.

Editing a Lean file no bank theorem reaches therefore breaks nothing.  If you
change a module that IS in a bank's set, re-mine and refreeze:

```bash
uv run python scripts/mine_bank_lean_dependencies.py <bank module> --compare
uv run python scratch/rigid221-sourceheavy-anchor/refreeze_narrowed_chain.py
uv run python scratch/rigid221-sourceheavy-anchor/refreeze_narrowed_chain.py --verify
```

Mining needs a built `.olean` tree.  The `--verify` walk runs the whole chain
with every frozen pin in force and overrides nothing; treat a checkpoint as
unverified until it reports `CHAIN VERIFY COMPLETE`.

## Communication with parallel agents
You can send messages to parallel agents via the erdos-97-96-formalization nthdegree convo. (`nthdegree convo`)

## Worktree ownership and artifact hygiene

Before a lane writes source or generates artifacts, give it a stable lane ID and
write `.codex/worktree-checkpoints/<lane-id>.json` using schema
`worktree-lane-checkpoint/v1`.  Declare exact source/test/doc paths in
`owned_paths`, exact retained evidence in `durable_paths`, and each runtime tree
in `generated_roots`.  Generated trees must use the registered layout
`scratch/runs/<lane-id>/<run-id>/` (or the governed card-head run layout), never
the repository root, `lean/`, or an ad hoc sibling of source files.

Run the read-only hygiene report at a natural checkpoint and before asking
another agent to take over:

```bash
python scripts/check_worktree_hygiene.py report --lane <lane-id>
```

Before staging or committing, stage exact owned paths only and require the
staged check to pass:

```bash
python scripts/check_worktree_hygiene.py check --lane <lane-id> --staged
```

Foreign dirty paths are reported for coordination.  Foreign staged paths are a
blocker: do not reset, unstage, amend, or commit them; wait for their owner or
use a separately reviewed exact-path commit after ownership is resolved.  Do
not use `git add .`, `git add -A`, directory pathspecs, or bulk formatting in a
shared worktree.

Runtime payloads are not made durable merely by living under `scratch/`.
Promote only authenticated manifests, receipts, reports, certificates, and
source needed for replay; put reproducible logs, caches, solver streams, and
temporary work below the declared generated root.  Cleanup is move-only
quarantine after a fresh reference/writer scan.  Never bulk-delete or
blanket-ignore JSON, Python, Lean, Markdown, manifests, receipts, or
certificates to make `git status` quiet.

## Proof obligations and promotion

Refer to the lean-usage skill for proof promotion guidelines, sorry policy,
etc.  If you don't see this skill in your context, notify the user immediately.

## Memory

This project uses nthdegree for persistent memory.

```bash
nthdegree recall "<query>"              # text output, default
nthdegree recall "<query>" [--format json]   # for scripted ULID extraction
nthdegree store "<content>" --type <decision|feedback|fact|reference>
nthdegree list                           # all memories
nthdegree stats
```

`recall` first before answering questions about past work in this project.

### Docs & Lean search

nthdegree also indexes ingested documentation corpora (project `docs/` trees,
papers, mathlib) as hybrid keyword+semantic search — prefer it over
`rg`/`find`/`grep` when what you want lives in a corpus (it finds by meaning,
not literal matches).

```bash
nthdegree docs list                                # configured corpora
nthdegree docs search --corpus <slug> "<query>"    # search one corpus
nthdegree docs search --current-project "<query>"  # this repo's prose docs
nthdegree docs search --lean "<query>"             # every project's Lean corpus, merged + ranked
```

For Lean, `--lean` searches every configured project's Lean corpus at once. To
search only this repository's Lean source, use
`--corpus erdos-97-96-formalization-lean`. Use `--current-project` only for this
repository's prose documentation. Post-filter with `--kind theorem` /
`--name add_*` / `--sig "↔"`.
