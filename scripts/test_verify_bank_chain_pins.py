"""Tests for the Tier-2d bank chain pin check.

The load-bearing test is ``test_the_drift_recovery_loop_is_not_gated_on_verify``.
It pins, by AST rather than by prose, the property that makes this whole check
necessary: ``refreeze_narrowed_chain.py`` can re-accept a drifted hash and still
print its success banner.  If that script is ever fixed, this test fails and the
tool's premise gets revisited rather than quietly rotting.
"""

from __future__ import annotations

import ast
import sys
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).resolve().parent))

import verify_bank_chain_pins as mod

REPO = Path(__file__).resolve().parents[1]


@pytest.fixture(scope="module")
def order():
    return mod.chain_modules(REPO)


@pytest.fixture(scope="module")
def expectation():
    return mod.expected_own_shas(REPO)


# --------------------------------------------------------------------------
# the premise of the whole check
# --------------------------------------------------------------------------


def test_the_drift_recovery_loop_is_not_gated_on_verify():
    """`--verify` does not stop the script re-accepting a drifted own sha.

    ``EXPECTED_BANK_SHA256`` is assigned in two places.  One sits inside
    ``if not VERIFY_ONLY:`` and is the intended override.  The other is the
    recovery loop, and it is NOT inside that guard, so it runs under
    ``--verify`` too.  Because the recovery path prints nothing, the banner and
    the exit code look identical either way.
    """
    tree = ast.parse((REPO / mod.REFREEZE).read_text(encoding="utf-8"))

    guarded: set[int] = set()
    for node in ast.walk(tree):
        if not isinstance(node, ast.If):
            continue
        test = node.test
        if not (
            isinstance(test, ast.UnaryOp)
            and isinstance(test.op, ast.Not)
            and getattr(test.operand, "id", None) == "VERIFY_ONLY"
        ):
            continue
        for inner in ast.walk(node):
            guarded.add(id(inner))

    assignments = [
        node
        for node in ast.walk(tree)
        if isinstance(node, ast.Assign)
        and any(
            isinstance(target, ast.Attribute) and target.attr == mod.OWN_PIN
            for target in node.targets
        )
    ]
    assert assignments, "the pin override disappeared; revisit this tool"
    ungated = [node for node in assignments if id(node) not in guarded]
    assert ungated, (
        "every EXPECTED_BANK_SHA256 assignment is now behind `if not VERIFY_ONLY`; "
        "the refreeze script may have been fixed -- recheck this tool's premise"
    )


def test_the_recovery_path_prints_nothing():
    """No log call on the drift path, so stdout cannot distinguish the two."""
    tree = ast.parse((REPO / mod.REFREEZE).read_text(encoding="utf-8"))
    handlers = [
        node
        for node in ast.walk(tree)
        if isinstance(node, ast.ExceptHandler)
        and any(
            isinstance(inner, ast.Assign)
            and any(
                isinstance(target, ast.Attribute) and target.attr == mod.OWN_PIN
                for target in inner.targets
            )
            for inner in ast.walk(node)
        )
    ]
    assert handlers, "the recovery handler moved; revisit this tool"
    for handler in handlers:
        called = {
            getattr(node.func, "id", None)
            for node in ast.walk(handler)
            if isinstance(node, ast.Call)
        }
        assert "print" not in called
        assert "log" not in called


def test_the_refreeze_script_writes_nothing():
    """Read-only in both modes, so running --verify cannot damage the tree."""
    source = (REPO / mod.REFREEZE).read_text(encoding="utf-8")
    tree = ast.parse(source)
    called = {
        getattr(node.func, "id", None)
        for node in ast.walk(tree)
        if isinstance(node, ast.Call)
    }
    attributes = {
        node.func.attr
        for node in ast.walk(tree)
        if isinstance(node, ast.Call) and isinstance(node.func, ast.Attribute)
    }
    assert "open" not in called
    assert not attributes & {"write_text", "write_bytes", "mkdir", "run", "system"}
    assert "subprocess" not in {
        alias.name
        for node in ast.walk(tree)
        if isinstance(node, ast.Import)
        for alias in node.names
    }


