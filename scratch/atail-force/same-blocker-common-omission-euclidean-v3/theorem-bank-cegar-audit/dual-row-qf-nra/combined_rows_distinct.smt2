; benchmark generated from python API
(set-info :status unknown)
(declare-fun a1_x () Real)
(declare-fun a1_y () Real)
(declare-fun t3_x () Real)
(declare-fun t3_y () Real)
(declare-fun t1_y () Real)
(declare-fun p2_y () Real)
(declare-fun t1_x () Real)
(declare-fun p2_x () Real)
(declare-fun q1_y () Real)
(declare-fun q1_x () Real)
(declare-fun q2_y () Real)
(declare-fun q2_x () Real)
(declare-fun s4_y () Real)
(declare-fun s4_x () Real)
(declare-fun t2_y () Real)
(declare-fun t2_x () Real)
(declare-fun s3_y () Real)
(declare-fun s3_x () Real)
(declare-fun a2_y () Real)
(declare-fun a2_x () Real)
(declare-fun r1_y () Real)
(declare-fun r1_x () Real)
(declare-fun r2_y () Real)
(declare-fun r2_x () Real)
(declare-fun a3_y () Real)
(declare-fun a3_x () Real)
(declare-fun s1_y () Real)
(declare-fun s1_x () Real)
(declare-fun s2_y () Real)
(declare-fun s2_x () Real)
(declare-fun t4_y () Real)
(declare-fun t4_x () Real)
(declare-fun p1_y () Real)
(declare-fun p1_x () Real)
(assert
 (= a1_x 0.0))
(assert
 (= a1_y 0.0))
(assert
 (= t3_x 1.0))
(assert
 (= t3_y 0.0))
(assert
 (let ((?x866 (+ (^ (- p2_x t1_x) 2.0) (^ (- p2_y t1_y) 2.0))))
 (let ((?x698 (+ (^ (- p2_x q1_x) 2.0) (^ (- p2_y q1_y) 2.0))))
 (= ?x698 ?x866))))
(assert
 (let ((?x866 (+ (^ (- p2_x t1_x) 2.0) (^ (- p2_y t1_y) 2.0))))
 (= (+ (^ (- p2_x q2_x) 2.0) (^ (- p2_y q2_y) 2.0)) ?x866)))
(assert
 (let ((?x866 (+ (^ (- p2_x t1_x) 2.0) (^ (- p2_y t1_y) 2.0))))
 (let ((?x728 (+ (^ (- p2_x s4_x) 2.0) (^ (- p2_y s4_y) 2.0))))
 (= ?x728 ?x866))))
(assert
 (let ((?x56 (+ (^ (- a1_x t2_x) 2.0) (^ (- a1_y t2_y) 2.0))))
 (let ((?x104 (+ (^ (- a1_x q1_x) 2.0) (^ (- a1_y q1_y) 2.0))))
 (= ?x104 ?x56))))
(assert
 (let ((?x56 (+ (^ (- a1_x t2_x) 2.0) (^ (- a1_y t2_y) 2.0))))
 (let ((?x92 (+ (^ (- a1_x q2_x) 2.0) (^ (- a1_y q2_y) 2.0))))
 (= ?x92 ?x56))))
(assert
 (let ((?x56 (+ (^ (- a1_x t2_x) 2.0) (^ (- a1_y t2_y) 2.0))))
 (let ((?x122 (+ (^ (- a1_x s3_x) 2.0) (^ (- a1_y s3_y) 2.0))))
 (= ?x122 ?x56))))
(assert
 (let ((?x882 (+ (^ (- q2_x a2_x) 2.0) (^ (- q2_y a2_y) 2.0))))
 (= (+ (^ (- q2_x r1_x) 2.0) (^ (- q2_y r1_y) 2.0)) ?x882)))
(assert
 (let ((?x882 (+ (^ (- q2_x a2_x) 2.0) (^ (- q2_y a2_y) 2.0))))
 (let ((?x662 (+ (^ (- q2_x r2_x) 2.0) (^ (- q2_y r2_y) 2.0))))
 (= ?x662 ?x882))))
(assert
 (let ((?x882 (+ (^ (- q2_x a2_x) 2.0) (^ (- q2_y a2_y) 2.0))))
 (let ((?x668 (+ (^ (- q2_x a3_x) 2.0) (^ (- q2_y a3_y) 2.0))))
 (= ?x668 ?x882))))
(assert
 (let ((?x500 (+ (^ (- a2_x r2_x) 2.0) (^ (- a2_y r2_y) 2.0))))
 (let ((?x494 (+ (^ (- a2_x q1_x) 2.0) (^ (- a2_y q1_y) 2.0))))
 (= ?x494 ?x500))))
