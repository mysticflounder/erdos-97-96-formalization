from __future__ import annotations

import re
import unittest
from pathlib import Path

from census.card_head.exact12_adjacent_apex_cross_block_membership_family_bank import (
    install_adjacent_apex_cross_block_membership_family_bank,
)
from census.card_head.exact12_apex_internal_shared_pair_common_five_membership_family_bank import (
    EXPECTED_COMPILED_SHA256,
    EXPECTED_DELTA_SHA256,
    EXPECTED_FINAL_CLAUSES,
    EXPECTED_FINAL_DIMACS_SHA256,
    EXPECTED_FINAL_VARIABLES,
    EXPECTED_REUSED_REQUIREMENT_COUNT,
    FAMILY_ID,
    _compile_payload,
    build_apex_internal_shared_pair_common_five_membership_family_bank,
    family_patterns,
    family_roles,
)
from census.card_head.exact12_apex_pair_cross_block_membership_family_bank import (
    install_apex_pair_cross_block_membership_family_bank,
)
from census.card_head.exact12_apex_shared_pair_cross_block_membership_family_bank import (
    install_apex_shared_pair_cross_block_membership_family_bank,
)
from census.card_head.exact12_apex_zero_cross_block_membership_family_bank import (
    install_apex_zero_cross_block_membership_family_bank,
)
from census.card_head.exact12_next_row_static_cegar import (
    materialize_positive_membership_static_cell,
)
from census.card_head.exact12_second_cap_apex_surplus_membership_family_bank import (
    install_second_cap_apex_surplus_membership_family_bank,
)
from census.card_head.exact12_surplus_apex_pair_membership_family_bank import (
    install_surplus_apex_pair_membership_family_bank,
)
from census.card_head.exact12_surplus_three_triad_membership_family_bank import (
    install_surplus_three_triad_membership_family_bank,
)
from census.card_head.exact12_zero_center_cross_block_membership_family_bank import (
    install_zero_center_cross_block_membership_family_bank,
)

REPO_ROOT = Path(__file__).resolve().parents[3]
LEAN_CNF_PATH = REPO_ROOT / (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221ApexInternalSharedPairCommonFiveMembershipFamilyCnf.lean"
)
SECOND_CAP_PARENT_LEAN_PATH = REPO_ROOT / (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221SecondCapApexSurplusMembershipFamilyCnf.lean"
)
TRIAD_PARENT_LEAN_PATH = REPO_ROOT / (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221SurplusThreeTriadMembershipFamilyCnf.lean"
)

EXPECTED_REUSED_LEAN_REFERENCES = (
    "SecondCapApexSurplusMembershipFamilyCnf.definition6_379",
    "SecondCapApexSurplusMembershipFamilyCnf.definition6_389",
    "SecondCapApexSurplusMembershipFamilyCnf.definition6_479",
    "SecondCapApexSurplusMembershipFamilyCnf.definition6_489",
    "SecondCapApexSurplusMembershipFamilyCnf.definition6_579",
    "SecondCapApexSurplusMembershipFamilyCnf.definition6_589",
    "SecondCapApexSurplusMembershipFamilyCnf.definition7_389",
    "SecondCapApexSurplusMembershipFamilyCnf.definition7_489",
    "SecondCapApexSurplusMembershipFamilyCnf.definition7_589",
    "SecondCapApexSurplusMembershipFamilyCnf.definition8_367",
    "SecondCapApexSurplusMembershipFamilyCnf.definition8_467",
    "SecondCapApexSurplusMembershipFamilyCnf.definition8_567",
    "SecondCapApexSurplusMembershipFamilyCnf.definition9_367",
    "SecondCapApexSurplusMembershipFamilyCnf.definition9_368",
    "SecondCapApexSurplusMembershipFamilyCnf.definition9_467",
    "SecondCapApexSurplusMembershipFamilyCnf.definition9_468",
    "SecondCapApexSurplusMembershipFamilyCnf.definition9_567",
    "SecondCapApexSurplusMembershipFamilyCnf.definition9_568",
    "SurplusThreeTriadMembershipFamilyCnf.definition6_39",
    "SurplusThreeTriadMembershipFamilyCnf.definition6_49",
    "SurplusThreeTriadMembershipFamilyCnf.definition6_59",
    "SurplusThreeTriadMembershipFamilyCnf.definition7_368",
    "SurplusThreeTriadMembershipFamilyCnf.definition7_468",
    "SurplusThreeTriadMembershipFamilyCnf.definition7_568",
)


def _lean_mk_definitions(path: Path) -> dict[str, tuple[int, int, tuple[int, ...]]]:
    declarations = re.finditer(
        r"^def (?P<name>[A-Za-z0-9_]+) := mkDefinition "
        r"(?P<var>[0-9]+) (?P<center>[0-9]+) \{(?P<support>[0-9, ]*)\}$",
        path.read_text(encoding="utf-8"),
        re.MULTILINE,
    )
    return {
        declaration.group("name"): (
            int(declaration.group("var")),
            int(declaration.group("center")),
            tuple(
                int(label)
                for label in declaration.group("support").split(", ")
                if label
            ),
        )
        for declaration in declarations
    }


