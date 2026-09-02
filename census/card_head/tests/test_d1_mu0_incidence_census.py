from __future__ import annotations

import argparse
import hashlib
import json
import tempfile
import unittest
import urllib.request
from itertools import combinations, product
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
    cap_of_interior,
    closure_violation,
    decode,
    explanation_clause,
    interior,
    interior_label,
    is_apex,
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


def assignment_of(pattern: Pattern, enc: census.Encoding) -> dict[int, bool]:
    """Primary-variable assignment of a pattern, including the CL0 membership aux."""

    assignment: dict[int, bool] = {}
    for x in pattern.cell.points:
        for label in range(N_LABELS):
            assignment[enc.v("c", x, label)] = pattern.centre[x] == label
            assignment[enc.v("s", x, label)] = label in pattern.shell[x]
        for k in range(3):
            centre = pattern.centre[x]
            assignment[enc.v("cin", x, k)] = (not is_apex(centre)) and cap_of_interior(centre) == k
    for x, y in combinations(pattern.cell.points, 2):
        assignment[enc.v("samec", x, y)] = pattern.centre[x] == pattern.centre[y]
    for (k, t), cls in pattern.classes.items():
        for label in range(N_LABELS):
            assignment[enc.v("A", k, t, label)] = label in cls
    for name, value in pattern.roles.items():
        for label in range(N_LABELS):
            assignment[enc.v(name, label)] = label == value
    for label in range(N_LABELS):
        assignment[enc.v("E", label)] = label in pattern.E
    for z in interior(0) + interior(1) + interior(2):
        for y in range(N_LABELS):
            if y != z and enc.has("M", z, y):
                assignment[enc.v("M", z, y)] = any(
                    pattern.centre[x] == z and y in pattern.shell[x] for x in pattern.cell.points
                )
    return assignment


def failing_primary_clauses(enc: census.Encoding, assignment: dict[int, bool]) -> list[tuple[int, ...]]:
    primary_only = [
        clause for clause in enc.cnf.clauses if all(abs(lit) in assignment for lit in clause)
    ]
    return [
        clause for clause in primary_only if not any(assignment[abs(lit)] == (lit > 0) for lit in clause)
    ]


def violating_witness() -> Pattern:
    """The hand witness with class A2 = interior(2) + {A0, P0.1}: A1 is then forced into it."""

    pattern = witness_i1()
    pattern.classes[(2, 0)] = frozenset(interior(2)) | {0, P(0, 1)}
    return pattern


class ClosureOracleTests(unittest.TestCase):
    def test_consistent_witness_has_no_violation(self) -> None:
        self.assertIsNone(closure_violation(witness_i1()))

    def test_equilateral_apex_triangle_forces_the_missing_class_member(self) -> None:
        pattern = violating_witness()
        violation = closure_violation(pattern)
        self.assertIsNotNone(violation)
        assert violation is not None
        self.assertEqual((violation.kind, violation.centre, violation.missing), ("class", 2, 1))
        self.assertEqual(violation.chain_length, 2)
        self.assertEqual(violation.consequent, ("A", 2, 0, 1))
        enc = build(pattern.cell)
        assignment = assignment_of(pattern, enc)
        clause = explanation_clause(enc, violation)
        self.assertIn(enc.v("A", 2, 0, 1), clause)
        self.assertFalse(any(assignment[abs(lit)] == (lit > 0) for lit in clause))
        # a shell-side equilateral triangle P0.2, P0.3, P2.2: shell(P2.2) gains P0.3, so
        # |P2.2 P0.2| = |P2.2 P0.3| and |P0.3 P0.2| = |P0.3 P2.2| force P2.2 onto shell(P0.2)
        shell_case = witness_i1()
        for x in (P(1, 4), P(2, 3)):
            shell_case.shell[x] = frozenset({P(0, 2), P(0, 3), P(2, 3), P(1, 4)})
        shell_violation = closure_violation(shell_case)
        assert shell_violation is not None
        self.assertEqual(
            (shell_violation.kind, shell_violation.centre, shell_violation.missing, shell_violation.chain_length),
            ("shell", P(0, 2), P(2, 2), 2),
        )
        self.assertEqual(shell_violation.consequent, ("s", P(0, 1), P(2, 2)))

    def test_cl0_static_block_agrees_with_the_oracle_on_length_two_chains(self) -> None:
        cell = witness_i1().cell
        enc = build(cell, equilateral=True)
        block = [b for b in enc.cnf.blocks if b.block_id == "CL0_equilateral_closure"]
        self.assertEqual(len(block), 1)
        self.assertGreater(block[0].clauses, 0)
        self.assertEqual(block[0].admission, "PROVEN")
        self.assertIn("Problem97.dist_eq_dist_of_mutual_bisector", block[0].lean_sources)
        self.assertEqual(failing_primary_clauses(enc, assignment_of(witness_i1(), enc)), [])
        failing = failing_primary_clauses(enc, assignment_of(violating_witness(), enc))
        self.assertTrue(failing)
        self.assertTrue(all(len(clause) == 6 for clause in failing))


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