(assert
 (let ((?x500 (+ (^ (- a2_x r2_x) 2.0) (^ (- a2_y r2_y) 2.0))))
 (let ((?x518 (+ (^ (- a2_x s1_x) 2.0) (^ (- a2_y s1_y) 2.0))))
 (= ?x518 ?x500))))
(assert
 (let ((?x500 (+ (^ (- a2_x r2_x) 2.0) (^ (- a2_y r2_y) 2.0))))
 (let ((?x530 (+ (^ (- a2_x s2_x) 2.0) (^ (- a2_y s2_y) 2.0))))
 (= ?x530 ?x500))))
(assert
 (let ((?x898 (+ (^ (- a3_x t3_x) 2.0) (^ (- a3_y t3_y) 2.0))))
 (= (+ (^ (- a3_x t4_x) 2.0) (^ (- a3_y t4_y) 2.0)) ?x898)))
(assert
 (let ((?x898 (+ (^ (- a3_x t3_x) 2.0) (^ (- a3_y t3_y) 2.0))))
 (= (+ (^ (- a3_x a2_x) 2.0) (^ (- a3_y a2_y) 2.0)) ?x898)))
(assert
 (let ((?x898 (+ (^ (- a3_x t3_x) 2.0) (^ (- a3_y t3_y) 2.0))))
 (let ((?x812 (+ (^ (- a3_x s1_x) 2.0) (^ (- a3_y s1_y) 2.0))))
 (= ?x812 ?x898))))
(assert
 (let ((?x866 (+ (^ (- p2_x t1_x) 2.0) (^ (- p2_y t1_y) 2.0))))
 (let ((?x698 (+ (^ (- p2_x q1_x) 2.0) (^ (- p2_y q1_y) 2.0))))
 (= ?x698 ?x866))))
(assert
 (let ((?x866 (+ (^ (- p2_x t1_x) 2.0) (^ (- p2_y t1_y) 2.0))))
 (= (+ (^ (- p2_x q2_x) 2.0) (^ (- p2_y q2_y) 2.0)) ?x866)))
(assert
 (let ((?x866 (+ (^ (- p2_x t1_x) 2.0) (^ (- p2_y t1_y) 2.0))))
 (let ((?x728 (+ (^ (- p2_x s4_x) 2.0) (^ (- p2_y s4_y) 2.0))))
 (= ?x728 ?x866))))
(assert
 (let ((?x68 (+ (^ (- a1_x t1_x) 2.0) (^ (- a1_y t1_y) 2.0))))
 (let ((?x50 (+ (^ (- a1_x t3_x) 2.0) (^ (- a1_y t3_y) 2.0))))
 (= ?x50 ?x68))))
(assert
 (let ((?x68 (+ (^ (- a1_x t1_x) 2.0) (^ (- a1_y t1_y) 2.0))))
 (let ((?x80 (+ (^ (- a1_x r1_x) 2.0) (^ (- a1_y r1_y) 2.0))))
 (= ?x80 ?x68))))
(assert
 (let ((?x68 (+ (^ (- a1_x t1_x) 2.0) (^ (- a1_y t1_y) 2.0))))
 (let ((?x110 (+ (^ (- a1_x r2_x) 2.0) (^ (- a1_y r2_y) 2.0))))
 (= ?x110 ?x68))))
(assert
 (let ((?x882 (+ (^ (- q2_x a2_x) 2.0) (^ (- q2_y a2_y) 2.0))))
 (= (+ (^ (- q2_x r1_x) 2.0) (^ (- q2_y r1_y) 2.0)) ?x882)))
(assert
 (let ((?x882 (+ (^ (- q2_x a2_x) 2.0) (^ (- q2_y a2_y) 2.0))))
 (let ((?x662 (+ (^ (- q2_x r2_x) 2.0) (^ (- q2_y r2_y) 2.0))))
 (= ?x662 ?x882))))
(assert
 (let ((?x882 (+ (^ (- q2_x a2_x) 2.0) (^ (- q2_y a2_y) 2.0))))
 (let ((?x668 (+ (^ (- q2_x a3_x) 2.0) (^ (- q2_y a3_y) 2.0))))
 (= ?x668 ?x882))))
(assert
 (let ((?x488 (+ (^ (- a2_x p2_x) 2.0) (^ (- a2_y p2_y) 2.0))))
 (let ((?x470 (+ (^ (- a2_x r1_x) 2.0) (^ (- a2_y r1_y) 2.0))))
 (= ?x470 ?x488))))
