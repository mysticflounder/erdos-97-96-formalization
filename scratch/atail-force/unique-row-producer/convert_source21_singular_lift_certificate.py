#!/usr/bin/env python3
"""Convert a replayed Singular source-21 unit lift to the common QQ schema."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path


PATTERN = "offset12-postunit-unit-core-shift1"
CORE_ID = "source-indexed-unit-core-654-21"
TARGET = "normalized_source_indexed_unit_core_654_21_shift1"
SOURCE_SIGNATURE = "6cfc4866799c3dc88a0e5546339ca0b0c23f856a1236b9471de562f3c687a5a5"
SOURCE_FULL_EQUALITY = "8fcef37fe0f195afe741796df84394461883c74bbe84e731814b0e403dc5e0d9"
CORE_EQUALITY = "600a3cad16d335265148d03151fa459a52036644e5a07f9e2fb0b2742f098b6c"
VARIABLES = [f"x{i}{coordinate}" for i in range(2, 12) for coordinate in ("x", "y")]
EXPECTED_ROWS = [
    {"center": 0, "support": [1, 3, 5, 9]},
    {"center": 3, "support": [0, 1, 2, 11]},
    {"center": 5, "support": [3, 4, 8, 11]},
    {"center": 7, "support": [1, 5, 6, 8]},
    {"center": 8, "support": [3, 6, 9, 11]},
    {"center": 11, "support": [1, 2, 6, 7]},
]


def require(condition: bool, message: str) -> None:
    if not condition:
        raise AssertionError(message)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("source", type=Path)
    parser.add_argument("output", type=Path)
    args = parser.parse_args()

    source_bytes = args.source.read_bytes()
    source = json.loads(source_bytes)
    require(source["schema"] == "p97-source-indexed-saved-pattern-exact-probe-v1",
            "unexpected source schema")
    require(source["pattern"] == PATTERN, "unexpected source pattern")
    require(source["coordinate_model"] == "p0_zero_p1_e1", "coordinate drift")
    require(source["point_relabeling"]["shift"] == 0, "unexpected extra relabeling")
    require(source["expanded_polynomial_sha256"] == CORE_EQUALITY,
            "core polynomial stream drift")
    rows = [
        {"center": int(row["center"]), "support": list(map(int, row["support"]))}
        for row in source["rows"]
    ]
    require(rows == EXPECTED_ROWS, "source-21 row stream drift")

    singular = source["singular"]
    require(singular["status"] == "UNIT", "Singular did not prove UNIT")
    lift = singular.get("lift")
    require(isinstance(lift, dict), "Singular unit lift is absent")
    require(lift["kind"] == "unit" and lift["pair"] is None, "wrong lift target")
    require(lift["target"] == "1", "lift target is not one")
    require(lift["singular_check"] is True, "Singular internal replay failed")
    require(lift["exact_sympy_replay"] is True, "independent SymPy replay failed")
    generators = list(lift["generators"])
    multipliers = list(lift["coefficients"])
    require(len(generators) == len(multipliers) == 18, "certificate arity drift")

    generator_names: list[str] = []
    for row in rows:
        pivot, *members = row["support"]
        generator_names.extend(
            f"ROW_{row['center']}_{pivot}_{member}" for member in members
        )
    generator_stream_sha256 = hashlib.sha256(
        "\n".join(generators).encode("utf-8")
    ).hexdigest()
    multiplier_stream_sha256 = hashlib.sha256(
        "\n".join(multipliers).encode("utf-8")
    ).hexdigest()
    require(multiplier_stream_sha256 == lift["coefficient_stream_sha256"],
            "coefficient stream hash drift")

    certificate = {
        "schema": "p97-atail-qq-change-matrix-certificate-v1",
        "target": TARGET,
        "coordinate_model": "p0_zero_p1_e1",
        "core_id": CORE_ID,
        "source_indexed_signature_sha256": SOURCE_SIGNATURE,
        "source_full_equality_sha256": SOURCE_FULL_EQUALITY,
        "core_equality_sha256": CORE_EQUALITY,
        "raw_change_identity_sha256": multiplier_stream_sha256,
        "normalized_change_identity_sha256": multiplier_stream_sha256,
        "generator_stream_sha256": generator_stream_sha256,
        "variables": VARIABLES,
        "rows": rows,
        "generator_names": generator_names,
        "generators": generators,
        "multipliers": multipliers,
        "identity": "1 = sum_i multipliers[i] * generators[i]",
        "basis_count": 1,
        "nonzero_multiplier_count": sum(value != "0" for value in multipliers),
        "provenance": {
            "engine": "Singular lift(I, ideal(1))",
            "source_report_sha256": hashlib.sha256(source_bytes).hexdigest(),
            "singular_variable_order": source.get("singular_variable_order"),
        },
    }
    args.output.write_text(
        json.dumps(certificate, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )
    print(json.dumps({
        "output": str(args.output),
        "generator_count": len(generators),
        "nonzero_multiplier_count": certificate["nonzero_multiplier_count"],
        "multiplier_stream_sha256": multiplier_stream_sha256,
    }, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
