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
 (let ((?x928 (+ (^ (- q1_x a1_x) 2.0) (^ (- q1_y a1_y) 2.0))))
 (= (+ (^ (- q1_x t2_x) 2.0) (^ (- q1_y t2_y) 2.0)) ?x928)))
(assert
 (let ((?x928 (+ (^ (- q1_x a1_x) 2.0) (^ (- q1_y a1_y) 2.0))))
 (= (+ (^ (- q1_x p1_x) 2.0) (^ (- q1_y p1_y) 2.0)) ?x928)))
(assert
 (let ((?x928 (+ (^ (- q1_x a1_x) 2.0) (^ (- q1_y a1_y) 2.0))))
 (= (+ (^ (- q1_x p2_x) 2.0) (^ (- q1_y p2_y) 2.0)) ?x928)))
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
(assert
 (let ((?x953 (- (* (- t3_x a1_x) (- t2_y a1_y)) (* (- t3_y a1_y) (- t2_x a1_x)))))
 (< ?x953 0.0)))
(assert
 (let ((?x959 (- (* (- t3_x a1_x) (- t4_y a1_y)) (* (- t3_y a1_y) (- t4_x a1_x)))))
 (< ?x959 0.0)))
(assert
 (let ((?x965 (- (* (- t3_x a1_x) (- t1_y a1_y)) (* (- t3_y a1_y) (- t1_x a1_x)))))
 (< ?x965 0.0)))
(assert
 (let ((?x971 (- (* (- t3_x a1_x) (- a2_y a1_y)) (* (- t3_y a1_y) (- a2_x a1_x)))))
 (< ?x971 0.0)))
(assert
 (let ((?x977 (- (* (- t3_x a1_x) (- r1_y a1_y)) (* (- t3_y a1_y) (- r1_x a1_x)))))
 (< ?x977 0.0)))
(assert
 (let ((?x983 (- (* (- t3_x a1_x) (- p1_y a1_y)) (* (- t3_y a1_y) (- p1_x a1_x)))))
 (< ?x983 0.0)))
(assert
 (let ((?x989 (- (* (- t3_x a1_x) (- q2_y a1_y)) (* (- t3_y a1_y) (- q2_x a1_x)))))
 (< ?x989 0.0)))
(assert
 (let ((?x995 (- (* (- t3_x a1_x) (- p2_y a1_y)) (* (- t3_y a1_y) (- p2_x a1_x)))))
 (< ?x995 0.0)))
(assert
 (let ((?x999 (- (* (- t3_x a1_x) (- q1_y a1_y)) (* (- t3_y a1_y) (- q1_x a1_x)))))
 (< ?x999 0.0)))
(assert
 (let ((?x1005 (- (* (- t3_x a1_x) (- r2_y a1_y)) (* (- t3_y a1_y) (- r2_x a1_x)))))
 (< ?x1005 0.0)))
(assert
 (let ((?x1011 (- (* (- t3_x a1_x) (- a3_y a1_y)) (* (- t3_y a1_y) (- a3_x a1_x)))))
 (< ?x1011 0.0)))
(assert
 (let ((?x1017 (- (* (- t3_x a1_x) (- s3_y a1_y)) (* (- t3_y a1_y) (- s3_x a1_x)))))
 (< ?x1017 0.0)))
(assert
 (let ((?x1023 (- (* (- t3_x a1_x) (- s1_y a1_y)) (* (- t3_y a1_y) (- s1_x a1_x)))))
 (< ?x1023 0.0)))
(assert
 (let ((?x1029 (- (* (- t3_x a1_x) (- s4_y a1_y)) (* (- t3_y a1_y) (- s4_x a1_x)))))
 (< ?x1029 0.0)))
(assert
 (let ((?x1035 (- (* (- t3_x a1_x) (- s2_y a1_y)) (* (- t3_y a1_y) (- s2_x a1_x)))))
 (< ?x1035 0.0)))
(assert
 (let ((?x1039 (- (* (- t2_x a1_x) (- t4_y a1_y)) (* (- t2_y a1_y) (- t4_x a1_x)))))
 (< ?x1039 0.0)))
(assert
 (let ((?x1043 (- (* (- t2_x a1_x) (- t1_y a1_y)) (* (- t2_y a1_y) (- t1_x a1_x)))))
 (< ?x1043 0.0)))
(assert
 (let ((?x1047 (- (* (- t2_x a1_x) (- a2_y a1_y)) (* (- t2_y a1_y) (- a2_x a1_x)))))
 (< ?x1047 0.0)))
(assert
 (let ((?x1051 (- (* (- t2_x a1_x) (- r1_y a1_y)) (* (- t2_y a1_y) (- r1_x a1_x)))))
 (< ?x1051 0.0)))
(assert
 (let ((?x1055 (- (* (- t2_x a1_x) (- p1_y a1_y)) (* (- t2_y a1_y) (- p1_x a1_x)))))
 (< ?x1055 0.0)))
(assert
 (let ((?x1059 (- (* (- t2_x a1_x) (- q2_y a1_y)) (* (- t2_y a1_y) (- q2_x a1_x)))))
 (< ?x1059 0.0)))
(assert
 (let ((?x1063 (- (* (- t2_x a1_x) (- p2_y a1_y)) (* (- t2_y a1_y) (- p2_x a1_x)))))
 (< ?x1063 0.0)))
(assert
 (let ((?x1067 (- (* (- t2_x a1_x) (- q1_y a1_y)) (* (- t2_y a1_y) (- q1_x a1_x)))))
 (< ?x1067 0.0)))
(assert
 (let ((?x1071 (- (* (- t2_x a1_x) (- r2_y a1_y)) (* (- t2_y a1_y) (- r2_x a1_x)))))
 (< ?x1071 0.0)))
(assert
 (let ((?x1075 (- (* (- t2_x a1_x) (- a3_y a1_y)) (* (- t2_y a1_y) (- a3_x a1_x)))))
 (< ?x1075 0.0)))
(assert
 (let ((?x1079 (- (* (- t2_x a1_x) (- s3_y a1_y)) (* (- t2_y a1_y) (- s3_x a1_x)))))
 (< ?x1079 0.0)))
(assert
 (let ((?x1083 (- (* (- t2_x a1_x) (- s1_y a1_y)) (* (- t2_y a1_y) (- s1_x a1_x)))))
 (< ?x1083 0.0)))
(assert
 (let ((?x1087 (- (* (- t2_x a1_x) (- s4_y a1_y)) (* (- t2_y a1_y) (- s4_x a1_x)))))
 (< ?x1087 0.0)))
(assert
 (let ((?x1091 (- (* (- t2_x a1_x) (- s2_y a1_y)) (* (- t2_y a1_y) (- s2_x a1_x)))))
 (< ?x1091 0.0)))
(assert
 (let ((?x1095 (- (* (- t4_x a1_x) (- t1_y a1_y)) (* (- t4_y a1_y) (- t1_x a1_x)))))
 (< ?x1095 0.0)))
(assert
 (let ((?x1099 (- (* (- t4_x a1_x) (- a2_y a1_y)) (* (- t4_y a1_y) (- a2_x a1_x)))))
 (< ?x1099 0.0)))
(assert
 (let ((?x1103 (- (* (- t4_x a1_x) (- r1_y a1_y)) (* (- t4_y a1_y) (- r1_x a1_x)))))
 (< ?x1103 0.0)))
(assert
 (let ((?x1107 (- (* (- t4_x a1_x) (- p1_y a1_y)) (* (- t4_y a1_y) (- p1_x a1_x)))))
 (< ?x1107 0.0)))
(assert
 (let ((?x1111 (- (* (- t4_x a1_x) (- q2_y a1_y)) (* (- t4_y a1_y) (- q2_x a1_x)))))
 (< ?x1111 0.0)))
(assert
 (let ((?x1115 (- (* (- t4_x a1_x) (- p2_y a1_y)) (* (- t4_y a1_y) (- p2_x a1_x)))))
 (< ?x1115 0.0)))
(assert
 (let ((?x1119 (- (* (- t4_x a1_x) (- q1_y a1_y)) (* (- t4_y a1_y) (- q1_x a1_x)))))
 (< ?x1119 0.0)))
(assert
 (let ((?x1123 (- (* (- t4_x a1_x) (- r2_y a1_y)) (* (- t4_y a1_y) (- r2_x a1_x)))))
 (< ?x1123 0.0)))
(assert
 (let ((?x1127 (- (* (- t4_x a1_x) (- a3_y a1_y)) (* (- t4_y a1_y) (- a3_x a1_x)))))
 (< ?x1127 0.0)))
(assert
 (let ((?x1131 (- (* (- t4_x a1_x) (- s3_y a1_y)) (* (- t4_y a1_y) (- s3_x a1_x)))))
 (< ?x1131 0.0)))
(assert
 (let ((?x1135 (- (* (- t4_x a1_x) (- s1_y a1_y)) (* (- t4_y a1_y) (- s1_x a1_x)))))
 (< ?x1135 0.0)))
(assert
 (let ((?x1139 (- (* (- t4_x a1_x) (- s4_y a1_y)) (* (- t4_y a1_y) (- s4_x a1_x)))))
 (< ?x1139 0.0)))
(assert
 (let ((?x1143 (- (* (- t4_x a1_x) (- s2_y a1_y)) (* (- t4_y a1_y) (- s2_x a1_x)))))
 (< ?x1143 0.0)))
(assert
 (let ((?x1147 (- (* (- t1_x a1_x) (- a2_y a1_y)) (* (- t1_y a1_y) (- a2_x a1_x)))))
 (< ?x1147 0.0)))
(assert
 (let ((?x1151 (- (* (- t1_x a1_x) (- r1_y a1_y)) (* (- t1_y a1_y) (- r1_x a1_x)))))
 (< ?x1151 0.0)))
(assert
 (let ((?x1155 (- (* (- t1_x a1_x) (- p1_y a1_y)) (* (- t1_y a1_y) (- p1_x a1_x)))))
 (< ?x1155 0.0)))
(assert
 (let ((?x1159 (- (* (- t1_x a1_x) (- q2_y a1_y)) (* (- t1_y a1_y) (- q2_x a1_x)))))
 (< ?x1159 0.0)))
(assert
 (let ((?x1163 (- (* (- t1_x a1_x) (- p2_y a1_y)) (* (- t1_y a1_y) (- p2_x a1_x)))))
 (< ?x1163 0.0)))
(assert
 (let ((?x1167 (- (* (- t1_x a1_x) (- q1_y a1_y)) (* (- t1_y a1_y) (- q1_x a1_x)))))
 (< ?x1167 0.0)))
(assert
 (let ((?x1171 (- (* (- t1_x a1_x) (- r2_y a1_y)) (* (- t1_y a1_y) (- r2_x a1_x)))))
 (< ?x1171 0.0)))
(assert
 (let ((?x1175 (- (* (- t1_x a1_x) (- a3_y a1_y)) (* (- t1_y a1_y) (- a3_x a1_x)))))
 (< ?x1175 0.0)))
(assert
 (let ((?x1179 (- (* (- t1_x a1_x) (- s3_y a1_y)) (* (- t1_y a1_y) (- s3_x a1_x)))))
 (< ?x1179 0.0)))
(assert
 (let ((?x1183 (- (* (- t1_x a1_x) (- s1_y a1_y)) (* (- t1_y a1_y) (- s1_x a1_x)))))
 (< ?x1183 0.0)))
(assert
 (let ((?x1187 (- (* (- t1_x a1_x) (- s4_y a1_y)) (* (- t1_y a1_y) (- s4_x a1_x)))))
 (< ?x1187 0.0)))
(assert
 (let ((?x1191 (- (* (- t1_x a1_x) (- s2_y a1_y)) (* (- t1_y a1_y) (- s2_x a1_x)))))
 (< ?x1191 0.0)))
(assert
 (let ((?x1195 (- (* (- a2_x a1_x) (- r1_y a1_y)) (* (- a2_y a1_y) (- r1_x a1_x)))))
 (< ?x1195 0.0)))
(assert
 (let ((?x1199 (- (* (- a2_x a1_x) (- p1_y a1_y)) (* (- a2_y a1_y) (- p1_x a1_x)))))
 (< ?x1199 0.0)))
(assert
 (let ((?x1203 (- (* (- a2_x a1_x) (- q2_y a1_y)) (* (- a2_y a1_y) (- q2_x a1_x)))))
 (< ?x1203 0.0)))
(assert
 (let ((?x1207 (- (* (- a2_x a1_x) (- p2_y a1_y)) (* (- a2_y a1_y) (- p2_x a1_x)))))
 (< ?x1207 0.0)))
(assert
 (let ((?x1211 (- (* (- a2_x a1_x) (- q1_y a1_y)) (* (- a2_y a1_y) (- q1_x a1_x)))))
 (< ?x1211 0.0)))
(assert
 (let ((?x1215 (- (* (- a2_x a1_x) (- r2_y a1_y)) (* (- a2_y a1_y) (- r2_x a1_x)))))
 (< ?x1215 0.0)))
(assert
 (let ((?x1219 (- (* (- a2_x a1_x) (- a3_y a1_y)) (* (- a2_y a1_y) (- a3_x a1_x)))))
 (< ?x1219 0.0)))
(assert
 (let ((?x1223 (- (* (- a2_x a1_x) (- s3_y a1_y)) (* (- a2_y a1_y) (- s3_x a1_x)))))
 (< ?x1223 0.0)))
(assert
 (let ((?x1227 (- (* (- a2_x a1_x) (- s1_y a1_y)) (* (- a2_y a1_y) (- s1_x a1_x)))))
 (< ?x1227 0.0)))
(assert
 (let ((?x1231 (- (* (- a2_x a1_x) (- s4_y a1_y)) (* (- a2_y a1_y) (- s4_x a1_x)))))
 (< ?x1231 0.0)))
(assert
 (let ((?x1235 (- (* (- a2_x a1_x) (- s2_y a1_y)) (* (- a2_y a1_y) (- s2_x a1_x)))))
 (< ?x1235 0.0)))
(assert
 (let ((?x1239 (- (* (- r1_x a1_x) (- p1_y a1_y)) (* (- r1_y a1_y) (- p1_x a1_x)))))
 (< ?x1239 0.0)))
(assert
 (let ((?x1243 (- (* (- r1_x a1_x) (- q2_y a1_y)) (* (- r1_y a1_y) (- q2_x a1_x)))))
 (< ?x1243 0.0)))
(assert
 (let ((?x1247 (- (* (- r1_x a1_x) (- p2_y a1_y)) (* (- r1_y a1_y) (- p2_x a1_x)))))
 (< ?x1247 0.0)))
(assert
 (let ((?x1251 (- (* (- r1_x a1_x) (- q1_y a1_y)) (* (- r1_y a1_y) (- q1_x a1_x)))))
 (< ?x1251 0.0)))
(assert
 (let ((?x1255 (- (* (- r1_x a1_x) (- r2_y a1_y)) (* (- r1_y a1_y) (- r2_x a1_x)))))
 (< ?x1255 0.0)))
(assert
 (let ((?x1259 (- (* (- r1_x a1_x) (- a3_y a1_y)) (* (- r1_y a1_y) (- a3_x a1_x)))))
 (< ?x1259 0.0)))
(assert
 (let ((?x1263 (- (* (- r1_x a1_x) (- s3_y a1_y)) (* (- r1_y a1_y) (- s3_x a1_x)))))
 (< ?x1263 0.0)))
(assert
 (let ((?x1267 (- (* (- r1_x a1_x) (- s1_y a1_y)) (* (- r1_y a1_y) (- s1_x a1_x)))))
 (< ?x1267 0.0)))
(assert
 (let ((?x1271 (- (* (- r1_x a1_x) (- s4_y a1_y)) (* (- r1_y a1_y) (- s4_x a1_x)))))
 (< ?x1271 0.0)))
(assert
 (let ((?x1275 (- (* (- r1_x a1_x) (- s2_y a1_y)) (* (- r1_y a1_y) (- s2_x a1_x)))))
 (< ?x1275 0.0)))
(assert
 (let ((?x1279 (- (* (- p1_x a1_x) (- q2_y a1_y)) (* (- p1_y a1_y) (- q2_x a1_x)))))
 (< ?x1279 0.0)))
(assert
 (let ((?x1283 (- (* (- p1_x a1_x) (- p2_y a1_y)) (* (- p1_y a1_y) (- p2_x a1_x)))))
 (< ?x1283 0.0)))
(assert
 (let ((?x1287 (- (* (- p1_x a1_x) (- q1_y a1_y)) (* (- p1_y a1_y) (- q1_x a1_x)))))
 (< ?x1287 0.0)))
(assert
 (let ((?x1291 (- (* (- p1_x a1_x) (- r2_y a1_y)) (* (- p1_y a1_y) (- r2_x a1_x)))))
 (< ?x1291 0.0)))
(assert
 (let ((?x1295 (- (* (- p1_x a1_x) (- a3_y a1_y)) (* (- p1_y a1_y) (- a3_x a1_x)))))
 (< ?x1295 0.0)))
(assert
 (let ((?x1299 (- (* (- p1_x a1_x) (- s3_y a1_y)) (* (- p1_y a1_y) (- s3_x a1_x)))))
 (< ?x1299 0.0)))
(assert
 (let ((?x1303 (- (* (- p1_x a1_x) (- s1_y a1_y)) (* (- p1_y a1_y) (- s1_x a1_x)))))
 (< ?x1303 0.0)))
