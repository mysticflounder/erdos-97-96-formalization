"""W3-0/W3-0b adversarial tests for the factorization gate of
scripts/gen_obligation_registry.py.

Every case here is SYNTHETIC.  The fixtures are injected through the
``FactorizationBackend`` seam (``MappingBackend``), never through the live
blueprint database, and no fixture declaration name is a real P97 declaration:
the Lean declarations a real W3-TD factorization would name do not exist yet,
so no live factorization entry may be written for one.

The W3-0b sections cover, in order:

1. the CANONICAL registry - ``build_registry`` materializes a normalized copy
   of every reviewed v2 block onto its own registry entry, and ``check``
   reports every kind of drift between the two;
2. the EXPLICIT trust boundary - ``ALLOWED_AXIOMS`` decides trust and the
   tool's tag is advisory, producer-path hops must be CLEAN and consumer-side
   hops must be CONSUMER-OK with ``sorryAx`` explained by the open leaf.  The
   ``open_leaf`` role is audited on that boundary too (#7462): CONSUMER-OK,
   with ``sorryAx`` always permitted because the leaf consumes itself;
3. transitive EXACTNESS - every ``via`` declaration resolves like a role, is a
   cycle-detection vertex, and may not be a role;
4. the stable-id migration at the COMMAND level - the real ``generate`` /
   ``check`` entry point driven over a COPY of proof-status in ``tmp_path``
   through the documented ``backend_factory`` / ``export_source`` seams.  Those
   fixtures use the real obligation ids OF THE COPY and write every artifact,
   receipts included, inside the copy;
5. declared consumer trust (W3-0e) - the optional ``consumer_trust`` key, which
   widens the boundary on CONSUMER-SIDE hops only, only for names the publish
   target's RECORDED closure already carries, and never for the producer path.
   The RECORDED closure is the authority in BOTH source modes (W3-0e-fix-2,
   auditor #7524): ``<baseline>/axioms.txt`` under ``--baseline`` and every
   ``check``, ``<out>/baseline/axioms.txt`` under ``--fresh``.  No live axioms
   export is ever consulted for trust, and the strict header/entry parser
   (auditor #7521) refuses a closure whose format changed.

Run with::

    uv run pytest -q scripts/test_gen_obligation_registry_factorization.py
"""

from __future__ import annotations

import importlib.util
import json
import shutil
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
# The audit's counterexample to tag-based trust: the tool prints ``core`` next
# to a native-reduction axiom, and the tag must not buy it any trust.
CORE_TAGGED_NATIVE = ("core", "Lean.ofReduceNat")