def _apex_shared_pair_parent():
    instance, _compiled, layout, bank = materialize_positive_membership_static_cell(
        REPO_ROOT, 1
    )
    for installer in (
        install_surplus_apex_pair_membership_family_bank,
        install_adjacent_apex_cross_block_membership_family_bank,
        install_second_cap_apex_surplus_membership_family_bank,
        install_surplus_three_triad_membership_family_bank,
        install_zero_center_cross_block_membership_family_bank,
        install_apex_zero_cross_block_membership_family_bank,
        install_apex_pair_cross_block_membership_family_bank,
        install_apex_shared_pair_cross_block_membership_family_bank,
    ):
        bank = installer(REPO_ROOT, instance, layout, bank, cell_index=1)
    return instance, layout, bank


class Exact12ApexInternalSharedPairCommonFiveMembershipFamilyBankTests(
    unittest.TestCase
):
    def test_roles_are_full_tuple_sorted_and_exactly_36(self) -> None:
        roles = family_roles()
        self.assertEqual(len(roles), 36)
        self.assertEqual(roles, tuple(sorted(roles)))
        self.assertEqual(roles[0], (6, 7, 3, 8, 9))
        self.assertEqual(roles[-1], (9, 8, 5, 7, 6))
        for a, x, b, c, y in roles:
            self.assertIn(a, (6, 7, 8, 9))
            self.assertIn(x, (6, 7, 8, 9))
            self.assertIn(c, (6, 7, 8, 9))
            self.assertIn(y, (6, 7, 8, 9))
            self.assertIn(b, (3, 4, 5))
            self.assertEqual(len({a, x, c, y}), 4)
            self.assertTrue((a < x and c < y) or (x < a and y < c))

        patterns = family_patterns()
        self.assertEqual(len(patterns), 36)
        for role, pattern in zip(roles, patterns, strict=True):
            a, x, b, c, y = role
            self.assertEqual(
                pattern,
                (
                    {"center": x, "support": [a, b]},
                    {"center": y, "support": [a, b]},
                    {"center": c, "support": [b, x, y]},
                ),
            )

    def test_compiler_reuses_parent_and_freezes_identity(self) -> None:
        instance, _layout, _bank = _apex_shared_pair_parent()
        compiled = _compile_payload(instance)
        self.assertEqual(FAMILY_ID, "apex-internal-shared-pair-common-five-a6789-b345-c6789.v1")
        self.assertEqual(compiled["final_n_variables"], EXPECTED_FINAL_VARIABLES)
        self.assertEqual(compiled["final_n_clauses"], EXPECTED_FINAL_CLAUSES)
        self.assertEqual(compiled["delta_sha256"], EXPECTED_DELTA_SHA256)
        self.assertEqual(compiled["final_dimacs_sha256"], EXPECTED_FINAL_DIMACS_SHA256)
        self.assertEqual(compiled["compiled_sha256"], EXPECTED_COMPILED_SHA256)
        self.assertEqual(len(compiled["pattern_definitions"]), 36)
        self.assertEqual(
            [definition["pattern_variable"] for definition in compiled["pattern_definitions"]],
            list(range(45_127, 45_163)),
        )
        self.assertEqual(
            [
                (definition["center"], tuple(definition["required"]))
                for definition in compiled["pattern_definitions"]
            ],
            [
                (6, (3, 7)), (6, (3, 8)), (6, (4, 7)), (6, (4, 8)),
                (6, (5, 7)), (6, (5, 8)), (7, (3, 6)), (7, (3, 8)),
                (7, (3, 9)), (7, (4, 6)), (7, (4, 8)), (7, (4, 9)),
                (7, (5, 6)), (7, (5, 8)), (7, (5, 9)), (8, (3, 6)),
                (8, (3, 7)), (8, (3, 7, 9)), (8, (3, 9)), (8, (4, 6)),
                (8, (4, 7)), (8, (4, 7, 9)), (8, (4, 9)), (8, (5, 6)),
                (8, (5, 7)), (8, (5, 7, 9)), (8, (5, 9)), (9, (3, 6)),
                (9, (3, 7)), (9, (3, 8)), (9, (4, 6)), (9, (4, 7)),
                (9, (4, 8)), (9, (5, 6)), (9, (5, 7)), (9, (5, 8)),
            ],
        )
        self.assertEqual(EXPECTED_REUSED_REQUIREMENT_COUNT, 24)

    def test_lean_definitions_match_python_fresh_and_reused_bindings(self) -> None:
        instance, _layout, _bank = _apex_shared_pair_parent()
        parent_pattern_variables = dict(instance.pattern_variables)
        compiled = _compile_payload(instance)

        target_source = LEAN_CNF_PATH.read_text(encoding="utf-8")
        target_definitions = _lean_mk_definitions(LEAN_CNF_PATH)
        lean_fresh = tuple(
            target_definitions[f"d{variable}"]
            for variable in range(45_127, 45_163)
        )
        python_fresh = tuple(
            (
                definition["pattern_variable"],
                definition["center"],
                tuple(definition["required"]),
            )
            for definition in compiled["pattern_definitions"]
        )
        self.assertEqual(lean_fresh, python_fresh)
        self.assertEqual(
            {name for name in target_definitions if name.startswith("d")},
            {f"d{variable}" for variable in range(45_127, 45_163)},
        )

        reused_block = re.search(
            r"def reusedDefinitions[^:]*: List PositiveMembershipDefinition :=\n"
            r"(?P<body>.*?)\n\n/-- Every definition referenced",
            target_source,
            re.DOTALL,
        )
        self.assertIsNotNone(reused_block)
        assert reused_block is not None
        lean_references = tuple(
            ".".join(reference)
            for reference in re.findall(
                r"(SecondCapApexSurplusMembershipFamilyCnf|"
                r"SurplusThreeTriadMembershipFamilyCnf)\."
                r"(definition[0-9_]+)",
                reused_block.group("body"),
            )
        )
        self.assertEqual(lean_references, EXPECTED_REUSED_LEAN_REFERENCES)

        parent_sources = {
            "SecondCapApexSurplusMembershipFamilyCnf": _lean_mk_definitions(
                SECOND_CAP_PARENT_LEAN_PATH
            ),
            "SurplusThreeTriadMembershipFamilyCnf": _lean_mk_definitions(
                TRIAD_PARENT_LEAN_PATH
            ),
        }
        lean_reused = {
            parent_sources[namespace][name]
            for namespace, name in (
                reference.split(".", maxsplit=1) for reference in lean_references
            )
        }
        requirements = {
            (requirement["center"], tuple(requirement["required"]))
            for pattern in compiled["pattern_keys"]
            for requirement in pattern
        }
        python_reused = {
            (
                parent_pattern_variables[(center, frozenset(required))],
                center,
                required,
            )
            for center, required in requirements
            if (center, frozenset(required)) in parent_pattern_variables
        }
        self.assertEqual(len(python_reused), EXPECTED_REUSED_REQUIREMENT_COUNT)
        self.assertEqual(lean_reused, python_reused)

        self.assertIn("freshDefinitions ++ reusedDefinitions", target_source)
        self.assertIn("(hreused : ∀ definition ∈ reusedDefinitions", target_source)

        family_data_block = re.search(
            r"def familyData : List ApexInternalSharedPairCommonFiveData :=\n"
            r"(?P<body>.*?)\n\ndef familyChoices",
            target_source,
            re.DOTALL,
        )
        self.assertIsNotNone(family_data_block)
        assert family_data_block is not None
        lean_roles = tuple(
            tuple(int(label) for label in role)
            for role in re.findall(
                r"\{a := ([0-9]+), x := ([0-9]+), b := ([0-9]+), "
                r"c := ([0-9]+), y := ([0-9]+)\}",
                family_data_block.group("body"),
            )
        )
        self.assertEqual(lean_roles, family_roles())
        self.assertRegex(
            target_source,
            r"def familyChoices[\s\S]*? :=\n"
            r"  \[\{center := data\.x, support := \{data\.a, data\.b\}\},\n"
            r"    \{center := data\.y, support := \{data\.a, data\.b\}\},\n"
            r"    \{center := data\.c, support := \{data\.b, data\.x, data\.y\}\}\]",
        )
        self.assertRegex(
            target_source,
            r"def entries : List FamilyEntry :=\n"
            r"  familyData\.map fun data =>\n"
            r"    \{ data := data\n"
            r"      definitions := \(familyChoices data\)\.map lookupDefinition \}",
        )
        self.assertIn(
            "entries.map fun entry => "
            "positiveMembershipBlockingClause entry.definitions",
            target_source,
        )

    def test_build_authenticates_both_lean_paths(self) -> None:
        instance, layout, parent_bank = _apex_shared_pair_parent()
        bank = build_apex_internal_shared_pair_common_five_membership_family_bank(
            REPO_ROOT, instance, layout, parent_bank, cell_index=1
        )
        self.assertEqual(len(bank["bank_sha256"]), 64)
        self.assertEqual(
            [record["path"] for record in bank["source_manifest"]],
            sorted(
                [
                    "census/card_head/exact12_positive_membership_cnf.py",
                    "census/card_head/exact12_positive_membership_source_order_bank.py",
                    (
                        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
                        "ExactTwelveRigid221ApexInternalSharedPairCommonFiveCertificate.lean"
                    ),
                    (
                        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
                        "ExactTwelveRigid221ApexInternalSharedPairCommonFiveMembershipFamilyCnf.lean"
                    ),
                ]
            ),
        )


if __name__ == "__main__":
    unittest.main()