(assert
 (let ((?x1307 (- (* (- p1_x a1_x) (- s4_y a1_y)) (* (- p1_y a1_y) (- s4_x a1_x)))))
 (< ?x1307 0.0)))
(assert
 (let ((?x1311 (- (* (- p1_x a1_x) (- s2_y a1_y)) (* (- p1_y a1_y) (- s2_x a1_x)))))
 (< ?x1311 0.0)))
(assert
 (let ((?x1315 (- (* (- q2_x a1_x) (- p2_y a1_y)) (* (- q2_y a1_y) (- p2_x a1_x)))))
 (< ?x1315 0.0)))
(assert
 (let ((?x1319 (- (* (- q2_x a1_x) (- q1_y a1_y)) (* (- q2_y a1_y) (- q1_x a1_x)))))
 (< ?x1319 0.0)))
(assert
 (let ((?x1323 (- (* (- q2_x a1_x) (- r2_y a1_y)) (* (- q2_y a1_y) (- r2_x a1_x)))))
 (< ?x1323 0.0)))
(assert
 (let ((?x1327 (- (* (- q2_x a1_x) (- a3_y a1_y)) (* (- q2_y a1_y) (- a3_x a1_x)))))
 (< ?x1327 0.0)))
(assert
 (let ((?x1331 (- (* (- q2_x a1_x) (- s3_y a1_y)) (* (- q2_y a1_y) (- s3_x a1_x)))))
 (< ?x1331 0.0)))
(assert
 (let ((?x1335 (- (* (- q2_x a1_x) (- s1_y a1_y)) (* (- q2_y a1_y) (- s1_x a1_x)))))
 (< ?x1335 0.0)))
(assert
 (let ((?x1339 (- (* (- q2_x a1_x) (- s4_y a1_y)) (* (- q2_y a1_y) (- s4_x a1_x)))))
 (< ?x1339 0.0)))
(assert
 (let ((?x1343 (- (* (- q2_x a1_x) (- s2_y a1_y)) (* (- q2_y a1_y) (- s2_x a1_x)))))
 (< ?x1343 0.0)))
(assert
 (let ((?x1347 (- (* (- p2_x a1_x) (- q1_y a1_y)) (* (- p2_y a1_y) (- q1_x a1_x)))))
 (< ?x1347 0.0)))
(assert
 (let ((?x1351 (- (* (- p2_x a1_x) (- r2_y a1_y)) (* (- p2_y a1_y) (- r2_x a1_x)))))
 (< ?x1351 0.0)))
(assert
 (let ((?x1355 (- (* (- p2_x a1_x) (- a3_y a1_y)) (* (- p2_y a1_y) (- a3_x a1_x)))))
 (< ?x1355 0.0)))
(assert
 (let ((?x1359 (- (* (- p2_x a1_x) (- s3_y a1_y)) (* (- p2_y a1_y) (- s3_x a1_x)))))
 (< ?x1359 0.0)))
(assert
 (let ((?x1363 (- (* (- p2_x a1_x) (- s1_y a1_y)) (* (- p2_y a1_y) (- s1_x a1_x)))))
 (< ?x1363 0.0)))
(assert
 (let ((?x1367 (- (* (- p2_x a1_x) (- s4_y a1_y)) (* (- p2_y a1_y) (- s4_x a1_x)))))
 (< ?x1367 0.0)))
(assert
 (let ((?x1371 (- (* (- p2_x a1_x) (- s2_y a1_y)) (* (- p2_y a1_y) (- s2_x a1_x)))))
 (< ?x1371 0.0)))
(assert
 (let ((?x1375 (- (* (- q1_x a1_x) (- r2_y a1_y)) (* (- q1_y a1_y) (- r2_x a1_x)))))
 (< ?x1375 0.0)))
(assert
 (let ((?x1379 (- (* (- q1_x a1_x) (- a3_y a1_y)) (* (- q1_y a1_y) (- a3_x a1_x)))))
 (< ?x1379 0.0)))
(assert
 (let ((?x1383 (- (* (- q1_x a1_x) (- s3_y a1_y)) (* (- q1_y a1_y) (- s3_x a1_x)))))
 (< ?x1383 0.0)))
(assert
 (let ((?x1387 (- (* (- q1_x a1_x) (- s1_y a1_y)) (* (- q1_y a1_y) (- s1_x a1_x)))))
 (< ?x1387 0.0)))
(assert
 (let ((?x1391 (- (* (- q1_x a1_x) (- s4_y a1_y)) (* (- q1_y a1_y) (- s4_x a1_x)))))
 (< ?x1391 0.0)))
(assert
 (let ((?x1395 (- (* (- q1_x a1_x) (- s2_y a1_y)) (* (- q1_y a1_y) (- s2_x a1_x)))))
 (< ?x1395 0.0)))
(assert
 (let ((?x1399 (- (* (- r2_x a1_x) (- a3_y a1_y)) (* (- r2_y a1_y) (- a3_x a1_x)))))
 (< ?x1399 0.0)))
(assert
 (let ((?x1403 (- (* (- r2_x a1_x) (- s3_y a1_y)) (* (- r2_y a1_y) (- s3_x a1_x)))))
 (< ?x1403 0.0)))
(assert
 (let ((?x1407 (- (* (- r2_x a1_x) (- s1_y a1_y)) (* (- r2_y a1_y) (- s1_x a1_x)))))
 (< ?x1407 0.0)))
(assert
 (let ((?x1411 (- (* (- r2_x a1_x) (- s4_y a1_y)) (* (- r2_y a1_y) (- s4_x a1_x)))))
 (< ?x1411 0.0)))
(assert
 (let ((?x1415 (- (* (- r2_x a1_x) (- s2_y a1_y)) (* (- r2_y a1_y) (- s2_x a1_x)))))
 (< ?x1415 0.0)))
(assert
 (let ((?x1419 (- (* (- a3_x a1_x) (- s3_y a1_y)) (* (- a3_y a1_y) (- s3_x a1_x)))))
 (< ?x1419 0.0)))
(assert
 (let ((?x1423 (- (* (- a3_x a1_x) (- s1_y a1_y)) (* (- a3_y a1_y) (- s1_x a1_x)))))
 (< ?x1423 0.0)))
(assert
 (let ((?x1427 (- (* (- a3_x a1_x) (- s4_y a1_y)) (* (- a3_y a1_y) (- s4_x a1_x)))))
 (< ?x1427 0.0)))
(assert
 (let ((?x1431 (- (* (- a3_x a1_x) (- s2_y a1_y)) (* (- a3_y a1_y) (- s2_x a1_x)))))
 (< ?x1431 0.0)))
(assert
 (let ((?x1435 (- (* (- s3_x a1_x) (- s1_y a1_y)) (* (- s3_y a1_y) (- s1_x a1_x)))))
 (< ?x1435 0.0)))
(assert
 (let ((?x1439 (- (* (- s3_x a1_x) (- s4_y a1_y)) (* (- s3_y a1_y) (- s4_x a1_x)))))
 (< ?x1439 0.0)))
(assert
 (let ((?x1443 (- (* (- s3_x a1_x) (- s2_y a1_y)) (* (- s3_y a1_y) (- s2_x a1_x)))))
 (< ?x1443 0.0)))
(assert
 (let ((?x1447 (- (* (- s1_x a1_x) (- s4_y a1_y)) (* (- s1_y a1_y) (- s4_x a1_x)))))
 (< ?x1447 0.0)))
(assert
 (let ((?x1451 (- (* (- s1_x a1_x) (- s2_y a1_y)) (* (- s1_y a1_y) (- s2_x a1_x)))))
 (< ?x1451 0.0)))
(assert
 (let ((?x1455 (- (* (- s4_x a1_x) (- s2_y a1_y)) (* (- s4_y a1_y) (- s2_x a1_x)))))
 (< ?x1455 0.0)))
(assert
 (let ((?x1463 (- (* (- t2_x t3_x) (- t4_y t3_y)) (* (- t2_y t3_y) (- t4_x t3_x)))))
 (< ?x1463 0.0)))
(assert
 (let ((?x1469 (- (* (- t2_x t3_x) (- t1_y t3_y)) (* (- t2_y t3_y) (- t1_x t3_x)))))
 (< ?x1469 0.0)))
(assert
 (let ((?x1475 (- (* (- t2_x t3_x) (- a2_y t3_y)) (* (- t2_y t3_y) (- a2_x t3_x)))))
 (< ?x1475 0.0)))
(assert
 (let ((?x1481 (- (* (- t2_x t3_x) (- r1_y t3_y)) (* (- t2_y t3_y) (- r1_x t3_x)))))
 (< ?x1481 0.0)))
(assert
 (let ((?x1487 (- (* (- t2_x t3_x) (- p1_y t3_y)) (* (- t2_y t3_y) (- p1_x t3_x)))))
 (< ?x1487 0.0)))
(assert
 (let ((?x1493 (- (* (- t2_x t3_x) (- q2_y t3_y)) (* (- t2_y t3_y) (- q2_x t3_x)))))
 (< ?x1493 0.0)))
(assert
 (let ((?x1499 (- (* (- t2_x t3_x) (- p2_y t3_y)) (* (- t2_y t3_y) (- p2_x t3_x)))))
 (< ?x1499 0.0)))
(assert
 (let ((?x1505 (- (* (- t2_x t3_x) (- q1_y t3_y)) (* (- t2_y t3_y) (- q1_x t3_x)))))
 (< ?x1505 0.0)))
(assert
 (let ((?x1511 (- (* (- t2_x t3_x) (- r2_y t3_y)) (* (- t2_y t3_y) (- r2_x t3_x)))))
 (< ?x1511 0.0)))
(assert
 (let ((?x1515 (- (* (- t2_x t3_x) (- a3_y t3_y)) (* (- t2_y t3_y) (- a3_x t3_x)))))
 (< ?x1515 0.0)))
(assert
 (let ((?x1521 (- (* (- t2_x t3_x) (- s3_y t3_y)) (* (- t2_y t3_y) (- s3_x t3_x)))))
 (< ?x1521 0.0)))
(assert
 (let ((?x1527 (- (* (- t2_x t3_x) (- s1_y t3_y)) (* (- t2_y t3_y) (- s1_x t3_x)))))
 (< ?x1527 0.0)))
(assert
 (let ((?x1533 (- (* (- t2_x t3_x) (- s4_y t3_y)) (* (- t2_y t3_y) (- s4_x t3_x)))))
 (< ?x1533 0.0)))
(assert
 (let ((?x1539 (- (* (- t2_x t3_x) (- s2_y t3_y)) (* (- t2_y t3_y) (- s2_x t3_x)))))
 (< ?x1539 0.0)))
(assert
 (let ((?x1543 (- (* (- t4_x t3_x) (- t1_y t3_y)) (* (- t4_y t3_y) (- t1_x t3_x)))))
 (< ?x1543 0.0)))
(assert
 (let ((?x1547 (- (* (- t4_x t3_x) (- a2_y t3_y)) (* (- t4_y t3_y) (- a2_x t3_x)))))
 (< ?x1547 0.0)))
(assert
 (let ((?x1551 (- (* (- t4_x t3_x) (- r1_y t3_y)) (* (- t4_y t3_y) (- r1_x t3_x)))))
 (< ?x1551 0.0)))
(assert
 (let ((?x1555 (- (* (- t4_x t3_x) (- p1_y t3_y)) (* (- t4_y t3_y) (- p1_x t3_x)))))
 (< ?x1555 0.0)))
(assert
 (let ((?x1559 (- (* (- t4_x t3_x) (- q2_y t3_y)) (* (- t4_y t3_y) (- q2_x t3_x)))))
 (< ?x1559 0.0)))
(assert
 (let ((?x1563 (- (* (- t4_x t3_x) (- p2_y t3_y)) (* (- t4_y t3_y) (- p2_x t3_x)))))
 (< ?x1563 0.0)))
(assert
 (let ((?x1567 (- (* (- t4_x t3_x) (- q1_y t3_y)) (* (- t4_y t3_y) (- q1_x t3_x)))))
 (< ?x1567 0.0)))
(assert
 (let ((?x1571 (- (* (- t4_x t3_x) (- r2_y t3_y)) (* (- t4_y t3_y) (- r2_x t3_x)))))
 (< ?x1571 0.0)))
(assert
 (let ((?x1575 (- (* (- t4_x t3_x) (- a3_y t3_y)) (* (- t4_y t3_y) (- a3_x t3_x)))))
 (< ?x1575 0.0)))
(assert
 (let ((?x1579 (- (* (- t4_x t3_x) (- s3_y t3_y)) (* (- t4_y t3_y) (- s3_x t3_x)))))
 (< ?x1579 0.0)))
(assert
 (let ((?x1583 (- (* (- t4_x t3_x) (- s1_y t3_y)) (* (- t4_y t3_y) (- s1_x t3_x)))))
 (< ?x1583 0.0)))
(assert
 (let ((?x1587 (- (* (- t4_x t3_x) (- s4_y t3_y)) (* (- t4_y t3_y) (- s4_x t3_x)))))
 (< ?x1587 0.0)))
(assert
 (let ((?x1591 (- (* (- t4_x t3_x) (- s2_y t3_y)) (* (- t4_y t3_y) (- s2_x t3_x)))))
 (< ?x1591 0.0)))
(assert
 (let ((?x1595 (- (* (- t1_x t3_x) (- a2_y t3_y)) (* (- t1_y t3_y) (- a2_x t3_x)))))
 (< ?x1595 0.0)))
(assert
 (let ((?x1599 (- (* (- t1_x t3_x) (- r1_y t3_y)) (* (- t1_y t3_y) (- r1_x t3_x)))))
 (< ?x1599 0.0)))
(assert
 (let ((?x1603 (- (* (- t1_x t3_x) (- p1_y t3_y)) (* (- t1_y t3_y) (- p1_x t3_x)))))
 (< ?x1603 0.0)))
(assert
 (let ((?x1607 (- (* (- t1_x t3_x) (- q2_y t3_y)) (* (- t1_y t3_y) (- q2_x t3_x)))))
 (< ?x1607 0.0)))
(assert
 (let ((?x1611 (- (* (- t1_x t3_x) (- p2_y t3_y)) (* (- t1_y t3_y) (- p2_x t3_x)))))
 (< ?x1611 0.0)))
(assert
 (let ((?x1615 (- (* (- t1_x t3_x) (- q1_y t3_y)) (* (- t1_y t3_y) (- q1_x t3_x)))))
 (< ?x1615 0.0)))
(assert
 (let ((?x1619 (- (* (- t1_x t3_x) (- r2_y t3_y)) (* (- t1_y t3_y) (- r2_x t3_x)))))
 (< ?x1619 0.0)))
(assert
 (let ((?x1623 (- (* (- t1_x t3_x) (- a3_y t3_y)) (* (- t1_y t3_y) (- a3_x t3_x)))))
 (< ?x1623 0.0)))
(assert
 (let ((?x1627 (- (* (- t1_x t3_x) (- s3_y t3_y)) (* (- t1_y t3_y) (- s3_x t3_x)))))
 (< ?x1627 0.0)))
(assert
 (let ((?x1631 (- (* (- t1_x t3_x) (- s1_y t3_y)) (* (- t1_y t3_y) (- s1_x t3_x)))))
 (< ?x1631 0.0)))
(assert
 (let ((?x1635 (- (* (- t1_x t3_x) (- s4_y t3_y)) (* (- t1_y t3_y) (- s4_x t3_x)))))
 (< ?x1635 0.0)))
(assert
 (let ((?x1639 (- (* (- t1_x t3_x) (- s2_y t3_y)) (* (- t1_y t3_y) (- s2_x t3_x)))))
 (< ?x1639 0.0)))
(assert
 (let ((?x1643 (- (* (- a2_x t3_x) (- r1_y t3_y)) (* (- a2_y t3_y) (- r1_x t3_x)))))
 (< ?x1643 0.0)))
(assert
 (let ((?x1647 (- (* (- a2_x t3_x) (- p1_y t3_y)) (* (- a2_y t3_y) (- p1_x t3_x)))))
 (< ?x1647 0.0)))
(assert
 (let ((?x1651 (- (* (- a2_x t3_x) (- q2_y t3_y)) (* (- a2_y t3_y) (- q2_x t3_x)))))
 (< ?x1651 0.0)))
(assert
 (let ((?x1655 (- (* (- a2_x t3_x) (- p2_y t3_y)) (* (- a2_y t3_y) (- p2_x t3_x)))))
 (< ?x1655 0.0)))
(assert
 (let ((?x1659 (- (* (- a2_x t3_x) (- q1_y t3_y)) (* (- a2_y t3_y) (- q1_x t3_x)))))
 (< ?x1659 0.0)))
(assert
 (let ((?x1663 (- (* (- a2_x t3_x) (- r2_y t3_y)) (* (- a2_y t3_y) (- r2_x t3_x)))))
 (< ?x1663 0.0)))
(assert
 (let ((?x1667 (- (* (- a2_x t3_x) (- a3_y t3_y)) (* (- a2_y t3_y) (- a3_x t3_x)))))
 (< ?x1667 0.0)))
(assert
 (let ((?x1671 (- (* (- a2_x t3_x) (- s3_y t3_y)) (* (- a2_y t3_y) (- s3_x t3_x)))))
 (< ?x1671 0.0)))
