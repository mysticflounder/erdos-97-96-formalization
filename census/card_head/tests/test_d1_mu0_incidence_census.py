from __future__ import annotations

import argparse
import json
import tempfile
import unittest
import urllib.request
from itertools import product
from pathlib import Path

from census.card_head import d1_mu0_incidence_census as census
from census.card_head.d1_mu0_incidence_census import (
    APEX_LABELS,
    N_LABELS,
    Cell,
    Cnf,
    Pattern,
    Piqd,
    adjacent_pick_domain,
    all_cells,
    blocking_clause,
    build,
    cap_by_index,
    decode,
    interior,
    interior_label,
    label_name,
    parse_cell,
    replay,
    sigma_key,
    sigma_label,
    slot_of,
    smoke_units,
    with_units,
)


def _piqd_reachable() -> bool:
    try:
        with urllib.request.urlopen(census.DEFAULT_SERVER + "/version", timeout=2) as response:
            return response.status == 200
    except OSError:
        return False


def _satisfiable(clauses: list[tuple[int, ...]], fixed: dict[int, bool], free: list[int]) -> bool:
    """Brute-force existence of an extension of ``fixed`` over ``free`` satisfying ``clauses``."""

    for bits in product((False, True), repeat=len(free)):
        assignment = dict(fixed)
        assignment.update(zip(free, bits, strict=True))
        if all(any(assignment[abs(lit)] == (lit > 0) for lit in clause) for clause in clauses):
            return True
    return False


def P(k: int, slot: int) -> int:
    return interior_label(k, slot)


def witness_i1() -> Pattern:
    """A hand-built incidence witness for cell ``i1-1R1R1R-in12`` (checked by hand)."""

    cell = Cell(1, ("1R", "1R", "1R"), False)
    c1, c2, c3, c4 = P(0, 2), P(0, 3), P(2, 3), P(2, 2)
    S1 = frozenset({P(0, 1), P(0, 3), P(1, 1), P(2, 1)})
    S2 = frozenset({P(0, 2), P(0, 4), P(1, 2), P(2, 2)})
    S3 = frozenset({P(2, 2), P(2, 4), P(1, 3), P(0, 1)})
    S4 = frozenset({P(2, 1), P(2, 3), P(1, 4), P(0, 2)})
    centre = {
        P(0, 1): c1, P(0, 3): c1, P(1, 1): c1, P(2, 1): c1,
        P(0, 2): c2, P(0, 4): c2, P(1, 2): c2, P(2, 2): c2,
        P(1, 3): c3, P(2, 4): c3,
        P(1, 4): c4, P(2, 3): c4,
    }
    shells = {c1: S1, c2: S2, c3: S3, c4: S4}
    shell = {x: shells[centre[x]] for x in centre}
    classes = {
        (0, 0): frozenset(interior(0)) | {1, 2},
        (1, 0): frozenset(interior(1)) | {0, 2},
        (2, 0): frozenset(interior(2)) | {0, 1},
    }
    roles = {"kept": P(0, 1), "deleted": P(0, 2), "source": 1, "z": P(0, 1), "w": P(0, 2)}
    E = frozenset({P(1, 3), P(1, 4), P(2, 3), P(2, 4)})
    return Pattern(cell, centre, shell, {}, classes, roles, E)


class GeometryTests(unittest.TestCase):
    def test_slots_and_closed_caps(self) -> None:
        for k in range(3):
            self.assertEqual(slot_of(k, (k + 1) % 3), 0)
            self.assertEqual(slot_of(k, (k + 2) % 3), 5)
            self.assertEqual([slot_of(k, x) for x in interior(k)], [1, 2, 3, 4])
            self.assertIsNone(slot_of(k, k))
            self.assertEqual(set(cap_by_index(k)), set(interior(k)) | {(k + 1) % 3, (k + 2) % 3})
            self.assertNotIn(k, adjacent_pick_domain(k, 0))
            self.assertNotIn(k, adjacent_pick_domain(k, 1))
            self.assertEqual(set(adjacent_pick_domain(k, 0)), set(interior((k + 1) % 3)) | {(k + 2) % 3})
            self.assertEqual(set(adjacent_pick_domain(k, 1)), set(interior((k + 2) % 3)) | {(k + 1) % 3})
        self.assertEqual(sorted(set(interior(0) + interior(1) + interior(2)) | set(APEX_LABELS)), list(range(N_LABELS)))

    def test_sigma_is_an_involution_that_maps_caps_and_reverses_slots(self) -> None:
        for label in range(N_LABELS):
            self.assertEqual(sigma_label(sigma_label(label)), label)
        self.assertEqual(sigma_label(0), 0)
        self.assertEqual(sigma_label(1), 2)
        for k, m in ((0, 0), (1, 2), (2, 1)):
            for x in cap_by_index(k):
                self.assertEqual(slot_of(m, sigma_label(x)), 5 - slot_of(k, x))

    def test_cell_names_round_trip(self) -> None:
        for cell in all_cells(False) + all_cells(True):
            self.assertEqual(parse_cell(cell.name), cell)
        self.assertEqual(len(all_cells(False)), 16)
        self.assertEqual(sum(cell.is_target for cell in all_cells(False)), 8)
        self.assertTrue(Cell(0, ("1R", "2R", "2R")).sigma_fixed)
        self.assertFalse(Cell(0, ("1R", "1R", "2R")).sigma_fixed)
        self.assertFalse(Cell(1, ("1R", "1R", "1R")).sigma_fixed)
        self.assertEqual(len(Cell(0, ("2R", "1R", "2R")).classes()), 5)