def witness_i1_rh() -> Pattern:
    """The hand witness moved into the reverse-hit route (checked by hand).

    kept = P0.1, deleted = P0.3, reverse blocker c(P0.3) = P0.2 strictly between
    them; shell(P0.3) = {P0.1, P0.3, P1.1, P2.1} meets the closed first cap
    exactly in {P0.1, P0.3}; P0.1 moves to the new centre P0.4 with shell
    {P0.1, A2, P1.2, P2.1}.
    """

    pattern = witness_i1()
    pattern.cell = Cell(1, ("1R", "1R", "1R"), False, "rh")
    pattern.centre[P(0, 1)] = P(0, 4)
    pattern.shell[P(0, 1)] = frozenset({P(0, 1), 2, P(1, 2), P(2, 1)})
    pattern.roles["kept"] = P(0, 1)
    pattern.roles["deleted"] = P(0, 3)
    return pattern


def block_clauses(enc: census.Encoding, block_id: str) -> list[tuple[int, ...]]:
    start = 0
    for block in enc.cnf.blocks:
        if block.block_id == block_id:
            return enc.cnf.clauses[start : start + block.clauses]
        start += block.clauses
    raise KeyError(block_id)


def failing_in_block(enc: census.Encoding, block_id: str, assignment: dict[int, bool]) -> list[tuple[int, ...]]:
    return [
        clause
        for clause in block_clauses(enc, block_id)
        if all(abs(lit) in assignment for lit in clause)
        and not any(assignment[abs(lit)] == (lit > 0) for lit in clause)
    ]


RH_BLOCKS = (
    "C3_reverse_coupling_route_selector",
    "RH2_reverse_blocker_in_first_cap_interior",
    "RH3_reverse_shell_meets_first_cap_exactly_in_pair",
    "RH4_reverse_blocker_strictly_between_sources",
    "RH5_fresh_first_cap_source_outside_reverse_shell",
    "RH6_row_through_both_sources_has_reverse_blocker",
)