(assert
 (let ((?x1675 (- (* (- a2_x t3_x) (- s1_y t3_y)) (* (- a2_y t3_y) (- s1_x t3_x)))))
 (< ?x1675 0.0)))
(assert
 (let ((?x1679 (- (* (- a2_x t3_x) (- s4_y t3_y)) (* (- a2_y t3_y) (- s4_x t3_x)))))
 (< ?x1679 0.0)))
(assert
 (let ((?x1683 (- (* (- a2_x t3_x) (- s2_y t3_y)) (* (- a2_y t3_y) (- s2_x t3_x)))))
 (< ?x1683 0.0)))
(assert
 (let ((?x1687 (- (* (- r1_x t3_x) (- p1_y t3_y)) (* (- r1_y t3_y) (- p1_x t3_x)))))
 (< ?x1687 0.0)))
(assert
 (let ((?x1691 (- (* (- r1_x t3_x) (- q2_y t3_y)) (* (- r1_y t3_y) (- q2_x t3_x)))))
 (< ?x1691 0.0)))
(assert
 (let ((?x1695 (- (* (- r1_x t3_x) (- p2_y t3_y)) (* (- r1_y t3_y) (- p2_x t3_x)))))
 (< ?x1695 0.0)))
(assert
 (let ((?x1699 (- (* (- r1_x t3_x) (- q1_y t3_y)) (* (- r1_y t3_y) (- q1_x t3_x)))))
 (< ?x1699 0.0)))
(assert
 (let ((?x1703 (- (* (- r1_x t3_x) (- r2_y t3_y)) (* (- r1_y t3_y) (- r2_x t3_x)))))
 (< ?x1703 0.0)))
(assert
 (let ((?x1707 (- (* (- r1_x t3_x) (- a3_y t3_y)) (* (- r1_y t3_y) (- a3_x t3_x)))))
 (< ?x1707 0.0)))
(assert
 (let ((?x1711 (- (* (- r1_x t3_x) (- s3_y t3_y)) (* (- r1_y t3_y) (- s3_x t3_x)))))
 (< ?x1711 0.0)))
(assert
 (let ((?x1715 (- (* (- r1_x t3_x) (- s1_y t3_y)) (* (- r1_y t3_y) (- s1_x t3_x)))))
 (< ?x1715 0.0)))
(assert
 (let ((?x1719 (- (* (- r1_x t3_x) (- s4_y t3_y)) (* (- r1_y t3_y) (- s4_x t3_x)))))
 (< ?x1719 0.0)))
(assert
 (let ((?x1723 (- (* (- r1_x t3_x) (- s2_y t3_y)) (* (- r1_y t3_y) (- s2_x t3_x)))))
 (< ?x1723 0.0)))
(assert
 (let ((?x1727 (- (* (- p1_x t3_x) (- q2_y t3_y)) (* (- p1_y t3_y) (- q2_x t3_x)))))
 (< ?x1727 0.0)))
(assert
 (let ((?x1731 (- (* (- p1_x t3_x) (- p2_y t3_y)) (* (- p1_y t3_y) (- p2_x t3_x)))))
 (< ?x1731 0.0)))
(assert
 (let ((?x1735 (- (* (- p1_x t3_x) (- q1_y t3_y)) (* (- p1_y t3_y) (- q1_x t3_x)))))
 (< ?x1735 0.0)))
(assert
 (let ((?x1739 (- (* (- p1_x t3_x) (- r2_y t3_y)) (* (- p1_y t3_y) (- r2_x t3_x)))))
 (< ?x1739 0.0)))
(assert
 (let ((?x1743 (- (* (- p1_x t3_x) (- a3_y t3_y)) (* (- p1_y t3_y) (- a3_x t3_x)))))
 (< ?x1743 0.0)))
(assert
 (let ((?x1747 (- (* (- p1_x t3_x) (- s3_y t3_y)) (* (- p1_y t3_y) (- s3_x t3_x)))))
 (< ?x1747 0.0)))
(assert
 (let ((?x1751 (- (* (- p1_x t3_x) (- s1_y t3_y)) (* (- p1_y t3_y) (- s1_x t3_x)))))
 (< ?x1751 0.0)))
(assert
 (let ((?x1755 (- (* (- p1_x t3_x) (- s4_y t3_y)) (* (- p1_y t3_y) (- s4_x t3_x)))))
 (< ?x1755 0.0)))
(assert
 (let ((?x1759 (- (* (- p1_x t3_x) (- s2_y t3_y)) (* (- p1_y t3_y) (- s2_x t3_x)))))
 (< ?x1759 0.0)))
(assert
 (let ((?x1763 (- (* (- q2_x t3_x) (- p2_y t3_y)) (* (- q2_y t3_y) (- p2_x t3_x)))))
 (< ?x1763 0.0)))
(assert
 (let ((?x1767 (- (* (- q2_x t3_x) (- q1_y t3_y)) (* (- q2_y t3_y) (- q1_x t3_x)))))
 (< ?x1767 0.0)))
(assert
 (let ((?x1771 (- (* (- q2_x t3_x) (- r2_y t3_y)) (* (- q2_y t3_y) (- r2_x t3_x)))))
 (< ?x1771 0.0)))
(assert
 (let ((?x1775 (- (* (- q2_x t3_x) (- a3_y t3_y)) (* (- q2_y t3_y) (- a3_x t3_x)))))
 (< ?x1775 0.0)))
(assert
 (let ((?x1779 (- (* (- q2_x t3_x) (- s3_y t3_y)) (* (- q2_y t3_y) (- s3_x t3_x)))))
 (< ?x1779 0.0)))
(assert
 (let ((?x1783 (- (* (- q2_x t3_x) (- s1_y t3_y)) (* (- q2_y t3_y) (- s1_x t3_x)))))
 (< ?x1783 0.0)))
(assert
 (let ((?x1787 (- (* (- q2_x t3_x) (- s4_y t3_y)) (* (- q2_y t3_y) (- s4_x t3_x)))))
 (< ?x1787 0.0)))
(assert
 (let ((?x1791 (- (* (- q2_x t3_x) (- s2_y t3_y)) (* (- q2_y t3_y) (- s2_x t3_x)))))
 (< ?x1791 0.0)))
(assert
 (let ((?x1795 (- (* (- p2_x t3_x) (- q1_y t3_y)) (* (- p2_y t3_y) (- q1_x t3_x)))))
 (< ?x1795 0.0)))
(assert
 (let ((?x1799 (- (* (- p2_x t3_x) (- r2_y t3_y)) (* (- p2_y t3_y) (- r2_x t3_x)))))
 (< ?x1799 0.0)))
(assert
 (let ((?x1803 (- (* (- p2_x t3_x) (- a3_y t3_y)) (* (- p2_y t3_y) (- a3_x t3_x)))))
 (< ?x1803 0.0)))
(assert
 (let ((?x1807 (- (* (- p2_x t3_x) (- s3_y t3_y)) (* (- p2_y t3_y) (- s3_x t3_x)))))
 (< ?x1807 0.0)))
(assert
 (let ((?x1811 (- (* (- p2_x t3_x) (- s1_y t3_y)) (* (- p2_y t3_y) (- s1_x t3_x)))))
 (< ?x1811 0.0)))
(assert
 (let ((?x1815 (- (* (- p2_x t3_x) (- s4_y t3_y)) (* (- p2_y t3_y) (- s4_x t3_x)))))
 (< ?x1815 0.0)))
(assert
 (let ((?x1819 (- (* (- p2_x t3_x) (- s2_y t3_y)) (* (- p2_y t3_y) (- s2_x t3_x)))))
 (< ?x1819 0.0)))
(assert
 (let ((?x1823 (- (* (- q1_x t3_x) (- r2_y t3_y)) (* (- q1_y t3_y) (- r2_x t3_x)))))
 (< ?x1823 0.0)))
(assert
 (let ((?x1827 (- (* (- q1_x t3_x) (- a3_y t3_y)) (* (- q1_y t3_y) (- a3_x t3_x)))))
 (< ?x1827 0.0)))
(assert
 (let ((?x1831 (- (* (- q1_x t3_x) (- s3_y t3_y)) (* (- q1_y t3_y) (- s3_x t3_x)))))
 (< ?x1831 0.0)))
(assert
 (let ((?x1835 (- (* (- q1_x t3_x) (- s1_y t3_y)) (* (- q1_y t3_y) (- s1_x t3_x)))))
 (< ?x1835 0.0)))
(assert
 (let ((?x1839 (- (* (- q1_x t3_x) (- s4_y t3_y)) (* (- q1_y t3_y) (- s4_x t3_x)))))
 (< ?x1839 0.0)))
(assert
 (let ((?x1843 (- (* (- q1_x t3_x) (- s2_y t3_y)) (* (- q1_y t3_y) (- s2_x t3_x)))))
 (< ?x1843 0.0)))
(assert
 (let ((?x1847 (- (* (- r2_x t3_x) (- a3_y t3_y)) (* (- r2_y t3_y) (- a3_x t3_x)))))
 (< ?x1847 0.0)))
(assert
 (let ((?x1851 (- (* (- r2_x t3_x) (- s3_y t3_y)) (* (- r2_y t3_y) (- s3_x t3_x)))))
 (< ?x1851 0.0)))
(assert
 (let ((?x1855 (- (* (- r2_x t3_x) (- s1_y t3_y)) (* (- r2_y t3_y) (- s1_x t3_x)))))
 (< ?x1855 0.0)))
(assert
 (let ((?x1859 (- (* (- r2_x t3_x) (- s4_y t3_y)) (* (- r2_y t3_y) (- s4_x t3_x)))))
 (< ?x1859 0.0)))
(assert
 (let ((?x1863 (- (* (- r2_x t3_x) (- s2_y t3_y)) (* (- r2_y t3_y) (- s2_x t3_x)))))
 (< ?x1863 0.0)))
(assert
 (let ((?x1867 (- (* (- a3_x t3_x) (- s3_y t3_y)) (* (- a3_y t3_y) (- s3_x t3_x)))))
 (< ?x1867 0.0)))
(assert
 (let ((?x1871 (- (* (- a3_x t3_x) (- s1_y t3_y)) (* (- a3_y t3_y) (- s1_x t3_x)))))
 (< ?x1871 0.0)))
(assert
 (let ((?x1875 (- (* (- a3_x t3_x) (- s4_y t3_y)) (* (- a3_y t3_y) (- s4_x t3_x)))))
 (< ?x1875 0.0)))
(assert
 (let ((?x1879 (- (* (- a3_x t3_x) (- s2_y t3_y)) (* (- a3_y t3_y) (- s2_x t3_x)))))
 (< ?x1879 0.0)))
(assert
 (let ((?x1883 (- (* (- s3_x t3_x) (- s1_y t3_y)) (* (- s3_y t3_y) (- s1_x t3_x)))))
 (< ?x1883 0.0)))
(assert
 (let ((?x1887 (- (* (- s3_x t3_x) (- s4_y t3_y)) (* (- s3_y t3_y) (- s4_x t3_x)))))
 (< ?x1887 0.0)))
(assert
 (let ((?x1891 (- (* (- s3_x t3_x) (- s2_y t3_y)) (* (- s3_y t3_y) (- s2_x t3_x)))))
 (< ?x1891 0.0)))
(assert
 (let ((?x1895 (- (* (- s1_x t3_x) (- s4_y t3_y)) (* (- s1_y t3_y) (- s4_x t3_x)))))
 (< ?x1895 0.0)))
(assert
 (let ((?x1899 (- (* (- s1_x t3_x) (- s2_y t3_y)) (* (- s1_y t3_y) (- s2_x t3_x)))))
 (< ?x1899 0.0)))
(assert
 (let ((?x1903 (- (* (- s4_x t3_x) (- s2_y t3_y)) (* (- s4_y t3_y) (- s2_x t3_x)))))
 (< ?x1903 0.0)))
(assert
 (let ((?x1911 (- (* (- t4_x t2_x) (- t1_y t2_y)) (* (- t4_y t2_y) (- t1_x t2_x)))))
 (< ?x1911 0.0)))
(assert
 (let ((?x1917 (- (* (- t4_x t2_x) (- a2_y t2_y)) (* (- t4_y t2_y) (- a2_x t2_x)))))
 (< ?x1917 0.0)))
(assert
 (let ((?x1923 (- (* (- t4_x t2_x) (- r1_y t2_y)) (* (- t4_y t2_y) (- r1_x t2_x)))))
 (< ?x1923 0.0)))
(assert
 (let ((?x1929 (- (* (- t4_x t2_x) (- p1_y t2_y)) (* (- t4_y t2_y) (- p1_x t2_x)))))
 (< ?x1929 0.0)))
(assert
 (let ((?x1935 (- (* (- t4_x t2_x) (- q2_y t2_y)) (* (- t4_y t2_y) (- q2_x t2_x)))))
 (< ?x1935 0.0)))
(assert
 (let ((?x1941 (- (* (- t4_x t2_x) (- p2_y t2_y)) (* (- t4_y t2_y) (- p2_x t2_x)))))
 (< ?x1941 0.0)))
(assert
 (let ((?x1945 (- (* (- t4_x t2_x) (- q1_y t2_y)) (* (- t4_y t2_y) (- q1_x t2_x)))))
 (< ?x1945 0.0)))
(assert
 (let ((?x1951 (- (* (- t4_x t2_x) (- r2_y t2_y)) (* (- t4_y t2_y) (- r2_x t2_x)))))
 (< ?x1951 0.0)))
(assert
 (let ((?x1957 (- (* (- t4_x t2_x) (- a3_y t2_y)) (* (- t4_y t2_y) (- a3_x t2_x)))))
 (< ?x1957 0.0)))
(assert
 (let ((?x1963 (- (* (- t4_x t2_x) (- s3_y t2_y)) (* (- t4_y t2_y) (- s3_x t2_x)))))
 (< ?x1963 0.0)))
(assert
 (let ((?x1969 (- (* (- t4_x t2_x) (- s1_y t2_y)) (* (- t4_y t2_y) (- s1_x t2_x)))))
 (< ?x1969 0.0)))
(assert
 (let ((?x1975 (- (* (- t4_x t2_x) (- s4_y t2_y)) (* (- t4_y t2_y) (- s4_x t2_x)))))
 (< ?x1975 0.0)))
(assert
 (let ((?x1981 (- (* (- t4_x t2_x) (- s2_y t2_y)) (* (- t4_y t2_y) (- s2_x t2_x)))))
 (< ?x1981 0.0)))
(assert
 (let ((?x1985 (- (* (- t1_x t2_x) (- a2_y t2_y)) (* (- t1_y t2_y) (- a2_x t2_x)))))
 (< ?x1985 0.0)))
(assert
 (let ((?x1989 (- (* (- t1_x t2_x) (- r1_y t2_y)) (* (- t1_y t2_y) (- r1_x t2_x)))))
 (< ?x1989 0.0)))
(assert
 (let ((?x1993 (- (* (- t1_x t2_x) (- p1_y t2_y)) (* (- t1_y t2_y) (- p1_x t2_x)))))
 (< ?x1993 0.0)))
(assert
 (let ((?x1997 (- (* (- t1_x t2_x) (- q2_y t2_y)) (* (- t1_y t2_y) (- q2_x t2_x)))))
 (< ?x1997 0.0)))
(assert
 (let ((?x2001 (- (* (- t1_x t2_x) (- p2_y t2_y)) (* (- t1_y t2_y) (- p2_x t2_x)))))
 (< ?x2001 0.0)))
(assert
 (let ((?x2005 (- (* (- t1_x t2_x) (- q1_y t2_y)) (* (- t1_y t2_y) (- q1_x t2_x)))))
 (< ?x2005 0.0)))
(assert
 (let ((?x2009 (- (* (- t1_x t2_x) (- r2_y t2_y)) (* (- t1_y t2_y) (- r2_x t2_x)))))
 (< ?x2009 0.0)))
(assert
 (let ((?x2013 (- (* (- t1_x t2_x) (- a3_y t2_y)) (* (- t1_y t2_y) (- a3_x t2_x)))))
 (< ?x2013 0.0)))
(assert
 (let ((?x2017 (- (* (- t1_x t2_x) (- s3_y t2_y)) (* (- t1_y t2_y) (- s3_x t2_x)))))
 (< ?x2017 0.0)))
(assert
 (let ((?x2021 (- (* (- t1_x t2_x) (- s1_y t2_y)) (* (- t1_y t2_y) (- s1_x t2_x)))))
 (< ?x2021 0.0)))
(assert
 (let ((?x2025 (- (* (- t1_x t2_x) (- s4_y t2_y)) (* (- t1_y t2_y) (- s4_x t2_x)))))
 (< ?x2025 0.0)))
(assert
 (let ((?x2029 (- (* (- t1_x t2_x) (- s2_y t2_y)) (* (- t1_y t2_y) (- s2_x t2_x)))))
 (< ?x2029 0.0)))
(assert
 (let ((?x2033 (- (* (- a2_x t2_x) (- r1_y t2_y)) (* (- a2_y t2_y) (- r1_x t2_x)))))
 (< ?x2033 0.0)))
(assert
 (let ((?x2037 (- (* (- a2_x t2_x) (- p1_y t2_y)) (* (- a2_y t2_y) (- p1_x t2_x)))))
 (< ?x2037 0.0)))
(assert
 (let ((?x2041 (- (* (- a2_x t2_x) (- q2_y t2_y)) (* (- a2_y t2_y) (- q2_x t2_x)))))
 (< ?x2041 0.0)))