# --------------------------------------------------------------------------
# the expected-sha map
# --------------------------------------------------------------------------


def test_the_chain_is_read_from_source_and_every_module_exists(order):
    assert len(order) == 13
    for name in order:
        assert (REPO / mod.CARD_HEAD / f"{name}.py").is_file()


def test_every_chain_module_has_an_expected_sha(expectation):
    """A module with no expectation would pass the diff vacuously."""
    assert expectation["unpinned"] == []
    assert len(expectation["expected"]) == expectation["chain_length"]
    for row in expectation["expected"]:
        assert mod.is_sha256(row["expected_sha256"])


def test_the_five_unpinned_heads_are_covered_by_their_successor(expectation):
    """Positions 1-5 hold no own literal; the successor's parent pin covers them."""
    by_source: dict[str, list[int]] = {}
    for row in expectation["expected"]:
        by_source.setdefault(row["pinned_by"], []).append(row["position"])
    assert by_source[mod.SUCCESSOR_PARENT] == [1, 2, 3, 4, 5]
    assert len(by_source[mod.OWN_LITERAL]) == 8


def test_the_tail_carries_its_own_literal(expectation):
    """Position 13 has no downstream pin, so its own literal is the only guard."""
    tail = expectation["expected"][-1]
    assert tail["module"] == expectation["tail_module"]
    assert tail["pinned_by"] == mod.OWN_LITERAL


def test_parent_links_are_consistent():
    """Every restated parent literal equals its predecessor's own literal.

    Twelve links, three shapes, and none of them a mismatch.  Links out of
    positions 1-5 report PREDECESSOR_UNPINNED because those modules carry no
    own literal at all -- there is nothing to compare, and the successor's
    parent literal is itself the pin for them.  The 12->13 link is an import
    alias, so the two values are the same object rather than two literals that
    happen to agree.
    """
    rows = mod.parent_link_consistency(REPO)
    assert len(rows) == 12
    counts: dict[str, int] = {}
    for row in rows:
        counts[row["verdict"]] = counts.get(row["verdict"], 0) + 1
    assert counts == {"PREDECESSOR_UNPINNED": 5, mod.MATCH: 6, "IMPORT_ALIAS": 1}
    assert mod.MISMATCH not in counts


def test_pin_literals_reports_an_import_alias_rather_than_inventing_a_value(order):
    literals = mod.pin_literals(REPO, order[-1])
    assert isinstance(literals[mod.PARENT_PIN], dict)
    assert "import_from" in literals[mod.PARENT_PIN]


# --------------------------------------------------------------------------
# parsing and diffing
# --------------------------------------------------------------------------


SHA_A = "a" * 64
SHA_B = "b" * 64


def transcript(rows: list[tuple[str, str]], banner: str = mod.VERIFY_BANNER) -> str:
    body = "\n".join(f"{name} {sha}" for name, sha in rows)
    return f"[00:00:00 +   1s] cell1 progress\n\nREFROZEN\n{body}\n[00:00:01 +   2s] {banner}\n"


def test_parse_reads_the_block_not_the_progress_lines():
    parsed = mod.parse_refrozen(transcript([("m1", SHA_A), ("m2", SHA_B)]))
    assert parsed["observed"] == [
        {"module": "m1", "sha256": SHA_A},
        {"module": "m2", "sha256": SHA_B},
    ]
    assert parsed["verify_banner_present"] is True


def test_a_truncated_sha_is_not_read_as_a_row():
    parsed = mod.parse_refrozen(transcript([("m1", "abc")]))
    assert parsed["observed"] == []