(assert
 (let ((?x488 (+ (^ (- a2_x p2_x) 2.0) (^ (- a2_y p2_y) 2.0))))
 (let ((?x482 (+ (^ (- a2_x q2_x) 2.0) (^ (- a2_y q2_y) 2.0))))
 (= ?x482 ?x488))))
(assert
 (let ((?x488 (+ (^ (- a2_x p2_x) 2.0) (^ (- a2_y p2_y) 2.0))))
 (let ((?x524 (+ (^ (- a2_x s4_x) 2.0) (^ (- a2_y s4_y) 2.0))))
 (= ?x524 ?x488))))
(assert
 (let ((?x898 (+ (^ (- a3_x t3_x) 2.0) (^ (- a3_y t3_y) 2.0))))
 (= (+ (^ (- a3_x t4_x) 2.0) (^ (- a3_y t4_y) 2.0)) ?x898)))
(assert
 (let ((?x898 (+ (^ (- a3_x t3_x) 2.0) (^ (- a3_y t3_y) 2.0))))
 (= (+ (^ (- a3_x p2_x) 2.0) (^ (- a3_y p2_y) 2.0)) ?x898)))
(assert
 (let ((?x898 (+ (^ (- a3_x t3_x) 2.0) (^ (- a3_y t3_y) 2.0))))
 (let ((?x812 (+ (^ (- a3_x s1_x) 2.0) (^ (- a3_y s1_y) 2.0))))
 (= ?x812 ?x898))))
(assert
 (let ((?x50 (+ (^ (- a1_x t3_x) 2.0) (^ (- a1_y t3_y) 2.0))))
 (> ?x50 0.0)))
(assert
 (let ((?x56 (+ (^ (- a1_x t2_x) 2.0) (^ (- a1_y t2_y) 2.0))))
 (> ?x56 0.0)))
(assert
 (> (+ (^ (- a1_x t4_x) 2.0) (^ (- a1_y t4_y) 2.0)) 0.0))
(assert
 (let ((?x68 (+ (^ (- a1_x t1_x) 2.0) (^ (- a1_y t1_y) 2.0))))
 (> ?x68 0.0)))
(assert
 (> (+ (^ (- a1_x a2_x) 2.0) (^ (- a1_y a2_y) 2.0)) 0.0))
(assert
 (let ((?x80 (+ (^ (- a1_x r1_x) 2.0) (^ (- a1_y r1_y) 2.0))))
 (> ?x80 0.0)))
(assert
 (> (+ (^ (- a1_x p1_x) 2.0) (^ (- a1_y p1_y) 2.0)) 0.0))
(assert
 (let ((?x92 (+ (^ (- a1_x q2_x) 2.0) (^ (- a1_y q2_y) 2.0))))
 (> ?x92 0.0)))
(assert
 (> (+ (^ (- a1_x p2_x) 2.0) (^ (- a1_y p2_y) 2.0)) 0.0))
(assert
 (let ((?x104 (+ (^ (- a1_x q1_x) 2.0) (^ (- a1_y q1_y) 2.0))))
 (> ?x104 0.0)))
(assert
 (let ((?x110 (+ (^ (- a1_x r2_x) 2.0) (^ (- a1_y r2_y) 2.0))))
 (> ?x110 0.0)))
(assert
 (> (+ (^ (- a1_x a3_x) 2.0) (^ (- a1_y a3_y) 2.0)) 0.0))
(assert
 (let ((?x122 (+ (^ (- a1_x s3_x) 2.0) (^ (- a1_y s3_y) 2.0))))
 (> ?x122 0.0)))
