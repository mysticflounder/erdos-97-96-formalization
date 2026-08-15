#!/usr/bin/env python3
"""Submit and finalize the twelfth Lean-owned exact-17 PIQD root.

The eleventh-root runner is a historical custody artifact. Load its audited
bytes, specialize root-local labels in memory, and bind the convex-five-point
child so no earlier job state or artifact can be overwritten.
"""

from __future__ import annotations

import hashlib
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
BASE_RUNNER = ROOT / "scripts" / "run_piqd_exact17_eleventh_root.py"
BASE_RUNNER_SHA256 = "3fa866f211ea5aed381770064907b0f99ac276accb8c07e69da729fe80237c6d"


def load_runner() -> dict[str, Any]:
    source_bytes = BASE_RUNNER.read_bytes()
    actual_hash = hashlib.sha256(source_bytes).hexdigest()
    if actual_hash != BASE_RUNNER_SHA256:
        raise RuntimeError(
            "historical eleventh-root runner changed: "
            f"expected {BASE_RUNNER_SHA256}, got {actual_hash}"
        )
    source = source_bytes.decode("utf-8")
    if source.count("eleventh") != 3:
        raise RuntimeError("unexpected eleventh-root specialization surface")
    source = source.replace("eleventh", "twelfth")
    namespace: dict[str, Any] = {
        "__file__": str(BASE_RUNNER),
        "__name__": "_piqd_exact17_twelfth_root_base",
    }
    # The executed bytes are pinned above; this is specialization, not input evaluation.
    exec(compile(source, str(BASE_RUNNER), "exec"), namespace)  # noqa: S102
    inherited = namespace["load_runner"]()
    if not isinstance(inherited, dict):
        raise TypeError("eleventh-root runner did not return a namespace")
    return inherited


def main() -> None:
    runner = load_runner()
    scratch = runner["SCRATCH"]
    runner.update(
        {
            "CNF": scratch
            / (
                "extended-cdefg-equal-k4-two-circle-three-row-hijk-interleaved-"
                "equality-chain-perp-bisector-chain-two-kalmanson-swapped-de-"
                "generic-cancellation-second-convex-five-point.cnf"
            ),
            "INGRESS_MANIFEST": scratch
            / "piqd-ingress-manifest-convex-five-point-third-rows.json",
            "INGRESS_REPORT": scratch
            / "extended-cdefg-equal-k4-two-circle-three-row-hijk-interleaved-equality-chain-perp-bisector-chain-two-kalmanson-swapped-de-generic-cancellation-second-convex-five-point-validation.json",
            "VARIABLES": 308,
            "CLAUSES": 5_846_088,
            "BYTES": 291_568_386,
            "CNF_SHA256": "f3b2abfd20baf6fbd61a2d31cf7635b946fe69f4cd383b1cdf97233d624e38bd",
            "MANIFEST_SHA256": "52138d2567ff73e3da9c9ca06d21a064097411a219e30c7e10a39cf7beb838af",
            "DAEMON_SHA256": "0cfc9577656fa3aef143a9fe7e5577d938dba9fd39f3b7118ed91735c97fc360",
        }
    )
    runner["main"]()


if __name__ == "__main__":
    main()
