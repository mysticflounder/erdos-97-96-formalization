"""W3-0 adversarial tests for the Legacy-exception and dated-graph rules of
`scripts/lint_cluster_imports.py`.

Every test builds a synthetic Lean tree and synthetic JSON records under
`tmp_path` and points the lint at them through `configure_paths`.  Nothing here
reads the live repository tree, the real waiver file, the frozen Phase 0 record
or the obligation database, and no fixture names a real obligation id: the
declarations these rules will eventually govern do not exist yet, so a test that
touched live data would be asserting against a moving target.

The cases are adversarial by design.  Each one is a way the Legacy escape hatch
could be widened into a general exemption -- a Legacy-looking name at the wrong
depth, a wrapper importing something nobody approved, a manifest row that
outlives its edge, a waiver that outlives the wrapper that retired it -- and
each asserts the lint refuses.

No regular expressions anywhere: JSON is parsed with `json`, and module names
are compared as whole strings.
"""

from __future__ import annotations

import json
import os
import sys

import pytest

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

# The import has to follow the path insert above: the lint lives beside this
# test, not in an installed package.
import lint_cluster_imports as lint

NS = "Erdos9796Proof.P97.ATail.FrontierLiveClosure"
LEGACY = NS + ".Legacy"

SHARED_CORE = NS + ".SharedCore"
RIGID_ALPHA = NS + ".Rigid221Alpha"
TRIAPEX_BETA = NS + ".TriApexBeta"
LEGACY_BRIDGE = LEGACY + ".Rigid221Bridge"

FAKE_HEAD = "0123abcd"
FAKE_FULL_HEAD = "0123abcd" * 5  # 40 hex characters


# --------------------------------------------------------------------------
# Fixture construction
# --------------------------------------------------------------------------


class Fixture:
    """A throwaway repository: a Lean tree plus the three JSON records."""

    def __init__(self, root):
        self.root = str(root)
        self.modules = {}
        os.makedirs(os.path.join(self.root, "proof-status"), exist_ok=True)
        # `main` refuses to run without the cluster directory itself.
        os.makedirs(
            os.path.join(
                self.root,
                "lean",
                "Erdos9796Proof",
                "P97",
                "ATail",
                "FrontierLiveClosure",
            ),
            exist_ok=True,
        )

    # -- Lean tree ---------------------------------------------------------

    def module(self, name, imports=()):
        """Write `lean/<path>.lean` for the module `name` with a real header."""
        parts = name.split(".")
        directory = os.path.join(self.root, "lean", *parts[:-1])
        os.makedirs(directory, exist_ok=True)
        path = os.path.join(directory, parts[-1] + ".lean")
        header = "".join("import %s\n" % target for target in imports)
        with open(path, "w", encoding="utf-8") as handle:
            handle.write(header + "\nnamespace Fixture\n\nend Fixture\n")
        self.modules[name] = list(imports)
        return path

    def base_tree(self):
        """The clean tree every test starts from: no forbidden edge at all."""
        self.module(SHARED_CORE, [])
        self.module(TRIAPEX_BETA, [SHARED_CORE])
        self.module(RIGID_ALPHA, [SHARED_CORE])
        self.module(NS, [SHARED_CORE])
        return self

    # -- Scanning ----------------------------------------------------------

    def activate(self):
        lint.configure_paths(self.root)
        return self

    def scan(self):
        self.activate()
        return lint.collect_edges()

    # -- JSON records ------------------------------------------------------

    def path(self, name):
        return os.path.join(self.root, "proof-status", name)

    def write_json(self, name, document):
        with open(self.path(name), "w", encoding="utf-8") as handle:
            handle.write(json.dumps(document, indent=2, sort_keys=True) + "\n")
        return self.path(name)

    def freeze(self, edges=None, extra_rows=(), base_head=FAKE_HEAD):
        """Write the frozen graph record from the live scan, plus `extra_rows`."""
        if edges is None:
            edges = self.scan()
        rows = [
            {
                "class": edge["class"],
                "from": edge["from"],
                "from_cluster": edge["from_cluster"],
                "from_file": edge["from_file"],
                "line": edge["line"],
                "to": edge["to"],
                "to_cluster": edge["to_cluster"],
            }
            for edge in edges
        ]
        rows.extend(extra_rows)
        return self.write_json(
            "cluster-import-edges.json",
            {
                "base_head": base_head,
                "edges": rows,
                "schema": "cluster-import-edges/v1",
            },
        )

    def frozen_classes(self):
        with open(self.path("cluster-import-edges.json"), encoding="utf-8") as handle:
            document = json.load(handle)
        classes = {}
        for row in document["edges"]:
            classes[(row["from"], row["to"])] = row["class"]
        return classes

    def waivers(self, rows=()):
        """Write the waiver file with a summary that matches its own rows."""
        rows = list(rows)
        classes = self.frozen_classes()
        by_class = {}
        by_retirement = {}
        for row in rows:
            retirement = row["planned_retirement"]
            by_retirement[retirement] = by_retirement.get(retirement, 0) + 1
            recorded = classes.get((row["from"], row["to"]))
            if recorded is not None:
                by_class[recorded] = by_class.get(recorded, 0) + 1
        return self.write_json(
            "import-waivers.json",
            {
                "base_head": FAKE_HEAD,
                "schema": "import-waivers/v1",
                "summary": {
                    "by_class": by_class,
                    "by_planned_retirement": by_retirement,
                    "waivers": len(rows),
                },
                "waivers": rows,
            },
        )

    def legacy(self, rows=(), base_head=FAKE_HEAD, digest=None):
        if digest is None:
            digest = lint.file_digest(self.path("cluster-import-edges.json"))
        return self.write_json(
            "legacy-import-exceptions.json",
            {
                "base_head": base_head,
                "exceptions": list(rows),
                "frozen_graph_sha256": digest,
                "schema": "legacy-import-exceptions/v1",
            },
        )

    # -- Running -----------------------------------------------------------

    def run(self, argv=()):
        self.activate()
        return lint.main(list(argv))


