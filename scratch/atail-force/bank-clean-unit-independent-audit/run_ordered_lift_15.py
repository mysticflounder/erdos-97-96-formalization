#!/usr/bin/env python3
"""Run the 15-core QQ lift in the fastest no-transform variable order."""

from __future__ import annotations

import json
from pathlib import Path

import audit
import minimize_core as core
import order_benchmark_15


HERE = Path(__file__).resolve().parent


def main() -> None:
    variables = order_benchmark_15.variants()["active_axes_blocked"]
    text = (HERE / "unit_certificate_15.sing").read_text()
    _ring, rest = text.split("\n", 1)
    source = HERE / "unit_certificate_15_active_axes_lift.sing"
    transcript = HERE / "unit_certificate_15_active_axes_lift.out"
    source.write_text(f"ring R=0,({','.join(variables)}),dp;\n" + rest)
    result = audit.run(["Singular", "-q", str(source)], timeout=600)
    output = str(result.get("stdout", ""))
    transcript.write_text(output)
    summary = {
        "status": (
            "PASS" if "__SINGULAR_IDENTITY_PASS__" in output else result["status"]
        ),
        "seconds": result["seconds"],
        "cofactor_count": output.count("__COFACTOR_"),
        "source": str(source.relative_to(core.audit.REPO)),
        "transcript": str(transcript.relative_to(core.audit.REPO)),
    }
    (HERE / "ordered_lift_15.json").write_text(
        json.dumps(summary, indent=2, sort_keys=True) + "\n"
    )
    print(json.dumps(summary, sort_keys=True), flush=True)


if __name__ == "__main__":
    main()
