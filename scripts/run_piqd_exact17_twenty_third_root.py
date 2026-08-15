#!/usr/bin/env python3
"""Submit and finalize the twenty-third Lean-owned exact-17 PIQD root.

The twentieth-root runner is a historical custody artifact. Load its audited
bytes, specialize root-local labels in memory, and bind the twenty-clause child
rooted at the twenty-second model refinements. The inherited persisted-state
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
    source = source.replace("twentieth", "twenty-third")
    namespace: dict[str, Any] = {
        "__file__": str(BASE_RUNNER),
        "__name__": "_piqd_exact17_twenty_third_root_base",
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
            / "exact17-twenty-third-root-twenty-second-model-refinements.cnf",
            "INGRESS_MANIFEST": scratch
            / "piqd-ingress-manifest-twenty-second-model-refinements.json",
            "INGRESS_REPORT": scratch
            / "exact17-twenty-third-root-validation.json",
            "VARIABLES": 308,
            "CLAUSES": 5_846_228,
            "BYTES": 291_574_848,
            "CNF_SHA256": "e88c12f36d113e8bbbe1484b27cbfa6f997a679f46d8b22e356f79d339f08827",
            "MANIFEST_SHA256": "8bdac588f99c32ba521cc5d5d9498c7acf8abd32dbc31b14cb10e559109664e7",
            "DAEMON_SHA256": "82187247e58c7b10773d56e190d795bf8f914150d818691c7d22f96f7264b396",
            "SOLVER_NAME": "piqd-satworker-cadical-3.0.0",
            "SOLVER_SHA256": "0ee355934249f1b3f14a20928877391a87a0dd51326cf8c6135f75cba0b6b965",
        }
    )
    runner["main"]()


if __name__ == "__main__":
    main()
