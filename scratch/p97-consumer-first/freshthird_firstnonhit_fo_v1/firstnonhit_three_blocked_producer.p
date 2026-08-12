% Positive smoke control for the exact missing producer contract.

include('firstnonhit_base_axioms.p').

fof(three_blocked_producer, axiom,
  car(ta) & car(da) & car(db) & car(dc) &
  da != db & da != dc & db != dc &
  cen(ta) != cen(qa) &
  mem(qa,da) & mem(qa,db) & mem(qa,dc) &
  blocked(da,cen(ta)) & blocked(db,cen(ta)) & blocked(dc,cen(ta))).

fof(three_blocked_inconsistent, conjecture, $false).
