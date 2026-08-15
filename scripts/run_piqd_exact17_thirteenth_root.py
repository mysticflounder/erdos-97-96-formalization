#!/usr/bin/env python3
"""Submit and finalize the thirteenth Lean-owned exact-17 PIQD root.

The twelfth-root runner is a historical custody artifact. Load its audited
bytes, specialize root-local labels in memory, and bind the fourth-row
convex-five-point child so no earlier job state or artifact can be overwritten.
"""

from __future__ import annotations

import hashlib
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
BASE_RUNNER = ROOT / "scripts" / "run_piqd_exact17_twelfth_root.py"
BASE_RUNNER_SHA256 = "fb795deb0c32a96ec79b1b1d27aeac417c93f3076d64ce549b839e13bdc4ce1d"


def load_runner() -> dict[str, Any]:
    source_bytes = BASE_RUNNER.read_bytes()
    actual_hash = hashlib.sha256(source_bytes).hexdigest()
    if actual_hash != BASE_RUNNER_SHA256:
        raise RuntimeError(
            "historical twelfth-root runner changed: "
            f"expected {BASE_RUNNER_SHA256}, got {actual_hash}"
        )
    source = source_bytes.decode("utf-8")
    if source.count("twelfth") != 3:
        raise RuntimeError("unexpected twelfth-root specialization surface")
    source = source.replace("twelfth", "thirteenth")
    namespace: dict[str, Any] = {
        "__file__": str(BASE_RUNNER),
        "__name__": "_piqd_exact17_thirteenth_root_base",
    }
    # The executed bytes are pinned above; this is specialization, not input evaluation.
    exec(compile(source, str(BASE_RUNNER), "exec"), namespace)  # noqa: S102
    inherited = namespace["load_runner"]()
    if not isinstance(inherited, dict):
        raise TypeError("twelfth-root runner did not return a namespace")
    return inherited


def main() -> None:
    runner = load_runner()
    scratch = runner["SCRATCH"]
    runner.update(
        {
            "CNF": scratch
            / "exact17-thirteenth-root-convex-five-point-fourth-rows.cnf",
            "INGRESS_MANIFEST": scratch
            / "piqd-ingress-manifest-convex-five-point-fourth-rows.json",
            "INGRESS_REPORT": scratch
            / "exact17-thirteenth-root-convex-five-point-fourth-rows-validation.json",
            "VARIABLES": 308,
            "CLAUSES": 5_846_096,
            "BYTES": 291_568_704,
            "CNF_SHA256": "82a0fe73b57b3c28e9b622eacde46b9ed4f789846231db912014624c46b31ae8",
            "MANIFEST_SHA256": "a5f95e63b7d30916805ccc66b680224fe1e768fbfb9c43ea8d09f74cac4eda8a",
            "DAEMON_SHA256": "0cfc9577656fa3aef143a9fe7e5577d938dba9fd39f3b7118ed91735c97fc360",
        }
    )
    runner["main"]()


if __name__ == "__main__":
    main()