(assert
 (let ((?x2045 (- (* (- a2_x t2_x) (- p2_y t2_y)) (* (- a2_y t2_y) (- p2_x t2_x)))))
 (< ?x2045 0.0)))
(assert
 (let ((?x2049 (- (* (- a2_x t2_x) (- q1_y t2_y)) (* (- a2_y t2_y) (- q1_x t2_x)))))
 (< ?x2049 0.0)))
(assert
 (let ((?x2053 (- (* (- a2_x t2_x) (- r2_y t2_y)) (* (- a2_y t2_y) (- r2_x t2_x)))))
 (< ?x2053 0.0)))
(assert
 (let ((?x2057 (- (* (- a2_x t2_x) (- a3_y t2_y)) (* (- a2_y t2_y) (- a3_x t2_x)))))
 (< ?x2057 0.0)))
(assert
 (let ((?x2061 (- (* (- a2_x t2_x) (- s3_y t2_y)) (* (- a2_y t2_y) (- s3_x t2_x)))))
 (< ?x2061 0.0)))
(assert
 (let ((?x2065 (- (* (- a2_x t2_x) (- s1_y t2_y)) (* (- a2_y t2_y) (- s1_x t2_x)))))
 (< ?x2065 0.0)))
(assert
 (let ((?x2069 (- (* (- a2_x t2_x) (- s4_y t2_y)) (* (- a2_y t2_y) (- s4_x t2_x)))))
 (< ?x2069 0.0)))
(assert
 (let ((?x2073 (- (* (- a2_x t2_x) (- s2_y t2_y)) (* (- a2_y t2_y) (- s2_x t2_x)))))
 (< ?x2073 0.0)))
(assert
 (let ((?x2077 (- (* (- r1_x t2_x) (- p1_y t2_y)) (* (- r1_y t2_y) (- p1_x t2_x)))))
 (< ?x2077 0.0)))
(assert
 (let ((?x2081 (- (* (- r1_x t2_x) (- q2_y t2_y)) (* (- r1_y t2_y) (- q2_x t2_x)))))
 (< ?x2081 0.0)))
(assert
 (let ((?x2085 (- (* (- r1_x t2_x) (- p2_y t2_y)) (* (- r1_y t2_y) (- p2_x t2_x)))))
 (< ?x2085 0.0)))
(assert
 (let ((?x2089 (- (* (- r1_x t2_x) (- q1_y t2_y)) (* (- r1_y t2_y) (- q1_x t2_x)))))
 (< ?x2089 0.0)))
(assert
 (let ((?x2093 (- (* (- r1_x t2_x) (- r2_y t2_y)) (* (- r1_y t2_y) (- r2_x t2_x)))))
 (< ?x2093 0.0)))
(assert
 (let ((?x2097 (- (* (- r1_x t2_x) (- a3_y t2_y)) (* (- r1_y t2_y) (- a3_x t2_x)))))
 (< ?x2097 0.0)))
(assert
 (let ((?x2101 (- (* (- r1_x t2_x) (- s3_y t2_y)) (* (- r1_y t2_y) (- s3_x t2_x)))))
 (< ?x2101 0.0)))
(assert
 (let ((?x2105 (- (* (- r1_x t2_x) (- s1_y t2_y)) (* (- r1_y t2_y) (- s1_x t2_x)))))
 (< ?x2105 0.0)))
(assert
 (let ((?x2109 (- (* (- r1_x t2_x) (- s4_y t2_y)) (* (- r1_y t2_y) (- s4_x t2_x)))))
 (< ?x2109 0.0)))
(assert
 (let ((?x2113 (- (* (- r1_x t2_x) (- s2_y t2_y)) (* (- r1_y t2_y) (- s2_x t2_x)))))
 (< ?x2113 0.0)))
(assert
 (let ((?x2117 (- (* (- p1_x t2_x) (- q2_y t2_y)) (* (- p1_y t2_y) (- q2_x t2_x)))))
 (< ?x2117 0.0)))
(assert
 (let ((?x2121 (- (* (- p1_x t2_x) (- p2_y t2_y)) (* (- p1_y t2_y) (- p2_x t2_x)))))
 (< ?x2121 0.0)))
(assert
 (let ((?x2125 (- (* (- p1_x t2_x) (- q1_y t2_y)) (* (- p1_y t2_y) (- q1_x t2_x)))))
 (< ?x2125 0.0)))
(assert
 (let ((?x2129 (- (* (- p1_x t2_x) (- r2_y t2_y)) (* (- p1_y t2_y) (- r2_x t2_x)))))
 (< ?x2129 0.0)))
(assert
 (let ((?x2133 (- (* (- p1_x t2_x) (- a3_y t2_y)) (* (- p1_y t2_y) (- a3_x t2_x)))))
 (< ?x2133 0.0)))
(assert
 (let ((?x2137 (- (* (- p1_x t2_x) (- s3_y t2_y)) (* (- p1_y t2_y) (- s3_x t2_x)))))
 (< ?x2137 0.0)))
(assert
 (let ((?x2141 (- (* (- p1_x t2_x) (- s1_y t2_y)) (* (- p1_y t2_y) (- s1_x t2_x)))))
 (< ?x2141 0.0)))
(assert
 (let ((?x2145 (- (* (- p1_x t2_x) (- s4_y t2_y)) (* (- p1_y t2_y) (- s4_x t2_x)))))
 (< ?x2145 0.0)))
(assert
 (let ((?x2149 (- (* (- p1_x t2_x) (- s2_y t2_y)) (* (- p1_y t2_y) (- s2_x t2_x)))))
 (< ?x2149 0.0)))
(assert
 (let ((?x2153 (- (* (- q2_x t2_x) (- p2_y t2_y)) (* (- q2_y t2_y) (- p2_x t2_x)))))
 (< ?x2153 0.0)))
(assert
 (let ((?x2157 (- (* (- q2_x t2_x) (- q1_y t2_y)) (* (- q2_y t2_y) (- q1_x t2_x)))))
 (< ?x2157 0.0)))
(assert
 (let ((?x2161 (- (* (- q2_x t2_x) (- r2_y t2_y)) (* (- q2_y t2_y) (- r2_x t2_x)))))
 (< ?x2161 0.0)))
(assert
 (let ((?x2165 (- (* (- q2_x t2_x) (- a3_y t2_y)) (* (- q2_y t2_y) (- a3_x t2_x)))))
 (< ?x2165 0.0)))
(assert
 (let ((?x2169 (- (* (- q2_x t2_x) (- s3_y t2_y)) (* (- q2_y t2_y) (- s3_x t2_x)))))
 (< ?x2169 0.0)))
(assert
 (let ((?x2173 (- (* (- q2_x t2_x) (- s1_y t2_y)) (* (- q2_y t2_y) (- s1_x t2_x)))))
 (< ?x2173 0.0)))
(assert
 (let ((?x2177 (- (* (- q2_x t2_x) (- s4_y t2_y)) (* (- q2_y t2_y) (- s4_x t2_x)))))
 (< ?x2177 0.0)))
(assert
 (let ((?x2181 (- (* (- q2_x t2_x) (- s2_y t2_y)) (* (- q2_y t2_y) (- s2_x t2_x)))))
 (< ?x2181 0.0)))
(assert
 (let ((?x2185 (- (* (- p2_x t2_x) (- q1_y t2_y)) (* (- p2_y t2_y) (- q1_x t2_x)))))
 (< ?x2185 0.0)))
(assert
 (let ((?x2189 (- (* (- p2_x t2_x) (- r2_y t2_y)) (* (- p2_y t2_y) (- r2_x t2_x)))))
 (< ?x2189 0.0)))
(assert
 (let ((?x2193 (- (* (- p2_x t2_x) (- a3_y t2_y)) (* (- p2_y t2_y) (- a3_x t2_x)))))
 (< ?x2193 0.0)))
(assert
 (let ((?x2197 (- (* (- p2_x t2_x) (- s3_y t2_y)) (* (- p2_y t2_y) (- s3_x t2_x)))))
 (< ?x2197 0.0)))
(assert
 (let ((?x2201 (- (* (- p2_x t2_x) (- s1_y t2_y)) (* (- p2_y t2_y) (- s1_x t2_x)))))
 (< ?x2201 0.0)))
(assert
 (let ((?x2205 (- (* (- p2_x t2_x) (- s4_y t2_y)) (* (- p2_y t2_y) (- s4_x t2_x)))))
 (< ?x2205 0.0)))
(assert
 (let ((?x2209 (- (* (- p2_x t2_x) (- s2_y t2_y)) (* (- p2_y t2_y) (- s2_x t2_x)))))
 (< ?x2209 0.0)))
(assert
 (let ((?x2213 (- (* (- q1_x t2_x) (- r2_y t2_y)) (* (- q1_y t2_y) (- r2_x t2_x)))))
 (< ?x2213 0.0)))
(assert
 (let ((?x2217 (- (* (- q1_x t2_x) (- a3_y t2_y)) (* (- q1_y t2_y) (- a3_x t2_x)))))
 (< ?x2217 0.0)))
(assert
 (let ((?x2221 (- (* (- q1_x t2_x) (- s3_y t2_y)) (* (- q1_y t2_y) (- s3_x t2_x)))))
 (< ?x2221 0.0)))
(assert
 (let ((?x2225 (- (* (- q1_x t2_x) (- s1_y t2_y)) (* (- q1_y t2_y) (- s1_x t2_x)))))
 (< ?x2225 0.0)))
(assert
 (let ((?x2229 (- (* (- q1_x t2_x) (- s4_y t2_y)) (* (- q1_y t2_y) (- s4_x t2_x)))))
 (< ?x2229 0.0)))
(assert
 (let ((?x2233 (- (* (- q1_x t2_x) (- s2_y t2_y)) (* (- q1_y t2_y) (- s2_x t2_x)))))
 (< ?x2233 0.0)))
(assert
 (let ((?x2237 (- (* (- r2_x t2_x) (- a3_y t2_y)) (* (- r2_y t2_y) (- a3_x t2_x)))))
 (< ?x2237 0.0)))
(assert
 (let ((?x2241 (- (* (- r2_x t2_x) (- s3_y t2_y)) (* (- r2_y t2_y) (- s3_x t2_x)))))
 (< ?x2241 0.0)))
(assert
 (let ((?x2245 (- (* (- r2_x t2_x) (- s1_y t2_y)) (* (- r2_y t2_y) (- s1_x t2_x)))))
 (< ?x2245 0.0)))
(assert
 (let ((?x2249 (- (* (- r2_x t2_x) (- s4_y t2_y)) (* (- r2_y t2_y) (- s4_x t2_x)))))
 (< ?x2249 0.0)))
(assert
 (let ((?x2253 (- (* (- r2_x t2_x) (- s2_y t2_y)) (* (- r2_y t2_y) (- s2_x t2_x)))))
 (< ?x2253 0.0)))
(assert
 (let ((?x2257 (- (* (- a3_x t2_x) (- s3_y t2_y)) (* (- a3_y t2_y) (- s3_x t2_x)))))
 (< ?x2257 0.0)))
(assert
 (let ((?x2261 (- (* (- a3_x t2_x) (- s1_y t2_y)) (* (- a3_y t2_y) (- s1_x t2_x)))))
 (< ?x2261 0.0)))
(assert
 (let ((?x2265 (- (* (- a3_x t2_x) (- s4_y t2_y)) (* (- a3_y t2_y) (- s4_x t2_x)))))
 (< ?x2265 0.0)))
(assert
 (let ((?x2269 (- (* (- a3_x t2_x) (- s2_y t2_y)) (* (- a3_y t2_y) (- s2_x t2_x)))))
 (< ?x2269 0.0)))
(assert
 (let ((?x2273 (- (* (- s3_x t2_x) (- s1_y t2_y)) (* (- s3_y t2_y) (- s1_x t2_x)))))
 (< ?x2273 0.0)))
(assert
 (let ((?x2277 (- (* (- s3_x t2_x) (- s4_y t2_y)) (* (- s3_y t2_y) (- s4_x t2_x)))))
 (< ?x2277 0.0)))
(assert
 (let ((?x2281 (- (* (- s3_x t2_x) (- s2_y t2_y)) (* (- s3_y t2_y) (- s2_x t2_x)))))
 (< ?x2281 0.0)))
(assert
 (let ((?x2285 (- (* (- s1_x t2_x) (- s4_y t2_y)) (* (- s1_y t2_y) (- s4_x t2_x)))))
 (< ?x2285 0.0)))
(assert
 (let ((?x2289 (- (* (- s1_x t2_x) (- s2_y t2_y)) (* (- s1_y t2_y) (- s2_x t2_x)))))
 (< ?x2289 0.0)))
(assert
 (let ((?x2293 (- (* (- s4_x t2_x) (- s2_y t2_y)) (* (- s4_y t2_y) (- s2_x t2_x)))))
 (< ?x2293 0.0)))
(assert
 (let ((?x2301 (- (* (- t1_x t4_x) (- a2_y t4_y)) (* (- t1_y t4_y) (- a2_x t4_x)))))
 (< ?x2301 0.0)))
(assert
 (let ((?x2307 (- (* (- t1_x t4_x) (- r1_y t4_y)) (* (- t1_y t4_y) (- r1_x t4_x)))))
 (< ?x2307 0.0)))
(assert
 (let ((?x2313 (- (* (- t1_x t4_x) (- p1_y t4_y)) (* (- t1_y t4_y) (- p1_x t4_x)))))
 (< ?x2313 0.0)))
(assert
 (let ((?x2319 (- (* (- t1_x t4_x) (- q2_y t4_y)) (* (- t1_y t4_y) (- q2_x t4_x)))))
 (< ?x2319 0.0)))
(assert
 (let ((?x2325 (- (* (- t1_x t4_x) (- p2_y t4_y)) (* (- t1_y t4_y) (- p2_x t4_x)))))
 (< ?x2325 0.0)))
(assert
 (let ((?x2331 (- (* (- t1_x t4_x) (- q1_y t4_y)) (* (- t1_y t4_y) (- q1_x t4_x)))))
 (< ?x2331 0.0)))
(assert
 (let ((?x2337 (- (* (- t1_x t4_x) (- r2_y t4_y)) (* (- t1_y t4_y) (- r2_x t4_x)))))
 (< ?x2337 0.0)))
(assert
 (let ((?x2341 (- (* (- t1_x t4_x) (- a3_y t4_y)) (* (- t1_y t4_y) (- a3_x t4_x)))))
 (< ?x2341 0.0)))
(assert
 (let ((?x2347 (- (* (- t1_x t4_x) (- s3_y t4_y)) (* (- t1_y t4_y) (- s3_x t4_x)))))
 (< ?x2347 0.0)))
(assert
 (let ((?x2353 (- (* (- t1_x t4_x) (- s1_y t4_y)) (* (- t1_y t4_y) (- s1_x t4_x)))))
 (< ?x2353 0.0)))
(assert
 (let ((?x2359 (- (* (- t1_x t4_x) (- s4_y t4_y)) (* (- t1_y t4_y) (- s4_x t4_x)))))
 (< ?x2359 0.0)))
(assert
 (let ((?x2365 (- (* (- t1_x t4_x) (- s2_y t4_y)) (* (- t1_y t4_y) (- s2_x t4_x)))))
 (< ?x2365 0.0)))
(assert
 (let ((?x2369 (- (* (- a2_x t4_x) (- r1_y t4_y)) (* (- a2_y t4_y) (- r1_x t4_x)))))
 (< ?x2369 0.0)))
(assert
 (let ((?x2373 (- (* (- a2_x t4_x) (- p1_y t4_y)) (* (- a2_y t4_y) (- p1_x t4_x)))))
 (< ?x2373 0.0)))
(assert
 (let ((?x2377 (- (* (- a2_x t4_x) (- q2_y t4_y)) (* (- a2_y t4_y) (- q2_x t4_x)))))
 (< ?x2377 0.0)))
(assert
 (let ((?x2381 (- (* (- a2_x t4_x) (- p2_y t4_y)) (* (- a2_y t4_y) (- p2_x t4_x)))))
 (< ?x2381 0.0)))
(assert
 (let ((?x2385 (- (* (- a2_x t4_x) (- q1_y t4_y)) (* (- a2_y t4_y) (- q1_x t4_x)))))
 (< ?x2385 0.0)))
(assert
 (let ((?x2389 (- (* (- a2_x t4_x) (- r2_y t4_y)) (* (- a2_y t4_y) (- r2_x t4_x)))))
 (< ?x2389 0.0)))
(assert
 (let ((?x2393 (- (* (- a2_x t4_x) (- a3_y t4_y)) (* (- a2_y t4_y) (- a3_x t4_x)))))
 (< ?x2393 0.0)))
(assert
 (let ((?x2397 (- (* (- a2_x t4_x) (- s3_y t4_y)) (* (- a2_y t4_y) (- s3_x t4_x)))))
 (< ?x2397 0.0)))
(assert
 (let ((?x2401 (- (* (- a2_x t4_x) (- s1_y t4_y)) (* (- a2_y t4_y) (- s1_x t4_x)))))
 (< ?x2401 0.0)))
(assert
 (let ((?x2405 (- (* (- a2_x t4_x) (- s4_y t4_y)) (* (- a2_y t4_y) (- s4_x t4_x)))))
 (< ?x2405 0.0)))