(assert
 (> (+ (^ (- a1_x s1_x) 2.0) (^ (- a1_y s1_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- a1_x s4_x) 2.0) (^ (- a1_y s4_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- a1_x s2_x) 2.0) (^ (- a1_y s2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t3_x t2_x) 2.0) (^ (- t3_y t2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t3_x t4_x) 2.0) (^ (- t3_y t4_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t3_x t1_x) 2.0) (^ (- t3_y t1_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t3_x a2_x) 2.0) (^ (- t3_y a2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t3_x r1_x) 2.0) (^ (- t3_y r1_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t3_x p1_x) 2.0) (^ (- t3_y p1_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t3_x q2_x) 2.0) (^ (- t3_y q2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t3_x p2_x) 2.0) (^ (- t3_y p2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t3_x q1_x) 2.0) (^ (- t3_y q1_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t3_x r2_x) 2.0) (^ (- t3_y r2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t3_x a3_x) 2.0) (^ (- t3_y a3_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t3_x s3_x) 2.0) (^ (- t3_y s3_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t3_x s1_x) 2.0) (^ (- t3_y s1_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t3_x s4_x) 2.0) (^ (- t3_y s4_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t3_x s2_x) 2.0) (^ (- t3_y s2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t2_x t4_x) 2.0) (^ (- t2_y t4_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t2_x t1_x) 2.0) (^ (- t2_y t1_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t2_x a2_x) 2.0) (^ (- t2_y a2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t2_x r1_x) 2.0) (^ (- t2_y r1_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t2_x p1_x) 2.0) (^ (- t2_y p1_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t2_x q2_x) 2.0) (^ (- t2_y q2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t2_x p2_x) 2.0) (^ (- t2_y p2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t2_x q1_x) 2.0) (^ (- t2_y q1_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t2_x r2_x) 2.0) (^ (- t2_y r2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t2_x a3_x) 2.0) (^ (- t2_y a3_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t2_x s3_x) 2.0) (^ (- t2_y s3_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t2_x s1_x) 2.0) (^ (- t2_y s1_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t2_x s4_x) 2.0) (^ (- t2_y s4_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t2_x s2_x) 2.0) (^ (- t2_y s2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t4_x t1_x) 2.0) (^ (- t4_y t1_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t4_x a2_x) 2.0) (^ (- t4_y a2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t4_x r1_x) 2.0) (^ (- t4_y r1_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t4_x p1_x) 2.0) (^ (- t4_y p1_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t4_x q2_x) 2.0) (^ (- t4_y q2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t4_x p2_x) 2.0) (^ (- t4_y p2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t4_x q1_x) 2.0) (^ (- t4_y q1_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t4_x r2_x) 2.0) (^ (- t4_y r2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t4_x a3_x) 2.0) (^ (- t4_y a3_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t4_x s3_x) 2.0) (^ (- t4_y s3_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t4_x s1_x) 2.0) (^ (- t4_y s1_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t4_x s4_x) 2.0) (^ (- t4_y s4_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t4_x s2_x) 2.0) (^ (- t4_y s2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t1_x a2_x) 2.0) (^ (- t1_y a2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t1_x r1_x) 2.0) (^ (- t1_y r1_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t1_x p1_x) 2.0) (^ (- t1_y p1_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t1_x q2_x) 2.0) (^ (- t1_y q2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t1_x p2_x) 2.0) (^ (- t1_y p2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t1_x q1_x) 2.0) (^ (- t1_y q1_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t1_x r2_x) 2.0) (^ (- t1_y r2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t1_x a3_x) 2.0) (^ (- t1_y a3_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t1_x s3_x) 2.0) (^ (- t1_y s3_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t1_x s1_x) 2.0) (^ (- t1_y s1_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t1_x s4_x) 2.0) (^ (- t1_y s4_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t1_x s2_x) 2.0) (^ (- t1_y s2_y) 2.0)) 0.0))
(assert
 (let ((?x470 (+ (^ (- a2_x r1_x) 2.0) (^ (- a2_y r1_y) 2.0))))
 (> ?x470 0.0)))
(assert
 (> (+ (^ (- a2_x p1_x) 2.0) (^ (- a2_y p1_y) 2.0)) 0.0))
(assert
 (let ((?x482 (+ (^ (- a2_x q2_x) 2.0) (^ (- a2_y q2_y) 2.0))))
 (> ?x482 0.0)))
(assert
 (let ((?x488 (+ (^ (- a2_x p2_x) 2.0) (^ (- a2_y p2_y) 2.0))))
 (> ?x488 0.0)))
(assert
 (let ((?x494 (+ (^ (- a2_x q1_x) 2.0) (^ (- a2_y q1_y) 2.0))))
 (> ?x494 0.0)))
(assert
 (let ((?x500 (+ (^ (- a2_x r2_x) 2.0) (^ (- a2_y r2_y) 2.0))))
 (> ?x500 0.0)))
(assert
 (> (+ (^ (- a2_x a3_x) 2.0) (^ (- a2_y a3_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- a2_x s3_x) 2.0) (^ (- a2_y s3_y) 2.0)) 0.0))
(assert
 (let ((?x518 (+ (^ (- a2_x s1_x) 2.0) (^ (- a2_y s1_y) 2.0))))
 (> ?x518 0.0)))
(assert
 (let ((?x524 (+ (^ (- a2_x s4_x) 2.0) (^ (- a2_y s4_y) 2.0))))
 (> ?x524 0.0)))
(assert
 (let ((?x530 (+ (^ (- a2_x s2_x) 2.0) (^ (- a2_y s2_y) 2.0))))
 (> ?x530 0.0)))
