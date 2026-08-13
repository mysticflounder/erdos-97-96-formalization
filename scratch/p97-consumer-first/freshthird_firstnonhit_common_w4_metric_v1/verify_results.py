"""Fail-closed verification of the committed W4 metric-wave artifacts.

This checks recorded evidence and SMT artifact shape only.  It deliberately
does not invoke a solver.
"""

from __future__ import annotations

import argparse
import json
import re
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parent
RESULTS_NAME = "results.json"
ARTIFACTS_NAME = "artifacts"

EXPECTED_STATUSES: dict[str, dict[str, str]] = {
    "geometry_core": {
        "z3py": "SAT",
        "z3_cli": "SAT",
        "cvc5": "TIMEOUT",
        "cvc5_pinned": "SAT",
    },
    "cap_classification": {
        "z3py": "SAT",
        "z3_cli": "SAT",
        "cvc5": "TIMEOUT",
        "cvc5_pinned": "SAT",
    },
    "canonical_three_radii": {
        "z3py": "UNKNOWN:timeout",
        "z3_cli": "TIMEOUT",
        "cvc5": "TIMEOUT",
    },
    "selected_row_equalities": {
        "z3py": "UNKNOWN:timeout",
        "z3_cli": "TIMEOUT",
        "cvc5": "TIMEOUT",
    },
    "blocker_exactness": {
        "z3py": "UNKNOWN:timeout",
        "z3_cli": "TIMEOUT",
        "cvc5": "TIMEOUT",
    },
    "control_row_equality_collision": {
        "z3py": "UNSAT",
        "z3_cli": "UNSAT",
        "cvc5": "UNSAT",
    },
    "control_radial_collision": {
        "z3py": "UNSAT",
        "z3_cli": "UNSAT",
        "cvc5": "UNSAT",
    },
    "control_blocker_nonmember_collision": {
        "z3py": "UNSAT",
        "z3_cli": "UNSAT",
        "cvc5": "UNSAT",
    },
}

EXPECTED_ARTIFACTS = {
    "blocker_exactness.smt2",
    "canonical_three_radii.smt2",
    "cap_classification.smt2",
    "cap_classification.pinned.smt2",
    "control_blocker_nonmember_collision.smt2",
    "control_radial_collision.smt2",
    "control_row_equality_collision.smt2",
    "geometry_core.smt2",
    "geometry_core.pinned.smt2",
    "selected_row_equalities.smt2",
}

EXPECTED_SCOPE = "one frozen exact-17 common-radius sameBlocker x sameBlocker case"
EXPECTED_NOT_ENCODED = [
    "arbitrary pointwise D.K4 witness supports",
    "anonymous deletion packets or universal minimality",
    "all FreshThird constructor arms",
    "general cardinality or a finite-to-universal lift",
]


class VerificationError(ValueError):
    """Raised when any recorded result or artifact fails verification."""


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise VerificationError(message)


def _load_json(path: Path) -> dict[str, Any]:
    try:
        value = json.loads(path.read_text())
    except (OSError, ValueError) as exc:
        raise VerificationError(f"cannot load JSON {path}: {exc}") from exc
    _require(isinstance(value, dict), f"JSON root is not an object: {path}")
    return value


def _check_sat_count(path: Path) -> int:
    """Count command occurrences after removing SMT-LIB line comments."""
    try:
        text = path.read_text()
    except OSError as exc:
        raise VerificationError(f"cannot read SMT artifact {path}: {exc}") from exc
    uncommented = "\n".join(line.split(";", 1)[0] for line in text.splitlines())
    return len(re.findall(r"\(check-sat\)", uncommented))


