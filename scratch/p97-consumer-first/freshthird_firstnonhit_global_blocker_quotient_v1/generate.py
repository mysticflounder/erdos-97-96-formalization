#!/usr/bin/env python3
"""Generate one source-audited QF_LIA quotient wave (three ingress cases)."""
from pathlib import Path

ROOT = Path(__file__).resolve().parent
CASES = ("retained", "common", "common_sameblocker")


def decl(lines, sort, names):
    for name in names:
        lines.append(f"(declare-const {name} {sort})")


def emit(case):
    L = ["(set-logic QF_LIA)", "(set-option :produce-models true)"]
    decl(L, "Int", ["first_tag", "second_tag", "first_deleted_q", "second_deleted_q", "second_source_cap", "second_q_cap", "qrow_canonical_cap_count", "q_boundary", "qdist", "qfiber_card", "repeat_z", "repeat_w", "repeat_outcome", "ret_location"])
    decl(L, "Int", [f"b{i}" for i in range(4)] + [f"cap{i}" for i in range(4)] + [f"ov{i}" for i in range(4)])
    decl(L, "Int", ["first_ov", "second_ov", "ret_z_ov", "ret_w_ov"] + [f"common_w{i}_ov" for i in range(4)])
    decl(L, "Bool", ["first_contains_deleted", "first_deletion_survives", "second_contains_deleted", "second_deletion_survives", "second_internal_q_in_cap", "q_nonrobust", "qfiber_image_support", "ret_z_eq_q", "ret_w_eq_q", "ret_z_contains_w", "ret_w_contains_z", "common_helper_active", "qcenter_in_canonical_cap", "common_witnesses_distinct"])
    decl(L, "Bool", [f"m{i}{j}" for i in range(4) for j in range(4)])
    decl(L, "Bool", [f"srcincap{i}" for i in range(4)])
    decl(L, "Bool", [f"common_w{i}_{kind}" for i in range(4) for kind in ("source_in_cap", "off_q", "blocker_ne_q")])
    decl(L, "Bool", [f"nofix_{name}" for name in ["q0", "q1", "q2", "q3", "first", "second", "retz", "retw", "w0", "w1", "w2", "w3"]])

    # Constructor tags and their exact local alternatives.
    L += ["(assert (and (<= 0 first_tag) (<= first_tag 1)))",
          "(assert (and (<= 0 second_tag) (<= second_tag 3)))",
          "(assert (and (<= 0 first_ov) (<= first_ov 4)))",
          "(assert (and (<= 0 second_ov) (<= second_ov 4)))",
          "(assert (= (= first_tag 0) (= first_ov 4)))",
          "(assert (=> (= first_tag 1) (<= first_ov 2)))",
          "(assert (= (= second_tag 0) (= second_ov 4)))",
          "(assert (=> (= second_tag 1) (<= second_ov 2)))",
          "(assert (=> (or (= second_tag 2) (= second_tag 3)) (= second_ov 2)))",
          "(assert (and (<= 0 first_deleted_q) (<= first_deleted_q 1)))",
          "(assert (and (<= 0 second_deleted_q) (<= second_deleted_q 1)))",
          "(assert (=> (= first_tag 1) (and (not first_contains_deleted) first_deletion_survives)))",
          "(assert (=> (= second_tag 1) (and (not second_contains_deleted) second_deletion_survives)))",
          "(assert (and (<= 0 second_source_cap) (<= second_source_cap 2) (<= 0 second_q_cap) (<= second_q_cap 2)))",
          "(assert (=> (= second_tag 2) (not (= second_source_cap second_q_cap))))",
          "(assert (=> (= second_tag 3) (and (= second_source_cap second_q_cap) second_internal_q_in_cap)))"]

    # Q row deletion fan. b_i=0 means the actual blocker is qCenter.
    for i in range(4):
        L += [f"(assert (and (<= 0 cap{i}) (<= cap{i} 2)))",
              f"(assert (and (<= 0 ov{i}) (<= ov{i} 4)))",
              f"(assert m{i}{i})",
              f"(assert (= ov{i} (+ " + " ".join(f"(ite m{i}{j} 1 0)" for j in range(4)) + ")))",
              f"(assert (=> (= b{i} 0) (= ov{i} 4)))",
              f"(assert (=> (not (= b{i} 0)) (<= ov{i} 2)))",
              f"(assert (=> (= b{i} 0) q_nonrobust))"]
    # Q.source1 and Q.source2 are distinct Q-row sources with the same actual blocker.
    L += ["(assert (= b0 0))", "(assert (= b1 0))"]
    for i in range(4):
        for j in range(i + 1, 4):
            for k in range(4):
                L.append(f"(assert (=> (= b{i} b{j}) (= m{i}{k} m{j}{k})))")
    for name in ["q0", "q1", "q2", "q3", "first", "second", "retz", "retw", "w0", "w1", "w2", "w3"]:
        L.append(f"(assert nofix_{name})")

    # Exact Q fiber boundary; image=support appears only in q_boundary=0/card=4.
    L += ["(assert (and (<= 0 q_boundary) (<= q_boundary 1)))",
          "(assert (and (<= 2 qfiber_card) (<= qfiber_card 4)))",
          "(assert (and (<= 0 qdist) (<= qdist 3)))",
          "(assert (=> (= q_boundary 0) (and (= qfiber_card 4) qfiber_image_support (= b0 0) (= b1 0) (= b2 0) (= b3 0))))",
          "(assert (=> (= q_boundary 1) (and (<= qfiber_card 3) (not qfiber_image_support) (or (not (= b2 0)) (not (= b3 0))))))",
          "(assert (=> (and (= q_boundary 1) (= qdist 0)) (and (not (= b0 0)) (<= ov0 2))))",
          "(assert (=> (and (= q_boundary 1) (= qdist 1)) (and (not (= b1 0)) (<= ov1 2))))",
          "(assert (=> (and (= q_boundary 1) (= qdist 2)) (and (not (= b2 0)) (<= ov2 2))))",
          "(assert (=> (and (= q_boundary 1) (= qdist 3)) (and (not (= b3 0)) (<= ov3 2))))"]

    # Repeated blocker-cap pair, preserving independent center-cap/source-cap predicates.
    L += ["(assert (and (<= 0 repeat_z) (<= repeat_z 3) (<= 0 repeat_w) (<= repeat_w 3) (not (= repeat_z repeat_w))))",
          "(assert (and (<= 0 repeat_outcome) (<= repeat_outcome 4)))"]
    pair_arms = []
    for i in range(4):
        for j in range(4):
            if i == j:
                continue
            outcome = f"(or (and (= repeat_outcome 0) (= b{i} b{j})) (and (= repeat_outcome 1) srcincap{i}) (and (= repeat_outcome 2) srcincap{j}) (and (= repeat_outcome 3) (not m{i}{j})) (and (= repeat_outcome 4) (not m{j}{i})))"
            pair_arms.append(f"(and (= repeat_z {i}) (= repeat_w {j}) (= cap{i} cap{j}) {outcome})")
    L.append("(assert (or " + " ".join(pair_arms) + "))")

    # Retained mutual-deletion/location producer, intentionally disconnected from Q.
    L += ["(assert (and (<= 0 ret_location) (<= ret_location 3)))",
          "(assert (not (and ret_z_eq_q ret_w_eq_q)))",
          "(assert (= ret_z_eq_q (= ret_z_ov 4)))",
          "(assert (= ret_w_eq_q (= ret_w_ov 4)))",
          "(assert (=> (not ret_z_eq_q) (and (<= 0 ret_z_ov) (<= ret_z_ov 2))))",
          "(assert (=> (not ret_w_eq_q) (and (<= 0 ret_w_ov) (<= ret_w_ov 2))))",
          "(assert (not ret_z_contains_w))", "(assert (not ret_w_contains_z))"]

    # Explicit ingress cases. Common helpers require common + both sameBlocker tags.
    active = case == "common_sameblocker"
    L.append(f"(assert (= common_helper_active {'true' if active else 'false'}))")
    if active:
        L += ["(assert (= first_tag 0))", "(assert (= second_tag 0))",
              "(assert qcenter_in_canonical_cap)", "(assert (= qrow_canonical_cap_count 2))", "(assert common_witnesses_distinct)"]
        for i in range(4):
            L.append(f"(assert (and common_w{i}_source_in_cap common_w{i}_off_q common_w{i}_blocker_ne_q (<= 0 common_w{i}_ov) (<= common_w{i}_ov 2)))")
    else:
        L += ["(assert (not qcenter_in_canonical_cap))", "(assert (= qrow_canonical_cap_count 0))", "(assert (not common_witnesses_distinct))"]
        for i in range(4):
            L.append(f"(assert (and (not common_w{i}_source_in_cap) (not common_w{i}_off_q) (not common_w{i}_blocker_ne_q) (= common_w{i}_ov 0)))")

    # Read back every semantic field used by the independent validator.
    values = ["first_tag", "second_tag", "first_ov", "second_ov", "first_deleted_q", "second_deleted_q", "first_contains_deleted", "first_deletion_survives", "second_contains_deleted", "second_deletion_survives", "second_source_cap", "second_q_cap", "second_internal_q_in_cap", "qrow_canonical_cap_count", "q_boundary", "qdist", "qfiber_card", "qfiber_image_support",
              "repeat_z", "repeat_w", "repeat_outcome", "ret_location", "ret_z_ov", "ret_w_ov",
              "ret_z_eq_q", "ret_w_eq_q", "ret_z_contains_w", "ret_w_contains_z",
              "q_nonrobust", "common_helper_active", "qcenter_in_canonical_cap", "common_witnesses_distinct"]
    values += [f"b{i}" for i in range(4)] + [f"cap{i}" for i in range(4)] + [f"ov{i}" for i in range(4)]
    values += [f"srcincap{i}" for i in range(4)] + [f"common_w{i}_ov" for i in range(4)]
    values += [f"common_w{i}_{kind}" for i in range(4) for kind in ("source_in_cap", "off_q", "blocker_ne_q")]
    values += [f"m{i}{j}" for i in range(4) for j in range(4)]
    L += ["(check-sat)", "(get-value (" + " ".join(values) + "))"]
    return "\n".join(L) + "\n"


for c in CASES:
    (ROOT / f"case_{c}.smt2").write_text(emit(c))
(ROOT / "control_unsat.smt2").write_text("(set-logic QF_LIA)\n(assert false)\n(check-sat)\n")
(ROOT / "control_malformed.smt2").write_text("(set-logic QF_LIA)\n(assert (and true)\n(check-sat)\n")