TD_CLUSTER = gor.CLUSTER_LABELS[gor.CLUSTER_TD]
FIXTURE_FILE = "Fixture/TwoDeletionCollisionFixture.lean"


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
    """Axiom closures for every hop the W3-0b trust boundary reads.

    ``legacy_wrapper``, the ``open_leaf`` itself and a consumer-side ``via`` hop
    are checked too, so they need a recorded closure: an unrecorded one is a
    "cannot verify" violation, which is the correct fail-closed answer but not
    the case under test.  The leaf's closure is CONSUMER-OK and carries
    ``sorryAx``: that is what an open leaf looks like in the kernel.
    """
    return {
        WRAPPER: list(CONSUMER_CLOSURE),
        PRODUCER: list(CLEAN_CLOSURE),
        COORDINATOR: list(CONSUMER_CLOSURE),
        ELIMINATOR: list(CONSUMER_CLOSURE),
        LEAF: list(CONSUMER_CLOSURE),
        HOP: list(CONSUMER_CLOSURE),
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


def run(payload, backend_obj=None, registry=None, required=(), declarable=None):
    """``check_factorizations`` over one fixture block.

    ``declarable`` is the publish target's RECORDED closure (W3-0e), injected
    as a set exactly like the backend; None is the fail-closed default and is
    what every pre-W3-0e case runs with.
    """
    return gor.check_factorizations(
        registry_for() if registry is None else registry,
        meta_for(payload),
        backend() if backend_obj is None else backend_obj,
        required,
        declarable_trust=declarable,
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


def axioms_text(target: str, header_count, entries: list[str]) -> str:
    """A ``proof-blueprint axioms`` transcript, header count given explicitly.

    ``header_count`` is interpolated verbatim, so a test can hand back a header
    with no count at all.
    """
    header = (
        "axioms reported by `#print axioms "
        + target
        + "` ("
        + str(header_count)
        + "):\n"
    )
    return header + "".join(line + "\n" for line in entries) + "\n"


AXIOMS_ENTRIES = [
    "      core  propext",
    "  \U0001FAB6 CUSTOM  sorryAx",
    "      core  Quot.sound",
]


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
    assert gor.parse_axioms_output(text, "Fixture.f") == [
        ("core", "propext"),
        ("custom", "sorryAx"),
        ("core", "Quot.sound"),
    ]


def test_parse_axioms_output_rejects_a_count_mismatch():
    text = "axioms reported by `#print axioms Fixture.f` (2):\n      core  propext\n"
    with pytest.raises(gor.RegistryError):
        gor.parse_axioms_output(text, "Fixture.f")


# -- strict header and entry grammar (auditor #7521) ------------------------
#
# The pre-hardening parser accepted ANY "axioms reported by" header without
# checking the target, treated a missing count as unknown and accepted it, and
# accepted any indented line with >= 2 tokens as an entry.  Each of those is a
# way for a changed output format to become a silently wrong closure.


def test_parse_axioms_output_rejects_a_header_naming_another_target():
    text = axioms_text("Fixture.other", 3, AXIOMS_ENTRIES)
    with pytest.raises(gor.RegistryError) as excinfo:
        gor.parse_axioms_output(text, "Fixture.f")
    assert "Fixture.other" in str(excinfo.value)
    assert "Fixture.f" in str(excinfo.value)


def test_parse_axioms_output_rejects_a_header_without_a_count():
    missing = "axioms reported by `#print axioms Fixture.f`:\n      core  propext\n"
    with pytest.raises(gor.RegistryError):
        gor.parse_axioms_output(missing, "Fixture.f")
    # A parenthesized NON-integer is the same refusal, not "unknown, accept".
    with pytest.raises(gor.RegistryError):
        gor.parse_axioms_output(
            axioms_text("Fixture.f", "many", AXIOMS_ENTRIES), "Fixture.f"
        )


def test_parse_axioms_output_rejects_a_bogus_entry_line():
    text = axioms_text("Fixture.f", 3, AXIOMS_ENTRIES[:2] + ["  bogus X"])
    with pytest.raises(gor.RegistryError) as excinfo:
        gor.parse_axioms_output(text, "Fixture.f")
    assert "bogus" in str(excinfo.value)
    # A well-tagged line whose NAME is not a Lean identifier is refused too.
    with pytest.raises(gor.RegistryError):
        gor.parse_axioms_output(
            axioms_text("Fixture.f", 3, AXIOMS_ENTRIES[:2] + ["      core  bad-name"]),
            "Fixture.f",
        )


def test_parse_axioms_output_rejects_an_extra_entry_line():
    text = axioms_text(
        "Fixture.f", 3, AXIOMS_ENTRIES + ["     core*  Lean.ofReduceBool"]
    )
    with pytest.raises(gor.RegistryError):
        gor.parse_axioms_output(text, "Fixture.f")
    # ... and one entry short of the header count is refused as well.
    with pytest.raises(gor.RegistryError):
        gor.parse_axioms_output(
            axioms_text("Fixture.f", 3, AXIOMS_ENTRIES[:2]), "Fixture.f"
        )


def test_parse_axioms_output_reads_the_real_recorded_closure():
    """The committed proof-status/baseline/axioms.txt must still parse.

    ``PROOF_STATUS`` is defined further down with the command-level fixtures;
    this reads the real file only, and writes nothing.
    """
    text = (PROOF_STATUS / "baseline" / gor.BASELINE_AXIOMS_FILE).read_text(
        encoding="utf-8"
    )
    closure = gor.parse_axioms_output(text, gor.PUBLISH_TARGET)
    assert len(closure) == 6
    assert ("custom", "sorryAx") in closure
    assert ("core*", "Lean.ofReduceBool") in closure


def test_a_per_symbol_parse_rejects_a_header_naming_another_symbol():
    """``BlueprintBackend.axioms`` parses against the symbol it queried."""
    text = axioms_text(gor.PUBLISH_TARGET, 3, AXIOMS_ENTRIES)
    assert gor.parse_axioms_output(text, gor.PUBLISH_TARGET)
    with pytest.raises(gor.RegistryError):
        gor.parse_axioms_output(text, "Fixture.some_hop")


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
    assert (
        OID
        + ": eliminator ("
        + ELIMINATOR
        + ") does not directly call open_leaf ("
        + LEAF
        + ")"
    ) in messages(result)
    # With the last edge reversed nothing reaches the open leaf any more, so the
    # W3-0b trust rule reports every consumer hop that carries sorryAx without
    # consuming it.  The cascade is deliberate: each of those hops really does
    # carry an unexplained sorryAx under this call graph.
    for role in ("legacy_wrapper", "coordinator", "eliminator"):
        assert (
            OID + ": " + role + " carries sorryAx without consuming the open leaf"
        ) in messages(result)


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
    assert "every role and via hop must be public" in joined(result)


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
    assert "a consumer hop may add nothing beyond" in joined(result)
    for allowed in gor.ALLOWED_AXIOMS:
        assert allowed in joined(result)


def test_producer_with_a_custom_axiom_fails():
    closures = base_closures()
    closures[PRODUCER] = [("core", "propext"), ("custom", "Fixture.myAxiom")]
    result = run(block(), backend(closures=closures))
    assert result["verified_ids"] == []
    assert "Fixture.myAxiom" in joined(result)
    assert "the producer path must be kernel clean" in joined(result)


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
    assert (
        OID
        + ": via[0] ("
        + HOP
        + ") does not directly call eliminator ("
        + ELIMINATOR
        + ")"
    ) in messages(result)
    # The broken hop also cuts every consumer hop off from the open leaf.
    assert (
        OID + ": legacy_wrapper carries sorryAx without consuming the open leaf"
    ) in messages(result)


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


def rename_closures() -> dict:
    """After the rename the OLD leaf name is the legacy wrapper, so it is the
    hop whose closure the consumer-side trust rule reads, and the NEW name is
    the audited open leaf."""
    closures = base_closures()
    closures[LEAF] = list(CONSUMER_CLOSURE)
    closures[RENAMED_LEAF] = list(CONSUMER_CLOSURE)
    return closures


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
        closures=rename_closures(),
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


# ---------------------------------------------------------------------------
# W3-0b item 1: the canonical registry carries every verified factorization
# ---------------------------------------------------------------------------


def export_record(symbol: str, *, line: int = 1, signature: str | None = None) -> dict:
    """One synthetic ``search --with-sorry --json`` export row."""
    return {
        "symbol": symbol,
        "kind": "theorem",
        "file": FIXTURE_FILE,
        "line": line,
        "has_sorry": True,
        "private": False,
        "signature": SIGNATURES[symbol] if signature is None else signature,
    }


def generated_registry(payload, *, symbol: str = LEAF, obligation_id: str = OID,
                       build: str | None = BUILD, extra_rows: list | None = None) -> dict:
    """The registry ``generate`` would write for one fixture obligation."""
    rows = [export_record(symbol)] + list(extra_rows or [])
    assigned = {row["symbol"]: obligation_id for row in rows[:1]}
    for index, row in enumerate(rows[1:], start=2):
        assigned[row["symbol"]] = obligation_id + "-" + str(index)
    registry, _ledger = gor.build_registry(
        rows, [], "deadbeefdeadbeef", ledger_with(assigned),
        meta_for(payload, obligation_id), build,
    )
    return registry


def entry_of(registry: dict, obligation_id: str = OID) -> dict:
    matches = [item for item in registry["obligations"] if item["id"] == obligation_id]
    assert len(matches) == 1
    return matches[0]


def test_generation_materializes_the_reviewed_block_on_the_registry_entry():
    payload = block(
        transitive=[
            {"from": "legacy_wrapper", "to": "coordinator", "via": [STRANGER]},
            {"from": "coordinator", "to": "eliminator", "via": [HOP]},
        ]
    )
    materialized = entry_of(generated_registry(payload))[gor.FACTORIZATION_KEY]

    # ``consumer_trust`` is optional and this block declares none, so the
    # materialization carries every other key of the tuple.
    assert set(materialized) == set(gor.MATERIALIZED_KEYS) - {gor.CONSUMER_TRUST_KEY}
    assert set(gor.MATERIALIZED_KEYS) == {
        "schema", "roles", "pinned", "transitive", gor.CONSUMER_TRUST_KEY,
        gor.VERIFIED_AT_BUILD
    }
    assert materialized["schema"] == gor.FACTORIZATION_SCHEMA_V2
    assert materialized["roles"] == payload["roles"]
    assert materialized["pinned"] == payload["pinned"]
    assert materialized[gor.VERIFIED_AT_BUILD] == BUILD
    # obligation_id (the entry's own key) and note (prose) are dropped, and the
    # rows are sorted, so the materialization is a function of the block alone.
    assert [row["from"] for row in materialized["transitive"]] == [
        "coordinator", "legacy_wrapper"
    ]
    assert materialized["transitive"][0]["via"] == [HOP]


def test_entry_without_a_reviewed_block_gets_no_factorization_key():
    registry = generated_registry(None)
    assert gor.FACTORIZATION_KEY not in entry_of(registry)
    # ... and the build fingerprint cannot leak into such an entry, so a
    # registry with no factorization entries regenerates byte-identical.
    assert gor.dump_canonical(registry) == gor.dump_canonical(
        generated_registry(None, build=None)
    )


def test_a_v1_block_is_never_materialized():
    payload = {
        "schema": gor.FACTORIZATION_SCHEMA_V1,
        "obligation_id": OID,
        "roles": block()["roles"],
        "note": "pre-pin legacy record",
    }
    assert gor.FACTORIZATION_KEY not in entry_of(generated_registry(payload))


def test_check_passes_when_the_registry_and_the_reviewed_block_agree():
    payload = block()
    registry = generated_registry(payload)
    assert gor.compare_registry_factorizations(registry, meta_for(payload), BUILD) == []
    # The live gate agrees too: the block itself still verifies.
    assert run(payload, registry=registry)["verified_ids"] == [OID]


def test_registry_drift_when_the_materialized_block_is_missing():
    payload = block()
    registry = generated_registry(payload)
    del entry_of(registry)[gor.FACTORIZATION_KEY]
    drift = gor.compare_registry_factorizations(registry, meta_for(payload), BUILD)
    assert len(drift) == 1
    assert OID in drift[0]
    assert "carries no materialized factorization block" in drift[0]


def test_registry_drift_when_the_registry_carries_an_undeclared_block():
    registry = generated_registry(block())
    drift = gor.compare_registry_factorizations(registry, meta_for(None), BUILD)
    assert len(drift) == 1
    assert OID in drift[0]
    assert "the reviewed metadata does not declare" in drift[0]


def test_registry_drift_on_a_field_names_the_id_and_the_key():
    payload = block()
    registry = generated_registry(payload)
    entry_of(registry)[gor.FACTORIZATION_KEY]["roles"]["producer"] = STRANGER
    drift = gor.compare_registry_factorizations(registry, meta_for(payload), BUILD)
    assert len(drift) == 1
    assert drift[0].startswith(OID + ": materialized factorization key 'roles'")
    assert STRANGER in drift[0] and PRODUCER in drift[0]

    pinned = block()
    registry = generated_registry(pinned)
    entry_of(registry)[gor.FACTORIZATION_KEY]["pinned"][
        "open_leaf_statement_sha256"
    ] = "0" * 64
    drift = gor.compare_registry_factorizations(registry, meta_for(pinned), BUILD)
    assert len(drift) == 1
    assert "'pinned'" in drift[0]


def test_registry_drift_when_verified_at_build_is_not_the_current_build():
    payload = block()
    registry = generated_registry(payload, build=OLD_BUILD)
    drift = gor.compare_registry_factorizations(registry, meta_for(payload), BUILD)
    assert len(drift) == 1
    assert OID in drift[0]
    assert gor.VERIFIED_AT_BUILD in drift[0]
    assert OLD_BUILD in drift[0] and BUILD in drift[0]

    # An unreadable current build is never "fresh": it fails closed here too.
    unknown = gor.compare_registry_factorizations(registry, meta_for(payload), None)
    assert len(unknown) == 1
    assert gor.VERIFIED_AT_BUILD in unknown[0]


def test_entries_without_a_block_are_untouched_by_the_comparison():
    payload = block()
    registry = generated_registry(
        payload, extra_rows=[export_record(STRANGER, line=9)]
    )
    other = [item for item in registry["obligations"] if item["id"] != OID]
    assert len(other) == 1
    assert gor.FACTORIZATION_KEY not in other[0]
    assert gor.compare_registry_factorizations(registry, meta_for(payload), BUILD) == []


def test_current_build_id_is_none_when_it_cannot_be_read():
    assert gor.current_build_id(None) is None
    assert gor.current_build_id(backend(build=None)) is None
    assert gor.current_build_id(backend()) == BUILD


# ---------------------------------------------------------------------------
# W3-0b item 2: the explicit trust boundary (tags are advisory)
# ---------------------------------------------------------------------------


def transitive_calls(via_pair: str = "consumer") -> dict:
    """Call graph with HOP inserted on one chain row."""
    if via_pair == "consumer":
        return {
            WRAPPER: [COORDINATOR],
            COORDINATOR: [PRODUCER, HOP],
            HOP: [ELIMINATOR],
            ELIMINATOR: [LEAF],
        }
    return {
        WRAPPER: [COORDINATOR],
        COORDINATOR: [HOP, ELIMINATOR],
        HOP: [PRODUCER],
        ELIMINATOR: [LEAF],
    }


def transitive_block(via_pair: str = "consumer") -> dict:
    pair = ("coordinator", "eliminator") if via_pair == "consumer" else (
        "coordinator", "producer"
    )
    return block(transitive=[{"from": pair[0], "to": pair[1], "via": [HOP]}])


def test_allowed_axiom_baseline_is_explicit():
    assert gor.ALLOWED_AXIOMS == ("propext", "Classical.choice", "Quot.sound")
    assert gor.is_clean_closure([("core", "propext"), ("x", "Classical.choice")])
    assert not gor.is_clean_closure([("core", "sorryAx")])
    assert gor.is_consumer_ok_closure([("core", "propext"), ("x", "sorryAx")])
    assert not gor.is_consumer_ok_closure([("core", "Lean.ofReduceNat")])


def test_core_tagged_native_axiom_is_rejected_on_every_hop_kind():
    """The tool tags Lean.ofReduceNat ``core``; the tag buys it nothing."""
    for symbol, label in (
        (WRAPPER, "legacy_wrapper"),
        (COORDINATOR, "coordinator"),
        (PRODUCER, "producer"),
        (ELIMINATOR, "eliminator"),
    ):
        closures = base_closures()
        closures[symbol] = list(closures[symbol]) + [CORE_TAGGED_NATIVE]
        result = run(block(), backend(closures=closures))
        assert result["verified_ids"] == []
        text = joined(result)
        assert (
            label + " (" + symbol + ") axiom closure contains Lean.ofReduceNat"
        ) in text
        assert "tool tag 'core', advisory" in text

    # ... and on a via hop of either side.
    for via_pair in ("consumer", "producer"):
        closures = base_closures()
        base = CONSUMER_CLOSURE if via_pair == "consumer" else CLEAN_CLOSURE
        closures[HOP] = list(base) + [CORE_TAGGED_NATIVE]
        result = run(
            transitive_block(via_pair),
            backend(calls=transitive_calls(via_pair), closures=closures),
        )
        assert result["verified_ids"] == []
        assert "via[0] (" + HOP + ") axiom closure contains Lean.ofReduceNat" in joined(
            result
        )


def test_sorry_ax_on_a_producer_path_hop_is_rejected():
    # The producer itself.
    closures = base_closures()
    closures[PRODUCER] = list(CONSUMER_CLOSURE)
    result = run(block(), backend(closures=closures))
    assert result["verified_ids"] == []
    assert "producer (" + PRODUCER + ") axiom closure contains sorryAx" in joined(result)
    assert "the producer path must be kernel clean" in joined(result)

    # A via hop on the coordinator -> producer row is producer path too.
    closures = base_closures()
    closures[HOP] = list(CONSUMER_CLOSURE)
    result = run(
        transitive_block("producer"),
        backend(calls=transitive_calls("producer"), closures=closures),
    )
    assert result["verified_ids"] == []
    assert "via[0] (" + HOP + ") axiom closure contains sorryAx" in joined(result)
    assert "the producer path must be kernel clean" in joined(result)


def test_sorry_ax_on_legacy_wrapper_is_accepted_only_when_it_reaches_the_leaf():
    # The base fixture: the wrapper carries sorryAx and the chain reaches the
    # open leaf, so the hop is explained and the block verifies.
    assert base_closures()[WRAPPER] == list(CONSUMER_CLOSURE)
    assert run(block())["verified_ids"] == [OID]

    # Same closure, but nothing on the wrapper's path reaches the open leaf.
    calls = base_calls()
    del calls[ELIMINATOR]
    result = run(block(), backend(calls=calls))
    assert result["verified_ids"] == []
    assert (
        OID + ": legacy_wrapper carries sorryAx without consuming the open leaf"
    ) in messages(result)


def test_custom_axiom_on_a_via_hop_is_rejected():
    closures = base_closures()
    closures[HOP] = list(CONSUMER_CLOSURE) + [("core", "Fixture.clusterAxiom")]
    result = run(
        transitive_block(), backend(calls=transitive_calls(), closures=closures)
    )
    assert result["verified_ids"] == []
    text = joined(result)
    assert "Fixture.clusterAxiom" in text
    assert "a consumer hop may add nothing beyond" in text


def test_a_hop_without_a_readable_closure_is_cannot_verify():
    closures = base_closures()
    del closures[WRAPPER]
    result = run(block(), backend(closures=closures))
    assert result["verified_ids"] == []
    assert "cannot verify the axiom closure of legacy_wrapper" in joined(result)


def test_open_leaf_closure_of_baseline_plus_sorry_ax_is_accepted():
    """#7462: the leaf is audited, and sorryAx alone does not fail it.

    sorryAx needs no consumption justification on the leaf - the leaf IS the
    open leaf every other consumer hop has to reach.
    """
    closures = base_closures()
    closures[LEAF] = [
        ("core", "propext"),
        ("core", "Classical.choice"),
        ("core", "Quot.sound"),
        ("custom", "sorryAx"),
    ]
    result = run(block(), backend(closures=closures))
    assert messages(result) == []
    assert result["verified_ids"] == [OID]


def test_open_leaf_with_a_native_axiom_fails_and_names_the_leaf():
    """has_sorry proves the leaf is OPEN; it does not exclude Lean.ofReduceNat.

    The tool tags that axiom ``core``; the tag buys it nothing on the leaf
    either.
    """
    closures = base_closures()
    closures[LEAF] = list(CONSUMER_CLOSURE) + [CORE_TAGGED_NATIVE]
    result = run(block(), backend(closures=closures))
    assert result["verified_ids"] == []
    assert (
        OID + ": open_leaf (" + LEAF + ") carries forbidden axiom Lean.ofReduceNat"
    ) in messages(result)


def test_open_leaf_with_a_custom_axiom_fails():
    closures = base_closures()
    closures[LEAF] = list(CONSUMER_CLOSURE) + [("custom", "Fixture.leafAxiom")]
    result = run(block(), backend(closures=closures))
    assert result["verified_ids"] == []
    assert (
        OID + ": open_leaf (" + LEAF + ") carries forbidden axiom Fixture.leafAxiom"
    ) in messages(result)


# ---------------------------------------------------------------------------
# W3-0b item 3: transitive exactness
# ---------------------------------------------------------------------------


def test_ambiguous_via_fails():
    index = base_index()
    index[HOP] = [record(HOP), record(HOP)]
    result = run(
        transitive_block(), backend(index=index, calls=transitive_calls())
    )
    assert result["verified_ids"] == []
    assert (
        "via[0] (" + HOP + ") resolves to 2 index records"
    ) in joined(result)


def test_unknown_via_fails():
    index = base_index()
    del index[HOP]
    result = run(
        transitive_block(), backend(index=index, calls=transitive_calls())
    )
    assert result["verified_ids"] == []
    assert (
        "via[0] (" + HOP + ") resolves to 0 index records"
    ) in joined(result)


def test_private_via_fails():
    index = base_index()
    index[HOP] = [record(HOP, private=True)]
    result = run(
        transitive_block(), backend(index=index, calls=transitive_calls())
    )
    assert result["verified_ids"] == []
    text = joined(result)
    assert "via[0] (" + HOP + ") is a private declaration" in text
    assert "every role and via hop must be public" in text


def test_via_that_is_also_a_role_fails():
    payload = block(
        transitive=[{"from": "coordinator", "to": "eliminator", "via": [PRODUCER]}]
    )
    calls = {
        WRAPPER: [COORDINATOR],
        COORDINATOR: [PRODUCER],
        PRODUCER: [ELIMINATOR],
        ELIMINATOR: [LEAF],
    }
    result = run(payload, backend(calls=calls))
    assert result["verified_ids"] == []
    assert len(messages(result)) == 1
    assert "is also the producer role" in messages(result)[0]
    assert PRODUCER in messages(result)[0]


def test_cycle_through_a_via_fails():
    calls = transitive_calls()
    calls[HOP] = [ELIMINATOR, COORDINATOR]
    result = run(transitive_block(), backend(calls=calls))
    assert result["verified_ids"] == []
    assert len(messages(result)) == 1
    text = messages(result)[0]
    assert "role cycle" in text
    assert HOP in text
    assert COORDINATOR in text


# ---------------------------------------------------------------------------
# W3-0b item 4: the stable-id migration at the COMMAND level
#
# These drive the real ``generate`` / ``check`` entry point over a COPY of
# proof-status in tmp_path, with the kernel-mined backend and the roster
# records injected through the documented command-level seams
# (``main(argv, backend_factory=..., export_source=...)``).  Nothing reads the
# live blueprint database and no receipt is written outside the copy.
# ---------------------------------------------------------------------------

PROOF_STATUS = SCRIPT.parent.parent / "proof-status"

MIGRATED_LEAF = "Fixture.W30b.migrated_open_leaf"
MIGRATED_COORDINATOR = "Fixture.W30b.cluster_coordinator"
MIGRATED_PRODUCER = "Fixture.W30b.intrinsic_producer"
MIGRATED_ELIMINATOR = "Fixture.W30b.terminal_eliminator"

MIGRATED_SIGNATURES = {
    MIGRATED_LEAF: "theorem migrated_open_leaf\n    (p : Fixture.Packet) :\n    False",
    MIGRATED_COORDINATOR: "theorem cluster_coordinator\n    (h : Fixture.Hyp) :\n    False",
    MIGRATED_PRODUCER: "theorem intrinsic_producer\n    (h : Fixture.Hyp) :\n    Fixture.Packet",
    MIGRATED_ELIMINATOR: "theorem terminal_eliminator\n    (p : Fixture.Packet) :\n    False",
}


def fixture_record(symbol: str, signature: str, *, has_sorry: bool = False,
                   private: bool = False) -> dict:
    return {
        "symbol": symbol,
        "kind": "theorem",
        "file": FIXTURE_FILE,
        "line": 1,
        "has_sorry": has_sorry,
        "private": private,
        "signature": signature,
        "doc": "",
        "attributes": [],
    }


def copy_proof_status(tmp_path: Path) -> Path:
    """A COPY of proof-status; every fixture edit and receipt stays inside it.

    Every LIVE factorization block is stripped from the copy (reviewed
    metadata and the materialized registry entry alike).  The command-level
    fixtures inject one synthetic block and run against a MappingBackend that
    knows only the Fixture.W30b.* symbols, so a real block left in the copy
    would be "cannot verify" noise unrelated to the behaviour under test.
    """
    target = tmp_path / "proof-status"
    shutil.copytree(PROOF_STATUS, target)
    meta_path = target / gor.META_NAME
    meta = json.loads(meta_path.read_text(encoding="utf-8"))
    for entry in meta.values():
        if isinstance(entry, dict):
            entry.pop(gor.FACTORIZATION_KEY, None)
    meta_path.write_text(
        json.dumps(meta, indent=2, sort_keys=True, ensure_ascii=False) + "\n",
        encoding="utf-8",
    )
    registry_path = target / gor.REGISTRY_NAME
    registry = json.loads(registry_path.read_text(encoding="utf-8"))
    for item in registry["obligations"]:
        item.pop(gor.FACTORIZATION_KEY, None)
    registry_path.write_text(gor.dump_canonical(registry), encoding="utf-8")

    # The logical registry now promotes two leaves through reviewed private
    # edges, but the physical blueprint miner still emits those declarations
    # in the off-spine export.  Reconstruct that source split explicitly so
    # command-level fixtures exercise the same fail-closed override path as
    # production generation.
    hidden_private = set(gor.PRIVATE_EDGE_REACHABILITY)
    exports = {True: [], False: []}
    for item in sorted(registry["obligations"], key=lambda row: row["lean_decl"]):
        physical_reachable = (
            bool(item["reachable"])
            and item["lean_decl"] not in hidden_private
        )
        exports[physical_reachable].append(
            {
                "symbol": item["lean_decl"],
                "file": item["source_file"],
                "line": item["line"],
                "kind": item["kind"],
            }
        )
    baseline = target / gor.BASELINE_DIR_NAME
    for reachable, name in (
        (True, gor.SPINE_EXPORT),
        (False, gor.OFFSPINE_EXPORT),
    ):
        (baseline / name).write_text(
            "".join(
                json.dumps(row, ensure_ascii=False) + "\n"
                for row in exports[reachable]
            ),
            encoding="utf-8",
        )
    return target


def read_status_json(status: Path, name: str) -> dict:
    return json.loads((status / name).read_text(encoding="utf-8"))


def first_reachable_entry(status: Path) -> dict:
    registry = read_status_json(status, gor.REGISTRY_NAME)
    hidden_private = set(gor.PRIVATE_EDGE_REACHABILITY)
    reachable = sorted(
        (
            item
            for item in registry["obligations"]
            if item.get("reachable") and item["lean_decl"] not in hidden_private
        ),
        key=lambda item: item["id"],
    )
    assert reachable
    return reachable[0]


def wrapper_signature_for(symbol: str) -> str:
    return "theorem " + symbol.rsplit(".", 1)[-1] + "\n    (h : Fixture.Hyp) :\n    False"


def migration_backend(old_symbol: str, *, closure_overrides: dict | None = None
                      ) -> gor.MappingBackend:
    """Kernel-mined truth AFTER the refactor: the old name is the wrapper.

    ``closure_overrides`` replaces the recorded axiom closure of individual
    symbols, which is how the W3-0c fixtures build an otherwise-correct rename
    whose producer closure is dirty.
    """
    wrapper_sig = wrapper_signature_for(old_symbol)
    index = {
        old_symbol: [fixture_record(old_symbol, wrapper_sig)],
        STRANGER: [record(STRANGER)],
    }
    for symbol, signature in MIGRATED_SIGNATURES.items():
        index[symbol] = [
            fixture_record(symbol, signature, has_sorry=symbol == MIGRATED_LEAF)
        ]
    calls = {
        old_symbol: [MIGRATED_COORDINATOR],
        MIGRATED_COORDINATOR: [MIGRATED_PRODUCER, MIGRATED_ELIMINATOR],
        MIGRATED_ELIMINATOR: [MIGRATED_LEAF],
    }
    closures = {
        old_symbol: list(CONSUMER_CLOSURE),
        MIGRATED_COORDINATOR: list(CONSUMER_CLOSURE),
        MIGRATED_ELIMINATOR: list(CONSUMER_CLOSURE),
        MIGRATED_LEAF: list(CONSUMER_CLOSURE),
        MIGRATED_PRODUCER: list(CLEAN_CLOSURE),
        STRANGER: list(CLEAN_CLOSURE),
    }
    closures.update(closure_overrides or {})
    mined = {symbol: BUILD for symbol in index}
    return gor.MappingBackend(
        index=index, calls=calls, axiom_closures=closures, mined=mined, build=BUILD
    )


def inject_factorization(status: Path, obligation_id: str, old_symbol: str,
                         *, legacy_wrapper: str | None = None) -> None:
    """Pin a rename on ONE entry of the copied reviewed metadata."""
    path = status / gor.META_NAME
    meta = json.loads(path.read_text(encoding="utf-8"))
    wrapper = old_symbol if legacy_wrapper is None else legacy_wrapper
    wrapper_sig = (
        wrapper_signature_for(old_symbol)
        if legacy_wrapper is None
        else SIGNATURES[STRANGER]
    )
    meta[obligation_id][gor.FACTORIZATION_KEY] = {
        "schema": gor.FACTORIZATION_SCHEMA_V2,
        "obligation_id": obligation_id,
        "roles": {
            "legacy_wrapper": wrapper,
            "coordinator": MIGRATED_COORDINATOR,
            "producer": MIGRATED_PRODUCER,
            "eliminator": MIGRATED_ELIMINATOR,
            "open_leaf": MIGRATED_LEAF,
        },
        "pinned": {
            "legacy_wrapper_statement_sha256": gor.statement_digest(wrapper_sig),
            "open_leaf_statement_sha256": gor.statement_digest(
                MIGRATED_SIGNATURES[MIGRATED_LEAF]
            ),
        },
        "note": "synthetic W3-0b command-level fixture; not a live factorization",
    }
    path.write_text(
        json.dumps(meta, indent=2, sort_keys=True, ensure_ascii=False) + "\n",
        encoding="utf-8",
    )


def baseline_exports(status: Path) -> tuple[list, list]:
    return (
        gor.read_records(status / "baseline" / gor.SPINE_EXPORT),
        gor.read_records(status / "baseline" / gor.OFFSPINE_EXPORT),
    )


def renamed_exports(status: Path, old_symbol: str) -> tuple[list, list]:
    """What the exporter reports AFTER the Lean rename.

    The open leaf is exported under its new name; the old public name survives
    as the compatibility wrapper and, carrying no sorry, is not exported.
    """
    spine, offspine = baseline_exports(status)
    renamed = []
    for row in spine:
        if row.get("symbol") == old_symbol:
            row = dict(row)
            row["symbol"] = MIGRATED_LEAF
        renamed.append(row)
    return renamed, offspine


def run_generate(status: Path, backend_obj, exports) -> int:
    return gor.main(
        [
            "generate",
            "--baseline", str(status / "baseline"),
            "--out", str(status),
            "--strict-meta",
        ],
        backend_factory=lambda: backend_obj,
        export_source=lambda: exports,
    )


def run_command_check(status: Path, backend_obj, exports) -> int:
    return gor.main(
        [
            "check",
            "--baseline", str(status / "baseline"),
            "--registry", str(status / gor.REGISTRY_NAME),
            "--receipts-dir", str(status / gor.RECEIPTS_DIRNAME),
        ],
        backend_factory=lambda: backend_obj,
        export_source=lambda: exports,
    )


def test_command_level_rename_migration_keeps_the_roster_and_is_idempotent(tmp_path):
    status = copy_proof_status(tmp_path)
    before = read_status_json(status, gor.REGISTRY_NAME)
    entry = first_reachable_entry(status)
    old_symbol = entry["lean_decl"]
    obligation_id = entry["id"]

    inject_factorization(status, obligation_id, old_symbol)
    backend_obj = migration_backend(old_symbol)
    exports = renamed_exports(status, old_symbol)

    assert run_generate(status, backend_obj, exports) == 0

    registry = read_status_json(status, gor.REGISTRY_NAME)
    # NO add / remove drift: the same id set, the same counts.
    assert sorted(item["id"] for item in registry["obligations"]) == sorted(
        item["id"] for item in before["obligations"]
    )
    counts = gor.roster_counts(registry["obligations"])
    assert counts == gor.roster_counts(before["obligations"])

    migrated = [item for item in registry["obligations"] if item["id"] == obligation_id]
    assert len(migrated) == 1
    # The id FOLLOWS the new open leaf ...
    assert migrated[0]["lean_decl"] == MIGRATED_LEAF
    # ... and the registry CARRIES the verified factorization.
    assert migrated[0][gor.FACTORIZATION_KEY][gor.VERIFIED_AT_BUILD] == BUILD
    assert migrated[0][gor.FACTORIZATION_KEY]["roles"]["legacy_wrapper"] == old_symbol

    ledger = read_status_json(status, gor.ID_ASSIGNMENTS_NAME)
    assert ledger["assigned"][MIGRATED_LEAF] == obligation_id
    assert old_symbol not in ledger["assigned"]
    assert old_symbol not in ledger["retired"]
    assert ledger["aliases"][obligation_id]["aliases"] == [old_symbol]
    assert ledger["aliases"][obligation_id]["renamed_from"] == old_symbol

    # Regenerating over the migrated ledger changes nothing.
    generated_once = (status / gor.REGISTRY_NAME).read_bytes()
    ledger_once = (status / gor.ID_ASSIGNMENTS_NAME).read_bytes()
    assert run_generate(status, backend_obj, exports) == 0
    assert (status / gor.REGISTRY_NAME).read_bytes() == generated_once
    assert (status / gor.ID_ASSIGNMENTS_NAME).read_bytes() == ledger_once

    # check on the copy agrees, and a second run is stable.
    assert run_command_check(status, backend_obj, exports) == 0
    assert run_command_check(status, backend_obj, exports) == 0
    assert (status / gor.ID_ASSIGNMENTS_NAME).read_bytes() == ledger_once
    assert (status / gor.REGISTRY_NAME).read_bytes() == generated_once


def test_command_level_check_fails_when_the_registry_block_drifts(tmp_path, capsys):
    status = copy_proof_status(tmp_path)
    entry = first_reachable_entry(status)
    old_symbol = entry["lean_decl"]
    obligation_id = entry["id"]

    inject_factorization(status, obligation_id, old_symbol)
    backend_obj = migration_backend(old_symbol)
    exports = renamed_exports(status, old_symbol)
    assert run_generate(status, backend_obj, exports) == 0
    capsys.readouterr()

    # Tamper with the materialized block on the COMMITTED registry.
    registry = read_status_json(status, gor.REGISTRY_NAME)
    for item in registry["obligations"]:
        if item["id"] == obligation_id:
            item[gor.FACTORIZATION_KEY][gor.VERIFIED_AT_BUILD] = OLD_BUILD
    (status / gor.REGISTRY_NAME).write_text(
        gor.dump_canonical(registry), encoding="utf-8"
    )

    assert run_command_check(status, backend_obj, exports) == 1
    out = capsys.readouterr().out
    assert "does not carry the reviewed factorization blocks" in out
    assert obligation_id in out
    assert gor.VERIFIED_AT_BUILD in out


def test_command_level_rename_that_would_allocate_a_new_id_is_rejected(tmp_path, capsys):
    status = copy_proof_status(tmp_path)
    entry = first_reachable_entry(status)
    old_symbol = entry["lean_decl"]
    obligation_id = entry["id"]

    # The block renames the leaf but does NOT keep the old public name as the
    # legacy wrapper, so the id could not follow it.
    inject_factorization(status, obligation_id, old_symbol, legacy_wrapper=STRANGER)
    backend_obj = migration_backend(old_symbol)
    # The tree is unchanged: the exports still name the old symbol.
    exports = baseline_exports(status)
    before_ledger = (status / gor.ID_ASSIGNMENTS_NAME).read_bytes()

    assert run_generate(status, backend_obj, exports) == 1
    captured = capsys.readouterr()
    assert "would allocate a new id" in captured.err
    assert obligation_id in captured.err
    assert (status / gor.ID_ASSIGNMENTS_NAME).read_bytes() == before_ledger

    assert run_command_check(status, backend_obj, exports) == 1
    captured = capsys.readouterr()
    assert "would allocate a new id" in captured.out
    assert (status / gor.ID_ASSIGNMENTS_NAME).read_bytes() == before_ledger
    # The entry still holds its original name and id.
    registry = read_status_json(status, gor.REGISTRY_NAME)
    still = [item for item in registry["obligations"] if item["id"] == obligation_id]
    assert len(still) == 1
    assert still[0]["lean_decl"] == old_symbol


# ---------------------------------------------------------------------------
# W3-0c: the HARD, TRANSACTIONAL generator gate (auditor #7468)
#
# Before W3-0c, ``command_generate`` wrote obligations.json, id-assignments.json
# and frontier-table.generated.md BEFORE the alias/factorization violations were
# inspected, and then routed those violations through the SOFT reviewed-metadata
# warning path, which only exits 1 under --strict-meta.  Two mutations therefore
# reached disk from a rejected block: a retired id plus a freshly allocated one,
# and a materialized ``verified_at_build`` block that never verified.
#
# These fixtures drive the REAL entry point over a copy of proof-status with the
# ACTUAL renamed exports, in BOTH modes, and compare file BYTES around the call.
# ---------------------------------------------------------------------------

GENERATED_OUTPUTS = (
    gor.REGISTRY_NAME,
    gor.ID_ASSIGNMENTS_NAME,
    gor.FRONTIER_TABLE_NAME,
)


def output_bytes(status: Path) -> dict:
    """The bytes of the three generated files; ``None`` for one that is absent."""
    return {
        name: (status / name).read_bytes() if (status / name).is_file() else None
        for name in GENERATED_OUTPUTS
    }


def assert_outputs_unchanged(status: Path, before: dict) -> None:
    after = output_bytes(status)
    for name in GENERATED_OUTPUTS:
        assert after[name] == before[name], name + " was mutated by a refused generate"


def run_generate_default(status: Path, backend_obj, exports) -> int:
    """The same command WITHOUT --strict-meta: the default mode operators use."""
    return gor.main(
        [
            "generate",
            "--baseline", str(status / "baseline"),
            "--out", str(status),
        ],
        backend_factory=lambda: backend_obj,
        export_source=lambda: exports,
    )


def native_axiom_migration_backend(old_symbol: str) -> gor.MappingBackend:
    """A CORRECT rename whose producer closure carries a native axiom.

    Everything else verifies: the wrapper is the old public name, the chain is
    intact, the digests are pinned.  Only the producer's kernel closure is
    dirty, and ``core`` is exactly the tag the tool prints next to it.
    """
    return migration_backend(
        old_symbol,
        closure_overrides={
            MIGRATED_PRODUCER: list(CLEAN_CLOSURE) + [CORE_TAGGED_NATIVE]
        },
    )


def ledger_state(status: Path) -> tuple[dict, dict, dict]:
    ledger = read_status_json(status, gor.ID_ASSIGNMENTS_NAME)
    return (
        ledger.get("assigned") or {},
        ledger.get("retired") or {},
        ledger.get("aliases") or {},
    )


def factorization_keys(status: Path) -> set:
    registry = read_status_json(status, gor.REGISTRY_NAME)
    return {
        item["id"]
        for item in registry["obligations"]
        if gor.FACTORIZATION_KEY in item
    }


def assert_ledger_untouched(status: Path, obligation_id: str, old_symbol: str,
                            before: tuple) -> None:
    """The rejected rename left the id ledger exactly as it was."""
    assigned, retired, aliases = ledger_state(status)
    before_assigned, before_retired, before_aliases = before
    # The old symbol still holds the old id ...
    assert assigned.get(old_symbol) == obligation_id
    # ... the new name was never allocated an id ...
    assert MIGRATED_LEAF not in assigned
    retired_ids = {
        entry.get("id") for entry in retired.values() if isinstance(entry, dict)
    }
    assert obligation_id not in retired_ids
    # ... nothing was retired, and no alias record appeared.
    assert retired == before_retired
    assert assigned == before_assigned
    assert aliases == before_aliases
    assert obligation_id not in aliases


def prepare_rejected_wrapper(tmp_path: Path):
    """Scenario (a): the rename is real, but the wrapper role names a stranger."""
    status = copy_proof_status(tmp_path)
    entry = first_reachable_entry(status)
    old_symbol = entry["lean_decl"]
    obligation_id = entry["id"]
    inject_factorization(status, obligation_id, old_symbol, legacy_wrapper=STRANGER)
    return (
        status,
        obligation_id,
        old_symbol,
        migration_backend(old_symbol),
        # The ACTUAL renamed exports: the leaf is gone under its old name, so a
        # write here would retire the old id and allocate a new one.
        renamed_exports(status, old_symbol),
    )


def prepare_native_axiom(tmp_path: Path):
    """Scenario (b): a correct rename whose producer closure is not clean."""
    status = copy_proof_status(tmp_path)
    entry = first_reachable_entry(status)
    old_symbol = entry["lean_decl"]
    obligation_id = entry["id"]
    inject_factorization(status, obligation_id, old_symbol)
    return (
        status,
        obligation_id,
        old_symbol,
        native_axiom_migration_backend(old_symbol),
        renamed_exports(status, old_symbol),
    )


@pytest.mark.parametrize("runner", [run_generate, run_generate_default])
def test_command_level_rejected_wrapper_writes_nothing_in_either_mode(
    tmp_path, capsys, runner
):
    status, obligation_id, old_symbol, backend_obj, exports = prepare_rejected_wrapper(
        tmp_path
    )
    before = output_bytes(status)
    before_ledger = ledger_state(status)
    before_blocks = factorization_keys(status)

    # HARD error in BOTH modes: --strict-meta has no say over this gate.
    assert runner(status, backend_obj, exports) == 1
    captured = capsys.readouterr()
    assert "ERROR: factorization: " in captured.err
    assert "would allocate a new id" in captured.err
    assert obligation_id in captured.err
    assert "are unchanged" in captured.err

    # TRANSACTIONAL: not one of the three generated files moved.
    assert_outputs_unchanged(status, before)
    assert_ledger_untouched(status, obligation_id, old_symbol, before_ledger)
    # No entry gained a factorization key it did not carry before.
    assert factorization_keys(status) == before_blocks
    # The registry entry still holds its old name and its old id.
    registry = read_status_json(status, gor.REGISTRY_NAME)
    still = [item for item in registry["obligations"] if item["id"] == obligation_id]
    assert len(still) == 1
    assert still[0]["lean_decl"] == old_symbol
    assert MIGRATED_LEAF not in {item["lean_decl"] for item in registry["obligations"]}


@pytest.mark.parametrize("runner", [run_generate, run_generate_default])
def test_command_level_native_axiom_producer_writes_nothing_in_either_mode(
    tmp_path, capsys, runner
):
    status, obligation_id, old_symbol, backend_obj, exports = prepare_native_axiom(
        tmp_path
    )
    before = output_bytes(status)
    before_ledger = ledger_state(status)
    before_blocks = factorization_keys(status)

    assert runner(status, backend_obj, exports) == 1
    captured = capsys.readouterr()
    assert "ERROR: factorization: " in captured.err
    assert (
        "producer (" + MIGRATED_PRODUCER + ") axiom closure contains Lean.ofReduceNat"
    ) in captured.err
    assert "tool tag 'core', advisory" in captured.err
    assert obligation_id in captured.err

    # The alias migration itself was legal here, so the pre-W3-0c code applied
    # it and stamped a verified_at_build block.  Neither may reach disk.
    assert_outputs_unchanged(status, before)
    assert_ledger_untouched(status, obligation_id, old_symbol, before_ledger)
    assert factorization_keys(status) == before_blocks
    assert gor.FACTORIZATION_KEY not in (status / gor.REGISTRY_NAME).read_text(
        encoding="utf-8"
    )
    assert gor.VERIFIED_AT_BUILD not in (status / gor.REGISTRY_NAME).read_text(
        encoding="utf-8"
    )


def test_command_level_valid_rename_in_default_mode_writes_and_migrates(tmp_path):
    """Parity: without --strict-meta a VERIFIED rename still writes and migrates."""
    status = copy_proof_status(tmp_path)
    entry = first_reachable_entry(status)
    old_symbol = entry["lean_decl"]
    obligation_id = entry["id"]

    inject_factorization(status, obligation_id, old_symbol)
    backend_obj = migration_backend(old_symbol)
    exports = renamed_exports(status, old_symbol)
    before = output_bytes(status)

    assert run_generate_default(status, backend_obj, exports) == 0
    # The gate passed, so this mode writes exactly what --strict-meta writes.
    assert output_bytes(status) != before

    registry = read_status_json(status, gor.REGISTRY_NAME)
    migrated = [item for item in registry["obligations"] if item["id"] == obligation_id]
    assert len(migrated) == 1
    assert migrated[0]["lean_decl"] == MIGRATED_LEAF
    assert migrated[0][gor.FACTORIZATION_KEY][gor.VERIFIED_AT_BUILD] == BUILD

    ledger = read_status_json(status, gor.ID_ASSIGNMENTS_NAME)
    assert ledger["assigned"][MIGRATED_LEAF] == obligation_id
    assert old_symbol not in ledger["assigned"]
    assert old_symbol not in ledger["retired"]
    assert ledger["aliases"][obligation_id]["renamed_from"] == old_symbol

    # Byte-for-byte the same artifact the strict-mode run produces.
    strict_status = copy_proof_status(tmp_path / "strict")
    inject_factorization(strict_status, obligation_id, old_symbol)
    strict_exports = renamed_exports(strict_status, old_symbol)
    assert run_generate(strict_status, migration_backend(old_symbol), strict_exports) == 0
    assert output_bytes(strict_status) == output_bytes(status)


def test_command_level_an_unverified_block_is_never_materialized(tmp_path):
    """There is no "generate succeeded, one block unverified" state to reach.

    Every v2 block that does not verify raises a violation, and a violation is
    now a hard error, so a partially-materialized registry is unreachable at the
    command level.  This asserts that unreachability directly, and separately
    pins the materialization rule the writer relies on: ``build_registry`` given
    a ``verified_ids`` set that excludes an id writes no block for that id.
    """
    status, obligation_id, _old, backend_obj, exports = prepare_native_axiom(tmp_path)

    # The block is declared and the rename is legal, but the block is NOT
    # verified -> the whole command fails and nothing is materialized anywhere.
    assert run_generate(status, backend_obj, exports) == 1
    registry = read_status_json(status, gor.REGISTRY_NAME)
    assert all(gor.FACTORIZATION_KEY not in item for item in registry["obligations"])

    # The writer's own rule, isolated from the command: an id outside the
    # verified set is not materialized even though the reviewed block is v2.
    payload = block()
    assert gor.FACTORIZATION_KEY in entry_of(generated_registry(payload))
    rows = [export_record(LEAF)]
    restricted, _ledger = gor.build_registry(
        rows, [], "deadbeefdeadbeef", ledger_with({LEAF: OID}),
        meta_for(payload, OID), BUILD, verified_ids=[],
    )
    assert gor.FACTORIZATION_KEY not in entry_of(restricted)
    # ... and the same call WITH the id in the verified set does materialize it.
    allowed, _ledger = gor.build_registry(
        rows, [], "deadbeefdeadbeef", ledger_with({LEAF: OID}),
        meta_for(payload, OID), BUILD, verified_ids=[OID],
    )
    assert allowed["obligations"] == generated_registry(payload)["obligations"]


def test_command_level_refused_generate_creates_no_output_file(tmp_path):
    """"Unchanged" includes "still absent": the gate creates nothing."""
    status, obligation_id, old_symbol, backend_obj, exports = prepare_rejected_wrapper(
        tmp_path
    )
    # The id ledger stays (it is the input the rename is planned against); the
    # two other generated files are removed so that any write shows up as a
    # created file rather than as changed bytes.
    (status / gor.REGISTRY_NAME).unlink()
    (status / gor.FRONTIER_TABLE_NAME).unlink()
    before = output_bytes(status)
    assert before[gor.REGISTRY_NAME] is None
    assert before[gor.FRONTIER_TABLE_NAME] is None
    before_ledger = ledger_state(status)

    assert run_generate_default(status, backend_obj, exports) == 1
    assert not (status / gor.REGISTRY_NAME).exists()
    assert not (status / gor.FRONTIER_TABLE_NAME).exists()
    assert_outputs_unchanged(status, before)
    assert_ledger_untouched(status, obligation_id, old_symbol, before_ledger)


# ---------------------------------------------------------------------------
# 5. declared consumer trust (W3-0e)
#
# A v2 block MAY carry the optional ``consumer_trust`` key.  A listed name is
# ACCEPTED only when it is not ``sorryAx``, is not already in ALLOWED_AXIOMS,
# and IS carried by the publish target's RECORDED closure, read by
# ``read_declarable_trust`` from ``<baseline>/axioms.txt`` under ``--baseline``
# and every ``check``, and from ``<out>/baseline/axioms.txt`` under ``--fresh``.
# The RECORDED closure is the authority in BOTH modes and no live axioms export
# is ever consulted for trust (W3-0e-fix-2, auditor #7524).  An accepted name is
# acceptable on CONSUMER-SIDE hops - the open leaf included - and NEVER on the
# producer path, and a name no consumer-side hop carries is itself a violation,
# so the key can never be a blanket widening.
#
# Every case here is synthetic: the recorded closure is injected as a set,
# exactly like the kernel-mined backend.
# ---------------------------------------------------------------------------

NATIVE_TRUST = "Lean.ofReduceBool"
SECOND_NATIVE_TRUST = "Lean.trustCompiler"
# The tool prints ``core*`` next to a native-reduction axiom.  That tag is
# advisory here exactly as everywhere else: the DECLARATION buys the trust, not
# the tag.
NATIVE_TAGGED = ("core*", NATIVE_TRUST)
SECOND_NATIVE_TAGGED = ("core*", SECOND_NATIVE_TRUST)
# What proof-status/baseline/axioms.txt records for Problem97.erdos97_rhs.
RECORDED_CLOSURE = {
    "propext",
    "Classical.choice",
    "Quot.sound",
    "sorryAx",
    NATIVE_TRUST,
    SECOND_NATIVE_TRUST,
}

AXIOMS_TEXT = (
    "axioms reported by `#print axioms Problem97.erdos97_rhs` (3):\n"
    "      core  propext\n"
    "     core*  Lean.ofReduceBool\n"
    "  \U0001fab6 CUSTOM  sorryAx\n"
    "\n"
    "  * native-reduction trust (1)\n"
)


def declaring(payload: dict, names: list) -> dict:
    """One fixture block with a ``consumer_trust`` declaration added."""
    payload[gor.CONSUMER_TRUST_KEY] = list(names)
    return payload


def closures_with(*symbols, axiom=NATIVE_TAGGED, closures=None):
    """The base closures with one extra axiom on each named symbol."""
    result = base_closures() if closures is None else closures
    for symbol in symbols:
        result[symbol] = list(result[symbol]) + [axiom]
    return result


def test_read_declarable_trust_reads_the_recorded_closure_or_fails_closed(tmp_path):
    (tmp_path / gor.BASELINE_AXIOMS_FILE).write_text(AXIOMS_TEXT, encoding="utf-8")
    assert gor.read_declarable_trust(tmp_path) == {
        "propext", NATIVE_TRUST, "sorryAx"
    }
    # No baseline directory, no file, and an unparseable file are all None -
    # never an empty set, which would read as "nothing is declarable" instead of
    # "the closure could not be read".
    assert gor.read_declarable_trust(None) is None
    assert gor.read_declarable_trust(tmp_path / "absent") is None
    (tmp_path / gor.BASELINE_AXIOMS_FILE).write_text(
        "no header here\n", encoding="utf-8"
    )
    assert gor.read_declarable_trust(tmp_path) is None
    # Undecodable bytes fail closed the same way (auditor #7518, non-blocking).
    (tmp_path / gor.BASELINE_AXIOMS_FILE).write_bytes(b"\xff\xfe\x00axioms")
    assert gor.read_declarable_trust(tmp_path) is None


def test_an_explicit_null_consumer_trust_is_present_not_absent():
    """Auditor #7518 blocker 2: ``"consumer_trust": null`` must not verify.

    Key ABSENCE declares nothing; a PRESENT null is the shape violation, so a
    block carrying it is never verified and never materialized.
    """
    assert gor.parse_consumer_trust(OID, {}, RECORDED_CLOSURE) == ([], [])
    accepted, violations = gor.parse_consumer_trust(
        OID, {gor.CONSUMER_TRUST_KEY: None}, RECORDED_CLOSURE
    )
    assert accepted == []
    assert violations == [
        OID + ": consumer_trust must be a non-empty list of unique axiom names"
    ]
    result = run(
        block(consumer_trust=None),
        backend(closures=closures_with(COORDINATOR)),
        declarable=RECORDED_CLOSURE,
    )
    assert result["verified_ids"] == []


def test_native_trust_on_a_consumer_hop_without_the_key_is_still_rejected():
    result = run(
        block(),
        backend(closures=closures_with(COORDINATOR)),
        declarable=RECORDED_CLOSURE,
    )
    assert result["verified_ids"] == []
    text = joined(result)
    assert (
        "coordinator (" + COORDINATOR + ") axiom closure contains " + NATIVE_TRUST
    ) in text
    # The refusal now says how the block could declare it.
    assert "unless the block declares it in consumer_trust" in text


def test_declared_native_trust_on_a_consumer_hop_verifies():
    result = run(
        block(consumer_trust=[NATIVE_TRUST]),
        backend(closures=closures_with(COORDINATOR)),
        declarable=RECORDED_CLOSURE,
    )
    assert messages(result) == []
    assert result["verified_ids"] == [OID]
    assert result["summary"]["declared_trust"] == {
        "blocks": 1,
        "axioms": [NATIVE_TRUST],
    }


def test_declared_native_trust_on_every_consumer_side_role_verifies():
    closures = closures_with(WRAPPER, COORDINATOR, ELIMINATOR)
    result = run(
        block(consumer_trust=[NATIVE_TRUST]),
        backend(closures=closures),
        declarable=RECORDED_CLOSURE,
    )
    assert messages(result) == []
    assert result["verified_ids"] == [OID]


def test_declared_native_trust_on_a_consumer_via_hop_verifies():
    closures = closures_with(HOP, COORDINATOR)
    result = run(
        declaring(transitive_block(), [NATIVE_TRUST]),
        backend(calls=transitive_calls(), closures=closures),
        declarable=RECORDED_CLOSURE,
    )
    assert messages(result) == []
    assert result["verified_ids"] == [OID]


def test_declared_native_trust_on_the_open_leaf_verifies():
    closures = closures_with(LEAF)
    refused = run(block(), backend(closures=closures), declarable=RECORDED_CLOSURE)
    assert (
        OID + ": open_leaf (" + LEAF + ") carries forbidden axiom " + NATIVE_TRUST
    ) in messages(refused)

    accepted = run(
        block(consumer_trust=[NATIVE_TRUST]),
        backend(closures=closures),
        declarable=RECORDED_CLOSURE,
    )
    assert messages(accepted) == []
    assert accepted["verified_ids"] == [OID]


def test_a_declaration_never_reaches_the_producer():
    result = run(
        block(consumer_trust=[NATIVE_TRUST]),
        backend(closures=closures_with(PRODUCER, COORDINATOR)),
        declarable=RECORDED_CLOSURE,
    )
    assert result["verified_ids"] == []
    # Exactly one violation: the producer's.  The coordinator carries the same
    # axiom and IS covered by the declaration.
    assert len(messages(result)) == 1
    text = joined(result)
    assert (
        "producer (" + PRODUCER + ") axiom closure contains " + NATIVE_TRUST
    ) in text
    assert "the producer path must be kernel clean" in text
    assert "consumer_trust does not apply to the producer path" in text


def test_a_declaration_never_reaches_a_coordinator_to_producer_via_hop():
    closures = closures_with(COORDINATOR)
    closures[HOP] = list(CLEAN_CLOSURE) + [NATIVE_TAGGED]
    result = run(
        declaring(transitive_block("producer"), [NATIVE_TRUST]),
        backend(calls=transitive_calls("producer"), closures=closures),
        declarable=RECORDED_CLOSURE,
    )
    assert result["verified_ids"] == []
    assert len(messages(result)) == 1
    text = joined(result)
    assert ("via[0] (" + HOP + ") axiom closure contains " + NATIVE_TRUST) in text
    assert "consumer_trust does not apply to the producer path" in text


def test_a_name_the_recorded_closure_does_not_carry_is_rejected():
    result = run(
        block(consumer_trust=["Lean.ofReduceNat"]),
        backend(closures=closures_with(COORDINATOR, axiom=CORE_TAGGED_NATIVE)),
        declarable=RECORDED_CLOSURE,
    )
    assert result["verified_ids"] == []
    assert (
        OID + ": consumer_trust lists Lean.ofReduceNat, which the publish target's"
        + " recorded closure does not carry"
    ) in messages(result)
    # The name was NOT accepted, so the hop carrying it is refused as before.
    assert "axiom closure contains Lean.ofReduceNat" in joined(result)


def test_sorry_ax_is_never_declarable():
    result = run(block(consumer_trust=[gor.SORRY_AXIOM]), declarable=RECORDED_CLOSURE)
    assert result["verified_ids"] == []
    assert messages(result) == [
        OID + ": consumer_trust lists sorryAx; an open obligation is never"
        + " declarable trust"
    ]


def test_an_already_allowed_name_is_rejected():
    result = run(block(consumer_trust=["propext"]), declarable=RECORDED_CLOSURE)
    assert result["verified_ids"] == []
    assert messages(result) == [
        OID + ": consumer_trust lists propext, which is already in ALLOWED_AXIOMS"
    ]


def test_a_declaration_no_consumer_side_hop_carries_is_rejected():
    """No blanket declarations: the key must pay for an axiom that is there."""
    result = run(
        block(consumer_trust=[NATIVE_TRUST]), declarable=RECORDED_CLOSURE
    )
    assert result["verified_ids"] == []
    assert messages(result) == [
        OID + ": consumer_trust declares " + NATIVE_TRUST
        + " but no consumer-side hop carries it"
    ]

    # A producer-only carrier does not justify the declaration either.
    producer_only = run(
        block(consumer_trust=[NATIVE_TRUST]),
        backend(closures=closures_with(PRODUCER)),
        declarable=RECORDED_CLOSURE,
    )
    assert (
        OID + ": consumer_trust declares " + NATIVE_TRUST
        + " but no consumer-side hop carries it"
    ) in messages(producer_only)


def test_an_unused_declaration_is_not_reported_when_a_closure_cannot_be_read():
    """The block already reports "cannot verify"; a second line would mislead."""
    closures = closures_with(COORDINATOR)
    del closures[WRAPPER]
    result = run(
        block(consumer_trust=[NATIVE_TRUST, SECOND_NATIVE_TRUST]),
        backend(closures=closures),
        declarable=RECORDED_CLOSURE,
    )
    assert result["verified_ids"] == []
    assert "cannot verify the axiom closure of legacy_wrapper" in joined(result)
    assert "but no consumer-side hop carries it" not in joined(result)


def test_an_unreadable_recorded_closure_is_cannot_verify_not_accepted():
    result = run(
        block(consumer_trust=[NATIVE_TRUST]),
        backend(closures=closures_with(COORDINATOR)),
        declarable=None,
    )
    assert result["verified_ids"] == []
    # SOURCE-NEUTRAL and it NAMES the file (auditor #7524).
    assert (
        OID + ": cannot verify consumer_trust: the recorded closure "
        + gor.BASELINE_AXIOMS_FILE
        + " could not be read"
    ) in messages(result)
    # Nothing was accepted, so the hop is refused too.
    assert "axiom closure contains " + NATIVE_TRUST in joined(result)
    # WITHOUT the key an unreadable recorded closure changes nothing.
    assert messages(run(block(), declarable=None)) == []
    assert run(block(), declarable=None)["verified_ids"] == [OID]


@pytest.mark.parametrize(
    "value",
    [
        NATIVE_TRUST,
        [],
        [NATIVE_TRUST, NATIVE_TRUST],
        [""],
        [NATIVE_TRUST, 7],
        {},
        # An explicit null is a PRESENT malformed value, not key absence
        # (auditor #7518).
        None,
    ],
)
def test_a_malformed_consumer_trust_value_is_one_shape_violation(value):
    result = run(
        block(consumer_trust=value),
        backend(closures=closures_with(COORDINATOR)),
        declarable=RECORDED_CLOSURE,
    )
    assert result["verified_ids"] == []
    assert (
        OID + ": consumer_trust must be a non-empty list of unique axiom names"
    ) in messages(result)


def test_consumer_trust_in_a_v1_block_is_an_unknown_key():
    payload = {
        "schema": gor.FACTORIZATION_SCHEMA_V1,
        "obligation_id": OID,
        "roles": block()["roles"],
        "consumer_trust": [NATIVE_TRUST],
        "note": "pre-pin legacy record",
    }
    result = run(payload, declarable=RECORDED_CLOSURE)
    assert result["verified_ids"] == []
    assert (
        OID + ": unknown key 'consumer_trust' in the " + gor.FACTORIZATION_SCHEMA_V1
        + " factorization block"
    ) in messages(result)


def test_declared_trust_is_materialized_sorted_and_omitted_when_absent():
    payload = block(consumer_trust=[SECOND_NATIVE_TRUST, NATIVE_TRUST])
    materialized = entry_of(generated_registry(payload))[gor.FACTORIZATION_KEY]
    assert materialized[gor.CONSUMER_TRUST_KEY] == [NATIVE_TRUST, SECOND_NATIVE_TRUST]
    # A block that declares nothing carries no key, so a registry with no
    # declaration regenerates byte-identical.
    plain = entry_of(generated_registry(block()))[gor.FACTORIZATION_KEY]
    assert gor.CONSUMER_TRUST_KEY not in plain


def test_registry_drift_when_the_materialized_declaration_differs():
    payload = block(consumer_trust=[NATIVE_TRUST])
    registry = generated_registry(payload)
    assert gor.compare_registry_factorizations(registry, meta_for(payload), BUILD) == []

    entry_of(registry)[gor.FACTORIZATION_KEY][gor.CONSUMER_TRUST_KEY] = [
        SECOND_NATIVE_TRUST
    ]
    drift = gor.compare_registry_factorizations(registry, meta_for(payload), BUILD)
    assert len(drift) == 1
    assert drift[0].startswith(
        OID + ": materialized factorization key 'consumer_trust'"
    )
    assert SECOND_NATIVE_TRUST in drift[0] and NATIVE_TRUST in drift[0]


def test_registry_drift_when_the_materialized_declaration_is_missing_or_extra():
    payload = block(consumer_trust=[NATIVE_TRUST])
    registry = generated_registry(payload)
    del entry_of(registry)[gor.FACTORIZATION_KEY][gor.CONSUMER_TRUST_KEY]
    drift = gor.compare_registry_factorizations(registry, meta_for(payload), BUILD)
    assert len(drift) == 1
    assert "'consumer_trust'" in drift[0] and NATIVE_TRUST in drift[0]

    # ... and a declaration on the registry that the reviewed block does not
    # make is drift in the other direction.
    plain = block()
    registry = generated_registry(plain)
    entry_of(registry)[gor.FACTORIZATION_KEY][gor.CONSUMER_TRUST_KEY] = [NATIVE_TRUST]
    drift = gor.compare_registry_factorizations(registry, meta_for(plain), BUILD)
    assert len(drift) == 1
    assert "'consumer_trust'" in drift[0] and NATIVE_TRUST in drift[0]


def test_registry_drift_when_the_registry_declares_a_null_the_metadata_omits():
    """Auditor #7524: optional-key PRESENCE is compared, not only the value.

    ``want.get(key) == got.get(key)`` read a registry-only
    ``"consumer_trust": null`` as agreement with an absent key, because both
    sides answered None.  A materialized key only one side carries is drift.
    """
    plain = block()
    registry = generated_registry(plain)
    assert gor.CONSUMER_TRUST_KEY not in entry_of(registry)[gor.FACTORIZATION_KEY]
    entry_of(registry)[gor.FACTORIZATION_KEY][gor.CONSUMER_TRUST_KEY] = None
    drift = gor.compare_registry_factorizations(registry, meta_for(plain), BUILD)
    assert len(drift) == 1
    assert "'" + gor.CONSUMER_TRUST_KEY + "'" in drift[0]
    assert "(absent)" in drift[0]

    # ... and the mirror image: a metadata-only declaration the registry omits.
    declaring_payload = block(consumer_trust=[NATIVE_TRUST])
    registry = generated_registry(declaring_payload)
    del entry_of(registry)[gor.FACTORIZATION_KEY][gor.CONSUMER_TRUST_KEY]
    drift = gor.compare_registry_factorizations(
        registry, meta_for(declaring_payload), BUILD
    )
    assert len(drift) == 1
    assert "(absent)" in drift[0] and NATIVE_TRUST in drift[0]


def test_the_console_line_reports_declared_trust_only_when_there_is_some():
    declared = run(
        block(consumer_trust=[NATIVE_TRUST]),
        backend(closures=closures_with(COORDINATOR)),
        declarable=RECORDED_CLOSURE,
    )
    assert "1 with declared consumer_trust (" + NATIVE_TRUST + ")" in (
        gor.factorization_line(declared)
    )

    plain = run(block(), declarable=RECORDED_CLOSURE)
    assert plain["summary"]["declared_trust"] == {"blocks": 0, "axioms": []}
    assert "declared consumer_trust" not in gor.factorization_line(plain)


# -- the same thing at the COMMAND level, over a copy of proof-status --------


def declare_consumer_trust(status: Path, obligation_id: str, names: list) -> None:
    """Add a ``consumer_trust`` declaration to the injected block on the copy."""
    path = status / gor.META_NAME
    meta = json.loads(path.read_text(encoding="utf-8"))
    meta[obligation_id][gor.FACTORIZATION_KEY][gor.CONSUMER_TRUST_KEY] = list(names)
    path.write_text(
        json.dumps(meta, indent=2, sort_keys=True, ensure_ascii=False) + "\n",
        encoding="utf-8",
    )


def drop_consumer_trust(status: Path, obligation_id: str) -> None:
    path = status / gor.META_NAME
    meta = json.loads(path.read_text(encoding="utf-8"))
    meta[obligation_id][gor.FACTORIZATION_KEY].pop(gor.CONSUMER_TRUST_KEY, None)
    path.write_text(
        json.dumps(meta, indent=2, sort_keys=True, ensure_ascii=False) + "\n",
        encoding="utf-8",
    )


def native_trust_backend(old_symbol: str) -> gor.MappingBackend:
    """Both declared names on consumer-side hops of the migrated fixture."""
    return migration_backend(
        old_symbol,
        closure_overrides={
            MIGRATED_COORDINATOR: list(CONSUMER_CLOSURE) + [NATIVE_TAGGED],
            MIGRATED_ELIMINATOR: list(CONSUMER_CLOSURE) + [SECOND_NATIVE_TAGGED],
        },
    )


def test_command_level_declared_trust_generates_and_is_drift_checked(tmp_path, capsys):
    status = copy_proof_status(tmp_path)
    entry = first_reachable_entry(status)
    old_symbol = entry["lean_decl"]
    obligation_id = entry["id"]

    inject_factorization(status, obligation_id, old_symbol)
    # Both names ARE in the copy's own baseline/axioms.txt.
    recorded = gor.read_declarable_trust(status / "baseline")
    assert recorded is not None
    assert {NATIVE_TRUST, SECOND_NATIVE_TRUST} <= recorded
    declare_consumer_trust(
        status, obligation_id, [SECOND_NATIVE_TRUST, NATIVE_TRUST]
    )
    backend_obj = native_trust_backend(old_symbol)
    exports = renamed_exports(status, old_symbol)

    assert run_generate(status, backend_obj, exports) == 0
    out = capsys.readouterr().out
    # ONE block declaring TWO names.
    assert (
        "1 with declared consumer_trust ("
        + NATIVE_TRUST + ", " + SECOND_NATIVE_TRUST + ")"
    ) in out

    registry = read_status_json(status, gor.REGISTRY_NAME)
    migrated = [item for item in registry["obligations"] if item["id"] == obligation_id]
    assert len(migrated) == 1
    assert migrated[0][gor.FACTORIZATION_KEY][gor.CONSUMER_TRUST_KEY] == [
        NATIVE_TRUST, SECOND_NATIVE_TRUST
    ]
    assert run_command_check(status, backend_obj, exports) == 0
    capsys.readouterr()

    # Editing the MATERIALIZED list on the committed registry is drift.
    registry = read_status_json(status, gor.REGISTRY_NAME)
    for item in registry["obligations"]:
        if item["id"] == obligation_id:
            item[gor.FACTORIZATION_KEY][gor.CONSUMER_TRUST_KEY] = [NATIVE_TRUST]
    (status / gor.REGISTRY_NAME).write_text(
        gor.dump_canonical(registry), encoding="utf-8"
    )
    assert run_command_check(status, backend_obj, exports) == 1
    out = capsys.readouterr().out
    assert obligation_id in out
    assert gor.CONSUMER_TRUST_KEY in out


def test_command_level_generate_refuses_a_declaration_without_a_recorded_closure(
    tmp_path, capsys
):
    status = copy_proof_status(tmp_path)
    entry = first_reachable_entry(status)
    old_symbol = entry["lean_decl"]
    obligation_id = entry["id"]

    inject_factorization(status, obligation_id, old_symbol)
    declare_consumer_trust(status, obligation_id, [NATIVE_TRUST])
    (status / "baseline" / gor.BASELINE_AXIOMS_FILE).unlink()
    backend_obj = native_trust_backend(old_symbol)
    exports = renamed_exports(status, old_symbol)
    before = output_bytes(status)

    assert run_generate(status, backend_obj, exports) == 1
    err = capsys.readouterr().err
    assert "cannot verify consumer_trust" in err
    assert obligation_id in err
    assert_outputs_unchanged(status, before)

    # The SAME copy, with no declaration, still generates: an unreadable
    # recorded closure only ever refuses a block that declares trust.
    drop_consumer_trust(status, obligation_id)
    assert run_generate(status, migration_backend(old_symbol), exports) == 0


# -- the FRESH mode of the same command (W3-0e-fix-2, auditor #7524) --------
#
# ``generate --fresh`` is the documented regeneration command, and --fresh and
# --baseline are mutually exclusive: the command is never TOLD a baseline
# directory.  It nevertheless gates declared trust against the RECORDED closure,
# read from the reviewed copy kept with the OUTPUT tree at
# ``<out>/baseline/axioms.txt``.  Nothing travels with the roster records: the
# ``export_source`` seam is a 2-tuple in every mode, and no live axioms export
# is run by ``generate --fresh`` or by ``check`` at all.


def run_generate_fresh(status: Path, backend_obj, exports) -> int:
    """The documented regeneration command: ``generate --fresh --out <dir>``."""
    return gor.main(
        [
            "generate",
            "--fresh",
            "--out", str(status),
            "--strict-meta",
        ],
        backend_factory=lambda: backend_obj,
        export_source=lambda: exports,
    )


def write_recorded_closure(status: Path, names: list) -> None:
    """Replace the copy's RECORDED closure with exactly ``names``."""
    lines = [
        "axioms reported by `#print axioms "
        + gor.PUBLISH_TARGET
        + "` ("
        + str(len(names))
        + "):"
    ]
    lines.extend("      core  " + name for name in names)
    (status / "baseline" / gor.BASELINE_AXIOMS_FILE).write_text(
        "\n".join(lines) + "\n\n", encoding="utf-8"
    )


def coordinator_trust_backend(old_symbol: str, axiom=NATIVE_TAGGED) -> gor.MappingBackend:
    """One consumer-side carrier, so ONE declared name pays for itself."""
    return migration_backend(
        old_symbol,
        closure_overrides={MIGRATED_COORDINATOR: list(CONSUMER_CLOSURE) + [axiom]},
    )


def test_w3_0e_fresh_generate_accepts_a_name_the_recorded_closure_carries(
    tmp_path, capsys
):
    status = copy_proof_status(tmp_path)
    entry = first_reachable_entry(status)
    old_symbol = entry["lean_decl"]
    obligation_id = entry["id"]

    inject_factorization(status, obligation_id, old_symbol)
    declare_consumer_trust(status, obligation_id, [NATIVE_TRUST])
    # The RECORDED closure kept with the OUTPUT tree is what --fresh reads, and
    # the committed proof-status/baseline/axioms.txt does carry the name.
    recorded = gor.read_declarable_trust(status / "baseline")
    assert recorded is not None and NATIVE_TRUST in recorded
    backend_obj = coordinator_trust_backend(old_symbol)
    exports = renamed_exports(status, old_symbol)
    assert len(exports) == 2

    assert run_generate_fresh(status, backend_obj, exports) == 0
    out = capsys.readouterr().out
    assert "1 with declared consumer_trust (" + NATIVE_TRUST + ")" in out

    # The registry WAS written, and it carries the materialized declaration.
    registry = read_status_json(status, gor.REGISTRY_NAME)
    migrated = [item for item in registry["obligations"] if item["id"] == obligation_id]
    assert len(migrated) == 1
    assert migrated[0][gor.FACTORIZATION_KEY][gor.CONSUMER_TRUST_KEY] == [NATIVE_TRUST]


def test_w3_0e_fresh_generate_rejects_a_name_the_recorded_closure_does_not_carry(
    tmp_path, capsys
):
    status = copy_proof_status(tmp_path)
    entry = first_reachable_entry(status)
    old_symbol = entry["lean_decl"]
    obligation_id = entry["id"]

    inject_factorization(status, obligation_id, old_symbol)
    declare_consumer_trust(status, obligation_id, [CORE_TAGGED_NATIVE[1]])
    backend_obj = coordinator_trust_backend(old_symbol, axiom=CORE_TAGGED_NATIVE)
    # The recorded closure carries the OTHER native name, not the declared one.
    recorded = gor.read_declarable_trust(status / "baseline")
    assert recorded is not None and CORE_TAGGED_NATIVE[1] not in recorded
    exports = renamed_exports(status, old_symbol)
    before = output_bytes(status)

    assert run_generate_fresh(status, backend_obj, exports) == 1
    err = capsys.readouterr().err
    assert (
        obligation_id + ": consumer_trust lists " + CORE_TAGGED_NATIVE[1]
        + ", which the publish target's recorded closure does not carry"
    ) in err
    # Not accepted, so the hop carrying it is refused as well, and nothing was
    # written: the hard gate is taken before any output file is touched.
    assert "axiom closure contains " + CORE_TAGGED_NATIVE[1] in err
    assert_outputs_unchanged(status, before)


def test_w3_0e_fresh_generate_never_trusts_a_live_consumer_closure(
    tmp_path, capsys
):
    """Auditor #7524 blocker: --fresh must gate on the RECORDED closure ONLY.

    The LIVE closure of this run is exactly what the injected backend reports,
    and a consumer-side hop of it carries ``Lean.ofReduceBool``.  The RECORDED
    closure does NOT, so the declaration is refused even though the tree being
    regenerated really does carry the axiom.  W3-0e-fix (00f0d377) authorized
    declarations against a live ``proof-blueprint axioms`` export and, driven
    through that live-export seam, accepted and materialized such a block
    (verifier probe).  This test injects the two-tuple export seam, so against
    00f0d377 it fails on the violation message, not on an acceptance; the
    decisive pre-fix failure is the seam-is-gone test below.
    """
    status = copy_proof_status(tmp_path)
    entry = first_reachable_entry(status)
    old_symbol = entry["lean_decl"]
    obligation_id = entry["id"]

    inject_factorization(status, obligation_id, old_symbol)
    exports = renamed_exports(status, old_symbol)
    assert len(exports) == 2

    # Pre-seed the OUT tree with a registry THIS tool wrote, so the byte
    # comparison below is against a prior successful --fresh run.
    assert run_generate_fresh(status, migration_backend(old_symbol), exports) == 0
    capsys.readouterr()

    # LIVE: the consumer-side coordinator carries the axiom.
    backend_obj = coordinator_trust_backend(old_symbol)
    assert NATIVE_TAGGED in backend_obj.axioms(MIGRATED_COORDINATOR)
    # RECORDED: it does not.
    write_recorded_closure(status, ["propext", "Classical.choice", "Quot.sound"])
    recorded = gor.read_declarable_trust(status / "baseline")
    assert recorded is not None and NATIVE_TRUST not in recorded
    declare_consumer_trust(status, obligation_id, [NATIVE_TRUST])
    before = output_bytes(status)

    assert run_generate_fresh(status, backend_obj, exports) == 1
    err = capsys.readouterr().err
    assert (
        obligation_id + ": consumer_trust lists " + NATIVE_TRUST
        + ", which the publish target's recorded closure does not carry"
    ) in err
    assert_outputs_unchanged(status, before)


def test_w3_0e_fresh_generate_without_a_recorded_closure_is_cannot_verify(
    tmp_path, capsys
):
    """No <out>/baseline/axioms.txt: "cannot verify", and nothing is written."""
    status = copy_proof_status(tmp_path)
    entry = first_reachable_entry(status)
    old_symbol = entry["lean_decl"]
    obligation_id = entry["id"]

    inject_factorization(status, obligation_id, old_symbol)
    declare_consumer_trust(status, obligation_id, [NATIVE_TRUST])
    (status / "baseline" / gor.BASELINE_AXIOMS_FILE).unlink()
    backend_obj = coordinator_trust_backend(old_symbol)
    exports = renamed_exports(status, old_symbol)
    before = output_bytes(status)

    assert run_generate_fresh(status, backend_obj, exports) == 1
    err = capsys.readouterr().err
    assert "cannot verify consumer_trust" in err
    # The message is source-neutral and NAMES the file it could not read.
    assert str(status / "baseline" / gor.BASELINE_AXIOMS_FILE) in err
    assert obligation_id in err
    assert_outputs_unchanged(status, before)

    # The SAME fresh run with no declaration still generates: a closure that
    # could not be read only ever refuses a block that declares trust.
    drop_consumer_trust(status, obligation_id)
    assert run_generate_fresh(status, migration_backend(old_symbol), exports) == 0


def test_w3_0e_the_live_axioms_export_seam_is_gone(tmp_path):
    """The whole live-closure export is REMOVED, not merely unused (#7524).

    ``gather_exports`` hands back the two roster record lists and nothing else,
    in both modes, so neither ``generate --fresh`` nor ``check`` can run
    ``proof-blueprint axioms`` for the publish target.
    """
    for name in ("export_live_closure", "AXIOMS_ARGS", "ExportBundle",
                 "normalize_exports"):
        assert not hasattr(gor, name), name + " must be removed"
    spine, offspine = gor.gather_exports(PROOF_STATUS / "baseline", False, tmp_path)
    assert isinstance(spine, list) and isinstance(offspine, list)