(assert
 (let ((?x2409 (- (* (- a2_x t4_x) (- s2_y t4_y)) (* (- a2_y t4_y) (- s2_x t4_x)))))
 (< ?x2409 0.0)))
(assert
 (let ((?x2413 (- (* (- r1_x t4_x) (- p1_y t4_y)) (* (- r1_y t4_y) (- p1_x t4_x)))))
 (< ?x2413 0.0)))
(assert
 (let ((?x2417 (- (* (- r1_x t4_x) (- q2_y t4_y)) (* (- r1_y t4_y) (- q2_x t4_x)))))
 (< ?x2417 0.0)))
(assert
 (let ((?x2421 (- (* (- r1_x t4_x) (- p2_y t4_y)) (* (- r1_y t4_y) (- p2_x t4_x)))))
 (< ?x2421 0.0)))
(assert
 (let ((?x2425 (- (* (- r1_x t4_x) (- q1_y t4_y)) (* (- r1_y t4_y) (- q1_x t4_x)))))
 (< ?x2425 0.0)))
(assert
 (let ((?x2429 (- (* (- r1_x t4_x) (- r2_y t4_y)) (* (- r1_y t4_y) (- r2_x t4_x)))))
 (< ?x2429 0.0)))
(assert
 (let ((?x2433 (- (* (- r1_x t4_x) (- a3_y t4_y)) (* (- r1_y t4_y) (- a3_x t4_x)))))
 (< ?x2433 0.0)))
(assert
 (let ((?x2437 (- (* (- r1_x t4_x) (- s3_y t4_y)) (* (- r1_y t4_y) (- s3_x t4_x)))))
 (< ?x2437 0.0)))
(assert
 (let ((?x2441 (- (* (- r1_x t4_x) (- s1_y t4_y)) (* (- r1_y t4_y) (- s1_x t4_x)))))
 (< ?x2441 0.0)))
(assert
 (let ((?x2445 (- (* (- r1_x t4_x) (- s4_y t4_y)) (* (- r1_y t4_y) (- s4_x t4_x)))))
 (< ?x2445 0.0)))
(assert
 (let ((?x2449 (- (* (- r1_x t4_x) (- s2_y t4_y)) (* (- r1_y t4_y) (- s2_x t4_x)))))
 (< ?x2449 0.0)))
(assert
 (let ((?x2453 (- (* (- p1_x t4_x) (- q2_y t4_y)) (* (- p1_y t4_y) (- q2_x t4_x)))))
 (< ?x2453 0.0)))
(assert
 (let ((?x2457 (- (* (- p1_x t4_x) (- p2_y t4_y)) (* (- p1_y t4_y) (- p2_x t4_x)))))
 (< ?x2457 0.0)))
(assert
 (let ((?x2461 (- (* (- p1_x t4_x) (- q1_y t4_y)) (* (- p1_y t4_y) (- q1_x t4_x)))))
 (< ?x2461 0.0)))
(assert
 (let ((?x2465 (- (* (- p1_x t4_x) (- r2_y t4_y)) (* (- p1_y t4_y) (- r2_x t4_x)))))
 (< ?x2465 0.0)))
(assert
 (let ((?x2469 (- (* (- p1_x t4_x) (- a3_y t4_y)) (* (- p1_y t4_y) (- a3_x t4_x)))))
 (< ?x2469 0.0)))
(assert
 (let ((?x2473 (- (* (- p1_x t4_x) (- s3_y t4_y)) (* (- p1_y t4_y) (- s3_x t4_x)))))
 (< ?x2473 0.0)))
(assert
 (let ((?x2477 (- (* (- p1_x t4_x) (- s1_y t4_y)) (* (- p1_y t4_y) (- s1_x t4_x)))))
 (< ?x2477 0.0)))
(assert
 (let ((?x2481 (- (* (- p1_x t4_x) (- s4_y t4_y)) (* (- p1_y t4_y) (- s4_x t4_x)))))
 (< ?x2481 0.0)))
(assert
 (let ((?x2485 (- (* (- p1_x t4_x) (- s2_y t4_y)) (* (- p1_y t4_y) (- s2_x t4_x)))))
 (< ?x2485 0.0)))
(assert
 (let ((?x2489 (- (* (- q2_x t4_x) (- p2_y t4_y)) (* (- q2_y t4_y) (- p2_x t4_x)))))
 (< ?x2489 0.0)))
(assert
 (let ((?x2493 (- (* (- q2_x t4_x) (- q1_y t4_y)) (* (- q2_y t4_y) (- q1_x t4_x)))))
 (< ?x2493 0.0)))
(assert
 (let ((?x2497 (- (* (- q2_x t4_x) (- r2_y t4_y)) (* (- q2_y t4_y) (- r2_x t4_x)))))
 (< ?x2497 0.0)))
(assert
 (let ((?x2501 (- (* (- q2_x t4_x) (- a3_y t4_y)) (* (- q2_y t4_y) (- a3_x t4_x)))))
 (< ?x2501 0.0)))
(assert
 (let ((?x2505 (- (* (- q2_x t4_x) (- s3_y t4_y)) (* (- q2_y t4_y) (- s3_x t4_x)))))
 (< ?x2505 0.0)))
(assert
 (let ((?x2509 (- (* (- q2_x t4_x) (- s1_y t4_y)) (* (- q2_y t4_y) (- s1_x t4_x)))))
 (< ?x2509 0.0)))
(assert
 (let ((?x2513 (- (* (- q2_x t4_x) (- s4_y t4_y)) (* (- q2_y t4_y) (- s4_x t4_x)))))
 (< ?x2513 0.0)))
(assert
 (let ((?x2517 (- (* (- q2_x t4_x) (- s2_y t4_y)) (* (- q2_y t4_y) (- s2_x t4_x)))))
 (< ?x2517 0.0)))
(assert
 (let ((?x2521 (- (* (- p2_x t4_x) (- q1_y t4_y)) (* (- p2_y t4_y) (- q1_x t4_x)))))
 (< ?x2521 0.0)))
(assert
 (let ((?x2525 (- (* (- p2_x t4_x) (- r2_y t4_y)) (* (- p2_y t4_y) (- r2_x t4_x)))))
 (< ?x2525 0.0)))
(assert
 (let ((?x2529 (- (* (- p2_x t4_x) (- a3_y t4_y)) (* (- p2_y t4_y) (- a3_x t4_x)))))
 (< ?x2529 0.0)))
(assert
 (let ((?x2533 (- (* (- p2_x t4_x) (- s3_y t4_y)) (* (- p2_y t4_y) (- s3_x t4_x)))))
 (< ?x2533 0.0)))
(assert
 (let ((?x2537 (- (* (- p2_x t4_x) (- s1_y t4_y)) (* (- p2_y t4_y) (- s1_x t4_x)))))
 (< ?x2537 0.0)))
(assert
 (let ((?x2541 (- (* (- p2_x t4_x) (- s4_y t4_y)) (* (- p2_y t4_y) (- s4_x t4_x)))))
 (< ?x2541 0.0)))
(assert
 (let ((?x2545 (- (* (- p2_x t4_x) (- s2_y t4_y)) (* (- p2_y t4_y) (- s2_x t4_x)))))
 (< ?x2545 0.0)))
(assert
 (let ((?x2549 (- (* (- q1_x t4_x) (- r2_y t4_y)) (* (- q1_y t4_y) (- r2_x t4_x)))))
 (< ?x2549 0.0)))
(assert
 (let ((?x2553 (- (* (- q1_x t4_x) (- a3_y t4_y)) (* (- q1_y t4_y) (- a3_x t4_x)))))
 (< ?x2553 0.0)))
(assert
 (let ((?x2557 (- (* (- q1_x t4_x) (- s3_y t4_y)) (* (- q1_y t4_y) (- s3_x t4_x)))))
 (< ?x2557 0.0)))
(assert
 (let ((?x2561 (- (* (- q1_x t4_x) (- s1_y t4_y)) (* (- q1_y t4_y) (- s1_x t4_x)))))
 (< ?x2561 0.0)))
(assert
 (let ((?x2565 (- (* (- q1_x t4_x) (- s4_y t4_y)) (* (- q1_y t4_y) (- s4_x t4_x)))))
 (< ?x2565 0.0)))
(assert
 (let ((?x2569 (- (* (- q1_x t4_x) (- s2_y t4_y)) (* (- q1_y t4_y) (- s2_x t4_x)))))
 (< ?x2569 0.0)))
(assert
 (let ((?x2573 (- (* (- r2_x t4_x) (- a3_y t4_y)) (* (- r2_y t4_y) (- a3_x t4_x)))))
 (< ?x2573 0.0)))
(assert
 (let ((?x2577 (- (* (- r2_x t4_x) (- s3_y t4_y)) (* (- r2_y t4_y) (- s3_x t4_x)))))
 (< ?x2577 0.0)))
(assert
 (let ((?x2581 (- (* (- r2_x t4_x) (- s1_y t4_y)) (* (- r2_y t4_y) (- s1_x t4_x)))))
 (< ?x2581 0.0)))
(assert
 (let ((?x2585 (- (* (- r2_x t4_x) (- s4_y t4_y)) (* (- r2_y t4_y) (- s4_x t4_x)))))
 (< ?x2585 0.0)))
(assert
 (let ((?x2589 (- (* (- r2_x t4_x) (- s2_y t4_y)) (* (- r2_y t4_y) (- s2_x t4_x)))))
 (< ?x2589 0.0)))
(assert
 (let ((?x2593 (- (* (- a3_x t4_x) (- s3_y t4_y)) (* (- a3_y t4_y) (- s3_x t4_x)))))
 (< ?x2593 0.0)))
(assert
 (let ((?x2597 (- (* (- a3_x t4_x) (- s1_y t4_y)) (* (- a3_y t4_y) (- s1_x t4_x)))))
 (< ?x2597 0.0)))
(assert
 (let ((?x2601 (- (* (- a3_x t4_x) (- s4_y t4_y)) (* (- a3_y t4_y) (- s4_x t4_x)))))
 (< ?x2601 0.0)))
(assert
 (let ((?x2605 (- (* (- a3_x t4_x) (- s2_y t4_y)) (* (- a3_y t4_y) (- s2_x t4_x)))))
 (< ?x2605 0.0)))
(assert
 (let ((?x2609 (- (* (- s3_x t4_x) (- s1_y t4_y)) (* (- s3_y t4_y) (- s1_x t4_x)))))
 (< ?x2609 0.0)))
(assert
 (let ((?x2613 (- (* (- s3_x t4_x) (- s4_y t4_y)) (* (- s3_y t4_y) (- s4_x t4_x)))))
 (< ?x2613 0.0)))
(assert
 (let ((?x2617 (- (* (- s3_x t4_x) (- s2_y t4_y)) (* (- s3_y t4_y) (- s2_x t4_x)))))
 (< ?x2617 0.0)))
(assert
 (let ((?x2621 (- (* (- s1_x t4_x) (- s4_y t4_y)) (* (- s1_y t4_y) (- s4_x t4_x)))))
 (< ?x2621 0.0)))
(assert
 (let ((?x2625 (- (* (- s1_x t4_x) (- s2_y t4_y)) (* (- s1_y t4_y) (- s2_x t4_x)))))
 (< ?x2625 0.0)))
(assert
 (let ((?x2629 (- (* (- s4_x t4_x) (- s2_y t4_y)) (* (- s4_y t4_y) (- s2_x t4_x)))))
 (< ?x2629 0.0)))
(assert
 (let ((?x2637 (- (* (- a2_x t1_x) (- r1_y t1_y)) (* (- a2_y t1_y) (- r1_x t1_x)))))
 (< ?x2637 0.0)))
(assert
 (let ((?x2643 (- (* (- a2_x t1_x) (- p1_y t1_y)) (* (- a2_y t1_y) (- p1_x t1_x)))))
 (< ?x2643 0.0)))
(assert
 (let ((?x2649 (- (* (- a2_x t1_x) (- q2_y t1_y)) (* (- a2_y t1_y) (- q2_x t1_x)))))
 (< ?x2649 0.0)))
(assert
 (let ((?x2653 (- (* (- a2_x t1_x) (- p2_y t1_y)) (* (- a2_y t1_y) (- p2_x t1_x)))))
 (< ?x2653 0.0)))
(assert
 (let ((?x2659 (- (* (- a2_x t1_x) (- q1_y t1_y)) (* (- a2_y t1_y) (- q1_x t1_x)))))
 (< ?x2659 0.0)))
(assert
 (let ((?x2665 (- (* (- a2_x t1_x) (- r2_y t1_y)) (* (- a2_y t1_y) (- r2_x t1_x)))))
 (< ?x2665 0.0)))
(assert
 (let ((?x2671 (- (* (- a2_x t1_x) (- a3_y t1_y)) (* (- a2_y t1_y) (- a3_x t1_x)))))
 (< ?x2671 0.0)))
(assert
 (let ((?x2677 (- (* (- a2_x t1_x) (- s3_y t1_y)) (* (- a2_y t1_y) (- s3_x t1_x)))))
 (< ?x2677 0.0)))
(assert
 (let ((?x2683 (- (* (- a2_x t1_x) (- s1_y t1_y)) (* (- a2_y t1_y) (- s1_x t1_x)))))
 (< ?x2683 0.0)))
(assert
 (let ((?x2689 (- (* (- a2_x t1_x) (- s4_y t1_y)) (* (- a2_y t1_y) (- s4_x t1_x)))))
 (< ?x2689 0.0)))
(assert
 (let ((?x2695 (- (* (- a2_x t1_x) (- s2_y t1_y)) (* (- a2_y t1_y) (- s2_x t1_x)))))
 (< ?x2695 0.0)))
(assert
 (let ((?x2699 (- (* (- r1_x t1_x) (- p1_y t1_y)) (* (- r1_y t1_y) (- p1_x t1_x)))))
 (< ?x2699 0.0)))
(assert
 (let ((?x2703 (- (* (- r1_x t1_x) (- q2_y t1_y)) (* (- r1_y t1_y) (- q2_x t1_x)))))
 (< ?x2703 0.0)))
(assert
 (let ((?x2707 (- (* (- r1_x t1_x) (- p2_y t1_y)) (* (- r1_y t1_y) (- p2_x t1_x)))))
 (< ?x2707 0.0)))
(assert
 (let ((?x2711 (- (* (- r1_x t1_x) (- q1_y t1_y)) (* (- r1_y t1_y) (- q1_x t1_x)))))
 (< ?x2711 0.0)))
(assert
 (let ((?x2715 (- (* (- r1_x t1_x) (- r2_y t1_y)) (* (- r1_y t1_y) (- r2_x t1_x)))))
 (< ?x2715 0.0)))
(assert
 (let ((?x2719 (- (* (- r1_x t1_x) (- a3_y t1_y)) (* (- r1_y t1_y) (- a3_x t1_x)))))
 (< ?x2719 0.0)))
(assert
 (let ((?x2723 (- (* (- r1_x t1_x) (- s3_y t1_y)) (* (- r1_y t1_y) (- s3_x t1_x)))))
 (< ?x2723 0.0)))
(assert
 (let ((?x2727 (- (* (- r1_x t1_x) (- s1_y t1_y)) (* (- r1_y t1_y) (- s1_x t1_x)))))
 (< ?x2727 0.0)))
(assert
 (let ((?x2731 (- (* (- r1_x t1_x) (- s4_y t1_y)) (* (- r1_y t1_y) (- s4_x t1_x)))))
 (< ?x2731 0.0)))
(assert
 (let ((?x2735 (- (* (- r1_x t1_x) (- s2_y t1_y)) (* (- r1_y t1_y) (- s2_x t1_x)))))
 (< ?x2735 0.0)))
(assert
 (let ((?x2739 (- (* (- p1_x t1_x) (- q2_y t1_y)) (* (- p1_y t1_y) (- q2_x t1_x)))))
 (< ?x2739 0.0)))
(assert
 (let ((?x2743 (- (* (- p1_x t1_x) (- p2_y t1_y)) (* (- p1_y t1_y) (- p2_x t1_x)))))
 (< ?x2743 0.0)))
(assert
 (let ((?x2747 (- (* (- p1_x t1_x) (- q1_y t1_y)) (* (- p1_y t1_y) (- q1_x t1_x)))))
 (< ?x2747 0.0)))
(assert
 (let ((?x2751 (- (* (- p1_x t1_x) (- r2_y t1_y)) (* (- p1_y t1_y) (- r2_x t1_x)))))
 (< ?x2751 0.0)))
(assert
 (let ((?x2755 (- (* (- p1_x t1_x) (- a3_y t1_y)) (* (- p1_y t1_y) (- a3_x t1_x)))))
 (< ?x2755 0.0)))
(assert
 (let ((?x2759 (- (* (- p1_x t1_x) (- s3_y t1_y)) (* (- p1_y t1_y) (- s3_x t1_x)))))
 (< ?x2759 0.0)))
(assert
 (let ((?x2763 (- (* (- p1_x t1_x) (- s1_y t1_y)) (* (- p1_y t1_y) (- s1_x t1_x)))))
 (< ?x2763 0.0)))
(assert
 (let ((?x2767 (- (* (- p1_x t1_x) (- s4_y t1_y)) (* (- p1_y t1_y) (- s4_x t1_x)))))
 (< ?x2767 0.0)))
(assert
 (let ((?x2771 (- (* (- p1_x t1_x) (- s2_y t1_y)) (* (- p1_y t1_y) (- s2_x t1_x)))))
 (< ?x2771 0.0)))
