#!/usr/bin/env python3
"""Submit and finalize the twentieth Lean-owned exact-17 PIQD root.

The nineteenth-root runner is a historical custody artifact. Load its audited
bytes, specialize root-local labels in memory, and bind the child rooted at the
nineteenth model refinements so no earlier job state or artifact can be
overwritten.
"""

from __future__ import annotations

import hashlib
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
BASE_RUNNER = ROOT / "scripts" / "run_piqd_exact17_nineteenth_root.py"
BASE_RUNNER_SHA256 = "9e98714678c441ed1334b9c5deabe9bfe47aeb370cb407c5527647205007ac84"


def load_runner() -> dict[str, Any]:
    source_bytes = BASE_RUNNER.read_bytes()
    actual_hash = hashlib.sha256(source_bytes).hexdigest()
    if actual_hash != BASE_RUNNER_SHA256:
        raise RuntimeError(
            "historical nineteenth-root runner changed: "
            f"expected {BASE_RUNNER_SHA256}, got {actual_hash}"
        )
    source = source_bytes.decode("utf-8")
    if source.count("nineteenth") != 5:
        raise RuntimeError("unexpected nineteenth-root specialization surface")
    source = source.replace("nineteenth", "twentieth")
    namespace: dict[str, Any] = {
        "__file__": str(BASE_RUNNER),
        "__name__": "_piqd_exact17_twentieth_root_base",
    }
    # The executed bytes are pinned above; this is specialization, not input evaluation.
    exec(compile(source, str(BASE_RUNNER), "exec"), namespace)  # noqa: S102
    inherited = namespace["load_runner"]()
    if not isinstance(inherited, dict):
        raise TypeError("nineteenth-root runner did not return a namespace")
    return inherited


def main() -> None:
    runner = load_runner()
    scratch = runner["SCRATCH"]
    runner.update(
        {
            "CNF": scratch
            / "exact17-twentieth-root-nineteenth-model-refinements.cnf",
            "INGRESS_MANIFEST": scratch
            / "piqd-ingress-manifest-nineteenth-model-refinements.json",
            "INGRESS_REPORT": scratch
            / "exact17-twentieth-root-nineteenth-model-refinements-validation.json",
            "VARIABLES": 308,
            "CLAUSES": 5_846_188,
            "BYTES": 291_573_096,
            "CNF_SHA256": "e719b8c17edf85e089d859fbc1ab8aaa43d8a6e9514f32eb4a76842a665dd3ce",
            "MANIFEST_SHA256": "42d6d1cf4ec489d5ec47c6d58e062b104bbec40aff605a3d3ce83c708f487c5a",
            "DAEMON_SHA256": "e00419994dac6c4ae8446b94eac0ae84a7025ea97ee0b3ffa42a20734367cd8f",
            "SOLVER_NAME": "piqd-satworker-cadical-3.0.0",
            "SOLVER_SHA256": "0ee355934249f1b3f14a20928877391a87a0dd51326cf8c6135f75cba0b6b965",
        }
    )
    runner["main"]()


if __name__ == "__main__":
    main()
