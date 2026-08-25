"""W3-0 adversarial tests for the factorization gate of scripts/gen_obligation_registry.py.

Every case here is SYNTHETIC.  The fixtures are injected through the
``FactorizationBackend`` seam (``MappingBackend``), never through the live
blueprint database, and no fixture id or declaration name is a real P97
obligation: the Lean declarations a real W3-TD factorization would name do not
exist yet, so no live factorization entry may be written for one.

Run with::

    uv run pytest -q scripts/test_gen_obligation_registry_factorization.py
"""

from __future__ import annotations

import importlib.util
import json
import sys
from pathlib import Path

import pytest

SCRIPT = Path(__file__).resolve().parent / "gen_obligation_registry.py"
_spec = importlib.util.spec_from_file_location("gen_obligation_registry", SCRIPT)
assert _spec is not None and _spec.loader is not None
gor = importlib.util.module_from_spec(_spec)
sys.modules[_spec.name] = gor
_spec.loader.exec_module(gor)


# ---------------------------------------------------------------------------
# synthetic fixture vocabulary
# ---------------------------------------------------------------------------

OID = "FIXTURE-TD-ALPHA"
OTHER_OID = "FIXTURE-TD-BETA"

WRAPPER = "Fixture.Cluster.legacy_wrapper_thm"
COORDINATOR = "Fixture.Cluster.coordinator_thm"
PRODUCER = "Fixture.Cluster.producer_thm"
ELIMINATOR = "Fixture.Cluster.eliminator_thm"
LEAF = "Fixture.Cluster.open_leaf_thm"
HOP = "Fixture.Cluster.hop_thm"
STRANGER = "Fixture.Cluster.stranger_thm"

ROLE_SYMBOLS = (WRAPPER, COORDINATOR, PRODUCER, ELIMINATOR, LEAF)

BUILD = "b" * 64
OLD_BUILD = "a" * 64
HEAD_SHORT = "0f1e2d3c"

SIGNATURES = {
    WRAPPER: "theorem legacy_wrapper_thm\n    (h : Fixture.Hyp) :\n    False",
    COORDINATOR: "theorem coordinator_thm\n    (h : Fixture.Hyp) :\n    False",
    PRODUCER: "theorem producer_thm\n    (h : Fixture.Hyp) :\n    Fixture.Packet",
    ELIMINATOR: "theorem eliminator_thm\n    (p : Fixture.Packet) :\n    False",
    LEAF: "theorem open_leaf_thm\n    (p : Fixture.Packet) :\n    False",
    HOP: "theorem hop_thm\n    (h : Fixture.Hyp) :\n    Fixture.Hyp",
    STRANGER: "theorem stranger_thm :\n    True",
}

CLEAN_CLOSURE = [("core", "propext"), ("core", "Quot.sound")]
CONSUMER_CLOSURE = [("core", "propext"), ("custom", "sorryAx")]

TD_CLUSTER = gor.CLUSTER_LABELS[gor.CLUSTER_TD]


def record(symbol: str, *, has_sorry: bool = False, private: bool = False,
           signature: str | None = None) -> dict:
    """One synthetic ``proof-blueprint search --json`` index record."""
    return {
        "symbol": symbol,
        "kind": "theorem",
        "file": "Fixture/TwoDeletionCollisionFixture.lean",
        "line": 1,
        "has_sorry": has_sorry,
        "private": private,
        "signature": SIGNATURES[symbol] if signature is None else signature,
        "doc": "",
        "attributes": [],
    }


def base_index() -> dict:
    index = {symbol: [record(symbol)] for symbol in ROLE_SYMBOLS}
    index[LEAF] = [record(LEAF, has_sorry=True)]
    index[HOP] = [record(HOP)]
    index[STRANGER] = [record(STRANGER)]
    return index


def base_calls() -> dict:
    """Caller -> callees.  ``MappingBackend.callers`` inverts this."""
    return {
        WRAPPER: [COORDINATOR],
        COORDINATOR: [PRODUCER, ELIMINATOR],
        ELIMINATOR: [LEAF],
    }


def base_closures() -> dict:
    return {
        PRODUCER: list(CLEAN_CLOSURE),
        COORDINATOR: list(CONSUMER_CLOSURE),
        ELIMINATOR: list(CONSUMER_CLOSURE),
    }


