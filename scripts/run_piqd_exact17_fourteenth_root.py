#!/usr/bin/env python3
"""Submit and finalize the fourteenth Lean-owned exact-17 PIQD root.

The thirteenth-root runner is a historical custody artifact. Load its audited
bytes, specialize root-local labels in memory, and bind the three-row
two-circle child so no earlier job state or artifact can be overwritten.
"""

from __future__ import annotations

import hashlib
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
BASE_RUNNER = ROOT / "scripts" / "run_piqd_exact17_thirteenth_root.py"
BASE_RUNNER_SHA256 = "c70725ac8a2c8c237a9736519899bfbf246f15442543ec41a513dc77d06b8844"


def load_runner() -> dict[str, Any]:
    source_bytes = BASE_RUNNER.read_bytes()
    actual_hash = hashlib.sha256(source_bytes).hexdigest()
    if actual_hash != BASE_RUNNER_SHA256:
        raise RuntimeError(
            "historical thirteenth-root runner changed: "
            f"expected {BASE_RUNNER_SHA256}, got {actual_hash}"
        )
    source = source_bytes.decode("utf-8")
    if source.count("thirteenth") != 5:
        raise RuntimeError("unexpected thirteenth-root specialization surface")
    source = source.replace("thirteenth", "fourteenth")
    namespace: dict[str, Any] = {
        "__file__": str(BASE_RUNNER),
        "__name__": "_piqd_exact17_fourteenth_root_base",
    }
    # The executed bytes are pinned above; this is specialization, not input evaluation.
    exec(compile(source, str(BASE_RUNNER), "exec"), namespace)  # noqa: S102
    inherited = namespace["load_runner"]()
    if not isinstance(inherited, dict):
        raise TypeError("thirteenth-root runner did not return a namespace")
    return inherited


def main() -> None:
    runner = load_runner()
    scratch = runner["SCRATCH"]
    runner.update(
        {
            "CNF": scratch
            / "exact17-fourteenth-root-four-point-two-circle-bisector-rows.cnf",
            "INGRESS_MANIFEST": scratch
            / "piqd-ingress-manifest-four-point-two-circle-bisector-rows.json",
            "INGRESS_REPORT": scratch
            / "exact17-fourteenth-root-four-point-two-circle-bisector-rows-validation.json",
            "VARIABLES": 308,
            "CLAUSES": 5_846_100,
            "BYTES": 291_568_848,
            "CNF_SHA256": "5bfbfe47d66930e446613403f33cbbf87044c448f488879c098b986cce2348fc",
            "MANIFEST_SHA256": "d067a854f6691bd55cca49eb67954dd917b47a0cddecf93ba43366a24c428499",
            "DAEMON_SHA256": "0cfc9577656fa3aef143a9fe7e5577d938dba9fd39f3b7118ed91735c97fc360",
        }
    )
    runner["main"]()


if __name__ == "__main__":
    main()