class RouteProvenanceTests(unittest.TestCase):
    def test_route_cells_round_trip_and_route_free_encoding_is_unchanged(self) -> None:
        cell = parse_cell("i1-1R1R1R-in12-rh")
        self.assertEqual(cell, Cell(1, ("1R", "1R", "1R"), False, "rh"))
        self.assertEqual(cell.name, "i1-1R1R1R-in12-rh")
        self.assertTrue(all(c.route == "sr" and c.name.endswith("-sr") for c in all_cells(True, route="sr")))
        with self.assertRaises(census.D1Mu0CensusError):
            Cell(0, ("1R", "1R", "1R"), False, "xx")
        with self.assertRaises(census.D1Mu0CensusError):
            parse_cell("i0-1R1R1R-in12-rh-extra")
        plain = build(Cell(1, ("1R", "1R", "1R")))
        self.assertFalse(any(b.block_id[:2] in ("C3", "RH", "SR") for b in plain.cnf.blocks))
        self.assertFalse(any(item.startswith("reverseHit_twoCenter") for item in plain.omitted_binders))
        routed = build(Cell(1, ("1R", "1R", "1R"), False, "rh"))
        self.assertEqual(routed.cnf.nvars, plain.cnf.nvars)
        self.assertEqual(
            [b.block_id for b in routed.cnf.blocks if b.block_id[:2] in ("C3", "RH", "SR")], list(RH_BLOCKS)
        )
        self.assertTrue(any(item.startswith("reverseHit_twoCenter_sqdist_acute") for item in routed.omitted_binders))
        args = argparse.Namespace(apex_shells="both", cell="targets", route="rh")
        self.assertEqual(len(census.select_cells(args)), 16)
        self.assertTrue(all(c.route == "rh" and c.is_target for c in census.select_cells(args)))
        args = argparse.Namespace(apex_shells="off", cell="i0-1R1R1R-in12,i1-2R1R1R-in12-sr", route="rh")
        self.assertEqual([c.name for c in census.select_cells(args)], ["i0-1R1R1R-in12-rh", "i1-2R1R1R-in12-sr"])

    def test_rh_blocks_carry_the_exact_lean_sources(self) -> None:
        enc = build(Cell(0, ("1R", "2R", "2R"), True, "rh"))
        blocks = {b.block_id: b for b in enc.cnf.blocks}
        for block_id in RH_BLOCKS:
            self.assertGreater(blocks[block_id].clauses, 0, block_id)
        self.assertEqual(blocks["C3_reverse_coupling_route_selector"].admission, "SELECTOR")
        self.assertIn("nonempty_retainedReverseCouplingOutcome", blocks["C3_reverse_coupling_route_selector"].lean_sources)
        self.assertEqual(blocks["RH2_reverse_blocker_in_first_cap_interior"].admission, "PROVEN")
        self.assertIn(
            "RetainedReverseCouplingOutcome.reverseHit.reverseBlocker_mem_capInterior",
            blocks["RH2_reverse_blocker_in_first_cap_interior"].lean_sources,
        )
        self.assertEqual(blocks["RH3_reverse_shell_meets_first_cap_exactly_in_pair"].admission, "IMPLIED")
        self.assertIn(
            "RetainedReverseCouplingOutcome.reverseHit.reverseShell_inter_cap_eq",
            blocks["RH3_reverse_shell_meets_first_cap_exactly_in_pair"].lean_sources,
        )
        self.assertEqual(blocks["RH4_reverse_blocker_strictly_between_sources"].admission, "IMPLIED")
        self.assertIn(
            "exists_firstCap_cgn_order_between_reverseBlocker_of_reverseHit",
            blocks["RH4_reverse_blocker_strictly_between_sources"].lean_sources,
        )
        self.assertIn(
            "exists_fresh_firstCap_commonDeletion_of_reverseHit",
            blocks["RH5_fresh_first_cap_source_outside_reverse_shell"].lean_sources,
        )
        self.assertEqual(blocks["RH6_row_through_both_sources_has_reverse_blocker"].admission, "PROVEN")
        self.assertIn(
            "actualRow_center_eq_reverseBlocker_of_reverseHit",
            blocks["RH6_row_through_both_sources_has_reverse_blocker"].lean_sources,
        )
        derived = [b.block_id for b in enc.cnf.blocks if b.admission == "DERIVED"]
        self.assertEqual(derived, ["R13_apex_class_twoRadii_exact_four_each"])
        sr2 = build(Cell(1, ("2R", "1R", "1R"), False, "sr"))
        self.assertIn("SR2_source_return_radius_dichotomy", [b.block_id for b in sr2.cnf.blocks])
        self.assertIn("nonempty_sourceReturnRadiusOutcome", {b.block_id: b for b in sr2.cnf.blocks}["SR2_source_return_radius_dichotomy"].lean_sources)
        sr1 = build(Cell(1, ("1R", "1R", "1R"), False, "sr"))
        self.assertNotIn("SR2_source_return_radius_dichotomy", [b.block_id for b in sr1.cnf.blocks])
        self.assertEqual(
            [b.clauses for b in sr1.cnf.blocks if b.block_id == "C3_reverse_coupling_route_selector"], [12]
        )

    def test_rh_positive_control_satisfies_every_block_and_replays(self) -> None:
        pattern = witness_i1_rh()
        self.assertEqual(replay(pattern), [])
        enc = build(pattern.cell)
        assignment = assignment_of(pattern, enc)
        self.assertEqual(failing_primary_clauses(enc, assignment), [])
        for block_id in RH_BLOCKS:
            self.assertEqual(failing_in_block(enc, block_id, assignment), [], block_id)
        model = [v if assignment.get(v, False) else -v for v in range(1, enc.cnf.nvars + 1)]
        decoded = decode(enc, model)
        self.assertEqual(decoded.shell[decoded.roles["deleted"]] & set(cap_by_index(0)), {P(0, 1), P(0, 3)})

    def test_rh_negative_controls_fail_the_named_block(self) -> None:
        enc = build(witness_i1_rh().cell)
        # (a) reverse omission: the sr-consistent witness fails the route selector
        omission = witness_i1()
        omission.cell = enc.cell
        self.assertTrue(failing_in_block(enc, "C3_reverse_coupling_route_selector", assignment_of(omission, enc)))
        self.assertTrue(any(v.startswith("C3 rh") for v in replay(omission)))
        # (b) reverse blocker outside the first cap
        outside = witness_i1_rh()
        outside.centre[P(0, 3)] = P(2, 1)
        self.assertTrue(failing_in_block(enc, "RH2_reverse_blocker_in_first_cap_interior", assignment_of(outside, enc)))
        self.assertTrue(any(v.startswith("RH2") for v in replay(outside)))
        # (c) exact intersection: shell(deleted) also contains the chord apex A1
        extra = witness_i1_rh()
        extra.shell[P(0, 3)] = frozenset({P(0, 1), P(0, 3), 1, P(2, 1)})
        self.assertTrue(failing_in_block(enc, "RH3_reverse_shell_meets_first_cap_exactly_in_pair", assignment_of(extra, enc)))
        self.assertTrue(any(v.startswith("RH3") for v in replay(extra)))
        # (d) betweenness: the reverse blocker at slot 4 is not between slots 1 and 3
        beside = witness_i1_rh()
        beside.centre[P(0, 3)] = P(0, 4)
        self.assertTrue(failing_in_block(enc, "RH4_reverse_blocker_strictly_between_sources", assignment_of(beside, enc)))
        self.assertTrue(any(v.startswith("RH4") for v in replay(beside)))
        # (e) fresh source: shell(deleted) swallows both spare interior slots
        swallowed = witness_i1_rh()
        swallowed.shell[P(0, 3)] = frozenset({P(0, 1), P(0, 3), P(0, 2), P(0, 4)})
        self.assertTrue(failing_in_block(enc, "RH5_fresh_first_cap_source_outside_reverse_shell", assignment_of(swallowed, enc)))
        self.assertTrue(any(v.startswith("RH5") for v in replay(swallowed)))
        # (f) a second row through both sources with another centre
        second = witness_i1_rh()
        second.shell[P(1, 3)] = frozenset({P(2, 2), P(1, 3), P(0, 1), P(0, 3)})
        self.assertTrue(failing_in_block(enc, "RH6_row_through_both_sources_has_reverse_blocker", assignment_of(second, enc)))
        self.assertTrue(any(v.startswith("RH6") for v in replay(second)))

    def test_sr_controls(self) -> None:
        cell = Cell(1, ("1R", "1R", "1R"), False, "sr")
        enc = build(cell)
        positive = witness_i1()
        positive.cell = cell
        self.assertEqual(replay(positive), [])
        self.assertEqual(failing_primary_clauses(enc, assignment_of(positive, enc)), [])
        negative = witness_i1_rh()
        negative.cell = cell
        self.assertTrue(failing_in_block(enc, "C3_reverse_coupling_route_selector", assignment_of(negative, enc)))
        self.assertTrue(any(v.startswith("C3 sr") for v in replay(negative)))


