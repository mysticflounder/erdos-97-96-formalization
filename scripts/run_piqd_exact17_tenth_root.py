#!/usr/bin/env python3
"""Submit and finalize the tenth Lean-owned exact-17 PIQD root.

The ninth-root runner is a historical custody artifact.  Load its audited
implementation only after verifying its exact bytes, then specialize the
root-local labels in memory so this successor cannot overwrite ninth-root
state or artifacts.
"""

from __future__ import annotations

import hashlib
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
BASE_RUNNER = ROOT / "scripts" / "run_piqd_exact17_ninth_root.py"
BASE_RUNNER_SHA256 = "223956a6062ea0c313c3eb333ca759423304cd2a0277b6b7e055e1c66acf9c74"


def load_runner() -> dict[str, Any]:
    source_bytes = BASE_RUNNER.read_bytes()
    actual_hash = hashlib.sha256(source_bytes).hexdigest()
    if actual_hash != BASE_RUNNER_SHA256:
        raise RuntimeError(
            "historical ninth-root runner changed: "
            f"expected {BASE_RUNNER_SHA256}, got {actual_hash}"
        )
    source = source_bytes.decode("utf-8")
    if source.count("ninth") != 11:
        raise RuntimeError("unexpected ninth-root specialization surface")
    source = source.replace("ninth", "tenth")
    namespace: dict[str, Any] = {
        "__file__": str(BASE_RUNNER),
        "__name__": "_piqd_exact17_tenth_root_base",
    }
    # The executed bytes are pinned above; this is specialization, not input evaluation.
    exec(compile(source, str(BASE_RUNNER), "exec"), namespace)  # noqa: S102
    return namespace


def main() -> None:
    runner = load_runner()
    scratch = runner["SCRATCH"]
    runner.update({
        "CNF": scratch / (
            "extended-cdefg-equal-k4-two-circle-three-row-hijk-interleaved-"
            "equality-chain-perp-bisector-chain-two-kalmanson-swapped-de-"
            "generic-cancellation.cnf"
        ),
        "INGRESS_MANIFEST": scratch / (
            "piqd-ingress-manifest-equal-k4-two-circle-three-row-hijk-interleaved-"
            "equality-chain-perp-bisector-chain-two-kalmanson-swapped-de-"
            "generic-cancellation.json"
        ),
        "INGRESS_REPORT": scratch / "extended-cdefg-equal-k4-two-circle-three-row-hijk-interleaved-equality-chain-perp-bisector-chain-two-kalmanson-swapped-de-generic-cancellation-validation.json",
        "VARIABLES": 308,
        "CLAUSES": 5_846_080,
        "BYTES": 291_568_096,
        "CNF_SHA256": "7def1009b154d3b846274821300bc68f6ddd43b651e11258506f19924773ccbc",
        "MANIFEST_SHA256": "b5f6f8749e4ce19d8791e0d6689f10be402a99e64145d614957aa96ce0182cca",
        "DAEMON_SHA256": "0cfc9577656fa3aef143a9fe7e5577d938dba9fd39f3b7118ed91735c97fc360",
    })
    runner["main"]()


if __name__ == "__main__":
    main()