(assert
 (let ((?x2775 (- (* (- q2_x t1_x) (- p2_y t1_y)) (* (- q2_y t1_y) (- p2_x t1_x)))))
 (< ?x2775 0.0)))
(assert
 (let ((?x2779 (- (* (- q2_x t1_x) (- q1_y t1_y)) (* (- q2_y t1_y) (- q1_x t1_x)))))
 (< ?x2779 0.0)))
(assert
 (let ((?x2783 (- (* (- q2_x t1_x) (- r2_y t1_y)) (* (- q2_y t1_y) (- r2_x t1_x)))))
 (< ?x2783 0.0)))
(assert
 (let ((?x2787 (- (* (- q2_x t1_x) (- a3_y t1_y)) (* (- q2_y t1_y) (- a3_x t1_x)))))
 (< ?x2787 0.0)))
(assert
 (let ((?x2791 (- (* (- q2_x t1_x) (- s3_y t1_y)) (* (- q2_y t1_y) (- s3_x t1_x)))))
 (< ?x2791 0.0)))
(assert
 (let ((?x2795 (- (* (- q2_x t1_x) (- s1_y t1_y)) (* (- q2_y t1_y) (- s1_x t1_x)))))
 (< ?x2795 0.0)))
(assert
 (let ((?x2799 (- (* (- q2_x t1_x) (- s4_y t1_y)) (* (- q2_y t1_y) (- s4_x t1_x)))))
 (< ?x2799 0.0)))
(assert
 (let ((?x2803 (- (* (- q2_x t1_x) (- s2_y t1_y)) (* (- q2_y t1_y) (- s2_x t1_x)))))
 (< ?x2803 0.0)))
(assert
 (let ((?x2807 (- (* (- p2_x t1_x) (- q1_y t1_y)) (* (- p2_y t1_y) (- q1_x t1_x)))))
 (< ?x2807 0.0)))
(assert
 (let ((?x2811 (- (* (- p2_x t1_x) (- r2_y t1_y)) (* (- p2_y t1_y) (- r2_x t1_x)))))
 (< ?x2811 0.0)))
(assert
 (let ((?x2815 (- (* (- p2_x t1_x) (- a3_y t1_y)) (* (- p2_y t1_y) (- a3_x t1_x)))))
 (< ?x2815 0.0)))
(assert
 (let ((?x2819 (- (* (- p2_x t1_x) (- s3_y t1_y)) (* (- p2_y t1_y) (- s3_x t1_x)))))
 (< ?x2819 0.0)))
(assert
 (let ((?x2823 (- (* (- p2_x t1_x) (- s1_y t1_y)) (* (- p2_y t1_y) (- s1_x t1_x)))))
 (< ?x2823 0.0)))
(assert
 (let ((?x2827 (- (* (- p2_x t1_x) (- s4_y t1_y)) (* (- p2_y t1_y) (- s4_x t1_x)))))
 (< ?x2827 0.0)))
(assert
 (let ((?x2831 (- (* (- p2_x t1_x) (- s2_y t1_y)) (* (- p2_y t1_y) (- s2_x t1_x)))))
 (< ?x2831 0.0)))
(assert
 (let ((?x2835 (- (* (- q1_x t1_x) (- r2_y t1_y)) (* (- q1_y t1_y) (- r2_x t1_x)))))
 (< ?x2835 0.0)))
(assert
 (let ((?x2839 (- (* (- q1_x t1_x) (- a3_y t1_y)) (* (- q1_y t1_y) (- a3_x t1_x)))))
 (< ?x2839 0.0)))
(assert
 (let ((?x2843 (- (* (- q1_x t1_x) (- s3_y t1_y)) (* (- q1_y t1_y) (- s3_x t1_x)))))
 (< ?x2843 0.0)))
(assert
 (let ((?x2847 (- (* (- q1_x t1_x) (- s1_y t1_y)) (* (- q1_y t1_y) (- s1_x t1_x)))))
 (< ?x2847 0.0)))
(assert
 (let ((?x2851 (- (* (- q1_x t1_x) (- s4_y t1_y)) (* (- q1_y t1_y) (- s4_x t1_x)))))
 (< ?x2851 0.0)))
(assert
 (let ((?x2855 (- (* (- q1_x t1_x) (- s2_y t1_y)) (* (- q1_y t1_y) (- s2_x t1_x)))))
 (< ?x2855 0.0)))
(assert
 (let ((?x2859 (- (* (- r2_x t1_x) (- a3_y t1_y)) (* (- r2_y t1_y) (- a3_x t1_x)))))
 (< ?x2859 0.0)))
(assert
 (let ((?x2863 (- (* (- r2_x t1_x) (- s3_y t1_y)) (* (- r2_y t1_y) (- s3_x t1_x)))))
 (< ?x2863 0.0)))
(assert
 (let ((?x2867 (- (* (- r2_x t1_x) (- s1_y t1_y)) (* (- r2_y t1_y) (- s1_x t1_x)))))
 (< ?x2867 0.0)))
(assert
 (let ((?x2871 (- (* (- r2_x t1_x) (- s4_y t1_y)) (* (- r2_y t1_y) (- s4_x t1_x)))))
 (< ?x2871 0.0)))
(assert
 (let ((?x2875 (- (* (- r2_x t1_x) (- s2_y t1_y)) (* (- r2_y t1_y) (- s2_x t1_x)))))
 (< ?x2875 0.0)))
(assert
 (let ((?x2879 (- (* (- a3_x t1_x) (- s3_y t1_y)) (* (- a3_y t1_y) (- s3_x t1_x)))))
 (< ?x2879 0.0)))
(assert
 (let ((?x2883 (- (* (- a3_x t1_x) (- s1_y t1_y)) (* (- a3_y t1_y) (- s1_x t1_x)))))
 (< ?x2883 0.0)))
(assert
 (let ((?x2887 (- (* (- a3_x t1_x) (- s4_y t1_y)) (* (- a3_y t1_y) (- s4_x t1_x)))))
 (< ?x2887 0.0)))
(assert
 (let ((?x2891 (- (* (- a3_x t1_x) (- s2_y t1_y)) (* (- a3_y t1_y) (- s2_x t1_x)))))
 (< ?x2891 0.0)))
(assert
 (let ((?x2895 (- (* (- s3_x t1_x) (- s1_y t1_y)) (* (- s3_y t1_y) (- s1_x t1_x)))))
 (< ?x2895 0.0)))
(assert
 (let ((?x2899 (- (* (- s3_x t1_x) (- s4_y t1_y)) (* (- s3_y t1_y) (- s4_x t1_x)))))
 (< ?x2899 0.0)))
(assert
 (let ((?x2903 (- (* (- s3_x t1_x) (- s2_y t1_y)) (* (- s3_y t1_y) (- s2_x t1_x)))))
 (< ?x2903 0.0)))
(assert
 (let ((?x2907 (- (* (- s1_x t1_x) (- s4_y t1_y)) (* (- s1_y t1_y) (- s4_x t1_x)))))
 (< ?x2907 0.0)))
(assert
 (let ((?x2911 (- (* (- s1_x t1_x) (- s2_y t1_y)) (* (- s1_y t1_y) (- s2_x t1_x)))))
 (< ?x2911 0.0)))
(assert
 (let ((?x2915 (- (* (- s4_x t1_x) (- s2_y t1_y)) (* (- s4_y t1_y) (- s2_x t1_x)))))
 (< ?x2915 0.0)))
(assert
 (let ((?x2923 (- (* (- r1_x a2_x) (- p1_y a2_y)) (* (- r1_y a2_y) (- p1_x a2_x)))))
 (< ?x2923 0.0)))
(assert
 (let ((?x2927 (- (* (- r1_x a2_x) (- q2_y a2_y)) (* (- r1_y a2_y) (- q2_x a2_x)))))
 (< ?x2927 0.0)))
(assert
 (let ((?x2933 (- (* (- r1_x a2_x) (- p2_y a2_y)) (* (- r1_y a2_y) (- p2_x a2_x)))))
 (< ?x2933 0.0)))
(assert
 (let ((?x2939 (- (* (- r1_x a2_x) (- q1_y a2_y)) (* (- r1_y a2_y) (- q1_x a2_x)))))
 (< ?x2939 0.0)))
(assert
 (let ((?x2945 (- (* (- r1_x a2_x) (- r2_y a2_y)) (* (- r1_y a2_y) (- r2_x a2_x)))))
 (< ?x2945 0.0)))
(assert
 (let ((?x2949 (- (* (- r1_x a2_x) (- a3_y a2_y)) (* (- r1_y a2_y) (- a3_x a2_x)))))
 (< ?x2949 0.0)))
(assert
 (let ((?x2955 (- (* (- r1_x a2_x) (- s3_y a2_y)) (* (- r1_y a2_y) (- s3_x a2_x)))))
 (< ?x2955 0.0)))
(assert
 (let ((?x2961 (- (* (- r1_x a2_x) (- s1_y a2_y)) (* (- r1_y a2_y) (- s1_x a2_x)))))
 (< ?x2961 0.0)))
(assert
 (let ((?x2967 (- (* (- r1_x a2_x) (- s4_y a2_y)) (* (- r1_y a2_y) (- s4_x a2_x)))))
 (< ?x2967 0.0)))
(assert
 (let ((?x2973 (- (* (- r1_x a2_x) (- s2_y a2_y)) (* (- r1_y a2_y) (- s2_x a2_x)))))
 (< ?x2973 0.0)))
(assert
 (let ((?x2977 (- (* (- p1_x a2_x) (- q2_y a2_y)) (* (- p1_y a2_y) (- q2_x a2_x)))))
 (< ?x2977 0.0)))
(assert
 (let ((?x2981 (- (* (- p1_x a2_x) (- p2_y a2_y)) (* (- p1_y a2_y) (- p2_x a2_x)))))
 (< ?x2981 0.0)))
(assert
 (let ((?x2985 (- (* (- p1_x a2_x) (- q1_y a2_y)) (* (- p1_y a2_y) (- q1_x a2_x)))))
 (< ?x2985 0.0)))
(assert
 (let ((?x2989 (- (* (- p1_x a2_x) (- r2_y a2_y)) (* (- p1_y a2_y) (- r2_x a2_x)))))
 (< ?x2989 0.0)))
(assert
 (let ((?x2993 (- (* (- p1_x a2_x) (- a3_y a2_y)) (* (- p1_y a2_y) (- a3_x a2_x)))))
 (< ?x2993 0.0)))
(assert
 (let ((?x2997 (- (* (- p1_x a2_x) (- s3_y a2_y)) (* (- p1_y a2_y) (- s3_x a2_x)))))
 (< ?x2997 0.0)))
(assert
 (let ((?x3001 (- (* (- p1_x a2_x) (- s1_y a2_y)) (* (- p1_y a2_y) (- s1_x a2_x)))))
 (< ?x3001 0.0)))
(assert
 (let ((?x3005 (- (* (- p1_x a2_x) (- s4_y a2_y)) (* (- p1_y a2_y) (- s4_x a2_x)))))
 (< ?x3005 0.0)))
(assert
 (let ((?x3009 (- (* (- p1_x a2_x) (- s2_y a2_y)) (* (- p1_y a2_y) (- s2_x a2_x)))))
 (< ?x3009 0.0)))
(assert
 (let ((?x3013 (- (* (- q2_x a2_x) (- p2_y a2_y)) (* (- q2_y a2_y) (- p2_x a2_x)))))
 (< ?x3013 0.0)))
(assert
 (let ((?x3017 (- (* (- q2_x a2_x) (- q1_y a2_y)) (* (- q2_y a2_y) (- q1_x a2_x)))))
 (< ?x3017 0.0)))
(assert
 (let ((?x3021 (- (* (- q2_x a2_x) (- r2_y a2_y)) (* (- q2_y a2_y) (- r2_x a2_x)))))
 (< ?x3021 0.0)))
(assert
 (let ((?x3025 (- (* (- q2_x a2_x) (- a3_y a2_y)) (* (- q2_y a2_y) (- a3_x a2_x)))))
 (< ?x3025 0.0)))
(assert
 (let ((?x3029 (- (* (- q2_x a2_x) (- s3_y a2_y)) (* (- q2_y a2_y) (- s3_x a2_x)))))
 (< ?x3029 0.0)))
(assert
 (let ((?x3033 (- (* (- q2_x a2_x) (- s1_y a2_y)) (* (- q2_y a2_y) (- s1_x a2_x)))))
 (< ?x3033 0.0)))
(assert
 (let ((?x3037 (- (* (- q2_x a2_x) (- s4_y a2_y)) (* (- q2_y a2_y) (- s4_x a2_x)))))
 (< ?x3037 0.0)))
(assert
 (let ((?x3041 (- (* (- q2_x a2_x) (- s2_y a2_y)) (* (- q2_y a2_y) (- s2_x a2_x)))))
 (< ?x3041 0.0)))
(assert
 (let ((?x3045 (- (* (- p2_x a2_x) (- q1_y a2_y)) (* (- p2_y a2_y) (- q1_x a2_x)))))
 (< ?x3045 0.0)))
(assert
 (let ((?x3049 (- (* (- p2_x a2_x) (- r2_y a2_y)) (* (- p2_y a2_y) (- r2_x a2_x)))))
 (< ?x3049 0.0)))
(assert
 (let ((?x3053 (- (* (- p2_x a2_x) (- a3_y a2_y)) (* (- p2_y a2_y) (- a3_x a2_x)))))
 (< ?x3053 0.0)))
(assert
 (let ((?x3057 (- (* (- p2_x a2_x) (- s3_y a2_y)) (* (- p2_y a2_y) (- s3_x a2_x)))))
 (< ?x3057 0.0)))
(assert
 (let ((?x3061 (- (* (- p2_x a2_x) (- s1_y a2_y)) (* (- p2_y a2_y) (- s1_x a2_x)))))
 (< ?x3061 0.0)))
(assert
 (let ((?x3065 (- (* (- p2_x a2_x) (- s4_y a2_y)) (* (- p2_y a2_y) (- s4_x a2_x)))))
 (< ?x3065 0.0)))
(assert
 (let ((?x3069 (- (* (- p2_x a2_x) (- s2_y a2_y)) (* (- p2_y a2_y) (- s2_x a2_x)))))
 (< ?x3069 0.0)))
(assert
 (let ((?x3073 (- (* (- q1_x a2_x) (- r2_y a2_y)) (* (- q1_y a2_y) (- r2_x a2_x)))))
 (< ?x3073 0.0)))
(assert
 (let ((?x3077 (- (* (- q1_x a2_x) (- a3_y a2_y)) (* (- q1_y a2_y) (- a3_x a2_x)))))
 (< ?x3077 0.0)))
(assert
 (let ((?x3081 (- (* (- q1_x a2_x) (- s3_y a2_y)) (* (- q1_y a2_y) (- s3_x a2_x)))))
 (< ?x3081 0.0)))
(assert
 (let ((?x3085 (- (* (- q1_x a2_x) (- s1_y a2_y)) (* (- q1_y a2_y) (- s1_x a2_x)))))
 (< ?x3085 0.0)))
(assert
 (let ((?x3089 (- (* (- q1_x a2_x) (- s4_y a2_y)) (* (- q1_y a2_y) (- s4_x a2_x)))))
 (< ?x3089 0.0)))
(assert
 (let ((?x3093 (- (* (- q1_x a2_x) (- s2_y a2_y)) (* (- q1_y a2_y) (- s2_x a2_x)))))
 (< ?x3093 0.0)))
(assert
 (let ((?x3097 (- (* (- r2_x a2_x) (- a3_y a2_y)) (* (- r2_y a2_y) (- a3_x a2_x)))))
 (< ?x3097 0.0)))
(assert
 (let ((?x3101 (- (* (- r2_x a2_x) (- s3_y a2_y)) (* (- r2_y a2_y) (- s3_x a2_x)))))
 (< ?x3101 0.0)))
(assert
 (let ((?x3105 (- (* (- r2_x a2_x) (- s1_y a2_y)) (* (- r2_y a2_y) (- s1_x a2_x)))))
 (< ?x3105 0.0)))
(assert
 (let ((?x3109 (- (* (- r2_x a2_x) (- s4_y a2_y)) (* (- r2_y a2_y) (- s4_x a2_x)))))
 (< ?x3109 0.0)))
(assert
 (let ((?x3113 (- (* (- r2_x a2_x) (- s2_y a2_y)) (* (- r2_y a2_y) (- s2_x a2_x)))))
 (< ?x3113 0.0)))
(assert
 (let ((?x3117 (- (* (- a3_x a2_x) (- s3_y a2_y)) (* (- a3_y a2_y) (- s3_x a2_x)))))
 (< ?x3117 0.0)))
(assert
 (let ((?x3121 (- (* (- a3_x a2_x) (- s1_y a2_y)) (* (- a3_y a2_y) (- s1_x a2_x)))))
 (< ?x3121 0.0)))
(assert
 (let ((?x3125 (- (* (- a3_x a2_x) (- s4_y a2_y)) (* (- a3_y a2_y) (- s4_x a2_x)))))
 (< ?x3125 0.0)))
(assert
 (let ((?x3129 (- (* (- a3_x a2_x) (- s2_y a2_y)) (* (- a3_y a2_y) (- s2_x a2_x)))))
 (< ?x3129 0.0)))
