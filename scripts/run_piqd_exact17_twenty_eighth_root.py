#!/usr/bin/env python3
"""Submit and finalize the twenty-eighth Lean-owned exact-17 PIQD root.

The twenty-fourth-root runner is a historical custody artifact. Load its
audited bytes, specialize root-local labels in memory, and bind the child
rooted at the twenty-seventh model refinements. The inherited persisted-state
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
    source = source.replace("twenty-fourth", "twenty-eighth")
    namespace: dict[str, Any] = {
        "__file__": str(BASE_RUNNER),
        "__name__": "_piqd_exact17_twenty_eighth_root_base",
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
            / "exact17-twenty-eighth-root-twenty-seventh-model-refinements.cnf",
            "INGRESS_MANIFEST": scratch
            / "piqd-ingress-manifest-twenty-seventh-model-refinements.json",
            "INGRESS_REPORT": scratch
            / "piqd-ingress-twenty-seventh-model-refinements-validation.json",
            "VARIABLES": 308,
            "CLAUSES": 5_846_288,
            "BYTES": 291_577_468,
            "CNF_SHA256": "86bbb7f4a8f78372e9df8ff830a6737475e44defd42a013d41885fe1966ab02c",
            "MANIFEST_SHA256": "1857b429d589e404ad7d9e871dd8a1b6b9d4d485ef46c08375a9f4ce7894a03c",
            "DAEMON_SHA256": "aa47e2ff3000890d11da79296721f0f51c3a228d4ef8446af3c3d2a73d969107",
            "SOLVER_NAME": "piqd-satworker-cadical-3.0.0",
            "SOLVER_SHA256": "0ee355934249f1b3f14a20928877391a87a0dd51326cf8c6135f75cba0b6b965",
        }
    )
    runner["main"]()


if __name__ == "__main__":
    main()
