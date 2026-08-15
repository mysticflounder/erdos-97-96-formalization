% Cardinality-independent FirstNonHit base, without a consistency conjecture.
% Source map: A1 BlockerMultiplicityGeometry.lean:70-113;
% A2 FrontierLiveClosure/TwoSourceCanonicalSurface.lean:131-158;
% A3/A4 FrontierLiveClosure/TwoSourceFreshThirdFiber.lean:
%     2068-2090, 2193-2245;
% A5 FrontierLiveClosure/TwoSourceFreshThirdResidual.lean:1261-1320.
fof(car_center, axiom, ! [U] : (car(U) => car(cen(U)))).
fof(center_ne_source, axiom, ! [U] : (car(U) => cen(U) != U)).
fof(mem_typed, axiom, ! [U,V] : (mem(U,V) => (car(U) & car(V)))).
fof(source_mem, axiom, ! [U] : (car(U) => mem(U,U))).
fof(exact_four, axiom,
  ! [U] : (car(U) => ? [V,W,X,Y] :
    (mem(U,V) & mem(U,W) & mem(U,X) & mem(U,Y) &
     V != W & V != X & V != Y & W != X & W != Y & X != Y &
     ! [Z] : (mem(U,Z) => (Z = V | Z = W | Z = X | Z = Y))))).
fof(equal_center_support, axiom,
  ! [U,V,W] : ((car(U) & car(V) & cen(U) = cen(V)) =>
    (mem(U,W) <=> mem(V,W)))).
fof(distinct_center_overlap_le_two, axiom,
  ! [U,V,W,X,Y] : ((car(U) & car(V) & cen(U) != cen(V) &
    mem(U,W) & mem(V,W) & mem(U,X) & mem(V,X) &
    mem(U,Y) & mem(V,Y)) => (W = X | W = Y | X = Y))).
fof(blocked_mem, axiom,
  ! [U,V] : ((car(U) & car(V) & blocked(V,cen(U))) => mem(U,V))).
fof(own_deletion_blocked, axiom, ! [U] : (car(U) => blocked(U,cen(U)))).
fof(fiber_le_four, axiom,
  ! [U,V,W,X,Y] : ((car(U) & car(V) & car(W) & car(X) & car(Y) &
    cen(U) = cen(V) & cen(U) = cen(W) & cen(U) = cen(X) & cen(U) = cen(Y)) =>
    (U = V | U = W | U = X | U = Y | V = W | V = X | V = Y |
     W = X | W = Y | X = Y))).
fof(named_carriers, axiom,
  car(pa) & car(pb) & car(ra) & car(rb) & car(qa) & car(qb) &
  car(ca) & car(cb) & car(oa)).
fof(endpoint_distinct, axiom,
  pa != pb & ra != rb & pa != ra & pa != rb & pb != ra & pb != rb).
fof(qc_distinct, axiom,
  qa != qb & ca != cb & qa != pa & qa != pb & qa != ra & qa != rb &
  qb != pa & qb != pb & qb != ra & qb != rb &
  ca != pa & ca != pb & ca != ra & ca != rb &
  cb != pa & cb != pb & cb != ra & cb != rb & ca != oa & cb != oa).
fof(strict_cap_points_ne_opp_apex, axiom,
  pa != oa & pb != oa & ra != oa & rb != oa).
fof(q_mutual_support, axiom, mem(qa,qb) & mem(qb,qa)).
fof(q_blocker_ne_retained_blockers, axiom,
  cen(qa) = cen(qb) & cen(qa) != cen(pa) & cen(qa) != cen(ra)).
fof(same_blocker_subarm, axiom,
  cen(ca) = cen(qa) & cen(cb) = cen(qa) & cen(ca) != oa & cen(cb) != oa).
fof(same_blocker_support_ca, axiom,
  ! [W] : (mem(ca,W) <=> mem(qa,W))).
fof(same_blocker_support_cb, axiom,
  ! [W] : (mem(cb,W) <=> mem(qa,W))).
fof(cross_pair_omissions, axiom,
  (~mem(ca,pa) | ~mem(ca,pb)) & (~mem(ca,ra) | ~mem(ca,rb)) &
  (~mem(cb,pa) | ~mem(cb,pb)) & (~mem(cb,ra) | ~mem(cb,rb))).
fof(common_omission, axiom,
  (co = pa | co = pb | co = ra | co = rb) & ~mem(ca,co) & ~mem(cb,co)).
fof(deletion_survival_polarity_ca, axiom,
  ! [V] : (((V = pa | V = pb | V = ra | V = rb)) =>
    (~mem(ca,V) <=> ~blocked(V,cen(ca))))).
fof(deletion_survival_polarity_cb, axiom,
  ! [V] : (((V = pa | V = pb | V = ra | V = rb)) =>
    (~mem(cb,V) <=> ~blocked(V,cen(cb))))).
fof(opp_apex_survival, axiom, ~blocked(pa,oa) & ~blocked(ra,oa)).
