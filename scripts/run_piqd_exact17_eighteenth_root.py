#!/usr/bin/env python3
"""Submit and finalize the eighteenth Lean-owned exact-17 PIQD root.

The seventeenth-root runner is a historical custody artifact. Load its audited
bytes, specialize root-local labels in memory, and bind the four-orbit child
so no earlier job state or artifact can be overwritten.
"""

from __future__ import annotations

import hashlib
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
BASE_RUNNER = ROOT / "scripts" / "run_piqd_exact17_seventeenth_root.py"
BASE_RUNNER_SHA256 = "35022e2013090d1b669fb372003fbac473267340b4f60883f21628973f883ad7"


def load_runner() -> dict[str, Any]:
    source_bytes = BASE_RUNNER.read_bytes()
    actual_hash = hashlib.sha256(source_bytes).hexdigest()
    if actual_hash != BASE_RUNNER_SHA256:
        raise RuntimeError(
            "historical seventeenth-root runner changed: "
            f"expected {BASE_RUNNER_SHA256}, got {actual_hash}"
        )
    source = source_bytes.decode("utf-8")
    if source.count("seventeenth") != 5:
        raise RuntimeError("unexpected seventeenth-root specialization surface")
    source = source.replace("seventeenth", "eighteenth")
    namespace: dict[str, Any] = {
        "__file__": str(BASE_RUNNER),
        "__name__": "_piqd_exact17_eighteenth_root_base",
    }
    # The executed bytes are pinned above; this is specialization, not input evaluation.
    exec(compile(source, str(BASE_RUNNER), "exec"), namespace)  # noqa: S102
    inherited = namespace["load_runner"]()
    if not isinstance(inherited, dict):
        raise TypeError("seventeenth-root runner did not return a namespace")
    return inherited


def main() -> None:
    runner = load_runner()
    scratch = runner["SCRATCH"]
    runner.update(
        {
            "CNF": scratch
            / "exact17-eighteenth-root-seventeenth-model-refinements.cnf",
            "INGRESS_MANIFEST": scratch
            / "piqd-ingress-manifest-seventeenth-model-refinements.json",
            "INGRESS_REPORT": scratch
            / "exact17-eighteenth-root-seventeenth-model-refinements-validation.json",
            "VARIABLES": 308,
            "CLAUSES": 5_846_160,
            "BYTES": 291_571_538,
            "CNF_SHA256": "40497f4c54505f66071aa7006040843d16592136d64b0a0508d895b11860577a",
            "MANIFEST_SHA256": "7e9698ecc5ec8635ddb4e1b2e0af4b3637310ec59e711960a8cf5500c8fe7329",
            "DAEMON_SHA256": "0cfc9577656fa3aef143a9fe7e5577d938dba9fd39f3b7118ed91735c97fc360",
        }
    )
    runner["main"]()


if __name__ == "__main__":
    main()