def base_mined() -> dict:
    mined = {symbol: BUILD for symbol in ROLE_SYMBOLS}
    mined[HOP] = BUILD
    mined[STRANGER] = BUILD
    return mined


def backend(index=None, calls=None, closures=None, mined=None, build=BUILD):
    return gor.MappingBackend(
        index=base_index() if index is None else index,
        calls=base_calls() if calls is None else calls,
        axiom_closures=base_closures() if closures is None else closures,
        mined=base_mined() if mined is None else mined,
        build=build,
    )


def digest(symbol: str, index: dict | None = None) -> str:
    source = base_index() if index is None else index
    return gor.statement_digest(source[symbol][0]["signature"])


def block(**overrides) -> dict:
    payload = {
        "schema": gor.FACTORIZATION_SCHEMA_V2,
        "obligation_id": OID,
        "roles": {
            "legacy_wrapper": WRAPPER,
            "coordinator": COORDINATOR,
            "producer": PRODUCER,
            "eliminator": ELIMINATOR,
            "open_leaf": LEAF,
        },
        "pinned": {
            "legacy_wrapper_statement_sha256": digest(WRAPPER),
            "open_leaf_statement_sha256": digest(LEAF),
        },
        "note": "synthetic W3-0 test fixture; no live obligation.",
    }
    payload.update(overrides)
    return payload


def meta_for(payload: dict | None, obligation_id: str = OID) -> dict:
    entry = {"cluster": TD_CLUSTER, "prose_status": "OPEN_MATHEMATICAL"}
    if payload is not None:
        entry["factorization"] = payload
    return {obligation_id: entry}


def registry_for(lean_decl: str = LEAF, obligation_id: str = OID,
                 reachable: bool = True, extra: list | None = None) -> dict:
    obligations = [
        {
            "id": obligation_id,
            "lean_decl": lean_decl,
            "reachable": reachable,
            "source_file": "Fixture/TwoDeletionCollisionFixture.lean",
            "line": 1,
            "cluster": TD_CLUSTER,
            "kind": "theorem",
            "legacy_labels": [],
            "meta_status": "OPEN_MATHEMATICAL",
        }
    ]
    obligations.extend(extra or [])
    return {"schema": gor.SCHEMA, "obligations": obligations}


def run(payload, backend_obj=None, registry=None, required=()):
    return gor.check_factorizations(
        registry_for() if registry is None else registry,
        meta_for(payload),
        backend() if backend_obj is None else backend_obj,
        required,
    )


def messages(result) -> list[str]:
    return result["summary"]["violations"]


def joined(result) -> str:
    return "\n".join(messages(result))


# ---------------------------------------------------------------------------
# normalization and parsing primitives
# ---------------------------------------------------------------------------


def test_statement_digest_collapses_whitespace_runs_and_strips():
    assert gor.normalize_statement("  theorem   f\n\t:  False \n") == "theorem f : False"
    reindented = SIGNATURES[LEAF].replace("\n    ", "\n        ")
    assert digest(LEAF) == gor.statement_digest(reindented)
    changed = SIGNATURES[LEAF].replace("False", "True")
    assert digest(LEAF) != gor.statement_digest(changed)


def test_parse_axioms_output_reads_tag_and_name():
    text = (
        "axioms reported by `#print axioms Fixture.f` (3):\n"
        "      core  propext\n"
        "  \U0001FAB6 CUSTOM  sorryAx\n"
        "      core  Quot.sound\n"
        "\n"
        "\N{CROSS MARK} 1 unapproved custom axiom(s) on spine:\n"
        "  - sorryAx  (a sorry on the spine)\n"
    )
    assert gor.parse_axioms_output(text) == [
        ("core", "propext"),
        ("custom", "sorryAx"),
        ("core", "Quot.sound"),
    ]


def test_parse_axioms_output_rejects_a_count_mismatch():
    text = "axioms reported by `#print axioms Fixture.f` (2):\n      core  propext\n"
    with pytest.raises(gor.RegistryError):
        gor.parse_axioms_output(text)


# ---------------------------------------------------------------------------
# legacy loading and the byte-stable no-block path
# ---------------------------------------------------------------------------


