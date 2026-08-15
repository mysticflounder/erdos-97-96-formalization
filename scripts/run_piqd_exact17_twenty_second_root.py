#!/usr/bin/env python3
"""Submit and finalize the twenty-second Lean-owned exact-17 PIQD root.

The twentieth-root runner is a historical custody artifact. Load its audited
bytes, specialize root-local labels in memory, and bind the eight-clause child
rooted at the twenty-first model refinements. The inherited persisted-state
gate makes ``start`` resumable without ever resubmitting the production job.
"""

from __future__ import annotations

import hashlib
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
BASE_RUNNER = ROOT / "scripts" / "run_piqd_exact17_twentieth_root.py"
BASE_RUNNER_SHA256 = "ccbc0f71e1040a2db01ad019dd48c5b1d78d4bbf59d4029477536b876ae210ea"


def load_runner() -> dict[str, Any]:
    source_bytes = BASE_RUNNER.read_bytes()
    actual_hash = hashlib.sha256(source_bytes).hexdigest()
    if actual_hash != BASE_RUNNER_SHA256:
        raise RuntimeError(
            "historical twentieth-root runner changed: "
            f"expected {BASE_RUNNER_SHA256}, got {actual_hash}"
        )
    source = source_bytes.decode("utf-8")
    if source.count("twentieth") != 5:
        raise RuntimeError("unexpected twentieth-root specialization surface")
    source = source.replace("twentieth", "twenty-second")
    namespace: dict[str, Any] = {
        "__file__": str(BASE_RUNNER),
        "__name__": "_piqd_exact17_twenty_second_root_base",
    }
    # The executed bytes are pinned above; this is specialization, not input evaluation.
    exec(compile(source, str(BASE_RUNNER), "exec"), namespace)  # noqa: S102
    inherited = namespace["load_runner"]()
    if not isinstance(inherited, dict):
        raise TypeError("twentieth-root runner did not return a namespace")
    return inherited


def main() -> None:
    runner = load_runner()
    scratch = runner["SCRATCH"]
    runner.update(
        {
            "CNF": scratch
            / "exact17-twenty-second-root-twenty-first-model-refinements.cnf",
            "INGRESS_MANIFEST": scratch
            / "piqd-ingress-manifest-twenty-first-model-refinements.json",
            "INGRESS_REPORT": scratch
            / "piqd-twenty-first-model-refinements-export-validation.json",
            "VARIABLES": 308,
            "CLAUSES": 5_846_208,
            "BYTES": 291_573_930,
            "CNF_SHA256": "dc44614e28c907d5c61b29e58cc6f6188e52a2504e119efa37157a81a56f7edb",
            "MANIFEST_SHA256": "e66141fa9b832ef37b5b99d45c531929c82d77d465747c7488929e360cb77693",
            "DAEMON_SHA256": "82187247e58c7b10773d56e190d795bf8f914150d818691c7d22f96f7264b396",
            "SOLVER_NAME": "piqd-satworker-cadical-3.0.0",
            "SOLVER_SHA256": "0ee355934249f1b3f14a20928877391a87a0dd51326cf8c6135f75cba0b6b965",
        }
    )
    runner["main"]()


if __name__ == "__main__":
    main()