@unittest.skipUnless(_piqd_reachable(), "piqd daemon is not reachable")
class PiqdRouteTests(unittest.TestCase):
    def test_route_cells_are_sat_and_replay(self) -> None:
        client = Piqd()
        for name in ("i0-1R1R1R-in12-rh", "i1-2R1R1R-in12-sr"):
            cell = parse_cell(name)
            enc = build(cell)
            cnf = enc.cnf.dimacs()
            _prepared, record = client.run_job(cnf, census.producer_manifest(enc, cnf, "base"), 60)
            self.assertEqual(record["result"], "SAT", name)
            pattern = decode(enc, client.model(record["id"]))
            self.assertEqual(replay(pattern), [], name)
            kept, deleted = pattern.roles["kept"], pattern.roles["deleted"]
            self.assertEqual(kept in pattern.shell[deleted], cell.route == "rh", name)
            if cell.route == "sr":
                session = client.create_session(record["id"], f"{census.PROJECT_LABEL}:test:{name}")
                try:
                    reply = client.solve(session["id"], [-enc.v("srJoint")], 60_000)
                    self.assertIn(reply["status"], ("SAT", "UNSAT"))
                    if reply["status"] == "SAT":
                        escape = decode(enc, reply["model"])
                        self.assertEqual(replay(escape), [])
                        retained = [cls for (k, _t), cls in escape.classes.items() if k == 0 and kept in cls]
                        self.assertEqual(len(retained), 1)
                        self.assertNotIn(escape.roles["source"], retained[0])
                finally:
                    client.close_session(session["id"])


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


