<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under GPL-3.0-or-later as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Exact-ten and exact-eleven Prove2Me transfer packet

This packet prepares two public theorem nodes and mission milestones for the
exact-cardinality endpoints already proved in the source Lean project:

```text
finite_nine_exclusion → finite_ten_exclusion → finite_eleven_exclusion
```

The theorem files are statement-only `SKETCH — NOT PROMOTABLE` stubs. The plan
deliberately has no `[[proof]]` entries and no `Solutions/` files: it is safe to
use for creating the public goals, but it does not pretend that the source
proofs have already been ported into Prove2Me's public environment.

Validate the packet locally, without network access, from the repository root:

```bash
uv run python prove2me/tools/prove2me_submit.py validate \
  prove2me/submissions/finite-ten-eleven/plan.toml
```

The live milestone ordering was reconciled and both public goals were created on
2026-09-10. The milestones occupy sort orders 10 and 11 after the two order-9
routes.

| Goal | Theorem ID | Milestone ID | Status |
| --- | --- | --- | --- |
| exact ten | `bbaf935e-32e1-4064-afaa-418647568fa9` | `cea298d2-663b-475e-9f63-bf66672bfea6` | Open transfer goal |
| exact eleven | `0c2105c8-40c2-4b5a-af9a-61f6237bd4b6` | `b39a02b2-d3c5-4bfb-91ee-1362b4c65f49` | Open transfer goal |

The first apply exposed a pagination bug after the twenty-first milestone was
created: the server listed 20 of 21 rows by default, so immediate readback could
not see exact eleven. Commit `74418fc23` teaches the reusable submission tool to
read every milestone page. The stored receipt was reconciled against page two,
and a second idempotent apply verified both theorem and milestone records without
creating duplicates.

Before adding real proof entries:

1. reuse the published exact-nine dependency;
2. port and verify exact ten;
3. port and verify exact eleven against the public exact-ten node;
4. test whether Prove2Me accepts the inherited native/compiler trust boundary;
5. retain local compilation, no-`sorry`, axiom, server, and readback evidence.

The source proofs are not core-only. Their documented final-consumer closures
are `{propext, Classical.choice, Quot.sound, Lean.ofReduceBool,
Lean.trustCompiler}`. Prove2Me acceptance of the two native/compiler axioms has
not yet been tested.
