# Lean docstring census — nthdegree delivery index

> **Delivery status:** This file indexes the canonical full census in the shared `erdos-97-96-formalization` repository. The canonical census is a large JSONL artifact and is not reproduced inline here: the nthdegree delivery endpoint accepts only `.md`/`.lean` text files up to 262,144 UTF-8 bytes, while the full 24,957-record census exceeds that delivery shape.

## Canonical census

- Repository path: `docs/audits/docstrings-2026-09-01/residue-lantern-whole-tree.jsonl`
- Final audit commit: `11044dcc403c7145d64696059b5e1895e72a9231`
- Census SHA-256: `04bfdb61c31b0663190e4e08cc58c347053cf95e6f5d89d5ec2970163f54d9e8`
- Records: **24,957**
  - declaration docs (`/-- ... -/`): **21,670**
  - module docs (`/-! ... -/`): **3,287**

## Frozen source manifest

- Repository path: `docs/audits/docstrings-2026-09-01/residue-lantern-source-manifest.sha256`
- Included Lean source files: **5,397**
- Manifest SHA-256: `b98a0ad48f7703485f2d5bab517b1f9fd6fab524a485073c50e1799935b3f5c1`
- Frozen branch: `main`
- Frozen source HEAD: `9a222da97112efc204a038ca2f71ff5a12078f94`

## Census coverage

Each full-text record is tied to the frozen source manifest and captures the documentation block and source attachment information, including the source path and line range, documentation kind, exact text, attached declaration information where applicable, and audit/risk metadata.

Attachment reconciliation found:

- **21,667** declaration docs lexically attached to declarations;
- **3** declaration-style docs immediately preceding `#guard` commands, validated separately;
- **0** other lexical parser attachment failures in the frozen census;
- **21** module-doc sections immediately adjacent to declarations, reviewed separately;
- **4** malformed ordinary-comment openers (`/-/`) carrying intended declaration documentation, outside the `/--`/`/-!` record population.

## Population summary

### Attached declaration docs — 21,667

- 10 confirmed mismatches
- 10 review records in 6 groups
- 4,061 scoped-clean
- 17,586 automated-only

### Module docs — 3,287

- 1 confirmed native/compiler-trust mismatch
- 11 optional style reviews
- 21 validated adjacency sections
- 3,254 census-only

## Canonical report companion

- Path: `docs/audits/docstrings-2026-09-01/residue-lantern-semantic-audit.md`
- SHA-256: `645e7e30d7300ea3b82beb03b928a4745a4ab3e88c27a7fcab547d635b34a415`

The repository copies at commit `11044dcc403c7145d64696059b5e1895e72a9231` are the authoritative byte-for-byte artifacts.
