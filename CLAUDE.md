# Agent Instructions

## Erdo

## Existing P97 Theorem Banks

Several large corpora of prior lean work is available in the
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

The sibling census has already identified:

- 96 general-n U5 class-level incidence incompatibility families, supported by
  88 metric-point and 112 scalar-algebra kernels;
- 18 unimported U1 source-unit contradiction consumers for ordinals
  `2, 12, 40, 47, 88, 136, 169, 206`; and
- `Problem97.U1LargeCapRouteBTailMetricResidualTarget.u1TwoLargeCapObstruction`.

## Communication with parallel agents
You can send messages to parallel agents via the erdos-97-96-formalization nthdegree convo. (`nthdegree convo`)

## Proof obligations and promotion

Refer to the lean-usage skill for proof promotion guidelines, sorry policy,
etc.  If you don't see this skill in your context, notify the user immediately.