def test_meta_without_any_factorization_block_still_loads(tmp_path):
    (tmp_path / gor.META_NAME).write_text(
        json.dumps({OID: {"cluster": TD_CLUSTER, "prose_status": "OPEN_MATHEMATICAL"}}),
        encoding="utf-8",
    )
    meta = gor.load_meta(tmp_path)
    assert meta[OID]["prose_status"] == "OPEN_MATHEMATICAL"
    assert gor.has_any_factorization(meta) is False
    assert gor.make_backend(meta) is None
    result = gor.check_factorizations(registry_for(), meta, None)
    assert result["summary"]["checked"] == 0
    assert result["summary"]["verified"] == 0
    assert messages(result) == []


def test_v1_block_loads_with_a_warning_and_is_never_verified(tmp_path):
    payload = {
        "schema": gor.FACTORIZATION_SCHEMA_V1,
        "obligation_id": OID,
        "roles": block()["roles"],
        "note": "pre-pin legacy record",
    }
    (tmp_path / gor.META_NAME).write_text(
        json.dumps(meta_for(payload)), encoding="utf-8"
    )
    meta = gor.load_meta(tmp_path)
    assert meta[OID]["factorization"]["schema"] == gor.FACTORIZATION_SCHEMA_V1

    result = gor.check_factorizations(registry_for(), meta, backend())
    summary = result["summary"]
    assert summary["v1_warnings"] == 1
    assert summary["checked"] == 1
    assert summary["verified"] == 0
    assert result["verified_ids"] == []
    assert messages(result) == []
    assert summary["schema_versions"] == {gor.FACTORIZATION_SCHEMA_V1: 1}


# ---------------------------------------------------------------------------
# the clean case
# ---------------------------------------------------------------------------


def test_producer_clean_factorization_verifies():
    result = run(block())
    assert messages(result) == []
    assert result["verified_ids"] == [OID]
    assert result["summary"]["verified"] == 1
    assert result["summary"]["missing"] == 0
    assert result["summary"]["schema_versions"] == {gor.FACTORIZATION_SCHEMA_V2: 1}


# ---------------------------------------------------------------------------
# chain, cycle and role adversaries
# ---------------------------------------------------------------------------


def test_edge_reversal_open_leaf_calls_eliminator_fails():
    calls = base_calls()
    del calls[ELIMINATOR]
    calls[LEAF] = [ELIMINATOR]
    result = run(block(), backend(calls=calls))
    assert result["verified_ids"] == []
    assert messages(result) == [
        OID
        + ": eliminator ("
        + ELIMINATOR
        + ") does not directly call open_leaf ("
        + LEAF
        + ")"
    ]


def test_cycle_among_roles_fails():
    calls = base_calls()
    calls[PRODUCER] = [WRAPPER]
    result = run(block(), backend(calls=calls))
    assert result["verified_ids"] == []
    assert len(messages(result)) == 1
    assert "role cycle" in joined(result)
    for role in ("legacy_wrapper", "coordinator", "producer"):
        assert role in joined(result)


def test_missing_role_fails():
    roles = dict(block()["roles"])
    del roles["producer"]
    result = run(block(roles=roles))
    assert result["verified_ids"] == []
    assert "role producer is missing" in joined(result)


def test_duplicate_roles_fail():
    roles = dict(block()["roles"])
    roles["eliminator"] = roles["coordinator"]
    result = run(block(roles=roles))
    assert result["verified_ids"] == []
    assert "must be distinct" in joined(result)
    assert "coordinator" in joined(result) and "eliminator" in joined(result)


def test_private_role_fails():
    index = base_index()
    index[PRODUCER] = [record(PRODUCER, private=True)]
    result = run(block(), backend(index=index))
    assert result["verified_ids"] == []
    assert "is a private declaration" in joined(result)
    assert "every role must be public" in joined(result)


def test_ambiguous_role_with_two_index_matches_fails():
    index = base_index()
    index[COORDINATOR] = [record(COORDINATOR), record(COORDINATOR)]
    result = run(block(), backend(index=index))
    assert result["verified_ids"] == []
    assert "resolves to 2 index records" in joined(result)


