#!/usr/bin/env python3
"""Submit and finalize the thirty-first Lean-owned exact-17 PIQD root.

The thirtieth-root runner is a historical custody artifact. Load its audited
bytes, specialize root-local labels in memory, and bind the child rooted at
the thirtieth model refinements. The inherited persisted-state gate makes
``start`` resumable without resubmitting the production job.
"""

from __future__ import annotations

import hashlib
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
BASE_RUNNER = ROOT / "scripts" / "run_piqd_exact17_thirtieth_root.py"
BASE_RUNNER_SHA256 = "434771e2aeff9be260bc521296acd0184398cfe9542a2ef3188ae397b0f20cbc"


def load_runner() -> dict[str, Any]:
    source_bytes = BASE_RUNNER.read_bytes()
    actual_hash = hashlib.sha256(source_bytes).hexdigest()
    if actual_hash != BASE_RUNNER_SHA256:
        raise RuntimeError(
            "historical thirtieth-root runner changed: "
            f"expected {BASE_RUNNER_SHA256}, got {actual_hash}"
        )
    source = source_bytes.decode("utf-8")
    if source.count("thirtieth") != 5:
        raise RuntimeError("unexpected thirtieth-root specialization surface")
    source = source.replace("thirtieth", "thirty-first")
    namespace: dict[str, Any] = {
        "__file__": str(BASE_RUNNER),
        "__name__": "_piqd_exact17_thirty_first_root_base",
    }
    # The executed bytes are pinned above; this is specialization, not input evaluation.
    exec(compile(source, str(BASE_RUNNER), "exec"), namespace)  # noqa: S102
    inherited = namespace["load_runner"]()
    if not isinstance(inherited, dict):
        raise TypeError("thirtieth-root runner did not return a namespace")
    return inherited


def main() -> None:
    runner = load_runner()
    scratch = runner["SCRATCH"]
    runner.update(
        {
            "CNF": scratch
            / "exact17-thirty-first-root-thirtieth-model-refinements.cnf",
            "INGRESS_MANIFEST": scratch
            / "piqd-ingress-manifest-thirtieth-model-refinements.json",
            "INGRESS_REPORT": scratch
            / "piqd-thirtieth-root-export-validation.json",
            "VARIABLES": 308,
            "CLAUSES": 5_846_904,
            "BYTES": 291_602_886,
            "CNF_SHA256": "3c847c1ebcacf85256b65d54563584a8b89eb50f427fe268e2f916d4cdafa204",
            "MANIFEST_SHA256": "f0a3b6304ed59524b48e3cc7c6336d15b44b8b6eef02b1d2f95be0cc67dd0c4f",
            "DAEMON_SHA256": "aa47e2ff3000890d11da79296721f0f51c3a228d4ef8446af3c3d2a73d969107",
            "SOLVER_NAME": "piqd-satworker-cadical-3.0.0",
            "SOLVER_SHA256": "0ee355934249f1b3f14a20928877391a87a0dd51326cf8c6135f75cba0b6b965",
        }
    )
    runner["main"]()


if __name__ == "__main__":
    main()