def test_the_banner_alone_is_not_treated_as_a_pass():
    """A transcript with the banner and no rows must not report a match."""
    parsed = mod.parse_refrozen(f"[00:00:01 +  2s] {mod.VERIFY_BANNER}\n")
    assert parsed["verify_banner_present"] is True
    expectation = {
        "chain_length": 1,
        "expected": [{"position": 1, "module": "m1", "expected_sha256": SHA_A}],
    }
    result = mod.diff_shas(expectation, parsed)
    assert result["all_pinned_shas_match"] is False
    assert result["verdicts"][mod.ABSENT] == 1


def test_one_altered_sha_is_caught():
    """The mandatory control: the detector must detect."""
    expectation = {
        "chain_length": 2,
        "expected": [
            {"position": 1, "module": "m1", "expected_sha256": SHA_A},
            {"position": 2, "module": "m2", "expected_sha256": SHA_B},
        ],
    }
    clean = mod.diff_shas(
        expectation, mod.parse_refrozen(transcript([("m1", SHA_A), ("m2", SHA_B)]))
    )
    assert clean["all_pinned_shas_match"] is True

    drifted = mod.diff_shas(
        expectation, mod.parse_refrozen(transcript([("m1", SHA_A), ("m2", "c" * 64)]))
    )
    assert drifted["all_pinned_shas_match"] is False
    assert drifted["verdicts"][mod.MISMATCH] == 1


def test_an_unexpected_module_in_the_block_is_reported():
    expectation = {
        "chain_length": 1,
        "expected": [{"position": 1, "module": "m1", "expected_sha256": SHA_A}],
    }
    result = mod.diff_shas(
        expectation, mod.parse_refrozen(transcript([("m1", SHA_A), ("x9", SHA_B)]))
    )
    assert result["unexpected_modules"] == ["x9"]
    assert result["all_pinned_shas_match"] is False


def test_is_sha256_rejects_the_near_misses():
    assert mod.is_sha256(SHA_A)
    assert not mod.is_sha256(SHA_A[:-1])
    assert not mod.is_sha256(SHA_A[:-1] + "g")
    assert not mod.is_sha256(SHA_A.upper())


def test_corrupt_digest_changes_exactly_one_character():
    corrupted = mod.corrupt_digest(SHA_A)
    assert corrupted != SHA_A
    assert len(corrupted) == len(SHA_A)
    assert sum(1 for x, y in zip(corrupted, SHA_A, strict=True) if x != y) == 1
    # Idempotent on a digest already starting with the replacement character.
    assert mod.corrupt_digest("0" + SHA_A[1:]) != "0" + SHA_A[1:]


# --------------------------------------------------------------------------
# Tier 2e -- the clause chain
# --------------------------------------------------------------------------


@pytest.fixture(scope="module")
def clauses():
    return mod.clause_chain(REPO)


def test_the_clause_chain_is_one_contiguous_run(clauses):
    """Each bank's parent count is its predecessor's final count, end to end.

    A break would localize to one link, which is the point of stating the
    counts twice.  There is one head and no fork.
    """
    assert clauses["banks_declaring_a_clause_chain"] == 24
    assert clauses["chain_heads"] == ["exact12_block_spanning_membership_family_bank"]
    assert clauses["contiguous"] is True
    assert mod.MISMATCH not in clauses["verdicts"]
    assert "FORKED" not in clauses["verdicts"]
    assert "UNRESOLVED" not in clauses["verdicts"]


def test_the_chain_spans_the_expected_clause_range(clauses):
    parents = [row["parent_clauses"] for row in clauses["rows"]]
    finals = [row["final_clauses"] for row in clauses["rows"]]
    assert min(parents) == 634_859
    assert max(finals) == 703_533
    # Every bank adds clauses; a non-increasing link would be a broken install.
    for row in clauses["rows"]:
        assert row["final_clauses"] > row["parent_clauses"], row["module"]


