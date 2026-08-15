include('firstnonhit_base_axioms.p').
fof(three_overlap_producer, axiom,
  car(ta) & car(da) & car(db) & car(dc) &
  da != db & da != dc & db != dc & cen(ta) != cen(qa) &
  mem(qa,da) & mem(qa,db) & mem(qa,dc) &
  mem(ta,da) & mem(ta,db) & mem(ta,dc)).
fof(three_overlap_inconsistent, conjecture, $false).