def test_unknown_key_in_block_is_a_metadata_violation():
    payload = block()
    payload["shortcut"] = True
    result = run(payload)
    assert result["verified_ids"] == []
    assert messages(result) == [
        OID
        + ": unknown key 'shortcut' in the "
        + gor.FACTORIZATION_SCHEMA_V2
        + " factorization block"
    ]


# ---------------------------------------------------------------------------
# freshness
# ---------------------------------------------------------------------------


def test_stale_role_fails():
    mined = base_mined()
    mined[COORDINATOR] = OLD_BUILD
    result = run(block(), backend(mined=mined))
    assert result["verified_ids"] == []
    assert len(messages(result)) == 1
    assert "coordinator (" + COORDINATOR + ") is stale" in joined(result)
    assert OLD_BUILD[:12] in joined(result)
    assert BUILD[:12] in joined(result)


def test_never_mined_role_fails():
    mined = base_mined()
    del mined[PRODUCER]
    result = run(block(), backend(mined=mined))
    assert result["verified_ids"] == []
    assert len(messages(result)) == 1
    assert "producer (" + PRODUCER + ") is never mined" in joined(result)


def test_unknown_current_build_is_cannot_verify_not_fresh():
    result = run(block(), backend(build=None))
    assert result["verified_ids"] == []
    assert "cannot verify mined freshness" in joined(result)


# ---------------------------------------------------------------------------
# trust
# ---------------------------------------------------------------------------


def test_producer_with_a_direct_sorry_ax_fails():
    index = base_index()
    index[PRODUCER] = [record(PRODUCER, has_sorry=True)]
    closures = base_closures()
    closures[PRODUCER] = [("core", "propext"), ("custom", "sorryAx")]
    result = run(block(), backend(index=index, closures=closures))
    assert result["verified_ids"] == []
    assert "producer (" + PRODUCER + ") axiom closure contains sorryAx" in joined(result)
    assert "must be kernel clean" in joined(result)


def test_producer_with_sorry_ax_only_transitively_fails():
    """The producer body is clean; a helper it calls carries the sorry.

    ``has_sorry`` on the producer's own index record is False, so a source-level
    scan would pass it.  The transitive kernel closure is what catches it.
    """
    index = base_index()
    assert index[PRODUCER][0]["has_sorry"] is False
    calls = base_calls()
    calls[PRODUCER] = [STRANGER]
    closures = base_closures()
    closures[PRODUCER] = [("core", "propext"), ("custom", "sorryAx")]
    closures[STRANGER] = [("core", "propext"), ("custom", "sorryAx")]
    result = run(block(), backend(index=index, calls=calls, closures=closures))
    assert result["verified_ids"] == []
    assert "producer (" + PRODUCER + ") axiom closure contains sorryAx" in joined(result)


def test_consumer_roles_may_carry_sorry_ax_but_not_native_trust():
    clean = run(block())
    assert clean["verified_ids"] == [OID]

    closures = base_closures()
    closures[ELIMINATOR] = [("core", "propext"), ("custom", "sorryAx"),
                            ("approved", "Lean.trustCompiler")]
    result = run(block(), backend(closures=closures))
    assert result["verified_ids"] == []
    assert "Lean.trustCompiler" in joined(result)
    assert "beyond core axioms and sorryAx" in joined(result)


def test_producer_with_a_non_core_axiom_fails():
    closures = base_closures()
    closures[PRODUCER] = [("core", "propext"), ("custom", "Fixture.myAxiom")]
    result = run(block(), backend(closures=closures))
    assert result["verified_ids"] == []
    assert "Fixture.myAxiom" in joined(result)
    assert "not a core axiom" in joined(result)


# ---------------------------------------------------------------------------
# pinned statements and leaf identity
# ---------------------------------------------------------------------------


def test_open_leaf_statement_digest_mismatch_fails():
    index = base_index()
    index[LEAF] = [
        record(LEAF, has_sorry=True, signature=SIGNATURES[LEAF] + "\n    \N{LOGICAL AND} True")
    ]
    result = run(block(), backend(index=index))
    assert result["verified_ids"] == []
    assert "open leaf statement changed" in joined(result)


def test_legacy_wrapper_statement_digest_mismatch_fails():
    index = base_index()
    index[WRAPPER] = [record(WRAPPER, signature=SIGNATURES[WRAPPER] + "\n    (extra : True)")]
    result = run(block(), backend(index=index))
    assert result["verified_ids"] == []
    assert "legacy wrapper statement changed" in joined(result)