def module_path(name):
    """Repository-relative path of a fixture module, as the lint prints it."""
    return os.path.join("lean", *name.split(".")) + ".lean"


def waiver_row(source, target, retirement="W3", reason="fixture"):
    return {
        "from": source,
        "planned_retirement": retirement,
        "reason": reason,
        "to": target,
    }


def legacy_row(wrapper, source, target, waiver_pair=None, wave="W3"):
    """A manifest row whose `class` is whatever the live classifier says."""
    return {
        "added_wave": wave,
        "class": lint.classify(lint.cluster_of(source), lint.cluster_of(target)),
        "from": source,
        "reason": "fixture wrapper",
        "to": target,
        "waiver_pair": waiver_pair,
        "wrapper_module": wrapper,
    }


@pytest.fixture
def repo(tmp_path):
    """A fixture repository; the real repository paths are restored after."""
    original = lint.REPO_ROOT
    try:
        yield Fixture(tmp_path)
    finally:
        lint.configure_paths(original)


def clean_legacy_repo(repo):
    """Base tree plus one approved wrapper edge, fully listed and passing."""
    repo.base_tree()
    repo.module(LEGACY_BRIDGE, [SHARED_CORE])
    repo.freeze()
    repo.waivers([])
    repo.legacy([legacy_row(LEGACY_BRIDGE, LEGACY_BRIDGE, SHARED_CORE)])
    return repo


# --------------------------------------------------------------------------
# Classification
# --------------------------------------------------------------------------


def test_directory_component_classification():
    """A cluster directory owns its modules; the prefix rule is unchanged."""
    # A whole dotted component that names a cluster wins, even though the
    # basename `Coordinator` carries no cluster name at all.
    assert lint.cluster_of(NS + ".TwoDeletion.Coordinator") == "TwoDeletion"
    assert lint.cluster_of(NS + ".TwoSource.Sub.Deep") == "TwoSource"
    # The pre-existing basename-prefix rule still applies.
    assert lint.cluster_of(NS + ".TwoDeletionFoo") == "TwoDeletion"
    # And it still matches the FINAL component only, so a cluster name buried
    # inside a longer basename does not capture the module.
    assert lint.cluster_of(NS + ".ExactTwelveRigid221Ingress") == "shared"
    # `TwoDeletionFoo` is not the component `TwoDeletion`: substring matching
    # on path components would classify this Rigid221 module as TwoDeletion.
    assert lint.cluster_of(NS + ".TwoDeletionFoo.Rigid221Leaf") == "Rigid221"


