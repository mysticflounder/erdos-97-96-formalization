#!/usr/bin/env python3

from __future__ import annotations

from copy import deepcopy
import unittest

from census import REPO, SOURCE_FILES
from domain import (
    ModelError,
    canonical_key,
    pair_key,
    validate_first_fiber_packet,
    validate_orbit_model,
)
from encode_z3 import first_fiber_nonbisector_probe, solve_orbit
from fixtures import all_omission_orbit, mixed_hit_orbit, valid_first_fiber_packet


class OrbitCensusTests(unittest.TestCase):
    def test_manifest_sources_resolve_inside_repository(self) -> None:
        self.assertTrue(all(path.is_file() for path in SOURCE_FILES))
        self.assertTrue(all(path.is_relative_to(REPO) for path in SOURCE_FILES))

    def test_exact_euclidean_fixtures(self) -> None:
        validate_orbit_model(all_omission_orbit())
        validate_orbit_model(mixed_hit_orbit())

    def test_mutated_shell_is_rejected(self) -> None:
        model = all_omission_orbit()
        model["edge_colors"][pair_key(2, 5)] = 99
        with self.assertRaises(ModelError):
            validate_orbit_model(model)

    def test_missing_opaque_witness_is_rejected(self) -> None:
        model = all_omission_orbit()
        del model["opaque_witnesses"][0]["double_deletion_k4"]
        with self.assertRaises(ModelError):
            validate_orbit_model(model)

    def test_cycle_rotation_canonicalizes_identically(self) -> None:
        model = all_omission_orbit()
        rotated = deepcopy(model)
        for field in (
            "sources",
            "mates",
            "hits",
            "hit_opposite_side",
            "cap_roles",
            "opaque_witnesses",
        ):
            rotated[field] = rotated[field][1:] + rotated[field][:1]
        validate_orbit_model(rotated)
        self.assertEqual(canonical_key(model), canonical_key(rotated))

    def test_distinct_query_is_not_canonicalized_together(self) -> None:
        self.assertNotEqual(
            canonical_key(all_omission_orbit()), canonical_key(mixed_hit_orbit())
        )

    def test_first_fiber_nonbisector_rule(self) -> None:
        for case in ("neither", "q_only", "o_only"):
            with self.subTest(solver_free_case=case):
                validate_first_fiber_packet(
                    valid_first_fiber_packet(second_case=case)
                )
        expected = {
            0: {
                "both": "UNSAT",
                "neither": "UNSAT",
                "q_only": "UNSAT",
                "o_only": "UNSAT",
            },
            1: {
                "both": "UNSAT",
                "neither": "UNSAT",
                "q_only": "SAT",
                "o_only": "SAT",
            },
            2: {
                "both": "UNSAT",
                "neither": "SAT",
                "q_only": "SAT",
                "o_only": "SAT",
            },
        }
        for fresh_count, cases in expected.items():
            for case, verdict in cases.items():
                with self.subTest(fresh_count=fresh_count, case=case):
                    self.assertEqual(
                        first_fiber_nonbisector_probe(
                            second_shell_case=case,
                            fresh_outside_points=fresh_count,
                        ),
                        verdict,
                    )

    def test_first_fiber_bisection_mutation_is_rejected(self) -> None:
        packet = valid_first_fiber_packet()
        roles = packet["roles"]
        packet["edge_colors"][pair_key(roles["b_rho"], roles["q"])] = packet[
            "edge_colors"
        ][pair_key(roles["b_rho"], roles["r1"])]
        packet["edge_colors"][pair_key(roles["b_rho"], roles["o"])] = packet[
            "edge_colors"
        ][pair_key(roles["b_rho"], roles["r1"])]
        with self.assertRaises(ModelError):
            validate_first_fiber_packet(packet)

    def test_first_fiber_each_named_beta_clause_is_hard(self) -> None:
        for role in ("p1", "p2", "q", "r1", "r2"):
            packet = valid_first_fiber_packet()
            packet["beta"][role] = packet["roles"]["o"]
            with self.subTest(role=role), self.assertRaises(ModelError):
                validate_first_fiber_packet(packet)

    def test_first_fiber_retained_source_distinctness_is_hard(self) -> None:
        for left, right in (("p1", "p2"), ("p1", "r1"), ("r1", "r2"), ("q", "o")):
            packet = valid_first_fiber_packet()
            packet["roles"][right] = packet["roles"][left]
            with self.subTest(left=left, right=right), self.assertRaises(ModelError):
                validate_first_fiber_packet(packet)

    def test_first_fiber_only_source_permitted_coincidences_are_allowed(self) -> None:
        for blocker, source in (
            ("b", "r1"),
            ("b", "r2"),
            ("b_rho", "p1"),
            ("b_rho", "p2"),
        ):
            base_roles = valid_first_fiber_packet()["roles"]
            packet = valid_first_fiber_packet(
                role_overrides={blocker: base_roles[source]}
            )
            with self.subTest(blocker=blocker, source=source):
                validate_first_fiber_packet(packet)

    def test_first_fiber_distinct_blocker_guard_is_hard(self) -> None:
        packet = valid_first_fiber_packet()
        packet["roles"]["b_rho"] = packet["roles"]["b"]
        with self.assertRaises(ModelError):
            validate_first_fiber_packet(packet)

    def test_first_fiber_cap_roles_are_hard(self) -> None:
        for role in ("p1", "p2", "r1", "r2", "b", "b_rho"):
            packet = valid_first_fiber_packet()
            packet["first_cap_membership"][packet["roles"][role]] = False
            with self.subTest(role=role), self.assertRaises(ModelError):
                validate_first_fiber_packet(packet)
        for role in ("q", "o"):
            packet = valid_first_fiber_packet()
            packet["first_cap_membership"][packet["roles"][role]] = True
            with self.subTest(role=role), self.assertRaises(ModelError):
                validate_first_fiber_packet(packet)

    def test_first_fiber_exact_first_shell_is_hard(self) -> None:
        for role in ("p2", "q", "o"):
            packet = valid_first_fiber_packet()
            roles = packet["roles"]
            packet["edge_colors"][pair_key(roles["b"], roles[role])] += 100
            with self.subTest(missing=role), self.assertRaises(ModelError):
                validate_first_fiber_packet(packet)
        packet = valid_first_fiber_packet()
        roles = packet["roles"]
        packet["edge_colors"][pair_key(roles["b"], roles["r1"])] = packet[
            "edge_colors"
        ][pair_key(roles["b"], roles["p1"])]
        with self.assertRaises(ModelError):
            validate_first_fiber_packet(packet)

    def test_first_fiber_trust_boundary_rejects_saturation_claim(self) -> None:
        packet = valid_first_fiber_packet()
        packet["trust_boundary"]["not_claimed"].remove("blocker_fiber_saturation")
        with self.assertRaises(ModelError):
            validate_first_fiber_packet(packet)

    def test_first_fiber_second_shell_exactness_is_hard(self) -> None:
        packet = valid_first_fiber_packet(second_case="q_only")
        roles = packet["roles"]
        packet["edge_colors"][pair_key(roles["b_rho"], 8)] += 100
        with self.assertRaises(ModelError):
            validate_first_fiber_packet(packet)

        packet = valid_first_fiber_packet(second_case="q_only")
        roles = packet["roles"]
        packet["edge_colors"][pair_key(roles["b_rho"], roles["p1"])] = packet[
            "edge_colors"
        ][pair_key(roles["b_rho"], roles["r1"])]
        with self.assertRaises(ModelError):
            validate_first_fiber_packet(packet)

    def test_first_fiber_no_extra_outside_layout_is_rejected(self) -> None:
        packet = valid_first_fiber_packet(second_case="q_only")
        packet["first_cap_membership"][8] = True
        with self.assertRaises(ModelError):
            validate_first_fiber_packet(packet)

    def test_first_fiber_partial_beta_does_not_claim_saturation(self) -> None:
        packet = valid_first_fiber_packet()
        packet["beta"]["o"] = packet["roles"]["b"]
        validate_first_fiber_packet(packet)

    def test_first_fiber_packet_structure_and_color_domain_are_hard(self) -> None:
        mutations = []

        bad_version = valid_first_fiber_packet()
        bad_version["packet_schema_version"] += 1
        mutations.append(("schema_version", bad_version))

        missing_role = valid_first_fiber_packet()
        del missing_role["roles"]["o"]
        mutations.append(("role_completeness", missing_role))

        outside_role = valid_first_fiber_packet()
        outside_role["roles"]["o"] = outside_role["point_count"]
        mutations.append(("role_carrier", outside_role))

        missing_color = valid_first_fiber_packet()
        del missing_color["edge_colors"][pair_key(0, 1)]
        mutations.append(("color_completeness", missing_color))

        negative_color = valid_first_fiber_packet()
        negative_color["edge_colors"][pair_key(0, 1)] = -1
        mutations.append(("color_domain", negative_color))

        incomplete_cap_classification = valid_first_fiber_packet()
        incomplete_cap_classification["first_cap_membership"].pop()
        mutations.append(("cap_classification", incomplete_cap_classification))

        for clause, packet in mutations:
            with self.subTest(clause=clause), self.assertRaises(ModelError):
                validate_first_fiber_packet(packet)

    def test_five_point_all_omission_two_cycle_is_unsat_discovery(self) -> None:
        self.assertEqual(
            solve_orbit(5, 2, "all_omission", timeout_ms=20_000)["status"],
            "UNSAT",
        )

    def test_six_point_all_omission_two_cycle_is_sat_and_verified(self) -> None:
        outcome = solve_orbit(6, 2, "all_omission", timeout_ms=20_000)
        self.assertEqual(outcome["status"], "SAT")
        validate_orbit_model(outcome["model"])

    def test_six_point_hit_two_cycle_is_sat_and_verified(self) -> None:
        outcome = solve_orbit(
            6, 2, "some_hit", fixed_apex_radius=True, timeout_ms=20_000
        )
        self.assertEqual(outcome["status"], "SAT")
        validate_orbit_model(outcome["model"])

    def test_period_six_needs_no_residual_non_source_point(self) -> None:
        for query in ("some_hit", "all_omission"):
            with self.subTest(query=query):
                outcome = solve_orbit(7, 6, query, timeout_ms=20_000)
                self.assertEqual(outcome["status"], "SAT")
                validate_orbit_model(outcome["model"])


if __name__ == "__main__":
    unittest.main()
