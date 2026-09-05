# Lean docstring correctness audit — nthdegree delivery record

> **Delivery status:** This is a verified handoff record for the canonical audit artifact in the shared `erdos-97-96-formalization` repository. It is not a byte-for-byte copy of the canonical report because that repository checkout is not mounted in the current ChatGPT runtime.

## Canonical artifact

- Repository path: `docs/audits/docstrings-2026-09-01/residue-lantern-semantic-audit.md`
- Final audit commit: `11044dcc403c7145d64696059b5e1895e72a9231`
- Initial governed artifact commit: `733f190187503de6b2a8db00cbd19e8da24d8ac7`
- Canonical report SHA-256: `645e7e30d7300ea3b82beb03b928a4745a4ab3e88c27a7fcab547d635b34a415`
- Report blob prefix recorded by the audit agent: `3652ff`

## Frozen audit boundary

- Branch: `main`
- Source HEAD frozen at start and end: `9a222da97112efc204a038ca2f71ff5a12078f94`
- Included production Lean sources: **5,397**
- Source-manifest SHA-256: `b98a0ad48f7703485f2d5bab517b1f9fd6fab524a485073c50e1799935b3f5c1`
- Declaration doc blocks (`/-- ... -/`): **21,670**
- Lexically attached declaration docs: **21,667**
- Command-adjacent declaration-style docs: **3**
- Module doc blocks (`/-! ... -/`): **3,287**
- Total full-text census records: **24,957**

## Final classifications

### Declaration documentation

The 21,667 attached declaration docs were classified as:

- **10 confirmed semantic mismatches** (`D001`–`D010`)
- **10 review records in 6 groups**
- **4,061 scoped-clean entries**
- **17,586 automated-only entries**

Three additional command-adjacent documentation blocks were validated separately.

### Module documentation

The 3,287 module docs were classified as:

- **1 confirmed native/compiler-trust mismatch** (`M006`)
- **11 optional style reviews**
- **21 validated declaration-adjacency sections**
- **3,254 census-only entries**

There were also **4 confirmed malformed `/-/` documentation-opener defects** outside the `/--` and `/-!` JSONL population.

## Independent skeptic pass

The skeptic pass:

- accepted `D001`–`D010`;
- accepted `M001`–`M004`;
- confirmed the `M006` native-trust mismatch;
- downgraded `M005` and `M007`–`M016` to optional style reviews;
- found no additional high-confidence defect in sampled sensitive-clean groups.

## Verification boundary

- No Lean declarations, theorem statements, proofs, generated banks, or source doc comments were modified.
- Exact-path staged-hygiene checks passed for both audit commits.
- A Lake build was **not** run or claimed because this was an audit-only, no-source-edit lane.
- Final audit status reported by the governed agent:

```text
COMPLETE-AUDIT 11044dcc403c7145d64696059b5e1895e72a9231
5397 sources
21670 declaration docs
3287 module docs
0 source corrections
15 confirmed findings
17 review groups
build=not-run-audit-only
```

## Related canonical files

- Full report: `docs/audits/docstrings-2026-09-01/residue-lantern-semantic-audit.md`
- Full census: `docs/audits/docstrings-2026-09-01/residue-lantern-whole-tree.jsonl`
- Frozen source manifest: `docs/audits/docstrings-2026-09-01/residue-lantern-source-manifest.sha256`