(assert
 (let ((?x3133 (- (* (- s3_x a2_x) (- s1_y a2_y)) (* (- s3_y a2_y) (- s1_x a2_x)))))
 (< ?x3133 0.0)))
(assert
 (let ((?x3137 (- (* (- s3_x a2_x) (- s4_y a2_y)) (* (- s3_y a2_y) (- s4_x a2_x)))))
 (< ?x3137 0.0)))
(assert
 (let ((?x3141 (- (* (- s3_x a2_x) (- s2_y a2_y)) (* (- s3_y a2_y) (- s2_x a2_x)))))
 (< ?x3141 0.0)))
(assert
 (let ((?x3145 (- (* (- s1_x a2_x) (- s4_y a2_y)) (* (- s1_y a2_y) (- s4_x a2_x)))))
 (< ?x3145 0.0)))
(assert
 (let ((?x3149 (- (* (- s1_x a2_x) (- s2_y a2_y)) (* (- s1_y a2_y) (- s2_x a2_x)))))
 (< ?x3149 0.0)))
(assert
 (let ((?x3153 (- (* (- s4_x a2_x) (- s2_y a2_y)) (* (- s4_y a2_y) (- s2_x a2_x)))))
 (< ?x3153 0.0)))
(assert
 (let ((?x3159 (- (* (- p1_x r1_x) (- q2_y r1_y)) (* (- p1_y r1_y) (- q2_x r1_x)))))
 (< ?x3159 0.0)))
(assert
 (let ((?x3165 (- (* (- p1_x r1_x) (- p2_y r1_y)) (* (- p1_y r1_y) (- p2_x r1_x)))))
 (< ?x3165 0.0)))
(assert
 (let ((?x3171 (- (* (- p1_x r1_x) (- q1_y r1_y)) (* (- p1_y r1_y) (- q1_x r1_x)))))
 (< ?x3171 0.0)))
(assert
 (let ((?x3177 (- (* (- p1_x r1_x) (- r2_y r1_y)) (* (- p1_y r1_y) (- r2_x r1_x)))))
 (< ?x3177 0.0)))
(assert
 (let ((?x3183 (- (* (- p1_x r1_x) (- a3_y r1_y)) (* (- p1_y r1_y) (- a3_x r1_x)))))
 (< ?x3183 0.0)))
(assert
 (let ((?x3189 (- (* (- p1_x r1_x) (- s3_y r1_y)) (* (- p1_y r1_y) (- s3_x r1_x)))))
 (< ?x3189 0.0)))
(assert
 (let ((?x3195 (- (* (- p1_x r1_x) (- s1_y r1_y)) (* (- p1_y r1_y) (- s1_x r1_x)))))
 (< ?x3195 0.0)))
(assert
 (let ((?x3201 (- (* (- p1_x r1_x) (- s4_y r1_y)) (* (- p1_y r1_y) (- s4_x r1_x)))))
 (< ?x3201 0.0)))
(assert
 (let ((?x3207 (- (* (- p1_x r1_x) (- s2_y r1_y)) (* (- p1_y r1_y) (- s2_x r1_x)))))
 (< ?x3207 0.0)))
(assert
 (let ((?x3211 (- (* (- q2_x r1_x) (- p2_y r1_y)) (* (- q2_y r1_y) (- p2_x r1_x)))))
 (< ?x3211 0.0)))
(assert
 (let ((?x3215 (- (* (- q2_x r1_x) (- q1_y r1_y)) (* (- q2_y r1_y) (- q1_x r1_x)))))
 (< ?x3215 0.0)))
(assert
 (let ((?x3219 (- (* (- q2_x r1_x) (- r2_y r1_y)) (* (- q2_y r1_y) (- r2_x r1_x)))))
 (< ?x3219 0.0)))
(assert
 (let ((?x3223 (- (* (- q2_x r1_x) (- a3_y r1_y)) (* (- q2_y r1_y) (- a3_x r1_x)))))
 (< ?x3223 0.0)))
(assert
 (let ((?x3227 (- (* (- q2_x r1_x) (- s3_y r1_y)) (* (- q2_y r1_y) (- s3_x r1_x)))))
 (< ?x3227 0.0)))
(assert
 (let ((?x3231 (- (* (- q2_x r1_x) (- s1_y r1_y)) (* (- q2_y r1_y) (- s1_x r1_x)))))
 (< ?x3231 0.0)))
(assert
 (let ((?x3235 (- (* (- q2_x r1_x) (- s4_y r1_y)) (* (- q2_y r1_y) (- s4_x r1_x)))))
 (< ?x3235 0.0)))
(assert
 (let ((?x3239 (- (* (- q2_x r1_x) (- s2_y r1_y)) (* (- q2_y r1_y) (- s2_x r1_x)))))
 (< ?x3239 0.0)))
(assert
 (let ((?x3243 (- (* (- p2_x r1_x) (- q1_y r1_y)) (* (- p2_y r1_y) (- q1_x r1_x)))))
 (< ?x3243 0.0)))
(assert
 (let ((?x3247 (- (* (- p2_x r1_x) (- r2_y r1_y)) (* (- p2_y r1_y) (- r2_x r1_x)))))
 (< ?x3247 0.0)))
(assert
 (let ((?x3251 (- (* (- p2_x r1_x) (- a3_y r1_y)) (* (- p2_y r1_y) (- a3_x r1_x)))))
 (< ?x3251 0.0)))
(assert
 (let ((?x3255 (- (* (- p2_x r1_x) (- s3_y r1_y)) (* (- p2_y r1_y) (- s3_x r1_x)))))
 (< ?x3255 0.0)))
(assert
 (let ((?x3259 (- (* (- p2_x r1_x) (- s1_y r1_y)) (* (- p2_y r1_y) (- s1_x r1_x)))))
 (< ?x3259 0.0)))
(assert
 (let ((?x3263 (- (* (- p2_x r1_x) (- s4_y r1_y)) (* (- p2_y r1_y) (- s4_x r1_x)))))
 (< ?x3263 0.0)))
(assert
 (let ((?x3267 (- (* (- p2_x r1_x) (- s2_y r1_y)) (* (- p2_y r1_y) (- s2_x r1_x)))))
 (< ?x3267 0.0)))
(assert
 (let ((?x3271 (- (* (- q1_x r1_x) (- r2_y r1_y)) (* (- q1_y r1_y) (- r2_x r1_x)))))
 (< ?x3271 0.0)))
(assert
 (let ((?x3275 (- (* (- q1_x r1_x) (- a3_y r1_y)) (* (- q1_y r1_y) (- a3_x r1_x)))))
 (< ?x3275 0.0)))
(assert
 (let ((?x3279 (- (* (- q1_x r1_x) (- s3_y r1_y)) (* (- q1_y r1_y) (- s3_x r1_x)))))
 (< ?x3279 0.0)))
(assert
 (let ((?x3283 (- (* (- q1_x r1_x) (- s1_y r1_y)) (* (- q1_y r1_y) (- s1_x r1_x)))))
 (< ?x3283 0.0)))
(assert
 (let ((?x3287 (- (* (- q1_x r1_x) (- s4_y r1_y)) (* (- q1_y r1_y) (- s4_x r1_x)))))
 (< ?x3287 0.0)))
(assert
 (let ((?x3291 (- (* (- q1_x r1_x) (- s2_y r1_y)) (* (- q1_y r1_y) (- s2_x r1_x)))))
 (< ?x3291 0.0)))
(assert
 (let ((?x3295 (- (* (- r2_x r1_x) (- a3_y r1_y)) (* (- r2_y r1_y) (- a3_x r1_x)))))
 (< ?x3295 0.0)))
(assert
 (let ((?x3299 (- (* (- r2_x r1_x) (- s3_y r1_y)) (* (- r2_y r1_y) (- s3_x r1_x)))))
 (< ?x3299 0.0)))
(assert
 (let ((?x3303 (- (* (- r2_x r1_x) (- s1_y r1_y)) (* (- r2_y r1_y) (- s1_x r1_x)))))
 (< ?x3303 0.0)))
(assert
 (let ((?x3307 (- (* (- r2_x r1_x) (- s4_y r1_y)) (* (- r2_y r1_y) (- s4_x r1_x)))))
 (< ?x3307 0.0)))
(assert
 (let ((?x3311 (- (* (- r2_x r1_x) (- s2_y r1_y)) (* (- r2_y r1_y) (- s2_x r1_x)))))
 (< ?x3311 0.0)))
(assert
 (let ((?x3315 (- (* (- a3_x r1_x) (- s3_y r1_y)) (* (- a3_y r1_y) (- s3_x r1_x)))))
 (< ?x3315 0.0)))
(assert
 (let ((?x3319 (- (* (- a3_x r1_x) (- s1_y r1_y)) (* (- a3_y r1_y) (- s1_x r1_x)))))
 (< ?x3319 0.0)))
(assert
 (let ((?x3323 (- (* (- a3_x r1_x) (- s4_y r1_y)) (* (- a3_y r1_y) (- s4_x r1_x)))))
 (< ?x3323 0.0)))
(assert
 (let ((?x3327 (- (* (- a3_x r1_x) (- s2_y r1_y)) (* (- a3_y r1_y) (- s2_x r1_x)))))
 (< ?x3327 0.0)))
(assert
 (let ((?x3331 (- (* (- s3_x r1_x) (- s1_y r1_y)) (* (- s3_y r1_y) (- s1_x r1_x)))))
 (< ?x3331 0.0)))
(assert
 (let ((?x3335 (- (* (- s3_x r1_x) (- s4_y r1_y)) (* (- s3_y r1_y) (- s4_x r1_x)))))
 (< ?x3335 0.0)))
(assert
 (let ((?x3339 (- (* (- s3_x r1_x) (- s2_y r1_y)) (* (- s3_y r1_y) (- s2_x r1_x)))))
 (< ?x3339 0.0)))
(assert
 (let ((?x3343 (- (* (- s1_x r1_x) (- s4_y r1_y)) (* (- s1_y r1_y) (- s4_x r1_x)))))
 (< ?x3343 0.0)))
(assert
 (let ((?x3347 (- (* (- s1_x r1_x) (- s2_y r1_y)) (* (- s1_y r1_y) (- s2_x r1_x)))))
 (< ?x3347 0.0)))
(assert
 (let ((?x3351 (- (* (- s4_x r1_x) (- s2_y r1_y)) (* (- s4_y r1_y) (- s2_x r1_x)))))
 (< ?x3351 0.0)))
(assert
 (let ((?x3359 (- (* (- q2_x p1_x) (- p2_y p1_y)) (* (- q2_y p1_y) (- p2_x p1_x)))))
 (< ?x3359 0.0)))
(assert
 (let ((?x3363 (- (* (- q2_x p1_x) (- q1_y p1_y)) (* (- q2_y p1_y) (- q1_x p1_x)))))
 (< ?x3363 0.0)))
(assert
 (let ((?x3369 (- (* (- q2_x p1_x) (- r2_y p1_y)) (* (- q2_y p1_y) (- r2_x p1_x)))))
 (< ?x3369 0.0)))
(assert
 (let ((?x3375 (- (* (- q2_x p1_x) (- a3_y p1_y)) (* (- q2_y p1_y) (- a3_x p1_x)))))
 (< ?x3375 0.0)))
(assert
 (let ((?x3381 (- (* (- q2_x p1_x) (- s3_y p1_y)) (* (- q2_y p1_y) (- s3_x p1_x)))))
 (< ?x3381 0.0)))
(assert
 (let ((?x3387 (- (* (- q2_x p1_x) (- s1_y p1_y)) (* (- q2_y p1_y) (- s1_x p1_x)))))
 (< ?x3387 0.0)))
(assert
 (let ((?x3393 (- (* (- q2_x p1_x) (- s4_y p1_y)) (* (- q2_y p1_y) (- s4_x p1_x)))))
 (< ?x3393 0.0)))
(assert
 (let ((?x3399 (- (* (- q2_x p1_x) (- s2_y p1_y)) (* (- q2_y p1_y) (- s2_x p1_x)))))
 (< ?x3399 0.0)))
(assert
 (let ((?x3403 (- (* (- p2_x p1_x) (- q1_y p1_y)) (* (- p2_y p1_y) (- q1_x p1_x)))))
 (< ?x3403 0.0)))
(assert
 (let ((?x3407 (- (* (- p2_x p1_x) (- r2_y p1_y)) (* (- p2_y p1_y) (- r2_x p1_x)))))
 (< ?x3407 0.0)))
(assert
 (let ((?x3411 (- (* (- p2_x p1_x) (- a3_y p1_y)) (* (- p2_y p1_y) (- a3_x p1_x)))))
 (< ?x3411 0.0)))
(assert
 (let ((?x3415 (- (* (- p2_x p1_x) (- s3_y p1_y)) (* (- p2_y p1_y) (- s3_x p1_x)))))
 (< ?x3415 0.0)))
(assert
 (let ((?x3419 (- (* (- p2_x p1_x) (- s1_y p1_y)) (* (- p2_y p1_y) (- s1_x p1_x)))))
 (< ?x3419 0.0)))
(assert
 (let ((?x3423 (- (* (- p2_x p1_x) (- s4_y p1_y)) (* (- p2_y p1_y) (- s4_x p1_x)))))
 (< ?x3423 0.0)))
(assert
 (let ((?x3427 (- (* (- p2_x p1_x) (- s2_y p1_y)) (* (- p2_y p1_y) (- s2_x p1_x)))))
 (< ?x3427 0.0)))
(assert
 (let ((?x3431 (- (* (- q1_x p1_x) (- r2_y p1_y)) (* (- q1_y p1_y) (- r2_x p1_x)))))
 (< ?x3431 0.0)))
(assert
 (let ((?x3435 (- (* (- q1_x p1_x) (- a3_y p1_y)) (* (- q1_y p1_y) (- a3_x p1_x)))))
 (< ?x3435 0.0)))
(assert
 (let ((?x3439 (- (* (- q1_x p1_x) (- s3_y p1_y)) (* (- q1_y p1_y) (- s3_x p1_x)))))
 (< ?x3439 0.0)))
(assert
 (let ((?x3443 (- (* (- q1_x p1_x) (- s1_y p1_y)) (* (- q1_y p1_y) (- s1_x p1_x)))))
 (< ?x3443 0.0)))
(assert
 (let ((?x3447 (- (* (- q1_x p1_x) (- s4_y p1_y)) (* (- q1_y p1_y) (- s4_x p1_x)))))
 (< ?x3447 0.0)))
(assert
 (let ((?x3451 (- (* (- q1_x p1_x) (- s2_y p1_y)) (* (- q1_y p1_y) (- s2_x p1_x)))))
 (< ?x3451 0.0)))
(assert
 (let ((?x3455 (- (* (- r2_x p1_x) (- a3_y p1_y)) (* (- r2_y p1_y) (- a3_x p1_x)))))
 (< ?x3455 0.0)))
(assert
 (let ((?x3459 (- (* (- r2_x p1_x) (- s3_y p1_y)) (* (- r2_y p1_y) (- s3_x p1_x)))))
 (< ?x3459 0.0)))
(assert
 (let ((?x3463 (- (* (- r2_x p1_x) (- s1_y p1_y)) (* (- r2_y p1_y) (- s1_x p1_x)))))
 (< ?x3463 0.0)))
(assert
 (let ((?x3467 (- (* (- r2_x p1_x) (- s4_y p1_y)) (* (- r2_y p1_y) (- s4_x p1_x)))))
 (< ?x3467 0.0)))
(assert
 (let ((?x3471 (- (* (- r2_x p1_x) (- s2_y p1_y)) (* (- r2_y p1_y) (- s2_x p1_x)))))
 (< ?x3471 0.0)))
(assert
 (let ((?x3475 (- (* (- a3_x p1_x) (- s3_y p1_y)) (* (- a3_y p1_y) (- s3_x p1_x)))))
 (< ?x3475 0.0)))
(assert
 (let ((?x3479 (- (* (- a3_x p1_x) (- s1_y p1_y)) (* (- a3_y p1_y) (- s1_x p1_x)))))
 (< ?x3479 0.0)))
(assert
 (let ((?x3483 (- (* (- a3_x p1_x) (- s4_y p1_y)) (* (- a3_y p1_y) (- s4_x p1_x)))))
 (< ?x3483 0.0)))
(assert
 (let ((?x3487 (- (* (- a3_x p1_x) (- s2_y p1_y)) (* (- a3_y p1_y) (- s2_x p1_x)))))
 (< ?x3487 0.0)))
(assert
 (let ((?x3491 (- (* (- s3_x p1_x) (- s1_y p1_y)) (* (- s3_y p1_y) (- s1_x p1_x)))))
 (< ?x3491 0.0)))
(assert
 (let ((?x3495 (- (* (- s3_x p1_x) (- s4_y p1_y)) (* (- s3_y p1_y) (- s4_x p1_x)))))
 (< ?x3495 0.0)))
(assert
 (let ((?x3499 (- (* (- s3_x p1_x) (- s2_y p1_y)) (* (- s3_y p1_y) (- s2_x p1_x)))))
 (< ?x3499 0.0)))
(assert
 (let ((?x3503 (- (* (- s1_x p1_x) (- s4_y p1_y)) (* (- s1_y p1_y) (- s4_x p1_x)))))
 (< ?x3503 0.0)))
(assert
 (let ((?x3507 (- (* (- s1_x p1_x) (- s2_y p1_y)) (* (- s1_y p1_y) (- s2_x p1_x)))))
 (< ?x3507 0.0)))