def test_open_leaf_must_be_the_registry_lean_decl_and_carry_a_sorry():
    other = run(block(), registry=registry_for(lean_decl=WRAPPER))
    assert "is not the registry lean_decl" in joined(other)

    index = base_index()
    index[LEAF] = [record(LEAF, has_sorry=False)]
    closed = run(block(), backend(index=index))
    assert "has no sorry" in joined(closed)


# ---------------------------------------------------------------------------
# transitive paths
# ---------------------------------------------------------------------------


def test_transitive_path_is_verified_hop_by_hop():
    calls = {
        WRAPPER: [COORDINATOR],
        COORDINATOR: [PRODUCER, HOP],
        HOP: [ELIMINATOR],
        ELIMINATOR: [LEAF],
    }
    payload = block(
        transitive=[{"from": "coordinator", "to": "eliminator", "via": [HOP]}]
    )
    result = run(payload, backend(calls=calls))
    assert messages(result) == []
    assert result["verified_ids"] == [OID]

    # The same call graph WITHOUT the declared path must fail: an unlisted pair
    # is required to be direct.
    bare = run(block(), backend(calls=calls))
    assert bare["verified_ids"] == []
    assert (
        OID
        + ": coordinator ("
        + COORDINATOR
        + ") does not directly call eliminator ("
        + ELIMINATOR
        + ")"
    ) in messages(bare)


def test_transitive_path_with_a_broken_hop_fails():
    calls = {
        WRAPPER: [COORDINATOR],
        COORDINATOR: [PRODUCER, HOP],
        ELIMINATOR: [LEAF],
    }
    payload = block(
        transitive=[{"from": "coordinator", "to": "eliminator", "via": [HOP]}]
    )
    result = run(payload, backend(calls=calls))
    assert result["verified_ids"] == []
    assert messages(result) == [
        OID
        + ": via[0] ("
        + HOP
        + ") does not directly call eliminator ("
        + ELIMINATOR
        + ")"
    ]


def test_transitive_hop_freshness_is_checked_too():
    calls = {
        WRAPPER: [COORDINATOR],
        COORDINATOR: [PRODUCER, HOP],
        HOP: [ELIMINATOR],
        ELIMINATOR: [LEAF],
    }
    mined = base_mined()
    del mined[HOP]
    payload = block(
        transitive=[{"from": "coordinator", "to": "eliminator", "via": [HOP]}]
    )
    result = run(payload, backend(calls=calls, mined=mined))
    assert result["verified_ids"] == []
    assert "via[0] (" + HOP + ") is never mined" in joined(result)


def test_transitive_row_naming_a_non_chain_pair_fails():
    payload = block(
        transitive=[{"from": "producer", "to": "open_leaf", "via": [HOP]}]
    )
    result = run(payload)
    assert result["verified_ids"] == []
    assert "is not a factorization chain edge" in joined(result)


# ---------------------------------------------------------------------------
# per-cluster requirement
# ---------------------------------------------------------------------------


def test_require_factorized_with_a_missing_entry_fails_and_names_the_id():
    registry = registry_for(
        extra=[
            {
                "id": OTHER_OID,
                "lean_decl": STRANGER,
                "reachable": True,
                "source_file": "Fixture/TwoDeletionCollisionFixture.lean",
                "line": 9,
                "cluster": TD_CLUSTER,
                "kind": "theorem",
                "legacy_labels": [],
                "meta_status": "OPEN_MATHEMATICAL",
            }
        ]
    )
    # Without the flag a missing block is only counted.
    counted = gor.check_factorizations(registry, meta_for(block()), backend())
    assert messages(counted) == []
    assert counted["summary"]["missing"] == 1
    assert counted["missing_ids"] == [OTHER_OID]

    required = gor.check_factorizations(
        registry, meta_for(block()), backend(), (gor.CLUSTER_TD,)
    )
    assert required["summary"]["required_clusters"] == [gor.CLUSTER_TD]
    assert len(messages(required)) == 1
    assert OTHER_OID in joined(required)
    assert "--require-factorized TD" in joined(required)
    assert OID not in joined(required)