class CardinalityEncoderTests(unittest.TestCase):
    def test_at_most_with_condition_is_exact(self) -> None:
        for n, bound in ((3, 1), (4, 2), (5, 2), (5, 0), (2, 1)):
            cnf = Cnf()
            cnf.begin("t", "ROOT_STATIC", "PROVEN", (), "test")
            xs = [cnf.new_var(("x", i)) for i in range(n)]
            cond = cnf.new_var(("cond",))
            cnf.at_most(xs, bound, condition=(cond,))
            aux = [v for v in range(1, cnf.nvars + 1) if v not in xs and v != cond]
            for bits in product((False, True), repeat=n):
                for cval in (False, True):
                    fixed = dict(zip(xs, bits, strict=True))
                    fixed[cond] = cval
                    expected = (not cval) or sum(bits) <= bound
                    self.assertEqual(_satisfiable(cnf.clauses, fixed, aux), expected, (n, bound, bits, cval))

    def test_counter_registers_are_exact(self) -> None:
        for n in (1, 2, 4):
            cnf = Cnf()
            cnf.begin("t", "ROOT_STATIC", "PROVEN", (), "test")
            xs = [cnf.new_var(("x", i)) for i in range(n)]
            regs = cnf.counter(xs, "t")
            aux = [v for v in range(1, cnf.nvars + 1) if v not in xs]
            for bits in product((False, True), repeat=n):
                fixed = dict(zip(xs, bits, strict=True))
                total = sum(bits)
                for j in range(1, n + 1):
                    forced = fixed | {regs[j - 1]: total >= j}
                    self.assertTrue(_satisfiable(cnf.clauses, forced, [v for v in aux if v != regs[j - 1]]))
                    wrong = fixed | {regs[j - 1]: not (total >= j)}
                    self.assertFalse(_satisfiable(cnf.clauses, wrong, [v for v in aux if v != regs[j - 1]]))