(assert
 (let ((?x3511 (- (* (- s4_x p1_x) (- s2_y p1_y)) (* (- s4_y p1_y) (- s2_x p1_x)))))
 (< ?x3511 0.0)))
(assert
 (let ((?x3517 (- (* (- p2_x q2_x) (- q1_y q2_y)) (* (- p2_y q2_y) (- q1_x q2_x)))))
 (< ?x3517 0.0)))
(assert
 (let ((?x3523 (- (* (- p2_x q2_x) (- r2_y q2_y)) (* (- p2_y q2_y) (- r2_x q2_x)))))
 (< ?x3523 0.0)))
(assert
 (let ((?x3529 (- (* (- p2_x q2_x) (- a3_y q2_y)) (* (- p2_y q2_y) (- a3_x q2_x)))))
 (< ?x3529 0.0)))
(assert
 (let ((?x3535 (- (* (- p2_x q2_x) (- s3_y q2_y)) (* (- p2_y q2_y) (- s3_x q2_x)))))
 (< ?x3535 0.0)))
(assert
 (let ((?x3541 (- (* (- p2_x q2_x) (- s1_y q2_y)) (* (- p2_y q2_y) (- s1_x q2_x)))))
 (< ?x3541 0.0)))
(assert
 (let ((?x3547 (- (* (- p2_x q2_x) (- s4_y q2_y)) (* (- p2_y q2_y) (- s4_x q2_x)))))
 (< ?x3547 0.0)))
(assert
 (let ((?x3553 (- (* (- p2_x q2_x) (- s2_y q2_y)) (* (- p2_y q2_y) (- s2_x q2_x)))))
 (< ?x3553 0.0)))
(assert
 (let ((?x3557 (- (* (- q1_x q2_x) (- r2_y q2_y)) (* (- q1_y q2_y) (- r2_x q2_x)))))
 (< ?x3557 0.0)))
(assert
 (let ((?x3561 (- (* (- q1_x q2_x) (- a3_y q2_y)) (* (- q1_y q2_y) (- a3_x q2_x)))))
 (< ?x3561 0.0)))
(assert
 (let ((?x3565 (- (* (- q1_x q2_x) (- s3_y q2_y)) (* (- q1_y q2_y) (- s3_x q2_x)))))
 (< ?x3565 0.0)))
(assert
 (let ((?x3569 (- (* (- q1_x q2_x) (- s1_y q2_y)) (* (- q1_y q2_y) (- s1_x q2_x)))))
 (< ?x3569 0.0)))
(assert
 (let ((?x3573 (- (* (- q1_x q2_x) (- s4_y q2_y)) (* (- q1_y q2_y) (- s4_x q2_x)))))
 (< ?x3573 0.0)))
(assert
 (let ((?x3577 (- (* (- q1_x q2_x) (- s2_y q2_y)) (* (- q1_y q2_y) (- s2_x q2_x)))))
 (< ?x3577 0.0)))
(assert
 (let ((?x3581 (- (* (- r2_x q2_x) (- a3_y q2_y)) (* (- r2_y q2_y) (- a3_x q2_x)))))
 (< ?x3581 0.0)))
(assert
 (let ((?x3585 (- (* (- r2_x q2_x) (- s3_y q2_y)) (* (- r2_y q2_y) (- s3_x q2_x)))))
 (< ?x3585 0.0)))
(assert
 (let ((?x3589 (- (* (- r2_x q2_x) (- s1_y q2_y)) (* (- r2_y q2_y) (- s1_x q2_x)))))
 (< ?x3589 0.0)))
(assert
 (let ((?x3593 (- (* (- r2_x q2_x) (- s4_y q2_y)) (* (- r2_y q2_y) (- s4_x q2_x)))))
 (< ?x3593 0.0)))
(assert
 (let ((?x3597 (- (* (- r2_x q2_x) (- s2_y q2_y)) (* (- r2_y q2_y) (- s2_x q2_x)))))
 (< ?x3597 0.0)))
(assert
 (let ((?x3601 (- (* (- a3_x q2_x) (- s3_y q2_y)) (* (- a3_y q2_y) (- s3_x q2_x)))))
 (< ?x3601 0.0)))
(assert
 (let ((?x3605 (- (* (- a3_x q2_x) (- s1_y q2_y)) (* (- a3_y q2_y) (- s1_x q2_x)))))
 (< ?x3605 0.0)))
(assert
 (let ((?x3609 (- (* (- a3_x q2_x) (- s4_y q2_y)) (* (- a3_y q2_y) (- s4_x q2_x)))))
 (< ?x3609 0.0)))
(assert
 (let ((?x3613 (- (* (- a3_x q2_x) (- s2_y q2_y)) (* (- a3_y q2_y) (- s2_x q2_x)))))
 (< ?x3613 0.0)))
(assert
 (let ((?x3617 (- (* (- s3_x q2_x) (- s1_y q2_y)) (* (- s3_y q2_y) (- s1_x q2_x)))))
 (< ?x3617 0.0)))
(assert
 (let ((?x3621 (- (* (- s3_x q2_x) (- s4_y q2_y)) (* (- s3_y q2_y) (- s4_x q2_x)))))
 (< ?x3621 0.0)))
(assert
 (let ((?x3625 (- (* (- s3_x q2_x) (- s2_y q2_y)) (* (- s3_y q2_y) (- s2_x q2_x)))))
 (< ?x3625 0.0)))
(assert
 (let ((?x3629 (- (* (- s1_x q2_x) (- s4_y q2_y)) (* (- s1_y q2_y) (- s4_x q2_x)))))
 (< ?x3629 0.0)))
(assert
 (let ((?x3633 (- (* (- s1_x q2_x) (- s2_y q2_y)) (* (- s1_y q2_y) (- s2_x q2_x)))))
 (< ?x3633 0.0)))
(assert
 (let ((?x3637 (- (* (- s4_x q2_x) (- s2_y q2_y)) (* (- s4_y q2_y) (- s2_x q2_x)))))
 (< ?x3637 0.0)))
(assert
 (let ((?x3643 (- (* (- q1_x p2_x) (- r2_y p2_y)) (* (- q1_y p2_y) (- r2_x p2_x)))))
 (< ?x3643 0.0)))
(assert
 (let ((?x3647 (- (* (- q1_x p2_x) (- a3_y p2_y)) (* (- q1_y p2_y) (- a3_x p2_x)))))
 (< ?x3647 0.0)))
(assert
 (let ((?x3653 (- (* (- q1_x p2_x) (- s3_y p2_y)) (* (- q1_y p2_y) (- s3_x p2_x)))))
 (< ?x3653 0.0)))
(assert
 (let ((?x3659 (- (* (- q1_x p2_x) (- s1_y p2_y)) (* (- q1_y p2_y) (- s1_x p2_x)))))
 (< ?x3659 0.0)))
(assert
 (let ((?x3665 (- (* (- q1_x p2_x) (- s4_y p2_y)) (* (- q1_y p2_y) (- s4_x p2_x)))))
 (< ?x3665 0.0)))
(assert
 (let ((?x3671 (- (* (- q1_x p2_x) (- s2_y p2_y)) (* (- q1_y p2_y) (- s2_x p2_x)))))
 (< ?x3671 0.0)))
(assert
 (let ((?x3675 (- (* (- r2_x p2_x) (- a3_y p2_y)) (* (- r2_y p2_y) (- a3_x p2_x)))))
 (< ?x3675 0.0)))
(assert
 (let ((?x3679 (- (* (- r2_x p2_x) (- s3_y p2_y)) (* (- r2_y p2_y) (- s3_x p2_x)))))
 (< ?x3679 0.0)))
(assert
 (let ((?x3683 (- (* (- r2_x p2_x) (- s1_y p2_y)) (* (- r2_y p2_y) (- s1_x p2_x)))))
 (< ?x3683 0.0)))
(assert
 (let ((?x3687 (- (* (- r2_x p2_x) (- s4_y p2_y)) (* (- r2_y p2_y) (- s4_x p2_x)))))
 (< ?x3687 0.0)))
(assert
 (let ((?x3691 (- (* (- r2_x p2_x) (- s2_y p2_y)) (* (- r2_y p2_y) (- s2_x p2_x)))))
 (< ?x3691 0.0)))
(assert
 (let ((?x3695 (- (* (- a3_x p2_x) (- s3_y p2_y)) (* (- a3_y p2_y) (- s3_x p2_x)))))
 (< ?x3695 0.0)))
(assert
 (let ((?x3699 (- (* (- a3_x p2_x) (- s1_y p2_y)) (* (- a3_y p2_y) (- s1_x p2_x)))))
 (< ?x3699 0.0)))
(assert
 (let ((?x3703 (- (* (- a3_x p2_x) (- s4_y p2_y)) (* (- a3_y p2_y) (- s4_x p2_x)))))
 (< ?x3703 0.0)))
(assert
 (let ((?x3707 (- (* (- a3_x p2_x) (- s2_y p2_y)) (* (- a3_y p2_y) (- s2_x p2_x)))))
 (< ?x3707 0.0)))
(assert
 (let ((?x3711 (- (* (- s3_x p2_x) (- s1_y p2_y)) (* (- s3_y p2_y) (- s1_x p2_x)))))
 (< ?x3711 0.0)))
(assert
 (let ((?x3715 (- (* (- s3_x p2_x) (- s4_y p2_y)) (* (- s3_y p2_y) (- s4_x p2_x)))))
 (< ?x3715 0.0)))
(assert
 (let ((?x3719 (- (* (- s3_x p2_x) (- s2_y p2_y)) (* (- s3_y p2_y) (- s2_x p2_x)))))
 (< ?x3719 0.0)))
(assert
 (let ((?x3723 (- (* (- s1_x p2_x) (- s4_y p2_y)) (* (- s1_y p2_y) (- s4_x p2_x)))))
 (< ?x3723 0.0)))
(assert
 (let ((?x3727 (- (* (- s1_x p2_x) (- s2_y p2_y)) (* (- s1_y p2_y) (- s2_x p2_x)))))
 (< ?x3727 0.0)))
(assert
 (let ((?x3731 (- (* (- s4_x p2_x) (- s2_y p2_y)) (* (- s4_y p2_y) (- s2_x p2_x)))))
 (< ?x3731 0.0)))
(assert
 (let ((?x3739 (- (* (- r2_x q1_x) (- a3_y q1_y)) (* (- r2_y q1_y) (- a3_x q1_x)))))
 (< ?x3739 0.0)))
(assert
 (let ((?x3745 (- (* (- r2_x q1_x) (- s3_y q1_y)) (* (- r2_y q1_y) (- s3_x q1_x)))))
 (< ?x3745 0.0)))
(assert
 (let ((?x3751 (- (* (- r2_x q1_x) (- s1_y q1_y)) (* (- r2_y q1_y) (- s1_x q1_x)))))
 (< ?x3751 0.0)))
(assert
 (let ((?x3757 (- (* (- r2_x q1_x) (- s4_y q1_y)) (* (- r2_y q1_y) (- s4_x q1_x)))))
 (< ?x3757 0.0)))
(assert
 (let ((?x3763 (- (* (- r2_x q1_x) (- s2_y q1_y)) (* (- r2_y q1_y) (- s2_x q1_x)))))
 (< ?x3763 0.0)))
(assert
 (let ((?x3767 (- (* (- a3_x q1_x) (- s3_y q1_y)) (* (- a3_y q1_y) (- s3_x q1_x)))))
 (< ?x3767 0.0)))
(assert
 (let ((?x3771 (- (* (- a3_x q1_x) (- s1_y q1_y)) (* (- a3_y q1_y) (- s1_x q1_x)))))
 (< ?x3771 0.0)))
(assert
 (let ((?x3775 (- (* (- a3_x q1_x) (- s4_y q1_y)) (* (- a3_y q1_y) (- s4_x q1_x)))))
 (< ?x3775 0.0)))
(assert
 (let ((?x3779 (- (* (- a3_x q1_x) (- s2_y q1_y)) (* (- a3_y q1_y) (- s2_x q1_x)))))
 (< ?x3779 0.0)))
(assert
 (let ((?x3783 (- (* (- s3_x q1_x) (- s1_y q1_y)) (* (- s3_y q1_y) (- s1_x q1_x)))))
 (< ?x3783 0.0)))
(assert
 (let ((?x3787 (- (* (- s3_x q1_x) (- s4_y q1_y)) (* (- s3_y q1_y) (- s4_x q1_x)))))
 (< ?x3787 0.0)))
(assert
 (let ((?x3791 (- (* (- s3_x q1_x) (- s2_y q1_y)) (* (- s3_y q1_y) (- s2_x q1_x)))))
 (< ?x3791 0.0)))
(assert
 (let ((?x3795 (- (* (- s1_x q1_x) (- s4_y q1_y)) (* (- s1_y q1_y) (- s4_x q1_x)))))
 (< ?x3795 0.0)))
(assert
 (let ((?x3799 (- (* (- s1_x q1_x) (- s2_y q1_y)) (* (- s1_y q1_y) (- s2_x q1_x)))))
 (< ?x3799 0.0)))
(assert
 (let ((?x3803 (- (* (- s4_x q1_x) (- s2_y q1_y)) (* (- s4_y q1_y) (- s2_x q1_x)))))
 (< ?x3803 0.0)))
(assert
 (let ((?x3811 (- (* (- a3_x r2_x) (- s3_y r2_y)) (* (- a3_y r2_y) (- s3_x r2_x)))))
 (< ?x3811 0.0)))
(assert
 (let ((?x3817 (- (* (- a3_x r2_x) (- s1_y r2_y)) (* (- a3_y r2_y) (- s1_x r2_x)))))
 (< ?x3817 0.0)))
(assert
 (let ((?x3823 (- (* (- a3_x r2_x) (- s4_y r2_y)) (* (- a3_y r2_y) (- s4_x r2_x)))))
 (< ?x3823 0.0)))
(assert
 (let ((?x3829 (- (* (- a3_x r2_x) (- s2_y r2_y)) (* (- a3_y r2_y) (- s2_x r2_x)))))
 (< ?x3829 0.0)))
(assert
 (let ((?x3833 (- (* (- s3_x r2_x) (- s1_y r2_y)) (* (- s3_y r2_y) (- s1_x r2_x)))))
 (< ?x3833 0.0)))
(assert
 (let ((?x3837 (- (* (- s3_x r2_x) (- s4_y r2_y)) (* (- s3_y r2_y) (- s4_x r2_x)))))
 (< ?x3837 0.0)))
(assert
 (let ((?x3841 (- (* (- s3_x r2_x) (- s2_y r2_y)) (* (- s3_y r2_y) (- s2_x r2_x)))))
 (< ?x3841 0.0)))
(assert
 (let ((?x3845 (- (* (- s1_x r2_x) (- s4_y r2_y)) (* (- s1_y r2_y) (- s4_x r2_x)))))
 (< ?x3845 0.0)))
(assert
 (let ((?x3849 (- (* (- s1_x r2_x) (- s2_y r2_y)) (* (- s1_y r2_y) (- s2_x r2_x)))))
 (< ?x3849 0.0)))
(assert
 (let ((?x3853 (- (* (- s4_x r2_x) (- s2_y r2_y)) (* (- s4_y r2_y) (- s2_x r2_x)))))
 (< ?x3853 0.0)))
(assert
 (let ((?x3861 (- (* (- s3_x a3_x) (- s1_y a3_y)) (* (- s3_y a3_y) (- s1_x a3_x)))))
 (< ?x3861 0.0)))
(assert
 (let ((?x3867 (- (* (- s3_x a3_x) (- s4_y a3_y)) (* (- s3_y a3_y) (- s4_x a3_x)))))
 (< ?x3867 0.0)))
(assert
 (let ((?x3873 (- (* (- s3_x a3_x) (- s2_y a3_y)) (* (- s3_y a3_y) (- s2_x a3_x)))))
 (< ?x3873 0.0)))
(assert
 (let ((?x3877 (- (* (- s1_x a3_x) (- s4_y a3_y)) (* (- s1_y a3_y) (- s4_x a3_x)))))
 (< ?x3877 0.0)))
(assert
 (let ((?x3881 (- (* (- s1_x a3_x) (- s2_y a3_y)) (* (- s1_y a3_y) (- s2_x a3_x)))))
 (< ?x3881 0.0)))
(assert
 (let ((?x3885 (- (* (- s4_x a3_x) (- s2_y a3_y)) (* (- s4_y a3_y) (- s2_x a3_x)))))
 (< ?x3885 0.0)))
(assert
 (let ((?x3893 (- (* (- s1_x s3_x) (- s4_y s3_y)) (* (- s1_y s3_y) (- s4_x s3_x)))))
 (< ?x3893 0.0)))
(assert
 (let ((?x3899 (- (* (- s1_x s3_x) (- s2_y s3_y)) (* (- s1_y s3_y) (- s2_x s3_x)))))
 (< ?x3899 0.0)))
(assert
 (let ((?x3903 (- (* (- s4_x s3_x) (- s2_y s3_y)) (* (- s4_y s3_y) (- s2_x s3_x)))))
 (< ?x3903 0.0)))
(assert
 (let ((?x3911 (- (* (- s4_x s1_x) (- s2_y s1_y)) (* (- s4_y s1_y) (- s2_x s1_x)))))
(< ?x3911 0.0)))
(check-sat)