STAGE1B_TARGET_CNF_SHA256 = "600dc7bbd95620ef5bde0dd3b9b21ee5f2cf59442f4db641a918f2b3ffaff0b7"


def bisector_violating_witness() -> Pattern:
    """shell(P2.3) = shell(P1.3) gains P0.1 and P0.3: three centres (P0.2, P2.3, A0) equidistant."""

    pattern = witness_i1()
    for x in (P(1, 3), P(2, 4)):
        pattern.shell[x] = frozenset({P(0, 1), P(0, 3), P(1, 3), P(2, 4)})
    return pattern


class BisectorTests(unittest.TestCase):
    def test_cl0_cnf_unchanged_and_bi1_block_admitted(self) -> None:
        enc = build(census.parse_cell("i0-1R1R1R-in12"), equilateral=True)
        self.assertEqual(hashlib.sha256(enc.cnf.dimacs()).hexdigest(), STAGE1B_TARGET_CNF_SHA256)
        cell = witness_i1().cell
        enc_b = build(cell, equilateral=True, bisector=True)
        block = [b for b in enc_b.cnf.blocks if b.block_id == "BI1_bisector_carrier_card_le_two"]
        self.assertEqual(len(block), 1)
        self.assertGreater(block[0].clauses, 0)
        self.assertEqual((block[0].clause_class, block[0].admission), ("ROOT_STATIC", "PROVEN"))
        self.assertIn("Dumitrescu.perpBisector_apex_bound", block[0].lean_sources)
        only_b = build(cell, bisector=True)
        self.assertTrue(only_b.has("M", P(0, 1), P(0, 2)))
        self.assertEqual(failing_primary_clauses(only_b, assignment_of(witness_i1(), only_b)), [])

    def test_hand_witness_satisfies_bi1(self) -> None:
        enc_b = build(witness_i1().cell, equilateral=True, bisector=True)
        self.assertEqual(failing_primary_clauses(enc_b, assignment_of(witness_i1(), enc_b)), [])
        self.assertEqual(census.bisector_violations(witness_i1()), [])

    def test_three_equidistant_centres_fail_bi1(self) -> None:
        pattern = bisector_violating_witness()
        violations = census.bisector_violations(pattern)
        self.assertEqual(violations, ["BI1 P0.1 P0.3 equidistant from 3 centres"])
        cell = pattern.cell
        without = set(failing_primary_clauses(build(cell, equilateral=True), assignment_of(pattern, build(cell, equilateral=True))))
        enc_b = build(cell, equilateral=True, bisector=True)
        with_b = set(failing_primary_clauses(enc_b, assignment_of(pattern, enc_b)))
        new = with_b - without
        self.assertTrue(new)
        self.assertTrue(all(len(clause) == 6 for clause in new))
        m01, m03 = enc_b.v("M", P(0, 2), P(0, 1)), enc_b.v("M", P(0, 2), P(0, 3))
        self.assertTrue(any(-m01 in clause and -m03 in clause for clause in new))