def test_require_factorized_rejects_an_unverified_block():
    calls = base_calls()
    del calls[ELIMINATOR]
    required = gor.check_factorizations(
        registry_for(), meta_for(block()), backend(calls=calls), (gor.CLUSTER_TD,)
    )
    text = joined(required)
    assert "does not directly call" in text
    assert "has no VERIFIED" in text
    assert OID in text


# ---------------------------------------------------------------------------
# stable identity: rename / alias migration
# ---------------------------------------------------------------------------

RENAMED_LEAF = "Fixture.Cluster.open_leaf_thm_intrinsic"
RENAMED_SIGNATURE = "theorem open_leaf_thm_intrinsic\n    (p : Fixture.Packet) :\n    False"
SIGNATURES[RENAMED_LEAF] = RENAMED_SIGNATURE


def rename_index(wrapper: dict | None = None) -> dict:
    """After the refactor the OLD leaf name is the public compatibility wrapper."""
    index = base_index()
    index[LEAF] = [record(LEAF, has_sorry=False)] if wrapper is None else wrapper
    index[RENAMED_LEAF] = [record(RENAMED_LEAF, has_sorry=True)]
    return index


def rename_calls() -> dict:
    return {
        LEAF: [COORDINATOR],
        COORDINATOR: [PRODUCER, ELIMINATOR],
        ELIMINATOR: [RENAMED_LEAF],
    }


def rename_mined() -> dict:
    mined = base_mined()
    mined[RENAMED_LEAF] = BUILD
    return mined


def rename_block() -> dict:
    return block(
        roles={
            "legacy_wrapper": LEAF,
            "coordinator": COORDINATOR,
            "producer": PRODUCER,
            "eliminator": ELIMINATOR,
            "open_leaf": RENAMED_LEAF,
        },
        pinned={
            "legacy_wrapper_statement_sha256": gor.statement_digest(SIGNATURES[LEAF]),
            "open_leaf_statement_sha256": gor.statement_digest(RENAMED_SIGNATURE),
        },
    )


def rename_backend(index=None):
    return backend(
        index=rename_index() if index is None else index,
        calls=rename_calls(),
        mined=rename_mined(),
    )


def ledger_with(assigned: dict, aliases: dict | None = None, retired: dict | None = None):
    return {
        "schema": gor.ID_SCHEMA,
        "assigned": dict(assigned),
        "retired": dict(retired or {}),
        "aliases": dict(aliases or {}),
    }


RENAMED_RECORDS = [
    {
        "symbol": RENAMED_LEAF,
        "reachable": True,
        "source_file": "Fixture/TwoDeletionCollisionFixture.lean",
        "line": 40,
        "kind": "theorem",
    }
]


def test_stable_id_rename_is_accepted_and_records_the_alias():
    payload = rename_block()
    ledger = ledger_with({LEAF: OID})
    migrations, violations = gor.plan_alias_migrations(
        ledger, meta_for(payload), rename_backend()
    )
    assert violations == []
    assert migrations == [{"id": OID, "old": LEAF, "new": RENAMED_LEAF}]

    updated = gor.apply_alias_migrations(ledger, migrations, HEAD_SHORT)
    # The id FOLLOWS the leaf: it is neither reissued nor retired.
    assert updated["assigned"] == {RENAMED_LEAF: OID}
    assert updated["retired"] == {}
    assert updated["aliases"] == {
        OID: {
            "aliases": [LEAF],
            "renamed_from": LEAF,
            "renamed_at_head": HEAD_SHORT,
        }
    }

    # The ledger writer allocates nothing new for the renamed symbol.
    current, written = gor.assign_ids(RENAMED_RECORDS, updated, "deadbeef")
    assert current == {RENAMED_LEAF: OID}
    assert written["retired"] == {}
    assert written["aliases"][OID]["renamed_from"] == LEAF

    # And the renamed leaf verifies against the registry entry it now carries.
    result = gor.check_factorizations(
        registry_for(lean_decl=RENAMED_LEAF), meta_for(payload), rename_backend()
    )
    assert messages(result) == []
    assert result["verified_ids"] == [OID]