def _verify_model_fields(root: Path, name: str, record: dict[str, Any]) -> None:
    z3py = record.get("z3py")
    _require(isinstance(z3py, dict), f"{name}: missing z3py record")
    required = {
        "status",
        "model",
        "fraction_validation",
        "fraction_errors",
        "substitution_validation",
        "substitution_errors",
    }
    _require(required <= z3py.keys(), f"{name}: incomplete model-validation fields")
    _require(z3py["status"] == "SAT", f"{name}: model source is not SAT")
    _require(
        z3py["fraction_validation"] == "PASS", f"{name}: fraction validation failed"
    )
    _require(
        z3py["substitution_validation"] == "PASS",
        f"{name}: substitution validation failed",
    )
    _require(z3py["fraction_errors"] == [], f"{name}: fraction errors are nonempty")
    _require(
        z3py["substitution_errors"] == [], f"{name}: substitution errors are nonempty"
    )

    model_name = z3py["model"]
    _require(isinstance(model_name, str), f"{name}: model filename is not a string")
    _require(model_name == f"{name}.model.json", f"{name}: unexpected model filename")
    model = _load_json(root / ARTIFACTS_NAME / model_name)
    _require(bool(model), f"{name}: model is empty")
    for variable, value in model.items():
        _require(isinstance(variable, str), f"{name}: non-string model variable")
        _require(
            isinstance(value, dict), f"{name}: malformed model value for {variable}"
        )
        _require(
            isinstance(value.get("exact"), str),
            f"{name}: missing exact value for {variable}",
        )
        _require(
            value.get("kind") == "rational",
            f"{name}: non-rational model value for {variable}",
        )


def verify_results(root: Path = ROOT) -> None:
    """Verify the fixture rooted at ``root``; raise on the first discrepancy."""
    root = Path(root)
    results = _load_json(root / RESULTS_NAME)
    _require(results.get("schema_version") == 1, "unexpected schema_version")
    contract = results.get("contract")
    _require(isinstance(contract, dict), "missing contract")
    _require(contract.get("scope") == EXPECTED_SCOPE, "unexpected contract scope")
    _require(
        contract.get("not_encoded") == EXPECTED_NOT_ENCODED,
        "unexpected contract not_encoded",
    )

    queries = results.get("queries")
    _require(isinstance(queries, list), "queries is not a list")
    _require(len(queries) == len(EXPECTED_STATUSES), "unexpected query count")
    seen: set[str] = set()
    for record in queries:
        _require(isinstance(record, dict), "query record is not an object")
        name = record.get("name")
        _require(name in EXPECTED_STATUSES, f"unexpected query name: {name!r}")
        _require(name not in seen, f"duplicate query name: {name}")
        seen.add(name)
        expected = EXPECTED_STATUSES[name]
        _require(
            set(record) >= set(expected) | {"assertions"}, f"{name}: incomplete record"
        )
        for solver, status in expected.items():
            entry = record.get(solver)
            _require(isinstance(entry, dict), f"{name}: missing {solver} record")
            _require(entry.get("status") == status, f"{name}: {solver} status mismatch")
        if name in {"geometry_core", "cap_classification"}:
            _verify_model_fields(root, name, record)
            pinned = record["cvc5_pinned"]
            command = pinned.get("command")
            _require(
                isinstance(command, list) and command, f"{name}: missing pinned command"
            )
            _require(
                str(command[-1]).endswith(f"artifacts/{name}.pinned.smt2"),
                f"{name}: wrong pinned artifact",
            )
        else:
            _require("cvc5_pinned" not in record, f"{name}: unexpected pinned result")
    _require(seen == set(EXPECTED_STATUSES), "query set mismatch")

    artifacts = root / ARTIFACTS_NAME
    _require(artifacts.is_dir(), f"missing artifact directory: {artifacts}")
    actual = {path.name for path in artifacts.glob("*.smt2")}
    _require(actual == EXPECTED_ARTIFACTS, "SMT artifact set mismatch")
    for path in sorted(artifacts.glob("*.smt2")):
        _require(
            _check_sat_count(path) == 1, f"{path.name}: expected exactly one check-sat"
        )


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("root", nargs="?", type=Path, default=ROOT)
    args = parser.parse_args()
    verify_results(args.root)
    print(f"verified {args.root / RESULTS_NAME} and {args.root / ARTIFACTS_NAME}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
