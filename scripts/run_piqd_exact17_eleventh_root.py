#!/usr/bin/env python3
"""Submit and finalize the eleventh Lean-owned exact-17 PIQD root.

The tenth-root runner is a historical custody artifact. Load its audited bytes,
specialize root-local labels in memory, and then bind the second generic-
cancellation root so no earlier job state or artifact can be overwritten.
"""

from __future__ import annotations

import hashlib
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
BASE_RUNNER = ROOT / "scripts" / "run_piqd_exact17_tenth_root.py"
BASE_RUNNER_SHA256 = "87e3fed2ca1dd7ea2f2fe437d237513290e3236852c1f03ca55596bf3762354b"


def load_runner() -> dict[str, Any]:
    source_bytes = BASE_RUNNER.read_bytes()
    actual_hash = hashlib.sha256(source_bytes).hexdigest()
    if actual_hash != BASE_RUNNER_SHA256:
        raise RuntimeError(
            "historical tenth-root runner changed: "
            f"expected {BASE_RUNNER_SHA256}, got {actual_hash}"
        )
    source = source_bytes.decode("utf-8")
    if source.count("tenth") != 3:
        raise RuntimeError("unexpected tenth-root specialization surface")
    source = source.replace("tenth", "eleventh")
    namespace: dict[str, Any] = {
        "__file__": str(BASE_RUNNER),
        "__name__": "_piqd_exact17_eleventh_root_base",
    }
    # The executed bytes are pinned above; this is specialization, not input evaluation.
    exec(compile(source, str(BASE_RUNNER), "exec"), namespace)  # noqa: S102
    inherited = namespace["load_runner"]()
    if not isinstance(inherited, dict):
        raise TypeError("tenth-root runner did not return a namespace")
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
                "generic-cancellation-second.cnf"
            ),
            "INGRESS_MANIFEST": scratch
            / "piqd-ingress-manifest-second-generic-cancellation.json",
            "INGRESS_REPORT": scratch
            / "extended-cdefg-equal-k4-two-circle-three-row-hijk-interleaved-equality-chain-perp-bisector-chain-two-kalmanson-swapped-de-generic-cancellation-second-validation.json",
            "VARIABLES": 308,
            "CLAUSES": 5_846_084,
            "BYTES": 291_568_228,
            "CNF_SHA256": "6ab37b78e0db7cc98e2a1d62999d54d15a278135621aad95d520598afc7b47c2",
            "MANIFEST_SHA256": "8413f6e58c5b9f6c18f785cb06be313e38a324854b49f7c4787dba5ea98087de",
            "DAEMON_SHA256": "0cfc9577656fa3aef143a9fe7e5577d938dba9fd39f3b7118ed91735c97fc360",
        }
    )
    runner["main"]()


if __name__ == "__main__":
    main()