def test_rename_that_would_allocate_a_new_id_is_rejected():
    # The block renames the leaf but does NOT keep the old public name as the
    # legacy wrapper, so the id could not follow it.
    payload = rename_block()
    payload["roles"] = dict(payload["roles"])
    payload["roles"]["legacy_wrapper"] = STRANGER
    ledger = ledger_with({LEAF: OID})

    migrations, violations = gor.plan_alias_migrations(
        ledger, meta_for(payload), rename_backend()
    )
    assert migrations == []
    assert len(violations) == 1
    assert "would allocate a new id" in violations[0]
    assert OID in violations[0] and LEAF in violations[0]

    # The ledger is untouched, so the rename shows up as ordinary drift instead.
    unchanged = gor.apply_alias_migrations(ledger, migrations, HEAD_SHORT)
    assert unchanged["assigned"] == {LEAF: OID}
    assert unchanged["aliases"] == {}
    current, written = gor.assign_ids(RENAMED_RECORDS, unchanged, "deadbeef")
    assert current[RENAMED_LEAF] != OID
    assert written["retired"][LEAF]["id"] == OID


def test_rename_whose_alias_is_claimed_by_another_id_is_rejected():
    payload = rename_block()

    claimed_alias = ledger_with(
        {LEAF: OID},
        aliases={
            OTHER_OID: {
                "aliases": [LEAF],
                "renamed_from": LEAF,
                "renamed_at_head": HEAD_SHORT,
            }
        },
    )
    migrations, violations = gor.plan_alias_migrations(
        claimed_alias, meta_for(payload), rename_backend()
    )
    assert migrations == []
    assert len(violations) == 1
    assert "id reuse" in violations[0]
    assert OTHER_OID in violations[0]

    # The same rule the other way round: the target symbol already holds an id.
    claimed_target = ledger_with({LEAF: OID, RENAMED_LEAF: OTHER_OID})
    migrations, violations = gor.plan_alias_migrations(
        claimed_target, meta_for(payload), rename_backend()
    )
    assert migrations == []
    assert len(violations) == 1
    assert "id reuse" in violations[0]
    assert OTHER_OID in violations[0]


def test_rename_without_a_surviving_public_wrapper_is_rejected():
    payload = rename_block()

    gone = rename_index(wrapper=[])
    migrations, violations = gor.plan_alias_migrations(
        ledger_with({LEAF: OID}), meta_for(payload), rename_backend(index=gone)
    )
    assert migrations == []
    assert len(violations) == 1
    assert "the compatibility wrapper must remain" in violations[0]

    hidden = rename_index(wrapper=[record(LEAF, private=True)])
    migrations, violations = gor.plan_alias_migrations(
        ledger_with({LEAF: OID}), meta_for(payload), rename_backend(index=hidden)
    )
    assert migrations == []
    assert len(violations) == 1
    assert "must be public" in violations[0]


def test_lean_decl_change_without_a_factorization_block_is_still_drift():
    ledger = ledger_with({LEAF: OID})
    migrations, violations = gor.plan_alias_migrations(
        ledger, meta_for(None), rename_backend()
    )
    assert migrations == []
    assert violations == []
    # Nothing shields the old symbol: assign_ids retires it and issues a new id.
    current, written = gor.assign_ids(RENAMED_RECORDS, ledger, "deadbeef")
    assert current[RENAMED_LEAF] != OID
    assert written["retired"][LEAF]["id"] == OID


# ---------------------------------------------------------------------------
# live backend plumbing (no live factorization entry is ever written)
# ---------------------------------------------------------------------------


def test_empty_search_result_is_an_empty_answer_not_an_error():
    """`search --json` exits 1 on an EMPTY result set.

    An empty caller set is what a broken chain looks like, so it must reach the
    chain check as an answer rather than as an operational failure.
    """
    live = gor.BlueprintBackend()
    live._run = lambda args: ("", "")
    assert live._records(["search", "--uses", LEAF, "--json"]) == []
    assert live.callers(LEAF) == set()


def test_a_cli_diagnostic_is_reported_as_cannot_verify():
    live = gor.BlueprintBackend()
    live._run = lambda args: (
        "",
        "proof-blueprint: `Fixture.NoSuchSymbol.ever` is not an indexed declaration\n",
    )
    with pytest.raises(gor.RegistryError):
        live._records(["search", "--uses", "Fixture.NoSuchSymbol.ever", "--json"])
