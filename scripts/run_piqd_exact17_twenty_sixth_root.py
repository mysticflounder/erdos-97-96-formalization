#!/usr/bin/env python3
"""Submit and finalize the twenty-sixth Lean-owned exact-17 PIQD root.

The twenty-fourth-root runner is a historical custody artifact. Load its
audited bytes, specialize root-local labels in memory, and bind the child
rooted at the twenty-fifth model refinements. The inherited persisted-state
gate makes ``start`` resumable without resubmitting the production job.
"""

from __future__ import annotations

import hashlib
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
BASE_RUNNER = ROOT / "scripts" / "run_piqd_exact17_twenty_fourth_root.py"
BASE_RUNNER_SHA256 = "583fa7fed744816d3783813274b4c7190931894d2c529cad28076587613e6bcb"


def load_runner() -> dict[str, Any]:
    source_bytes = BASE_RUNNER.read_bytes()
    actual_hash = hashlib.sha256(source_bytes).hexdigest()
    if actual_hash != BASE_RUNNER_SHA256:
        raise RuntimeError(
            "historical twenty-fourth-root runner changed: "
            f"expected {BASE_RUNNER_SHA256}, got {actual_hash}"
        )
    source = source_bytes.decode("utf-8")
    if source.count("twenty-fourth") != 3:
        raise RuntimeError("unexpected twenty-fourth-root specialization surface")
    source = source.replace("twenty-fourth", "twenty-sixth")
    namespace: dict[str, Any] = {
        "__file__": str(BASE_RUNNER),
        "__name__": "_piqd_exact17_twenty_sixth_root_base",
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
            / "exact17-twenty-sixth-root-twenty-fifth-model-refinements.cnf",
            "INGRESS_MANIFEST": scratch
            / "piqd-ingress-manifest-twenty-fifth-model-refinements.json",
            "INGRESS_REPORT": scratch
            / "piqd-ingress-twenty-fifth-model-refinements-validation.json",
            "VARIABLES": 308,
            "CLAUSES": 5_846_272,
            "BYTES": 291_576_766,
            "CNF_SHA256": "d238b81bfdc40c53c948c7655285e0b74203711e1b5cd013fb8d8c9ad1a642f5",
            "MANIFEST_SHA256": "138d488c822f0a3abdd1443bac0f5386fc254ce6efec2964a804557d5ae7cd33",
            "DAEMON_SHA256": "82187247e58c7b10773d56e190d795bf8f914150d818691c7d22f96f7264b396",
            "SOLVER_NAME": "piqd-satworker-cadical-3.0.0",
            "SOLVER_SHA256": "0ee355934249f1b3f14a20928877391a87a0dd51326cf8c6135f75cba0b6b965",
        }
    )
    runner["main"]()


if __name__ == "__main__":
    main()