def test_directory_component_classification_is_enforced_end_to_end(repo, capsys):
    """A cluster-directory module importing another cluster is a violation."""
    coordinator = NS + ".TwoDeletion.Coordinator"
    repo.base_tree()
    repo.module(coordinator, [SHARED_CORE, TRIAPEX_BETA])
    repo.freeze()
    repo.waivers([])
    repo.legacy([])

    assert repo.run() == 1
    captured = capsys.readouterr()
    # The violation is reported against the coordinator's own file, and the
    # cluster pair proves the directory component decided the ownership: by
    # the basename rule alone `Coordinator` would have been `shared`.
    assert module_path(coordinator) in captured.err
    assert "(TwoDeletion -> TriApex, cross-cluster)" in captured.err


# --------------------------------------------------------------------------
# The Legacy exemption is not a name pattern
# --------------------------------------------------------------------------


def test_legacyish_modules_get_no_exemption(repo, capsys):
    """`LegacyWrappers` and a deeper `Legacy` component are ordinary modules."""
    wrong_name = NS + ".LegacyWrappers"
    wrong_depth = NS + ".Foo.Legacy.Bar"
    assert not lint.is_legacy_module(wrong_name)
    assert not lint.is_legacy_module(wrong_depth)
    assert not lint.is_legacy_module(LEGACY)  # the namespace itself is not a wrapper

    repo.base_tree()
    # Both modules are Rigid221 by the basename rule and import TriApex, so
    # each edge is cross-cluster.  Neither is a Legacy edge.
    repo.module(wrong_name + ".Rigid221Leaf", [TRIAPEX_BETA])
    repo.module(wrong_depth + ".Rigid221Leaf", [TRIAPEX_BETA])
    repo.freeze()
    repo.waivers([])
    # Even an explicit manifest row cannot rescue them: the row is rejected
    # because its wrapper_module is not under the Legacy namespace, and it
    # matches no Legacy edge.
    repo.legacy(
        [
            legacy_row(
                wrong_name + ".Rigid221Leaf",
                wrong_name + ".Rigid221Leaf",
                TRIAPEX_BETA,
            )
        ]
    )

    assert repo.run() == 1
    captured = capsys.readouterr()
    assert "is not under " + LEGACY in captured.err
    assert "2 non-waived forbidden import edges" in captured.err
    assert module_path(wrong_name + ".Rigid221Leaf") in captured.err
    assert module_path(wrong_depth + ".Rigid221Leaf") in captured.err
    # The manifest row is rejected AND matches nothing live.
    assert "stale -- no such Legacy edge in the live tree" in captured.err
    # No edge was ever treated as Legacy: nothing was printed as approved.
    assert "legacy " not in captured.out


def test_approved_wrapper_importing_unlisted_target_fails(repo, capsys):
    """Listing one edge of a wrapper does not license its other edges."""
    repo.base_tree()
    repo.module(LEGACY_BRIDGE, [SHARED_CORE, TRIAPEX_BETA])
    repo.freeze()
    repo.waivers([])
    repo.legacy([legacy_row(LEGACY_BRIDGE, LEGACY_BRIDGE, SHARED_CORE)])

    assert repo.run() == 1
    captured = capsys.readouterr()
    assert (
        "unlisted Legacy edge %s -> %s" % (LEGACY_BRIDGE, TRIAPEX_BETA)
    ) in captured.err
    # The approved edge is still reported as approved.
    assert ("legacy %s -> %s" % (LEGACY_BRIDGE, SHARED_CORE)) in captured.out


def test_listed_legacy_edge_passes_and_is_printed(repo, capsys):
    """An approved wrapper edge passes, is never silent, and is summarised."""
    clean_legacy_repo(repo)

    assert repo.run() == 0
    captured = capsys.readouterr()
    assert (
        "legacy %s -> %s (to-shared) %s:1 wrapper=%s"
        % (
            LEGACY_BRIDGE,
            SHARED_CORE,
            os.path.join(
                "lean",
                "Erdos9796Proof",
                "P97",
                "ATail",
                "FrontierLiveClosure",
                "Legacy",
                "Rigid221Bridge.lean",
            ),
            LEGACY_BRIDGE,
        )
    ) in captured.out
    assert "1 legacy edge, all listed." in captured.out