class EncodingTests(unittest.TestCase):
    def test_every_block_carries_an_admission_record(self) -> None:
        for cell in (Cell(0, ("1R", "1R", "1R")), Cell(0, ("1R", "2R", "2R"), True), Cell(1, ("2R", "1R", "2R"))):
            enc = build(cell)
            self.assertTrue(enc.cnf.blocks)
            for block in enc.cnf.blocks:
                self.assertIn(block.admission, ("PROVEN", "DERIVED", "IMPLIED", "SELECTOR"))
                if block.admission in ("PROVEN", "DERIVED"):
                    self.assertTrue(block.lean_sources, block.block_id)
                self.assertTrue(block.antecedent)
            self.assertEqual(sum(b.clauses for b in enc.cnf.blocks), len(enc.cnf.clauses))
            derived = [b.block_id for b in enc.cnf.blocks if b.admission == "DERIVED"]
            self.assertEqual(derived, ["R13_apex_class_twoRadii_exact_four_each"])

    def test_dimacs_is_well_formed(self) -> None:
        enc = build(Cell(0, ("1R", "1R", "1R")))
        text = enc.cnf.dimacs().decode("ascii")
        lines = text.splitlines()
        header = lines[0].split()
        self.assertEqual(header[:2], ["p", "cnf"])
        self.assertEqual(int(header[2]), enc.cnf.nvars)
        self.assertEqual(int(header[3]), len(lines) - 1)
        for line in lines[1:]:
            lits = [int(tok) for tok in line.split()]
            self.assertEqual(lits[-1], 0)
            self.assertTrue(all(0 < abs(l) <= enc.cnf.nvars for l in lits[:-1]))
        extended = with_units(enc.cnf.dimacs(), (1, -2))
        self.assertEqual(int(extended.splitlines()[0].split()[3]), len(lines) + 1)

    def test_hand_witness_replays_and_mutations_are_caught(self) -> None:
        pattern = witness_i1()
        self.assertEqual(replay(pattern), [])
        mutated = witness_i1()
        x = P(0, 2)
        mutated.shell[x] = frozenset({P(0, 1), P(0, 2), P(0, 4), P(1, 2)})  # adjacent arrow P0.2 -> P0.1
        for y in list(mutated.centre):
            if mutated.centre[y] == mutated.centre[x]:
                mutated.shell[y] = mutated.shell[x]
        self.assertTrue(any(v.startswith(("R6", "R8")) for v in replay(mutated)))
        mutated = witness_i1()
        mutated.centre[P(1, 3)] = 0
        self.assertTrue(any(v.startswith("R4") for v in replay(mutated)))
        mutated = witness_i1()
        mutated.shell[P(1, 3)] = frozenset({P(1, 3), P(2, 4), P(0, 1), P(2, 2)})
        mutated.shell[P(2, 4)] = frozenset({P(1, 3), P(2, 4), P(0, 1), P(0, 4)})
        self.assertTrue(any(v.startswith("R5") for v in replay(mutated)))
        wrong_cell = witness_i1()
        wrong_cell.cell = Cell(0, ("1R", "1R", "1R"))
        self.assertTrue(any(v.startswith("C2") for v in replay(wrong_cell)))

    def test_hand_witness_satisfies_the_cnf_and_blocking_clause_excludes_it(self) -> None:
        pattern = witness_i1()
        enc = build(pattern.cell)
        assignment: dict[int, bool] = {}
        for x in pattern.cell.points:
            for label in range(N_LABELS):
                assignment[enc.v("c", x, label)] = pattern.centre[x] == label
                assignment[enc.v("s", x, label)] = label in pattern.shell[x]
        for (k, t), cls in pattern.classes.items():
            for label in range(N_LABELS):
                assignment[enc.v("A", k, t, label)] = label in cls
        for name, value in pattern.roles.items():
            for label in range(N_LABELS):
                assignment[enc.v(name, label)] = label == value
        for label in range(N_LABELS):
            assignment[enc.v("E", label)] = label in pattern.E
        # primary variables are fixed; the semantic (non-aux) clauses over them must hold
        primary_only = [
            clause for clause in enc.cnf.clauses if all(abs(lit) in assignment for lit in clause)
        ]
        failing = [
            clause for clause in primary_only if not any(assignment[abs(lit)] == (lit > 0) for lit in clause)
        ]
        self.assertEqual(failing, [])
        model = [v if assignment.get(v, False) else -v for v in range(1, enc.cnf.nvars + 1)]
        decoded = decode(enc, model)
        self.assertEqual(decoded.centre, pattern.centre)
        self.assertEqual(decoded.shell, pattern.shell)
        for projection in ("full", "capi", "centres"):
            clause = blocking_clause(enc, decoded, projection)
            self.assertFalse(any(assignment.get(abs(lit), False) == (lit > 0) for lit in clause))
        key = decoded.key("full")
        self.assertEqual(sigma_key(sigma_key(key, "full"), "full"), tuple(sorted(key)))

    def test_smoke_units_shape(self) -> None:
        enc = build(Cell(0, ("1R", "1R", "1R")))
        units = smoke_units(enc)
        self.assertEqual(
            [units[k][1] for k in sorted(units)], ["SAT", "UNSAT", "UNSAT", "UNSAT"]
        )
        self.assertEqual(units["ii_adjacent_slot_arrow"][0], (enc.v("s", P(0, 1), P(0, 2)),))
        with self.assertRaises(census.D1Mu0CensusError):
            smoke_units(build(Cell(0, ("2R", "1R", "1R"))))


@unittest.skipUnless(_piqd_reachable(), "piqd daemon is not reachable")
class PiqdSmokeTests(unittest.TestCase):
    def test_guardrail_one_smoke_tests_through_piqd(self) -> None:
        client = Piqd()
        cell = Cell(0, ("1R", "1R", "1R"))
        with tempfile.TemporaryDirectory() as tmp:
            artifacts = Path(tmp) / "artifacts"
            artifacts.mkdir()
            args = argparse.Namespace(timeout=60)
            results = census.run_smoke(cell, client, artifacts, args)
        self.assertTrue(results["all_passed"], json.dumps(results, indent=1)[:2000])
        for name, entry in results["tests"].items():
            self.assertEqual(entry["job"]["result"], entry["expected"], name)
            if entry["expected"] == "UNSAT":
                self.assertIsNotNone(entry["job"]["proof_blob_hash"], name)

    def test_base_cell_is_sat_and_replays(self) -> None:
        client = Piqd()
        cell = Cell(0, ("1R", "1R", "1R"))
        enc = build(cell)
        cnf = enc.cnf.dimacs()
        _prepared, record = client.run_job(cnf, census.producer_manifest(enc, cnf, "base"), 60)
        self.assertEqual(record["result"], "SAT")
        pattern = decode(enc, client.model(record["id"]))
        self.assertEqual(replay(pattern), [])
        self.assertEqual(label_name(pattern.roles["kept"])[:2], "P0")


if __name__ == "__main__":
    unittest.main()
