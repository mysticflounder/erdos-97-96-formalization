#!/usr/bin/env python3
"""Freshly replay and convert a Singular unit lift to the common schema.

The source must be a ``probe_saved_source_indexed_patterns.py`` report emitted
with ``--lift-unit --include-lift``.  The converter reconstructs the saved rows
and generators and exactly replays the coefficient stream; it does not trust
the source report's cached replay boolean.  All source identity and encoding
metadata is supplied explicitly and checked fail-closed before the certificate
is written.  The common independent checker remains the final admission gate.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
from typing import Any

import sympy as sp

from probe_saved_source_indexed_patterns import exact_replay, load_oracle


VARIABLES = [
    f"x{point}{coordinate}"
    for point in range(2, 12)
    for coordinate in ("x", "y")
]


def require(condition: bool, message: str) -> None:
    if not condition:
        raise AssertionError(message)


def sha256_bytes(value: bytes) -> str:
    return hashlib.sha256(value).hexdigest()


def parse_relabeling(value: str | None) -> list[int] | None:
    if value is None:
        return None
    result = [int(token) for token in value.split(",")]
    require(len(result) == 12, "point relabeling must contain twelve labels")
    require(sorted(result) == list(range(12)), "point relabeling is not a permutation")
    return result


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("source", type=Path)
    parser.add_argument("output", type=Path)
    parser.add_argument("--pattern", required=True)
    parser.add_argument("--core-id", required=True)
    parser.add_argument("--target", required=True)
    parser.add_argument("--source-signature", required=True)
    parser.add_argument("--source-full-equality", required=True)
    parser.add_argument("--core-equality", required=True)
    parser.add_argument("--expected-old-to-new")
    args = parser.parse_args()

    require(not args.output.exists(), f"refusing to overwrite {args.output}")
    source_bytes = args.source.read_bytes()
    source: dict[str, Any] = json.loads(source_bytes)
    require(
        source.get("schema") == "p97-source-indexed-saved-pattern-exact-probe-v1",
        "unexpected source schema",
    )
    require(source.get("pattern") == args.pattern, "unexpected source pattern")
    require(source.get("coordinate_model") == "p0_zero_p1_e1", "coordinate drift")
    require(
        source.get("expanded_polynomial_sha256") == args.core_equality,
        "core polynomial stream drift",
    )

    relabeling = list(source["point_relabeling"]["old_to_new"])
    expected_relabeling = parse_relabeling(args.expected_old_to_new)
    if expected_relabeling is not None:
        require(relabeling == expected_relabeling, "point relabeling drift")

    rows = [
        {
            "center": int(row["center"]),
            "support": [int(point) for point in row["support"]],
        }
        for row in source["rows"]
    ]
    require(rows == sorted(rows, key=lambda row: row["center"]), "row order drift")

    singular = source["singular"]
    require(singular.get("status") == "UNIT", "Singular did not prove UNIT")
    lift = singular.get("lift")
    require(isinstance(lift, dict), "Singular unit lift is absent")
    require(lift.get("kind") == "unit" and lift.get("pair") is None, "wrong lift target")
    require(lift.get("target") == "1", "lift target is not one")
    require(lift.get("singular_check") is True, "Singular internal replay failed")

    generators = list(lift["generators"])
    multipliers = list(lift["coefficients"])
    oracle = load_oracle()
    metric_rows = tuple(
        oracle.MetricRow(row["center"], tuple(row["support"]), exact=False)
        for row in rows
    )
    polynomials = oracle.system_polynomials(12, metric_rows)
    require(
        generators == [oracle.serialize_poly(poly) for poly in polynomials],
        "source generator stream does not match reconstructed rows",
    )
    converter_exact_replay = exact_replay(
        multipliers,
        polynomials,
        sp.Poly(1, *polynomials[0].gens, domain=sp.QQ),
    )
    require(converter_exact_replay, "fresh converter exact replay failed")
    expected_generator_count = sum(len(row["support"]) - 1 for row in rows)
    require(
        len(generators) == len(multipliers) == expected_generator_count,
        "certificate arity drift",
    )

    generator_names: list[str] = []
    for row in rows:
        pivot, *members = row["support"]
        generator_names.extend(
            f"ROW_{row['center']}_{pivot}_{member}" for member in members
        )
    generator_stream_sha256 = sha256_bytes("\n".join(generators).encode())
    multiplier_stream_sha256 = sha256_bytes("\n".join(multipliers).encode())
    require(
        multiplier_stream_sha256 == lift["coefficient_stream_sha256"],
        "coefficient stream hash drift",
    )

    certificate = {
        "schema": "p97-atail-qq-change-matrix-certificate-v1",
        "target": args.target,
        "coordinate_model": "p0_zero_p1_e1",
        "core_id": args.core_id,
        "source_indexed_signature_sha256": args.source_signature,
        "source_full_equality_sha256": args.source_full_equality,
        "core_equality_sha256": args.core_equality,
        "point_relabeling_old_to_new": relabeling,
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
            "source_report_sha256": sha256_bytes(source_bytes),
            "singular_variable_order": source.get("singular_variable_order"),
            "source_exact_sympy_replay": lift.get("exact_sympy_replay"),
            "converter_exact_sympy_replay": converter_exact_replay,
        },
    }
    rendered = json.dumps(certificate, indent=2, sort_keys=True) + "\n"
    args.output.write_text(rendered, encoding="utf-8")
    print(
        json.dumps(
            {
                "output": str(args.output),
                "output_sha256": sha256_bytes(rendered.encode()),
                "generator_count": len(generators),
                "nonzero_multiplier_count": certificate["nonzero_multiplier_count"],
                "multiplier_stream_sha256": multiplier_stream_sha256,
            },
            indent=2,
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
