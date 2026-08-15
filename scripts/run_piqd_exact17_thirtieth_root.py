#!/usr/bin/env python3
"""Submit and finalize the thirtieth Lean-owned exact-17 PIQD root.

The twenty-ninth-root runner is a historical custody artifact. Load its
audited bytes, specialize root-local labels in memory, and bind the child
rooted at the twenty-ninth model refinements. The inherited persisted-state
gate makes ``start`` resumable without resubmitting the production job.
"""

from __future__ import annotations

import hashlib
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
BASE_RUNNER = ROOT / "scripts" / "run_piqd_exact17_twenty_ninth_root.py"
BASE_RUNNER_SHA256 = "66ab5abc2e8fc5b6937945c9b26f59d5b3f867eab7eaf30d4f4abfcc09319b32"


def load_runner() -> dict[str, Any]:
    source_bytes = BASE_RUNNER.read_bytes()
    actual_hash = hashlib.sha256(source_bytes).hexdigest()
    if actual_hash != BASE_RUNNER_SHA256:
        raise RuntimeError(
            "historical twenty-ninth-root runner changed: "
            f"expected {BASE_RUNNER_SHA256}, got {actual_hash}"
        )
    source = source_bytes.decode("utf-8")
    if source.count("twenty-ninth") != 4:
        raise RuntimeError("unexpected twenty-ninth-root specialization surface")
    source = source.replace("twenty-ninth", "thirtieth")
    namespace: dict[str, Any] = {
        "__file__": str(BASE_RUNNER),
        "__name__": "_piqd_exact17_thirtieth_root_base",
    }
    # The executed bytes are pinned above; this is specialization, not input evaluation.
    exec(compile(source, str(BASE_RUNNER), "exec"), namespace)  # noqa: S102
    inherited = namespace["load_runner"]()
    if not isinstance(inherited, dict):
        raise TypeError("twenty-ninth-root runner did not return a namespace")
    return inherited


def main() -> None:
    runner = load_runner()
    scratch = runner["SCRATCH"]
    runner.update(
        {
            "CNF": scratch
            / "exact17-thirtieth-root-twenty-ninth-model-refinements.cnf",
            "INGRESS_MANIFEST": scratch
            / "piqd-ingress-manifest-twenty-ninth-model-refinements.json",
            "INGRESS_REPORT": scratch
            / "piqd-thirtieth-root-export-validation.json",
            "VARIABLES": 308,
            "CLAUSES": 5_846_744,
            "BYTES": 291_596_500,
            "CNF_SHA256": "02aca42eb22814540816d9e4f1d19b2c71888700147e6b832d735f9efc41acd0",
            "MANIFEST_SHA256": "db261da1107184863e18a56ebbba69ce44653560add981679e235accc9be80b4",
            "DAEMON_SHA256": "aa47e2ff3000890d11da79296721f0f51c3a228d4ef8446af3c3d2a73d969107",
            "SOLVER_NAME": "piqd-satworker-cadical-3.0.0",
            "SOLVER_SHA256": "0ee355934249f1b3f14a20928877391a87a0dd51326cf8c6135f75cba0b6b965",
        }
    )
    runner["main"]()


if __name__ == "__main__":
    main()
