#!/usr/bin/env python3
"""Submit and finalize the twenty-seventh Lean-owned exact-17 PIQD root.

The twenty-fourth-root runner is a historical custody artifact. Load its
audited bytes, specialize root-local labels in memory, and bind the child
rooted at the twenty-sixth model refinements. The inherited persisted-state
gate makes ``start`` resumable without resubmitting the production job.
"""

from __future__ import annotations

import hashlib
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
BASE_RUNNER = ROOT / "scripts" / "run_piqd_exact17_twenty_fourth_root.py"
BASE_RUNNER_SHA256 = "b43652c7436f16f0c8365b5d690212e1fb4d6c31a5fa1637913fe4e734d7f3ce"


def load_runner() -> dict[str, Any]:
    source_bytes = BASE_RUNNER.read_bytes()
    actual_hash = hashlib.sha256(source_bytes).hexdigest()
    if actual_hash != BASE_RUNNER_SHA256:
        raise RuntimeError(
            "historical twenty-fourth-root runner changed: "
            f"expected {BASE_RUNNER_SHA256}, got {actual_hash}"
        )
    source = source_bytes.decode("utf-8")
    if source.count("twenty-fourth") != 4:
        raise RuntimeError("unexpected twenty-fourth-root specialization surface")
    source = source.replace("twenty-fourth", "twenty-seventh")
    namespace: dict[str, Any] = {
        "__file__": str(BASE_RUNNER),
        "__name__": "_piqd_exact17_twenty_seventh_root_base",
    }
    # The executed bytes are pinned above; this is specialization, not input evaluation.
    exec(compile(source, str(BASE_RUNNER), "exec"), namespace)  # noqa: S102
    inherited = namespace["load_runner"]()
    if not isinstance(inherited, dict):
        raise TypeError("twenty-fourth-root runner did not return a namespace")
    return inherited


def main() -> None:
    runner = load_runner()
    scratch = runner["SCRATCH"]
    runner.update(
        {
            "CNF": scratch
            / "exact17-twenty-seventh-root-twenty-sixth-model-refinements.cnf",
            "INGRESS_MANIFEST": scratch
            / "piqd-ingress-manifest-twenty-sixth-model-refinements.json",
            "INGRESS_REPORT": scratch
            / "exact17-twenty-seventh-root-validation.json",
            "VARIABLES": 308,
            "CLAUSES": 5_846_284,
            "BYTES": 291_577_238,
            "CNF_SHA256": "566d394436a30d1fee4c85240433f0217223c6f2ecf80e2945568ea37646194b",
            "MANIFEST_SHA256": "7c8d60e7e7847a7c219047fc7023aff862ed5d32b6ee6e688e68d62aad2a3a44",
            "DAEMON_SHA256": "c853176aff2cd9cadec20e10d58b917bde5f016ddc5bd10f06e5e525321b4d81",
            "SOLVER_NAME": "piqd-satworker-cadical-3.0.0",
            "SOLVER_SHA256": "0ee355934249f1b3f14a20928877391a87a0dd51326cf8c6135f75cba0b6b965",
        }
    )
    runner["main"]()


if __name__ == "__main__":
    main()