(assert
 (> (+ (^ (- r1_x p1_x) 2.0) (^ (- r1_y p1_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- r1_x q2_x) 2.0) (^ (- r1_y q2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- r1_x p2_x) 2.0) (^ (- r1_y p2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- r1_x q1_x) 2.0) (^ (- r1_y q1_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- r1_x r2_x) 2.0) (^ (- r1_y r2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- r1_x a3_x) 2.0) (^ (- r1_y a3_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- r1_x s3_x) 2.0) (^ (- r1_y s3_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- r1_x s1_x) 2.0) (^ (- r1_y s1_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- r1_x s4_x) 2.0) (^ (- r1_y s4_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- r1_x s2_x) 2.0) (^ (- r1_y s2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- p1_x q2_x) 2.0) (^ (- p1_y q2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- p1_x p2_x) 2.0) (^ (- p1_y p2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- p1_x q1_x) 2.0) (^ (- p1_y q1_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- p1_x r2_x) 2.0) (^ (- p1_y r2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- p1_x a3_x) 2.0) (^ (- p1_y a3_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- p1_x s3_x) 2.0) (^ (- p1_y s3_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- p1_x s1_x) 2.0) (^ (- p1_y s1_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- p1_x s4_x) 2.0) (^ (- p1_y s4_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- p1_x s2_x) 2.0) (^ (- p1_y s2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- q2_x p2_x) 2.0) (^ (- q2_y p2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- q2_x q1_x) 2.0) (^ (- q2_y q1_y) 2.0)) 0.0))
(assert
 (let ((?x662 (+ (^ (- q2_x r2_x) 2.0) (^ (- q2_y r2_y) 2.0))))
 (> ?x662 0.0)))
(assert
 (let ((?x668 (+ (^ (- q2_x a3_x) 2.0) (^ (- q2_y a3_y) 2.0))))
 (> ?x668 0.0)))
(assert
 (> (+ (^ (- q2_x s3_x) 2.0) (^ (- q2_y s3_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- q2_x s1_x) 2.0) (^ (- q2_y s1_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- q2_x s4_x) 2.0) (^ (- q2_y s4_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- q2_x s2_x) 2.0) (^ (- q2_y s2_y) 2.0)) 0.0))
(assert
 (let ((?x698 (+ (^ (- p2_x q1_x) 2.0) (^ (- p2_y q1_y) 2.0))))
 (> ?x698 0.0)))
(assert
 (> (+ (^ (- p2_x r2_x) 2.0) (^ (- p2_y r2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- p2_x a3_x) 2.0) (^ (- p2_y a3_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- p2_x s3_x) 2.0) (^ (- p2_y s3_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- p2_x s1_x) 2.0) (^ (- p2_y s1_y) 2.0)) 0.0))
(assert
 (let ((?x728 (+ (^ (- p2_x s4_x) 2.0) (^ (- p2_y s4_y) 2.0))))
 (> ?x728 0.0)))
(assert
 (> (+ (^ (- p2_x s2_x) 2.0) (^ (- p2_y s2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- q1_x r2_x) 2.0) (^ (- q1_y r2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- q1_x a3_x) 2.0) (^ (- q1_y a3_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- q1_x s3_x) 2.0) (^ (- q1_y s3_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- q1_x s1_x) 2.0) (^ (- q1_y s1_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- q1_x s4_x) 2.0) (^ (- q1_y s4_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- q1_x s2_x) 2.0) (^ (- q1_y s2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- r2_x a3_x) 2.0) (^ (- r2_y a3_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- r2_x s3_x) 2.0) (^ (- r2_y s3_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- r2_x s1_x) 2.0) (^ (- r2_y s1_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- r2_x s4_x) 2.0) (^ (- r2_y s4_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- r2_x s2_x) 2.0) (^ (- r2_y s2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- a3_x s3_x) 2.0) (^ (- a3_y s3_y) 2.0)) 0.0))
(assert
 (let ((?x812 (+ (^ (- a3_x s1_x) 2.0) (^ (- a3_y s1_y) 2.0))))
 (> ?x812 0.0)))
(assert
 (> (+ (^ (- a3_x s4_x) 2.0) (^ (- a3_y s4_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- a3_x s2_x) 2.0) (^ (- a3_y s2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- s3_x s1_x) 2.0) (^ (- s3_y s1_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- s3_x s4_x) 2.0) (^ (- s3_y s4_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- s3_x s2_x) 2.0) (^ (- s3_y s2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- s1_x s4_x) 2.0) (^ (- s1_y s4_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- s1_x s2_x) 2.0) (^ (- s1_y s2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- s4_x s2_x) 2.0) (^ (- s4_y s2_y) 2.0)) 0.0))
(check-sat)
