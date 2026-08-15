#!/usr/bin/env python3
"""Submit and finalize the nineteenth Lean-owned exact-17 PIQD root.

The eighteenth-root runner is a historical custody artifact. Load its audited
bytes, specialize root-local labels in memory, and bind the four-clause child
so no earlier job state or artifact can be overwritten.
"""

from __future__ import annotations

import hashlib
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
BASE_RUNNER = ROOT / "scripts" / "run_piqd_exact17_eighteenth_root.py"
BASE_RUNNER_SHA256 = "33eb06481dfe323d20e138ba559cdb0b73bfb1b7d71475b21c8ea0b2b103ac25"


def load_runner() -> dict[str, Any]:
    source_bytes = BASE_RUNNER.read_bytes()
    actual_hash = hashlib.sha256(source_bytes).hexdigest()
    if actual_hash != BASE_RUNNER_SHA256:
        raise RuntimeError(
            "historical eighteenth-root runner changed: "
            f"expected {BASE_RUNNER_SHA256}, got {actual_hash}"
        )
    source = source_bytes.decode("utf-8")
    if source.count("eighteenth") != 5:
        raise RuntimeError("unexpected eighteenth-root specialization surface")
    source = source.replace("eighteenth", "nineteenth")
    namespace: dict[str, Any] = {
        "__file__": str(BASE_RUNNER),
        "__name__": "_piqd_exact17_nineteenth_root_base",
    }
    # The executed bytes are pinned above; this is specialization, not input evaluation.
    exec(compile(source, str(BASE_RUNNER), "exec"), namespace)  # noqa: S102
    inherited = namespace["load_runner"]()
    if not isinstance(inherited, dict):
        raise TypeError("eighteenth-root runner did not return a namespace")
    return inherited


def main() -> None:
    runner = load_runner()
    scratch = runner["SCRATCH"]
    runner.update(
        {
            "CNF": scratch
            / "exact17-nineteenth-root-eighteenth-model-refinements.cnf",
            "INGRESS_MANIFEST": scratch
            / "piqd-ingress-manifest-eighteenth-model-refinements.json",
            "INGRESS_REPORT": scratch
            / "exact17-nineteenth-root-eighteenth-model-refinements-validation.json",
            "VARIABLES": 308,
            "CLAUSES": 5_846_164,
            "BYTES": 291_571_750,
            "CNF_SHA256": "534ae4fb643f76f5cdf7cecdd6ee984fb41da3dc76da202e082075d3d82c3db2",
            "MANIFEST_SHA256": "a8a262e048697580d937c0d90bc4a29ba273e44c0568266efd615b98fa74f0eb",
            "DAEMON_SHA256": "0cfc9577656fa3aef143a9fe7e5577d938dba9fd39f3b7118ed91735c97fc360",
        }
    )
    runner["main"]()


if __name__ == "__main__":
    main()
