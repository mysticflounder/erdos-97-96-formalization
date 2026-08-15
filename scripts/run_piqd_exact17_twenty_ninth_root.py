#!/usr/bin/env python3
"""Submit and finalize the twenty-ninth Lean-owned exact-17 PIQD root.

The twenty-fourth-root runner is a historical custody artifact. Load its
audited bytes, specialize root-local labels in memory, and bind the child
rooted at the twenty-eighth model refinements. The inherited persisted-state
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
    source = source.replace("twenty-fourth", "twenty-ninth")
    namespace: dict[str, Any] = {
        "__file__": str(BASE_RUNNER),
        "__name__": "_piqd_exact17_twenty_ninth_root_base",
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
            / "exact17-twenty-ninth-root-twenty-eighth-model-refinements.cnf",
            "INGRESS_MANIFEST": scratch
            / "piqd-ingress-manifest-twenty-eighth-model-refinements.json",
            "INGRESS_REPORT": scratch
            / "piqd-twenty-ninth-root-export-validation.json",
            "VARIABLES": 308,
            "CLAUSES": 5_846_544,
            "BYTES": 291_588_188,
            "CNF_SHA256": "620ea5ad066edf6526d11eb51c4cff93284130f6fd27de46d8d0c2e5ff9c0c53",
            "MANIFEST_SHA256": "29bfc11cfb30f807252e38aa0e0ea0cc4470fd1e6a805e552596a0b4b3573a4a",
            "DAEMON_SHA256": "aa47e2ff3000890d11da79296721f0f51c3a228d4ef8446af3c3d2a73d969107",
            "SOLVER_NAME": "piqd-satworker-cadical-3.0.0",
            "SOLVER_SHA256": "0ee355934249f1b3f14a20928877391a87a0dd51326cf8c6135f75cba0b6b965",
        }
    )
    runner["main"]()


if __name__ == "__main__":
    main()