def test_a_local_name_alias_is_followed(clauses):
    """`EXPECTED_PARENT_CLAUSES = FAMILY_FINAL_CLAUSES` links three-triad.

    Reading only integer literals leaves this module unresolved and reports two
    chain heads where there is one.  The resolver follows local names as well
    as cross-module imports.
    """
    row = next(
        r
        for r in clauses["rows"]
        if r["module"] == "exact12_three_triad_membership_bank"
    )
    assert row["parent_clauses"] == 635_405
    assert row["parent_by_import_alias"] is True
    assert row["verdict"] == "IMPORT_ALIAS"


def test_bindings_read_all_three_forms(tmp_path):
    path = tmp_path / "m.py"
    path.write_text(
        "from .other import EXPECTED_FINAL_CLAUSES as UPSTREAM\n"
        "EXPECTED_PARENT_CLAUSES = UPSTREAM\n"
        "EXPECTED_FINAL_CLAUSES = 12\n",
        encoding="utf-8",
    )
    bindings = mod.module_bindings(path)
    assert bindings["EXPECTED_FINAL_CLAUSES"] == 12
    assert bindings["EXPECTED_PARENT_CLAUSES"] == {"local": "UPSTREAM"}
    assert bindings["UPSTREAM"] == {
        "import_from": "other",
        "import_name": "EXPECTED_FINAL_CLAUSES",
    }


def test_every_chain_module_also_appears_in_the_clause_chain(order, clauses):
    """The 13 pin-chain modules are a subset of the 24 clause-chain banks."""
    declared = {row["module"] for row in clauses["rows"]}
    assert set(order) <= declared


# --------------------------------------------------------------------------
# Tier 2e -- runtime coverage of the generators
# --------------------------------------------------------------------------


@pytest.fixture(scope="module")
def coverage():
    return mod.runtime_coverage(REPO)


def test_every_declared_bank_is_built_by_the_verify_walk(coverage, clauses):
    """ "Rerunning the generator" is building it under its frozen pins.

    These banks have no CLI at all -- no ``__main__``, no argparse, and no
    write of any kind -- so there is nothing else to rerun.  The walk covers
    all 24 from three places: the cell materializer, the chain head's nine
    installers, and the thirteen the CHAIN loop builds explicitly.
    """
    assert len(coverage["via_cell_materializer"]) == 2
    assert len(coverage["via_chain_head_parent"]) == 9
    assert len(coverage["via_chain_loop"]) == 13
    assert len(coverage["built_at_runtime"]) == 24
    assert coverage["not_built"] == []
    assert coverage["every_declared_bank_built"] is True
    assert set(coverage["declared_banks"]) == {r["module"] for r in clauses["rows"]}


def test_the_chain_head_is_the_first_bank_the_materializer_installs(coverage, clauses):
    assert coverage["via_cell_materializer"][0] == clauses["chain_heads"][0]


def test_the_banks_have_no_command_line_at_all(coverage):
    """If one grew a CLI, "rerun the generator" would mean something else."""
    for name in coverage["declared_banks"]:
        source = (REPO / mod.CARD_HEAD / f"{name}.py").read_text(encoding="utf-8")
        tree = ast.parse(source)
        assert "__main__" not in source
        imported = {
            alias.name
            for node in ast.walk(tree)
            if isinstance(node, ast.Import)
            for alias in node.names
        }
        assert "argparse" not in imported


def test_installer_owners_maps_back_to_the_defining_module():
    owners = mod.installer_owners(REPO)
    assert (
        owners["install_three_triad_membership_bank"]
        == "exact12_three_triad_membership_bank"
    )


def test_called_installers_reads_names_in_source_order(tmp_path):
    path = tmp_path / "m.py"
    path.write_text(
        "def _parent():\n"
        "    for installer in (install_b, install_a):\n"
        "        bank = installer(1)\n"
        "    return bank\n",
        encoding="utf-8",
    )
    assert mod.called_installers(path.read_text(encoding="utf-8"), "_parent") == [
        "install_b",
        "install_a",
    ]