def test_list_legacy_prints_a_count_header(repo, capsys):
    clean_legacy_repo(repo)

    assert repo.run(["--list-legacy"]) == 0
    captured = capsys.readouterr()
    assert "legacy edges (1):" in captured.out


def test_fail_on_legacy_rejects_a_listed_edge(repo, capsys):
    """The migration-complete check refuses even an approved wrapper edge."""
    clean_legacy_repo(repo)
    assert repo.run() == 0
    capsys.readouterr()

    assert repo.run(["--fail-on-legacy"]) == 1
    captured = capsys.readouterr()
    assert "--fail-on-legacy: Legacy edge %s -> %s" % (
        LEGACY_BRIDGE,
        SHARED_CORE,
    ) in captured.err


# --------------------------------------------------------------------------
# Manifest row hygiene
# --------------------------------------------------------------------------


def test_stale_manifest_row_fails(repo, capsys):
    """A row whose edge no longer exists must be deleted, not left behind."""
    repo.base_tree()
    repo.module(LEGACY_BRIDGE, [SHARED_CORE])
    repo.freeze()
    repo.waivers([])
    repo.legacy(
        [
            legacy_row(LEGACY_BRIDGE, LEGACY_BRIDGE, SHARED_CORE),
            # This edge was retired; the row was not.
            legacy_row(LEGACY_BRIDGE, LEGACY_BRIDGE, TRIAPEX_BETA),
        ]
    )

    assert repo.run() == 1
    captured = capsys.readouterr()
    assert "stale -- no such Legacy edge in the live tree" in captured.err
    assert TRIAPEX_BETA in captured.err


def test_duplicate_manifest_rows_fail(repo, capsys):
    """Two rows for one (wrapper_module, from, to) are a bookkeeping error."""
    repo.base_tree()
    repo.module(LEGACY_BRIDGE, [SHARED_CORE])
    repo.freeze()
    repo.waivers([])
    row = legacy_row(LEGACY_BRIDGE, LEGACY_BRIDGE, SHARED_CORE)
    repo.legacy([row, dict(row)])

    assert repo.run() == 1
    captured = capsys.readouterr()
    assert "duplicate legacy exception row" in captured.err


def test_manifest_class_mismatch_fails(repo, capsys):
    """A row may not record a class the live classifier disagrees with."""
    repo.base_tree()
    repo.module(LEGACY_BRIDGE, [TRIAPEX_BETA])
    repo.freeze()
    repo.waivers([])
    row = legacy_row(LEGACY_BRIDGE, LEGACY_BRIDGE, TRIAPEX_BETA)
    assert row["class"] == "cross-cluster"
    row["class"] = "to-shared"  # the comfortable lie
    repo.legacy([row])

    assert repo.run() == 1
    captured = capsys.readouterr()
    assert "'class' is \"to-shared\"" in captured.err
    assert "recomputes 'cross-cluster'" in captured.err


def test_unknown_added_wave_fails(repo, capsys):
    repo.base_tree()
    repo.module(LEGACY_BRIDGE, [SHARED_CORE])
    repo.freeze()
    repo.waivers([])
    repo.legacy(
        [legacy_row(LEGACY_BRIDGE, LEGACY_BRIDGE, SHARED_CORE, wave="W9")]
    )

    assert repo.run() == 1
    captured = capsys.readouterr()
    assert "'added_wave' is \"W9\"" in captured.err


# --------------------------------------------------------------------------
# Waiver linkage
# --------------------------------------------------------------------------


def test_waiver_pair_naming_a_missing_waiver_fails(repo, capsys):
    """A dangling cross-reference is a failure, not a null."""
    repo.base_tree()
    repo.module(LEGACY_BRIDGE, [SHARED_CORE])
    repo.freeze()
    repo.waivers([])
    repo.legacy(
        [
            legacy_row(
                LEGACY_BRIDGE,
                LEGACY_BRIDGE,
                SHARED_CORE,
                waiver_pair=[RIGID_ALPHA, TRIAPEX_BETA],
            )
        ]
    )

    assert repo.run() == 1
    captured = capsys.readouterr()
    assert "names no row in import-waivers.json" in captured.err


