"""Independent exact replay of the exact-17 child-31 CNF and SAT model."""

from __future__ import annotations

import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parent
CHILD = ROOT / "exact17-thirty-first-root-thirtieth-model-refinements.cnf"
PARENT = ROOT / "exact17-thirtieth-root-twenty-ninth-model-refinements.cnf"
MODEL = ROOT / "piqd-thirty-first-root-model.json"
REPORT = ROOT / "audit-child31-cnf-model.json"
EXPECTED_SHA256 = "3c847c1ebcacf85256b65d54563584a8b89eb50f427fe268e2f916d4cdafa204"


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        while chunk := stream.read(1024 * 1024):
            digest.update(chunk)
    return digest.hexdigest()


def split_header_body(path: Path) -> tuple[bytes, bytes]:
    data = path.read_bytes()
    header, separator, body = data.partition(b"\n")
    if not separator:
        raise AssertionError(f"missing newline after DIMACS header: {path}")
    return header, body


def parse_header(header: bytes) -> tuple[int, int]:
    fields = header.split()
    if len(fields) != 4 or fields[:2] != [b"p", b"cnf"]:
        raise AssertionError(f"invalid DIMACS header: {header!r}")
    return int(fields[2]), int(fields[3])


def main() -> None:
    child_hash = sha256(CHILD)
    assert child_hash == EXPECTED_SHA256

    child_header, child_body = split_header_body(CHILD)
    parent_header, parent_body = split_header_body(PARENT)
    num_vars, declared_clauses = parse_header(child_header)
    parent_vars, parent_clauses = parse_header(parent_header)
    assert num_vars == parent_vars == 308
    assert child_body.startswith(parent_body)

    model_payload = json.loads(MODEL.read_text(encoding="utf-8"))
    assignment = model_payload["assignment"]
    assert model_payload["result"] == "SAT"
    assert model_payload["num_assigned"] == len(assignment) == num_vars
    values: dict[int, bool] = {}
    for literal in assignment:
        variable = abs(literal)
        assert 1 <= variable <= num_vars
        assert variable not in values
        values[variable] = literal > 0
    assert set(values) == set(range(1, num_vars + 1))

    clauses_checked = 0
    suffix_clauses = 0
    with CHILD.open("rb") as stream:
        assert stream.readline().rstrip(b"\n") == child_header
        for line_number, raw_line in enumerate(stream, start=2):
            fields = raw_line.split()
            assert fields and fields[-1] == b"0", line_number
            literals = [int(field) for field in fields[:-1]]
            assert literals, line_number
            assert all(1 <= abs(lit) <= num_vars for lit in literals), line_number
            assert any(values[abs(lit)] == (lit > 0) for lit in literals), line_number
            clauses_checked += 1
            if clauses_checked > parent_clauses:
                suffix_clauses += 1
    assert clauses_checked == declared_clauses == 5_846_904
    assert parent_clauses == 5_846_744
    assert suffix_clauses == declared_clauses - parent_clauses == 160

    report = {
        "child_sha256": child_hash,
        "variables": num_vars,
        "clauses_checked": clauses_checked,
        "model_entries": len(assignment),
        "model_complete_unique_in_range": True,
        "model_satisfies_all_clauses": True,
        "parent_clause_body_byte_prefix": True,
        "parent_clauses": parent_clauses,
        "suffix_clauses": suffix_clauses,
    }
    REPORT.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(REPORT)
    print(json.dumps(report, sort_keys=True))


if __name__ == "__main__":
    main()
