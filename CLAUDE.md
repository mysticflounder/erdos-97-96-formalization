
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

For Lean, `--lean` searches EVERY configured project's Lean corpus at once (from
any dir); add `--corpus <slug>` to scope to one, or `--current-project` for this
repo. Post-filter with `--kind theorem` / `--name add_*` / `--sig "↔"`.