def test_waiver_retired_through_legacy_wrapper_is_reported_stale(repo, capsys):
    """The waiver row must be deleted in the commit that lands the wrapper."""
    # The frozen record remembers the direct Rigid221 -> TriApex edge, and the
    # waiver file still waives it, but the live tree routes through the
    # wrapper instead: the direct edge is gone.
    repo.base_tree()
    repo.module(RIGID_ALPHA, [SHARED_CORE, LEGACY_BRIDGE])
    repo.module(LEGACY_BRIDGE, [TRIAPEX_BETA])
    retired = {
        "class": "cross-cluster",
        "from": RIGID_ALPHA,
        "from_cluster": "Rigid221",
        "from_file": "lean/fixture/Rigid221Alpha.lean",
        "line": 3,
        "to": TRIAPEX_BETA,
        "to_cluster": "TriApex",
    }
    repo.freeze(extra_rows=[retired])
    repo.waivers([waiver_row(RIGID_ALPHA, TRIAPEX_BETA)])
    repo.legacy(
        [
            legacy_row(LEGACY_BRIDGE, RIGID_ALPHA, LEGACY_BRIDGE),
            legacy_row(
                LEGACY_BRIDGE,
                LEGACY_BRIDGE,
                TRIAPEX_BETA,
                waiver_pair=[RIGID_ALPHA, TRIAPEX_BETA],
            ),
        ]
    )

    assert repo.run() == 1
    captured = capsys.readouterr()
    assert (
        "waiver %s -> %s is stale: edge retired through Legacy wrapper %s"
        % (RIGID_ALPHA, TRIAPEX_BETA, LEGACY_BRIDGE)
    ) in captured.err


def test_live_waiver_named_by_a_manifest_row_still_passes(repo, capsys):
    """While the direct edge is still live and waived, the linkage is clean."""
    repo.base_tree()
    repo.module(RIGID_ALPHA, [SHARED_CORE, TRIAPEX_BETA, LEGACY_BRIDGE])
    repo.module(LEGACY_BRIDGE, [TRIAPEX_BETA])
    repo.freeze()
    repo.waivers([waiver_row(RIGID_ALPHA, TRIAPEX_BETA)])
    repo.legacy(
        [
            legacy_row(LEGACY_BRIDGE, RIGID_ALPHA, LEGACY_BRIDGE),
            legacy_row(
                LEGACY_BRIDGE,
                LEGACY_BRIDGE,
                TRIAPEX_BETA,
                waiver_pair=[RIGID_ALPHA, TRIAPEX_BETA],
            ),
        ]
    )

    assert repo.run() == 0
    captured = capsys.readouterr()
    assert "1 forbidden edges, all waived by 1 authenticated waiver" in captured.out
    assert "2 legacy edges, all listed." in captured.out


# --------------------------------------------------------------------------
# Frozen record and manifest authentication (exit 2: cannot run)
# --------------------------------------------------------------------------


def test_malformed_frozen_row_exits_2(repo, capsys):
    repo.base_tree()
    repo.freeze(
        extra_rows=[
            {
                "class": "cross-cluster",
                "from": RIGID_ALPHA,
                "from_cluster": "Rigid221",
                "from_file": "lean/fixture/Rigid221Alpha.lean",
                "line": "three",  # not an integer
                "to": TRIAPEX_BETA,
                "to_cluster": "TriApex",
            }
        ]
    )
    repo.waivers([])
    repo.legacy([])

    assert repo.run() == 2
    assert "needs a positive integer 'line'" in capsys.readouterr().err


def test_duplicate_frozen_rows_exit_2(repo, capsys):
    repo.base_tree()
    edges = repo.scan()
    duplicate = {
        "class": edges[0]["class"],
        "from": edges[0]["from"],
        "from_cluster": edges[0]["from_cluster"],
        "from_file": edges[0]["from_file"],
        "line": edges[0]["line"],
        "to": edges[0]["to"],
        "to_cluster": edges[0]["to_cluster"],
    }
    repo.freeze(edges=edges, extra_rows=[duplicate])
    repo.waivers([])
    repo.legacy([])

    assert repo.run() == 2
    assert "duplicates the row" in capsys.readouterr().err


