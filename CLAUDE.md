
## READ THIS BEFORE TOUCHING THE ERDŐS-97 SPINE

The publish target is `Problem97.erdos97_rhs` (P96 sibling). Its open leaves are
NOT a blank slate — they have an append-only authoritative status doc. **Before
working ANY spine sorry, read the owning plan doc IN FULL (including its tail —
it is append-only, newest checkpoint last), or you WILL re-derive months of
settled work.**

- Erased-pin / `isM44NonSurplusContainmentErasedPinTripleResidualsExcluded`
  (RemovableVertexOfLarge discharge): **`docs/four-point-subpacket-live-frontier.md`**
  is the authoritative owner. Its tail carries the live boundary.
- Get the live residual from the kernel, not from prose or your own inference:
  `proof-blueprint spine <symbol>` (slow; be patient) and
  `grep -rn "sorry" lean/Erdos9796Proof/P97/RemovableVertexAxiom/`.
- The 8-point bad-pattern EMPTINESS is ALREADY PROVEN sorry-free
  (`u5NoAuditedBoundedBadPattern`, U5FiniteExtraction.lean). Do NOT sweep/re-decide
  it. The open work is the CONFINEMENT/mask-incidence PRODUCER, not emptiness.
- The 4 open erased-pin sorries (Continuation.lean 174/202/303/328) are genuine
  geometric producers (per-center mask-incidence for the pinned erased-payload
  classes), NOT wiring; 174/202 additionally need global `HasNEquidistantProperty 4 A`.
  `nthdegree recall "SHARPENED boundary for the 4 erased-pin sorries"` for the map.

`nthdegree recall` first, then read the plan doc. Do not restate the plan's
conclusions by re-investigating the source — extend the plan.

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
