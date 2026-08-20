"""Extract and independently validate a U3 packet from a real SAT model.

The input is the authenticated v10 U3 CNF, variable map, candidate manifest,
and CaDiCaL model log from the 2026-08-19 FreshThird wave.  The script checks
the model against every CNF clause before projecting the named U3 roles.  The
result remains a finite CEGAR artifact: the v10 manifest explicitly says that
source totality and Euclidean realization are not encoded.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
from collections.abc import Mapping
from pathlib import Path
from typing import Any

ROOT = Path(__file__).parents[3]
DEFAULT_WAVE = ROOT / "scratch/runs/freshthird-common-sixpacket-v8-20260819/wave-0001"
DEFAULT_CNF = DEFAULT_WAVE / "u3/candidate.cnf"
DEFAULT_MAP = DEFAULT_WAVE / "u3/candidate.map.json"
DEFAULT_MANIFEST = DEFAULT_WAVE / "u3/candidate.manifest.json"
DEFAULT_STDOUT = DEFAULT_WAVE / "events/u3-v10-r2.stdout"


def _load_serializer() -> Any:
    path = ROOT / "scratch/runs/freshthird-u3-serializer-20260819/packet_to_lean_sat_ir.py"
    spec = importlib.util.spec_from_file_location("u3_packet_serializer", path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load packet serializer: {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


SERIALIZER = _load_serializer()


def _canonical(value: Any) -> bytes:
    return (json.dumps(value, sort_keys=True, separators=(",", ":")) + "\n").encode()


def _sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _load_json(path: Path) -> dict[str, Any]:
    value = json.loads(path.read_text())
    if not isinstance(value, dict):
        raise TypeError(f"expected JSON object: {path}")
    return value


def parse_model(path: Path, variable_count: int) -> set[int]:
    """Parse a complete CaDiCaL `v` model and reject conflicting bindings."""
    assignment: dict[int, bool] = {}
    status = None
    for raw_line in path.read_text().splitlines():
        line = raw_line.strip()
        if line.startswith("s "):
            status = line
        if not line.startswith("v "):
            continue
        for token in line.split()[1:]:
            literal = int(token)
            if literal == 0:
                break
            variable = abs(literal)
            if variable < 1 or variable > variable_count:
                raise ValueError(f"model variable outside declared range: {literal}")
            value = literal > 0
            if variable in assignment:
                raise ValueError(f"model assigns variable twice: {variable}")
            assignment[variable] = value
    if status != "s SATISFIABLE":
        raise ValueError(f"expected SAT model status, found {status!r}")
    if len(assignment) != variable_count:
        raise ValueError(
            f"incomplete model: assigned {len(assignment)} of {variable_count} variables"
        )
    return {variable for variable, value in assignment.items() if value}


def verify_cnf(path: Path, true_variables: set[int], expected_variables: int,
               expected_clauses: int) -> int:
    """Replay every DIMACS clause against the decoded model."""
    header: tuple[int, int] | None = None
    current: list[int] = []
    clauses = 0
    for raw_line in path.read_text().splitlines():
        line = raw_line.strip()
        if not line or line.startswith("c"):
            continue
        tokens = line.split()
        if tokens[0] == "p":
            if len(tokens) != 4 or tokens[1] != "cnf":
                raise ValueError(f"malformed DIMACS header: {line}")
            header = (int(tokens[2]), int(tokens[3]))
            continue
        for token in tokens:
            literal = int(token)
            if literal == 0:
                if not any(
                    (item > 0 and item in true_variables)
                    or (item < 0 and -item not in true_variables)
                    for item in current
                ):
                    raise ValueError(f"model falsifies DIMACS clause {clauses + 1}")
                clauses += 1
                current = []
            else:
                current.append(literal)
    if current:
        raise ValueError("unterminated DIMACS clause")
    if header != (expected_variables, expected_clauses):
        raise ValueError(f"DIMACS header {header} disagrees with manifest")
    if clauses != expected_clauses:
        raise ValueError(f"replayed {clauses} clauses, expected {expected_clauses}")
    return clauses


def _role_ids(variable_map: Mapping[str, Any]) -> dict[str, int]:
    rows = variable_map.get("variables")
    if not isinstance(rows, list):
        raise TypeError("variable map has no variables list")
    result: dict[str, int] = {}
    for row in rows:
        if not isinstance(row, dict) or type(row.get("id")) is not int:
            raise ValueError("malformed variable-map row")
        role = row.get("role")
        if not isinstance(role, str):
            raise TypeError("variable-map role is not a string")
        result[role] = row["id"]
    return result


def _true_indices(roles: Mapping[str, int], prefix: str, true_variables: set[int]) -> list[int]:
    values: list[int] = []
    for role, variable in roles.items():
        if not role.startswith(prefix):
            continue
        suffix = role[len(prefix):]
        if "/" in suffix or not suffix.isdigit():
            raise ValueError(f"non-indexed role under {prefix}: {role}")
        if variable in true_variables:
            values.append(int(suffix))
    return sorted(values)


def _one(roles: Mapping[str, int], prefix: str, true_variables: set[int]) -> int:
    values = _true_indices(roles, prefix, true_variables)
    if len(values) != 1:
        raise ValueError(f"expected one true value for {prefix}, got {values}")
    return values[0]


def _exact_set(roles: Mapping[str, int], prefix: str, count: int,
               true_variables: set[int]) -> list[int]:
    values = _true_indices(roles, prefix, true_variables)
    if len(values) != count:
        raise ValueError(f"expected {count} true values for {prefix}, got {values}")
    return values


def extract_packet(cnf: Path, variable_map_path: Path, manifest_path: Path,
                   stdout: Path) -> dict[str, Any]:
    manifest = _load_json(manifest_path)
    variable_map = _load_json(variable_map_path)
    n = manifest.get("n")
    variables = manifest.get("variables")
    clauses = manifest.get("clauses")
    if type(n) is not int or type(variables) is not int or type(clauses) is not int:
        raise ValueError("manifest lacks integer n/variables/clauses")
    if _sha256(cnf) != manifest.get("cnf_sha256"):
        raise ValueError("CNF SHA-256 does not match candidate manifest")
    if _sha256(variable_map_path) != manifest.get("map_sha256"):
        raise ValueError("variable-map SHA-256 does not match candidate manifest")
    true_variables = parse_model(stdout, variables)
    replayed_clauses = verify_cnf(cnf, true_variables, variables, clauses)
    roles = _role_ids(variable_map)
    points = {name: _one(roles, f"u3/point/{name}/", true_variables)
              for name in ("q", "p", "t1", "t2", "t3", "u", "a0", "a1")}
    dangerous = _exact_set(roles, "u3/dangerous_base/", 4, true_variables)
    exact_radius = _exact_set(roles, "u3/dangerous_radius/", 3, true_variables)
    bounded = _exact_set(roles, "u3/bounded_support/", 8, true_variables)
    centers = ("u", "a0", "a1", "t1", "t2", "t3")
    obstruction = [center for center in centers
                   if roles.get(f"u3/obstruction/{center}") in true_variables]
    if len(obstruction) != 1:
        raise ValueError(f"expected one selected obstruction center, got {obstruction}")
    center = obstruction[0]
    modes = [mode for mode in ("q_deleted", "critical_shell")
             if roles.get(f"u3/row_mode/{center}/{mode}") in true_variables]
    if len(modes) != 1:
        raise ValueError(f"expected one row mode at {center}, got {modes}")
    row = _exact_set(roles, f"u3/row/{center}/support/", 4, true_variables)
    outside = sorted(set(row) - set(bounded))
    if not outside:
        raise ValueError(f"selected row {row} has no outside point")
    arm = "qDeleted" if modes[0] == "q_deleted" else "criticalShell"
    packet_roles = {**points, "x": points[center]}
    if arm == "qDeleted":
        packet_roles["z"] = outside[0]
    packet = {
        "schema": SERIALIZER.PACKET_SCHEMA,
        "arm": arm,
        "carrier_card": n,
        "roles": packet_roles,
        "dangerous": dangerous,
        "exact_radius": exact_radius,
        "bounded": bounded,
        "row": row,
    }
    normalized = SERIALIZER.validate_packet(packet)
    return {
        "schema": "freshthird-u3-validated-cegar-packet/v1",
        "packet": normalized,
        "evidence": {
            "candidate_manifest": str(manifest_path),
            "candidate_manifest_sha256": _sha256(manifest_path),
            "cnf_sha256": _sha256(cnf),
            "map_sha256": _sha256(variable_map_path),
            "solver_stdout_sha256": _sha256(stdout),
            "solver_status": "SATISFIABLE",
            "variable_count": variables,
            "true_variable_count": len(true_variables),
            "replayed_clause_count": replayed_clauses,
            "source_total": manifest.get("source_total"),
            "source_total_claim": manifest.get("source_total_claim"),
            "selected_obstruction_center": center,
            "outside_candidates": outside,
            "projection_boundary": "finite U3 abstraction; Euclidean realization and source totality omitted",
        },
    }


def validate_decoded_model(decoded: Mapping[str, Any], packet: Mapping[str, Any]) -> dict[str, Any]:
    """Check that piqd's decoded function tables reproduce the packet."""
    if decoded.get("result") != "SAT":
        raise ValueError(f"decoded model result is not SAT: {decoded.get('result')!r}")
    model = decoded.get("model")
    if not isinstance(model, dict):
        raise TypeError("decoded response has no model object")
    rows = model.get("functions")
    if not isinstance(rows, list):
        raise TypeError("decoded model has no functions list")
    functions = {row.get("name"): row for row in rows if isinstance(row, dict)}

    def table(name: str) -> list[int]:
        row = functions.get(name)
        if not isinstance(row, dict) or not isinstance(row.get("rows"), list):
            raise TypeError(f"decoded model lacks function table {name}")
        values: list[int] = []
        for item in row["rows"]:
            if not isinstance(item, dict) or type(item.get("value")) is not int:
                raise ValueError(f"malformed decoded row in {name}")
            args = item.get("args")
            if not isinstance(args, list) or len(args) > 1:
                raise ValueError(f"unexpected decoded arguments in {name}")
            values.append(item["value"])
        return values

    packet_roles = packet["roles"]
    for name in ("q", "p", "t1", "t2", "t3", "u", "a0", "a1"):
        if table(f"point_{name}") != [packet_roles[name]]:
            raise ValueError(f"decoded point_{name} disagrees with packet")
    if table("source_x") != [packet_roles["x"]]:
        raise ValueError("decoded source_x disagrees with packet")
    if packet["arm"] == "qDeleted":
        if table("source_z") != [packet_roles["z"]]:
            raise ValueError("decoded source_z disagrees with packet")
    elif "source_z" in functions:
        raise ValueError("criticalShell decoded model unexpectedly has source_z")
    for name, expected in (
        ("dangerous_base", packet["dangerous"]),
        ("exact_radius", packet["exact_radius"]),
        ("bounded_support", packet["bounded"]),
        ("source_row", packet["row"]),
    ):
        if table(name) != expected:
            raise ValueError(f"decoded {name} disagrees with packet")
    return {
        "result": "SAT",
        "function_count": len(functions),
        "packet_sha256": SERIALIZER.packet_sha256(packet),
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--cnf", type=Path, default=DEFAULT_CNF)
    parser.add_argument("--map", dest="variable_map", type=Path, default=DEFAULT_MAP)
    parser.add_argument("--manifest", type=Path, default=DEFAULT_MANIFEST)
    parser.add_argument("--stdout", type=Path, default=DEFAULT_STDOUT)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--packet-output", type=Path, required=True)
    parser.add_argument("--ir-output", type=Path, required=True)
    parser.add_argument("--decoded-model", type=Path)
    args = parser.parse_args()
    wrapper = extract_packet(args.cnf, args.variable_map, args.manifest, args.stdout)
    if args.decoded_model is not None:
        decoded = _load_json(args.decoded_model)
        wrapper["evidence"]["decoded_replay"] = validate_decoded_model(
            decoded, wrapper["packet"]
        )
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.packet_output.write_bytes(_canonical(wrapper["packet"]))
    args.output.write_bytes(_canonical(wrapper))
    args.ir_output.write_bytes(_canonical(SERIALIZER.packet_to_ir(wrapper["packet"])))


if __name__ == "__main__":
    main()