def test_frozen_graph_sha256_mismatch_exits_2(repo, capsys):
    repo.base_tree()
    repo.freeze()
    repo.waivers([])
    repo.legacy([], digest="0" * 64)

    assert repo.run() == 2
    captured = capsys.readouterr()
    assert "written against a different authentication basis" in captured.err


def test_manifest_base_head_format_exits_2(repo, capsys):
    repo.base_tree()
    repo.freeze()
    repo.waivers([])
    repo.legacy([], base_head="HEAD")

    assert repo.run() == 2
    assert "expected 8 lowercase hex characters" in capsys.readouterr().err


def test_frozen_class_disagreement_exits_1(repo, capsys):
    """A frozen class the live tree recomputes differently is a failure."""
    repo.base_tree()
    edges = repo.scan()
    rows = []
    for edge in edges:
        row = {
            "class": edge["class"],
            "from": edge["from"],
            "from_cluster": edge["from_cluster"],
            "from_file": edge["from_file"],
            "line": edge["line"],
            "to": edge["to"],
            "to_cluster": edge["to_cluster"],
        }
        if edge["from"] == RIGID_ALPHA:
            row["class"] = "intra-cluster"
        rows.append(row)
    repo.write_json(
        "cluster-import-edges.json",
        {"base_head": FAKE_HEAD, "edges": rows, "schema": "cluster-import-edges/v1"},
    )
    repo.waivers([])
    repo.legacy([])

    assert repo.run() == 1
    captured = capsys.readouterr()
    assert "records class 'intra-cluster'" in captured.err
    assert "recomputes 'to-shared'" in captured.err


# --------------------------------------------------------------------------
# Dated current graph
# --------------------------------------------------------------------------


def test_write_record_is_deterministic_and_matches_the_scan(
    repo, tmp_path, monkeypatch, capsys
):
    """Two runs produce identical bytes, and the rows are the scanned edges."""
    repo.base_tree()
    repo.module(LEGACY_BRIDGE, [SHARED_CORE])
    repo.activate()
    monkeypatch.setattr(lint, "current_head", lambda: FAKE_FULL_HEAD)

    first = str(tmp_path / "record-a.json")
    second = str(tmp_path / "record-b.json")
    assert repo.run(["--write-record", first]) == 0
    assert repo.run(["--write-record", second]) == 0
    capsys.readouterr()

    with open(first, "rb") as handle:
        first_bytes = handle.read()
    with open(second, "rb") as handle:
        second_bytes = handle.read()
    assert first_bytes == second_bytes
    assert first_bytes.endswith(b"\n")

    document = json.loads(first_bytes.decode("utf-8"))
    assert document["schema"] == "cluster-import-edges/v1"
    assert document["live_record"] is True
    assert document["generated_from_head"] == FAKE_FULL_HEAD
    assert document["note"] == (
        "dated current graph; the Phase 0 file remains the waiver "
        "authentication basis"
    )

    edges = lint.collect_edges()
    assert document["edges"] == edges
    assert document["summary"]["total_edges"] == len(edges)
    assert document["summary"]["legacy_edges"] == 1
    # Row order is the scan order: sorted by (from, to, line).
    keys = [(row["from"], row["to"], row["line"]) for row in document["edges"]]
    assert keys == sorted(keys)


def test_write_record_never_becomes_an_authentication_basis(repo, capsys):
    """A live record in place of the frozen record is refused, not accepted."""
    repo.base_tree()
    repo.freeze()
    repo.waivers([])
    repo.legacy([])
    record = os.path.join(repo.root, "proof-status", "live-record.json")
    assert repo.run(["--write-record", record]) == 0
    capsys.readouterr()

    # The live record carries no `base_head`, so it cannot stand in for the
    # frozen record even if someone points `--graph` at it.
    assert repo.run(["--graph", record]) == 2
    assert "'base_head'" in capsys.readouterr().err
