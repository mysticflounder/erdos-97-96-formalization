#!/usr/bin/env python3
"""Emit and replay the source-faithful Boolean exact-13 witnessed-key root.

This is a solver-only discovery encoder.  It represents raw supports directly,
and reconstructs the positional ``Key`` by applying the selected direct or
mirror order.  The root contains the six finite-validity conjuncts and their
explicit witnesses, but no metric, Kalmanson, or learned clauses.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import re
from collections.abc import Iterable
from pathlib import Path

LABELS = tuple(range(13))
SECOND_APEX = 0
FIRST_APEX = 1
I2 = frozenset(range(8, 13))
GLOBAL_CENTERS = tuple(range(2, 13))
BASE_ROWS = ("C0", "C1", "K", "L", "T")
ROWS = (*BASE_ROWS, *(f"G{c}" for c in GLOBAL_CENTERS))
PROVIDERS = (*BASE_ROWS, *(f"G{c}" for c in GLOBAL_CENTERS))
ROLE_NAMES = ("b0", "b1", "z", "s0", "s1", "d", "ell", "a", "b")
DIRECT_ORDER = (2, 8, 9, 10, 11, 12, 1, 3, 4, 5, 0, 6, 7)
MIRROR_ORDER = (2, 6, 7, 0, 3, 4, 5, 1, 8, 9, 10, 11, 12)
ORDERS = {0: DIRECT_ORDER, 1: MIRROR_ORDER}
SCHEMA = "cardge13-exact13-witnessed-key-root-piqd/v1"
PIQD_NORMALIZATION_SCHEMA = "cardge13-exact13-piqd-session-normalization/v1"
PIQD_CUSTODY_SCHEMA = "cardge13-exact13-piqd-session-custody/v1"
PRODUCER = "cardge13_exact13_witnessed_key_root_piqd.py"


def canonical(value: object) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode()


def sha256(value: bytes) -> str:
    return hashlib.sha256(value).hexdigest()


def seal_event(value: dict[str, object]) -> dict[str, object]:
    result = dict(value)
    result["event_sha256"] = sha256(canonical(result))
    return result


def normalize_for_piqd_session(cnf_bytes: bytes) -> tuple[bytes, dict[str, object]]:
    """Model PIQD SAT-session ingestion for this producer's DIMACS bytes.

    ``piqc session add --file`` parses the DIMACS and journals only canonical
    clause lines.  This emitter already writes one canonical clause per line,
    so normalization is exactly removal of its three comments and one header.
    """
    lines = cnf_bytes.splitlines(keepends=True)
    if len(lines) < 5:
        raise ValueError("emitted DIMACS is too short")
    prefix = lines[:4]
    if not all(line.startswith(b"c ") for line in prefix[:3]):
        raise ValueError("expected exactly three leading DIMACS comments")
    if not prefix[3].startswith(b"p cnf "):
        raise ValueError("expected DIMACS header after three comments")
    if any(line.startswith((b"c ", b"p cnf ")) for line in lines[4:]):
        raise ValueError("unexpected comment or header in clause body")
    journal_bytes = b"".join(lines[4:])
    metadata = {
        "schema": PIQD_NORMALIZATION_SCHEMA,
        "operation": "remove exactly three leading comment lines and one p-cnf header line",
        "removed_prefix_lines": 4,
        "removed_prefix_bytes": sum(map(len, prefix)),
        "emitted_cnf_bytes": len(cnf_bytes),
        "emitted_cnf_sha256": sha256(cnf_bytes),
        "piqd_normalized_journal_bytes": len(journal_bytes),
        "piqd_normalized_journal_sha256": sha256(journal_bytes),
        "clause_body_preserved_byte_for_byte": True,
    }
    return journal_bytes, metadata


class Cnf:
    def __init__(self) -> None:
        self.names: dict[str, int] = {}
        self.clauses: list[tuple[int, ...]] = []

    def var(self, name: str) -> int:
        if name not in self.names:
            self.names[name] = len(self.names) + 1
        return self.names[name]

    def add(self, *literals: int) -> None:
        clause = tuple(dict.fromkeys(literals))
        if any(-literal in clause for literal in clause):
            return
        self.clauses.append(clause)

    def onehot(self, names: Iterable[str]) -> tuple[int, ...]:
        values = tuple(self.var(name) for name in names)
        self.add(*values)
        for left, right in itertools.combinations(values, 2):
            self.add(-left, -right)
        return values

    def exactly(self, values: Iterable[int], count: int) -> None:
        values = tuple(values)
        if not 0 <= count <= len(values):
            raise ValueError("cardinality outside variable family")
        for chosen in itertools.combinations(values, count + 1):
            self.add(*(-value for value in chosen))
        for chosen in itertools.combinations(values, len(values) - count + 1):
            self.add(*chosen)

    def at_most(self, values: Iterable[int], count: int) -> None:
        values = tuple(values)
        for chosen in itertools.combinations(values, count + 1):
            self.add(*(-value for value in chosen))

    def iff_and(self, target: int, terms: Iterable[int]) -> None:
        terms = tuple(terms)
        for term in terms:
            self.add(-target, term)
        self.add(target, *(-term for term in terms))

    def iff_or(self, target: int, terms: Iterable[int]) -> None:
        terms = tuple(terms)
        self.add(-target, *terms)
        for term in terms:
            self.add(-term, target)

    def guarded_equal(self, guard: int, left: int, right: int) -> None:
        self.add(-guard, -left, right)
        self.add(-guard, left, -right)

    def dimacs(self, comments: Iterable[str] = ()) -> bytes:
        lines = [*(f"c {line}" for line in comments)]
        lines.append(f"p cnf {len(self.names)} {len(self.clauses)}")
        lines.extend(" ".join(map(str, (*clause, 0))) for clause in self.clauses)
        return ("\n".join(lines) + "\n").encode("ascii")

    def satisfied(self, assignment: set[int]) -> bool:
        return all(any((literal > 0) == (abs(literal) in assignment) for literal in clause)
                   for clause in self.clauses)


def role(cnf: Cnf, name: str, point: int) -> int:
    return cnf.var(f"is_{name}_{point}")


def member(cnf: Cnf, row: str, point: int) -> int:
    return cnf.var(f"m_{row}_{point}")


def emit_root() -> tuple[Cnf, dict[str, object]]:
    cnf = Cnf()
    for row in ROWS:
        for point in LABELS:
            member(cnf, row, point)
    for name in ROLE_NAMES:
        cnf.onehot(f"is_{name}_{point}" for point in LABELS)
    other_c0, other_c1 = cnf.onehot(("other_c0", "other_c1"))
    orientation = cnf.var("orientation_mirror")
    for name in ("b0", "b1"):
        cnf.add(-role(cnf, name, SECOND_APEX), -role(cnf, name, FIRST_APEX))
    for point in LABELS:
        cnf.add(-role(cnf, "b0", point), -role(cnf, "b1", point))
        cnf.add(-role(cnf, "b0", point), -member(cnf, "C0", point))
        cnf.add(-role(cnf, "b1", point), -member(cnf, "C1", point))

    for row in BASE_ROWS:
        cnf.exactly((member(cnf, row, point) for point in LABELS), 4)
    cnf.add(-member(cnf, "K", SECOND_APEX), -member(cnf, "L", SECOND_APEX))
    cnf.add(-member(cnf, "T", FIRST_APEX))

    for center in GLOBAL_CENTERS:
        row = f"G{center}"
        b0 = role(cnf, "b0", center)
        b1 = role(cnf, "b1", center)
        cnf.add(-member(cnf, row, center))
        for point in LABELS:
            cnf.add(-b0, -member(cnf, row, point))
            cnf.add(-b1, -member(cnf, row, point))
        values = tuple(member(cnf, row, point) for point in LABELS)
        for chosen in itertools.combinations(values, 5):
            cnf.add(b0, b1, *(-value for value in chosen))
        for chosen in itertools.combinations(values, 10):
            cnf.add(b0, b1, *chosen)

    z = tuple(role(cnf, "z", point) for point in LABELS)
    for point in LABELS:
        partition = (z[point], member(cnf, "C0", point), member(cnf, "C1", point), member(cnf, "K", point))
        cnf.add(*partition)
        for left, right in itertools.combinations(partition, 2):
            cnf.add(-left, -right)
        cnf.add(-member(cnf, "K", point), -member(cnf, "L", point))
        cnf.add(-z[point], member(cnf, "L", point))
        if point not in I2:
            cnf.add(-z[point])
        else:
            cnf.add(member(cnf, "K", point), member(cnf, "L", point))
    cnf.at_most((member(cnf, "K", point) for point in I2), 3)
    for chosen in itertools.combinations(tuple(member(cnf, "K", point) for point in I2), 4):
        cnf.add(*chosen)
    for row in ("C0", "C1"):
        cnf.at_most((cnf.var(f"inter_{row}_L_{point}") for point in LABELS), 2)
        for point in LABELS:
            inter = cnf.var(f"inter_{row}_L_{point}")
            cnf.iff_and(inter, (member(cnf, row, point), member(cnf, "L", point)))

    for point in LABELS:
        s0, s1, d = (role(cnf, name, point) for name in ("s0", "s1", "d"))
        cnf.add(-s0, -s1)
        cnf.add(-s0, member(cnf, "C0", point),)
        cnf.add(-s1, member(cnf, "C1", point),)
        cnf.add(-s0, -member(cnf, "T", point))
        cnf.add(-s1, -member(cnf, "T", point))
        cnf.add(-d, member(cnf, "T", point))
        cnf.add(-d, -member(cnf, "C0", point))
        cnf.add(-d, -member(cnf, "C1", point))
        cnf.add(-d, role(cnf, "z", point), member(cnf, "K", point))

    u_bits: list[int] = []
    pair_bits: list[int] = []
    chosen_bits: list[int] = []
    c_bits: list[int] = []
    e_bits: list[int] = []
    for point in LABELS:
        u = cnf.var(f"u_{point}")
        if point == SECOND_APEX:
            cnf.add(-u)
        else:
            cnf.iff_and(u, (-member(cnf, "K", point), -member(cnf, "L", point)))
        u_bits.append(u)
        e = cnf.var(f"e_{point}")
        e_bits.append(e)
        cnf.add(-e, u)
        pair = cnf.var(f"pair_{point}")
        pair_bits.append(pair)
        cnf.iff_and(pair, (member(cnf, "L", point), -role(cnf, "z", point), -role(cnf, "ell", point)))
        cnf.add(-pair, role(cnf, "a", point), role(cnf, "b", point))
        cnf.add(-role(cnf, "a", point), pair)
        cnf.add(-role(cnf, "b", point), pair)
        c = cnf.var(f"c_{point}")
        c_bits.append(c)
        if point == SECOND_APEX:
            cnf.add(c)
        else:
            cnf.iff_or(c, (role(cnf, "ell", point), e))
        chosen = cnf.var(f"chosen_{point}")
        chosen_bits.append(chosen)
        ue = cnf.var(f"u_not_e_{point}")
        cnf.iff_and(ue, (u, -e))
        cnf.iff_or(chosen, (pair, ue))
    cnf.exactly(u_bits, 4)
    cnf.exactly(e_bits, 2)
    for point in LABELS:
        ell = role(cnf, "ell", point)
        cnf.add(-ell, member(cnf, "L", point), -role(cnf, "z", point))
    for point in LABELS:
        a, b = role(cnf, "a", point), role(cnf, "b", point)
        cnf.add(-a, member(cnf, "L", point))
        cnf.add(-b, member(cnf, "L", point))
        cnf.add(-a, -b)
        cnf.add(-a, -other_c0, member(cnf, "C0", point))
        cnf.add(-b, -other_c0, member(cnf, "C0", point))
        cnf.add(-a, -other_c1, member(cnf, "C1", point))
        cnf.add(-b, -other_c1, member(cnf, "C1", point))
        cnf.guarded_equal(other_c0, chosen_bits[point], member(cnf, "C0", point))
        cnf.guarded_equal(other_c1, chosen_bits[point], member(cnf, "C1", point))
        cnf.guarded_equal(other_c0, c_bits[point], member(cnf, "C1", point))
        cnf.guarded_equal(other_c1, c_bits[point], member(cnf, "C0", point))

    projection = {
        "orientation": orientation,
        "rows": {row: {str(point): member(cnf, row, point) for point in LABELS} for row in ROWS},
        "roles": {name: {str(point): role(cnf, name, point) for point in LABELS} for name in ROLE_NAMES},
        "other": {"c0": other_c0, "c1": other_c1},
        "witness_bits": {"u": u_bits, "e": e_bits, "pair": pair_bits, "c": c_bits, "chosen": chosen_bits},
    }
    return cnf, projection


def selected(assignment: set[int], table: dict[str, int]) -> int:
    values = [int(point) for point, variable in table.items() if variable in assignment]
    if len(values) != 1:
        raise ValueError(f"one-hot family has {len(values)} true values")
    return values[0]


def key_from_assignment(assignment: set[int], projection: dict[str, object]) -> dict[str, object]:
    roles_table = projection["roles"]
    rows_table = projection["rows"]
    if not isinstance(roles_table, dict) or not isinstance(rows_table, dict):
        raise TypeError("projection map malformed")
    roles = {name: selected(assignment, table) for name, table in roles_table.items() if isinstance(table, dict)}
    rows = {
        row: [int(point) for point, variable in table.items() if variable in assignment]
        for row, table in rows_table.items()
        if isinstance(table, dict)
    }
    other_table = projection["other"]
    if not isinstance(other_table, dict):
        raise TypeError("other map malformed")
    other = ".c0" if other_table["c0"] in assignment else ".c1"
    mirror = projection["orientation"] in assignment
    order = ORDERS[int(mirror)]
    order_index = {raw: position for position, raw in enumerate(order)}
    center_raw = {"C0": roles["b0"], "C1": roles["b1"], "K": 0, "L": 0, "T": 1}
    center_raw.update({f"G{center}": center for center in GLOBAL_CENTERS})
    center_of = {row: order_index[center] for row, center in center_raw.items()}
    support_of = {row: sorted(order_index[p] for p in points) for row, points in rows.items()}
    return {"orientation": "mirror" if mirror else "direct", "roles": roles, "raw_rows": rows,
            "centerOf": center_of, "supportOf": support_of, "z": roles["z"], "a": roles["a"],
            "b": roles["b"], "other": other}


def projected_key_literals(assignment: set[int], projection: dict[str, object]) -> tuple[int, ...]:
    """Return the signed literals representing only the projected ``Key`` fields.

    The center map is represented by orientation, b0, and b1; supportOf is
    represented by all raw row membership bits.  Auxiliary s0/s1/d/ell/E/C/U
    witness bits are deliberately absent.
    """
    literals: list[int] = []
    orientation = int(projection["orientation"])
    literals.append(orientation if orientation in assignment else -orientation)
    rows = projection["rows"]
    if not isinstance(rows, dict):
        raise TypeError("projection rows malformed")
    for table in rows.values():
        if not isinstance(table, dict):
            raise TypeError("projection row table malformed")
        literals.extend(variable if variable in assignment else -variable for variable in table.values())
    roles = projection["roles"]
    if not isinstance(roles, dict):
        raise TypeError("projection roles malformed")
    for name in ("b0", "b1", "z", "a", "b"):
        table = roles[name]
        if not isinstance(table, dict):
            raise TypeError("projection role table malformed")
        literals.append(table[str(selected(assignment, table))])
    other = projection["other"]
    if not isinstance(other, dict):
        raise TypeError("projection other table malformed")
    literals.append(other["c0"] if other["c0"] in assignment else other["c1"])
    return tuple(literals)


def projected_key_block(assignment: set[int], projection: dict[str, object]) -> tuple[int, ...]:
    """A clause excluding exactly this projected Key, not its witnesses."""
    return tuple(-literal for literal in projected_key_literals(assignment, projection))


def raw_support(key: dict[str, object], row: str) -> set[int]:
    mirror = key["orientation"] == "mirror"
    order_index = {raw: position for position, raw in enumerate(ORDERS[int(mirror)])}
    support = set(key["supportOf"][row])
    return {raw for raw in LABELS if order_index[raw] in support}


def replay_key(key: dict[str, object]) -> dict[str, bool]:
    roles = key["roles"]
    rows = {row: raw_support(key, row) for row in ROWS}
    b0, b1, z = roles["b0"], roles["b1"], roles["z"]
    centers = key["centerOf"]
    mirror = key["orientation"] == "mirror"
    order = ORDERS[int(mirror)]
    oi = {raw: position for position, raw in enumerate(order)}
    center_valid = (
        centers["K"] == oi[0] and centers["L"] == oi[0] and centers["T"] == oi[1]
        and centers["C0"] == oi[b0] and centers["C1"] == oi[b1]
        and b0 != b1 and b0 not in (0, 1) and b1 not in (0, 1)
        and all((not rows[f"G{c}"]) if c in (b0, b1) else (len(rows[f"G{c}"]) == 4) for c in GLOBAL_CENTERS)
    )
    row_valid = (
        all(centers[row] not in set(key["supportOf"][row]) for row in ROWS)
        and all(len(rows[row]) == 4 for row in BASE_ROWS)
        and not (rows["C0"] & rows["C1"] or rows["C0"] & rows["K"] or rows["C1"] & rows["K"])
        and not rows["K"] & rows["L"]
        and (rows["C0"] | rows["C1"] | rows["K"]) == set(LABELS) - {z}
    )
    coarse_valid = (
        z in I2 and z in rows["L"] and z not in rows["K"]
        and (rows["K"] & I2) | (rows["L"] & I2) == set(I2)
        and len(rows["K"] & I2) in (2, 3)
        and len(rows["C0"] & rows["L"]) <= 2 and len(rows["C1"] & rows["L"]) <= 2
    )
    s0, s1, d = roles["s0"], roles["s1"], roles["d"]
    role_valid = (
        s0 != s1 and s0 in rows["C0"] and s1 in rows["C1"]
        and s0 not in rows["T"] and s1 not in rows["T"]
        and d in rows["T"] and d not in rows["C0"] and d not in rows["C1"]
        and (d == z or d in rows["K"])
    )
    L = rows["L"]
    U = set(LABELS) - (rows["K"] | L | {SECOND_APEX})
    a, b = roles["a"], roles["b"]
    # E and C are witness bits, checked by replay_assignment below.
    occurrence_valid = (key["other"] in (".c0", ".c1") and a != b and a in L and b in L
                        and a in rows[key["other"][1:].upper()] and b in rows[key["other"][1:].upper()]
                        and SECOND_APEX != roles["z"] and SECOND_APEX not in rows["K"]
                        and SECOND_APEX not in L and len(U) == 4)
    order_valid = (tuple(oi[raw] for raw in order) == tuple(range(13))
                   and all(oi[left] < oi[right] for left, right in itertools.pairwise(order)))
    return {"CenterValid": center_valid, "RowValid": row_valid, "CoarseValid": coarse_valid,
            "RoleValid": role_valid, "OccurrenceValid_partial": occurrence_valid, "OrderValid": order_valid}


def replay_assignment(assignment: set[int], key: dict[str, object], projection: dict[str, object]) -> dict[str, bool]:
    checks = replay_key(key)
    bits = projection["witness_bits"]
    if not isinstance(bits, dict):
        raise TypeError("witness map malformed")
    e_bits = bits["e"]
    c_bits = bits["c"]
    chosen_bits = bits["chosen"]
    rows = {row: raw_support(key, row) for row in ROWS}
    roles = key["roles"]
    E = {point for point, variable in enumerate(e_bits) if variable in assignment}
    C = {point for point, variable in enumerate(c_bits) if variable in assignment}
    chosen = {point for point, variable in enumerate(chosen_bits) if variable in assignment}
    L = rows["L"]
    U = set(LABELS) - (rows["K"] | L | {SECOND_APEX})
    ell, a, b = roles["ell"], roles["a"], roles["b"]
    pair = (L - {roles["z"], ell})
    other_row = "C0" if key["other"] == ".c0" else "C1"
    opposite_row = "C1" if other_row == "C0" else "C0"
    occurrence = (
        checks["OccurrenceValid_partial"] and E <= U and len(E) == 2 and len(C) == 4
        and ell in L - {roles["z"]} and pair == {a, b}
        and C == {SECOND_APEX, ell} | E
        and chosen == pair | (U - E) and chosen == rows[other_row]
        and C == rows[opposite_row]
    )
    checks["OccurrenceValid"] = occurrence
    checks.pop("OccurrenceValid_partial", None)
    checks["Valid"] = all(checks.values())
    return checks


def replay_model(model_path: Path, run_root: Path, source_path: Path, producer_commit: str,
                 report: dict[str, object]) -> dict[str, object]:
    value = json.loads(model_path.read_text())
    assignment = parse_assignment(value["model"] if isinstance(value, dict) else value)
    cnf, projection = emit_root()
    key = key_from_assignment(assignment, projection)
    checks = replay_assignment(assignment, key, projection)
    result = {
        "schema": SCHEMA,
        "producer": PRODUCER,
        "producer_commit": producer_commit,
        "source_path": str(source_path),
        "source_sha256": sha256(source_path.read_bytes()),
        "model_path": str(model_path),
        "model_sha256": sha256(model_path.read_bytes()),
        "piqd_result_sha256": value.get("result_sha256") if isinstance(value, dict) else None,
        "assignment_positive_literals": len(assignment),
        "cnf_satisfied_independently": cnf.satisfied(assignment),
        "projected_key_literals": len(projected_key_literals(assignment, projection)),
        "projected_key_block_literals": len(projected_key_block(assignment, projection)),
        "key": key,
        "checks": checks,
        "all_checks_pass": bool(cnf.satisfied(assignment) and checks["Valid"]),
        "root_event_sha256": report["event_sha256"],
        "emitted_cnf_bytes": report["emitted_cnf_bytes"],
        "emitted_cnf_sha256": report["emitted_cnf_sha256"],
        "piqd_normalized_journal_bytes": report["piqd_normalized_journal_bytes"],
        "piqd_normalized_journal_sha256": report["piqd_normalized_journal_sha256"],
        "normalization_relation_verified": True,
    }
    event_path = run_root / "events" / "model-replay.json"
    event_path.write_bytes(canonical(result) + b"\n")
    return result


def parse_assignment(value: object) -> set[int]:
    if isinstance(value, list):
        return {int(item) for item in value if int(item) > 0}
    if isinstance(value, str):
        return {int(item) for item in re.findall(r"(?<![A-Za-z])-?\d+", value) if int(item) > 0}
    raise TypeError("PIQD model is neither a literal list nor text")


def repair_piqd_run_event(run_root: Path, report: dict[str, object],
                          custody: dict[str, object]) -> dict[str, object] | None:
    path = run_root / "events" / "piqd-run.json"
    if not path.exists():
        return None
    prior = json.loads(path.read_text())
    if prior.get("piqd_session_id") != custody["piqd_session_id"]:
        raise ValueError("PIQD run event session does not match custody event")
    if prior.get("result_sha256") != custody["result_sha256"]:
        raise ValueError("PIQD run event result does not match custody event")
    for ambiguous in ("cnf_bytes", "cnf_sha256", "event_sha256"):
        prior.pop(ambiguous, None)
    model_replay_path = run_root / "events" / "model-replay.json"
    prior.update({
        "emitted_cnf_path": report["cnf"],
        "emitted_cnf_bytes": report["emitted_cnf_bytes"],
        "emitted_cnf_sha256": report["emitted_cnf_sha256"],
        "piqd_journal_retained_path": custody["piqd_journal_retained_path"],
        "piqd_normalized_journal_bytes": custody["piqd_normalized_journal_bytes"],
        "piqd_normalized_journal_sha256": custody["piqd_normalized_journal_sha256"],
        "normalization_schema": PIQD_NORMALIZATION_SCHEMA,
        "normalization_relation_verified": True,
        "root_event_sha256": report["event_sha256"],
        "custody_event_sha256": custody["event_sha256"],
        "custody_event_file_sha256": sha256(
            (run_root / "events" / "piqd-custody.json").read_bytes()
        ),
        "model_replay_sha256": (
            sha256(model_replay_path.read_bytes()) if model_replay_path.exists() else None
        ),
        "rebound_without_solver_rerun": True,
    })
    event = seal_event(prior)
    path.write_bytes(canonical(event) + b"\n")
    return event


def verify_piqd_custody(run_root: Path, report: dict[str, object], journal_path: Path,
                        receipts_path: Path, model_path: Path | None) -> dict[str, object]:
    journal_bytes = journal_path.read_bytes()
    expected_journal, normalization = normalize_for_piqd_session(report["cnf_bytes"])
    if journal_bytes != expected_journal:
        raise ValueError("PIQD journal is not the deterministic normalization of emitted DIMACS")
    receipts = json.loads(receipts_path.read_text())
    rows = receipts.get("receipts", [])
    if receipts.get("count") != 1 or len(rows) != 1:
        raise ValueError("expected exactly one retained PIQD receipt")
    receipt = rows[0]
    expected_receipt = {
        "base_bytes": len(journal_bytes),
        "base_clauses": report["clauses"],
        "base_sha256": sha256(journal_bytes),
        "model_recorded": True,
        "status": "SAT",
    }
    if any(receipt.get(key) != value for key, value in expected_receipt.items()):
        raise ValueError("PIQD receipt does not bind the normalized journal")
    model_sha256 = None
    if model_path is not None:
        model = json.loads(model_path.read_text())
        if model.get("session_id") != receipts.get("session_id"):
            raise ValueError("retained model session does not match receipt session")
        if model.get("result_sha256") != receipt.get("result_sha256"):
            raise ValueError("retained model result does not match receipt result")
        model_sha256 = sha256(model_path.read_bytes())
    retained_journal_path = run_root / "artifacts" / "piqd-normalized-journal.cnf"
    retained_journal_path.write_bytes(journal_bytes)
    event = seal_event({
        "schema": PIQD_CUSTODY_SCHEMA,
        "producer": PRODUCER,
        "producer_commit": report["producer_commit"],
        "emitted_cnf_path": report["cnf"],
        "emitted_cnf_bytes": len(report["cnf_bytes"]),
        "emitted_cnf_sha256": sha256(report["cnf_bytes"]),
        "piqd_journal_source_path": str(journal_path),
        "piqd_journal_retained_path": str(retained_journal_path),
        "piqd_normalized_journal_bytes": len(journal_bytes),
        "piqd_normalized_journal_sha256": sha256(journal_bytes),
        "normalization": normalization,
        "normalization_relation_verified": True,
        "receipt_path": str(receipts_path),
        "receipt_sha256": sha256(receipts_path.read_bytes()),
        "piqd_session_id": receipts["session_id"],
        "solve_index": receipt["solve_index"],
        "result_sha256": receipt["result_sha256"],
        "model_path": str(model_path) if model_path is not None else None,
        "model_sha256": model_sha256,
        "rebound_without_solver_rerun": True,
        "all_checks_pass": True,
    })
    event_path = run_root / "events" / "piqd-custody.json"
    event_path.write_bytes(canonical(event) + b"\n")
    repair_piqd_run_event(run_root, report, event)
    return event


def write_root(run_root: Path, source_path: Path, producer_commit: str) -> dict[str, object]:
    cnf, projection = emit_root()
    source_bytes = source_path.read_bytes()
    run_root.joinpath("artifacts").mkdir(parents=True, exist_ok=True)
    run_root.joinpath("events").mkdir(parents=True, exist_ok=True)
    cnf_bytes = cnf.dimacs((SCHEMA, f"producer={PRODUCER}", f"producer_commit={producer_commit}"))
    _journal_bytes, normalization = normalize_for_piqd_session(cnf_bytes)
    cnf_path = run_root / "artifacts" / "exact13-witnessed-key-root.cnf"
    map_path = run_root / "artifacts" / "exact13-witnessed-key-root.map.json"
    event_path = run_root / "events" / "root.json"
    cnf_path.write_bytes(cnf_bytes)
    map_value = {"schema": SCHEMA, "variables": len(cnf.names), "clauses": len(cnf.clauses), "projection": projection}
    map_path.write_bytes(canonical(map_value) + b"\n")
    event = seal_event({"schema": SCHEMA, "producer": PRODUCER, "producer_commit": producer_commit,
                        "source_path": str(source_path), "source_sha256": sha256(source_bytes),
                        "cnf": str(cnf_path),
                        "emitted_cnf_bytes": len(cnf_bytes), "emitted_cnf_sha256": sha256(cnf_bytes),
                        "piqd_normalized_journal_bytes": normalization["piqd_normalized_journal_bytes"],
                        "piqd_normalized_journal_sha256": normalization["piqd_normalized_journal_sha256"],
                        "normalization": normalization, "normalization_relation_verified": True,
                        "map": str(map_path), "map_sha256": sha256(map_path.read_bytes()),
                        "variables": len(cnf.names), "clauses": len(cnf.clauses),
                        "root_claim": "finite Key.Valid witness relation only",
                        "no_metric_or_learned_conflicts": True})
    event_path.write_bytes(canonical(event) + b"\n")
    return {**event, "projection": projection, "cnf_bytes": cnf_bytes}


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--run-root", type=Path, required=True)
    parser.add_argument("--source-path", type=Path, default=Path("lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/CardGeThirteenExact13SourceIndexedFiniteKey.lean"))
    parser.add_argument("--producer-commit", default="d405f50b4575bd9b3a3e5e7d817b7ac81851d973")
    parser.add_argument("--model-json", type=Path)
    parser.add_argument("--piqd-journal", type=Path)
    parser.add_argument("--piqd-receipts", type=Path)
    args = parser.parse_args()
    report = write_root(args.run_root, args.source_path, args.producer_commit)
    output = {key: report[key] for key in (
        "variables", "clauses", "emitted_cnf_bytes", "emitted_cnf_sha256",
        "piqd_normalized_journal_bytes", "piqd_normalized_journal_sha256",
        "map_sha256", "event_sha256",
    )}
    if args.model_json:
        replay = replay_model(args.model_json, args.run_root, args.source_path, args.producer_commit, report)
        output["all_checks_pass"] = replay["all_checks_pass"]
        output["assignment_positive_literals"] = replay["assignment_positive_literals"]
    if (args.piqd_journal is None) != (args.piqd_receipts is None):
        parser.error("--piqd-journal and --piqd-receipts must be supplied together")
    if args.piqd_journal is not None:
        custody = verify_piqd_custody(
            args.run_root, report, args.piqd_journal, args.piqd_receipts, args.model_json
        )
        output["custody_checks_pass"] = custody["all_checks_pass"]
        output["piqd_normalized_journal_sha256"] = custody["piqd_normalized_journal_sha256"]
    print(json.dumps(output, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
