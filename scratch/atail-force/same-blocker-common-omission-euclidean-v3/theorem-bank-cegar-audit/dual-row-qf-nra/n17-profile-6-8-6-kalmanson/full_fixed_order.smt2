(set-logic QF_NRA)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun a1_x () Real)
(declare-fun a1_y () Real)
(declare-fun t3_x () Real)
(declare-fun t3_y () Real)
(declare-fun t2_y () Real)
(declare-fun t2_x () Real)
(declare-fun q1_y () Real)
(declare-fun q1_x () Real)
(declare-fun q2_y () Real)
(declare-fun q2_x () Real)
(declare-fun s3_y () Real)
(declare-fun s3_x () Real)
(declare-fun r2_y () Real)
(declare-fun a2_y () Real)
(declare-fun r2_x () Real)
(declare-fun a2_x () Real)
(declare-fun a3_y () Real)
(declare-fun a3_x () Real)
(declare-fun s1_y () Real)
(declare-fun s1_x () Real)
(declare-fun t4_y () Real)
(declare-fun t4_x () Real)
(declare-fun p2_y () Real)
(declare-fun p2_x () Real)
(declare-fun t1_y () Real)
(declare-fun t1_x () Real)
(declare-fun s2_y () Real)
(declare-fun s2_x () Real)
(declare-fun r1_y () Real)
(declare-fun r1_x () Real)
(declare-fun s4_y () Real)
(declare-fun s4_x () Real)
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
 (let ((?x56 (+ (^ (- a1_x t2_x) 2.0) (^ (- a1_y t2_y) 2.0))))
 (let ((?x104 (+ (^ (- a1_x q1_x) 2.0) (^ (- a1_y q1_y) 2.0))))
 (= ?x104 ?x56))))
(assert
 (let ((?x56 (+ (^ (- a1_x t2_x) 2.0) (^ (- a1_y t2_y) 2.0))))
 (let ((?x86 (+ (^ (- a1_x q2_x) 2.0) (^ (- a1_y q2_y) 2.0))))
 (= ?x86 ?x56))))
(assert
 (let ((?x56 (+ (^ (- a1_x t2_x) 2.0) (^ (- a1_y t2_y) 2.0))))
 (let ((?x122 (+ (^ (- a1_x s3_x) 2.0) (^ (- a1_y s3_y) 2.0))))
 (= ?x122 ?x56))))
(assert
 (let ((?x500 (+ (^ (- a2_x r2_x) 2.0) (^ (- a2_y r2_y) 2.0))))
 (let ((?x494 (+ (^ (- a2_x q1_x) 2.0) (^ (- a2_y q1_y) 2.0))))
 (= ?x494 ?x500))))
(assert
 (let ((?x500 (+ (^ (- a2_x r2_x) 2.0) (^ (- a2_y r2_y) 2.0))))
 (let ((?x506 (+ (^ (- a2_x a3_x) 2.0) (^ (- a2_y a3_y) 2.0))))
 (= ?x506 ?x500))))
(assert
 (let ((?x500 (+ (^ (- a2_x r2_x) 2.0) (^ (- a2_y r2_y) 2.0))))
 (let ((?x518 (+ (^ (- a2_x s1_x) 2.0) (^ (- a2_y s1_y) 2.0))))
 (= ?x518 ?x500))))
(assert
 (let ((?x872 (+ (^ (- a3_x t3_x) 2.0) (^ (- a3_y t3_y) 2.0))))
 (= (+ (^ (- a3_x t4_x) 2.0) (^ (- a3_y t4_y) 2.0)) ?x872)))
(assert
 (let ((?x872 (+ (^ (- a3_x t3_x) 2.0) (^ (- a3_y t3_y) 2.0))))
 (= (+ (^ (- a3_x p2_x) 2.0) (^ (- a3_y p2_y) 2.0)) ?x872)))
(assert
 (let ((?x872 (+ (^ (- a3_x t3_x) 2.0) (^ (- a3_y t3_y) 2.0))))
 (let ((?x812 (+ (^ (- a3_x s1_x) 2.0) (^ (- a3_y s1_y) 2.0))))
 (= ?x812 ?x872))))
(assert
 (let ((?x890 (+ (^ (- p2_x t1_x) 2.0) (^ (- p2_y t1_y) 2.0))))
 (let ((?x656 (+ (^ (- p2_x q1_x) 2.0) (^ (- p2_y q1_y) 2.0))))
 (= ?x656 ?x890))))
(assert
 (let ((?x890 (+ (^ (- p2_x t1_x) 2.0) (^ (- p2_y t1_y) 2.0))))
 (= (+ (^ (- p2_x q2_x) 2.0) (^ (- p2_y q2_y) 2.0)) ?x890)))
(assert
 (let ((?x890 (+ (^ (- p2_x t1_x) 2.0) (^ (- p2_y t1_y) 2.0))))
 (let ((?x692 (+ (^ (- p2_x s2_x) 2.0) (^ (- p2_y s2_y) 2.0))))
 (= ?x692 ?x890))))
(assert
 (let ((?x903 (+ (^ (- q2_x t2_x) 2.0) (^ (- q2_y t2_y) 2.0))))
 (= (+ (^ (- q2_x r1_x) 2.0) (^ (- q2_y r1_y) 2.0)) ?x903)))
(assert
 (let ((?x903 (+ (^ (- q2_x t2_x) 2.0) (^ (- q2_y t2_y) 2.0))))
 (let ((?x614 (+ (^ (- q2_x r2_x) 2.0) (^ (- q2_y r2_y) 2.0))))
 (= ?x614 ?x903))))
(assert
 (let ((?x903 (+ (^ (- q2_x t2_x) 2.0) (^ (- q2_y t2_y) 2.0))))
 (let ((?x638 (+ (^ (- q2_x s4_x) 2.0) (^ (- q2_y s4_y) 2.0))))
 (= ?x638 ?x903))))
(assert
 (let ((?x68 (+ (^ (- a1_x t1_x) 2.0) (^ (- a1_y t1_y) 2.0))))
 (let ((?x80 (+ (^ (- a1_x r1_x) 2.0) (^ (- a1_y r1_y) 2.0))))
 (= ?x80 ?x68))))
(assert
 (let ((?x68 (+ (^ (- a1_x t1_x) 2.0) (^ (- a1_y t1_y) 2.0))))
 (let ((?x110 (+ (^ (- a1_x r2_x) 2.0) (^ (- a1_y r2_y) 2.0))))
 (= ?x110 ?x68))))
(assert
 (let ((?x68 (+ (^ (- a1_x t1_x) 2.0) (^ (- a1_y t1_y) 2.0))))
 (let ((?x140 (+ (^ (- a1_x s2_x) 2.0) (^ (- a1_y s2_y) 2.0))))
 (= ?x140 ?x68))))
(assert
 (let ((?x482 (+ (^ (- a2_x p2_x) 2.0) (^ (- a2_y p2_y) 2.0))))
 (let ((?x470 (+ (^ (- a2_x r1_x) 2.0) (^ (- a2_y r1_y) 2.0))))
 (= ?x470 ?x482))))
(assert
 (let ((?x482 (+ (^ (- a2_x p2_x) 2.0) (^ (- a2_y p2_y) 2.0))))
 (let ((?x476 (+ (^ (- a2_x q2_x) 2.0) (^ (- a2_y q2_y) 2.0))))
 (= ?x476 ?x482))))
(assert
 (let ((?x482 (+ (^ (- a2_x p2_x) 2.0) (^ (- a2_y p2_y) 2.0))))
 (let ((?x524 (+ (^ (- a2_x s4_x) 2.0) (^ (- a2_y s4_y) 2.0))))
 (= ?x524 ?x482))))
(assert
 (let ((?x872 (+ (^ (- a3_x t3_x) 2.0) (^ (- a3_y t3_y) 2.0))))
 (= (+ (^ (- a3_x t4_x) 2.0) (^ (- a3_y t4_y) 2.0)) ?x872)))
(assert
 (let ((?x872 (+ (^ (- a3_x t3_x) 2.0) (^ (- a3_y t3_y) 2.0))))
 (= (+ (^ (- a3_x p2_x) 2.0) (^ (- a3_y p2_y) 2.0)) ?x872)))
(assert
 (let ((?x872 (+ (^ (- a3_x t3_x) 2.0) (^ (- a3_y t3_y) 2.0))))
 (let ((?x812 (+ (^ (- a3_x s1_x) 2.0) (^ (- a3_y s1_y) 2.0))))
 (= ?x812 ?x872))))
(assert
 (let ((?x890 (+ (^ (- p2_x t1_x) 2.0) (^ (- p2_y t1_y) 2.0))))
 (let ((?x656 (+ (^ (- p2_x q1_x) 2.0) (^ (- p2_y q1_y) 2.0))))
 (= ?x656 ?x890))))
(assert
 (let ((?x890 (+ (^ (- p2_x t1_x) 2.0) (^ (- p2_y t1_y) 2.0))))
 (= (+ (^ (- p2_x q2_x) 2.0) (^ (- p2_y q2_y) 2.0)) ?x890)))
(assert
 (let ((?x890 (+ (^ (- p2_x t1_x) 2.0) (^ (- p2_y t1_y) 2.0))))
 (let ((?x692 (+ (^ (- p2_x s2_x) 2.0) (^ (- p2_y s2_y) 2.0))))
 (= ?x692 ?x890))))
(assert
 (let ((?x903 (+ (^ (- q2_x t2_x) 2.0) (^ (- q2_y t2_y) 2.0))))
 (= (+ (^ (- q2_x r1_x) 2.0) (^ (- q2_y r1_y) 2.0)) ?x903)))
(assert
 (let ((?x903 (+ (^ (- q2_x t2_x) 2.0) (^ (- q2_y t2_y) 2.0))))
 (let ((?x614 (+ (^ (- q2_x r2_x) 2.0) (^ (- q2_y r2_y) 2.0))))
 (= ?x614 ?x903))))
(assert
 (let ((?x903 (+ (^ (- q2_x t2_x) 2.0) (^ (- q2_y t2_y) 2.0))))
 (let ((?x638 (+ (^ (- q2_x s4_x) 2.0) (^ (- q2_y s4_y) 2.0))))
 (= ?x638 ?x903))))
(assert
 (let ((?x922 (+ (^ (- q1_x a1_x) 2.0) (^ (- q1_y a1_y) 2.0))))
 (= (+ (^ (- q1_x t2_x) 2.0) (^ (- q1_y t2_y) 2.0)) ?x922)))
(assert
 (let ((?x922 (+ (^ (- q1_x a1_x) 2.0) (^ (- q1_y a1_y) 2.0))))
 (= (+ (^ (- q1_x p1_x) 2.0) (^ (- q1_y p1_y) 2.0)) ?x922)))
(assert
 (let ((?x922 (+ (^ (- q1_x a1_x) 2.0) (^ (- q1_y a1_y) 2.0))))
 (= (+ (^ (- q1_x p2_x) 2.0) (^ (- q1_y p2_y) 2.0)) ?x922)))
(assert
 (> (+ (^ (- a1_x t3_x) 2.0) (^ (- a1_y t3_y) 2.0)) 0.0))
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
 (let ((?x86 (+ (^ (- a1_x q2_x) 2.0) (^ (- a1_y q2_y) 2.0))))
 (> ?x86 0.0)))
(assert
 (> (+ (^ (- a1_x p2_x) 2.0) (^ (- a1_y p2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- a1_x p1_x) 2.0) (^ (- a1_y p1_y) 2.0)) 0.0))
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
 (let ((?x140 (+ (^ (- a1_x s2_x) 2.0) (^ (- a1_y s2_y) 2.0))))
 (> ?x140 0.0)))
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
 (> (+ (^ (- t3_x q2_x) 2.0) (^ (- t3_y q2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t3_x p2_x) 2.0) (^ (- t3_y p2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t3_x p1_x) 2.0) (^ (- t3_y p1_y) 2.0)) 0.0))
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
 (> (+ (^ (- t2_x q2_x) 2.0) (^ (- t2_y q2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t2_x p2_x) 2.0) (^ (- t2_y p2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t2_x p1_x) 2.0) (^ (- t2_y p1_y) 2.0)) 0.0))
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
 (> (+ (^ (- t4_x q2_x) 2.0) (^ (- t4_y q2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t4_x p2_x) 2.0) (^ (- t4_y p2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t4_x p1_x) 2.0) (^ (- t4_y p1_y) 2.0)) 0.0))
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
 (> (+ (^ (- t1_x q2_x) 2.0) (^ (- t1_y q2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t1_x p2_x) 2.0) (^ (- t1_y p2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- t1_x p1_x) 2.0) (^ (- t1_y p1_y) 2.0)) 0.0))
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
 (let ((?x476 (+ (^ (- a2_x q2_x) 2.0) (^ (- a2_y q2_y) 2.0))))
 (> ?x476 0.0)))
(assert
 (let ((?x482 (+ (^ (- a2_x p2_x) 2.0) (^ (- a2_y p2_y) 2.0))))
 (> ?x482 0.0)))
(assert
 (> (+ (^ (- a2_x p1_x) 2.0) (^ (- a2_y p1_y) 2.0)) 0.0))
(assert
 (let ((?x494 (+ (^ (- a2_x q1_x) 2.0) (^ (- a2_y q1_y) 2.0))))
 (> ?x494 0.0)))
(assert
 (let ((?x500 (+ (^ (- a2_x r2_x) 2.0) (^ (- a2_y r2_y) 2.0))))
 (> ?x500 0.0)))
(assert
 (let ((?x506 (+ (^ (- a2_x a3_x) 2.0) (^ (- a2_y a3_y) 2.0))))
 (> ?x506 0.0)))
(assert
 (> (+ (^ (- a2_x s3_x) 2.0) (^ (- a2_y s3_y) 2.0)) 0.0))
(assert
 (let ((?x518 (+ (^ (- a2_x s1_x) 2.0) (^ (- a2_y s1_y) 2.0))))
 (> ?x518 0.0)))
(assert
 (let ((?x524 (+ (^ (- a2_x s4_x) 2.0) (^ (- a2_y s4_y) 2.0))))
 (> ?x524 0.0)))
(assert
 (> (+ (^ (- a2_x s2_x) 2.0) (^ (- a2_y s2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- r1_x q2_x) 2.0) (^ (- r1_y q2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- r1_x p2_x) 2.0) (^ (- r1_y p2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- r1_x p1_x) 2.0) (^ (- r1_y p1_y) 2.0)) 0.0))
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
 (> (+ (^ (- q2_x p2_x) 2.0) (^ (- q2_y p2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- q2_x p1_x) 2.0) (^ (- q2_y p1_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- q2_x q1_x) 2.0) (^ (- q2_y q1_y) 2.0)) 0.0))
(assert
 (let ((?x614 (+ (^ (- q2_x r2_x) 2.0) (^ (- q2_y r2_y) 2.0))))
 (> ?x614 0.0)))
(assert
 (> (+ (^ (- q2_x a3_x) 2.0) (^ (- q2_y a3_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- q2_x s3_x) 2.0) (^ (- q2_y s3_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- q2_x s1_x) 2.0) (^ (- q2_y s1_y) 2.0)) 0.0))
(assert
 (let ((?x638 (+ (^ (- q2_x s4_x) 2.0) (^ (- q2_y s4_y) 2.0))))
 (> ?x638 0.0)))
(assert
 (> (+ (^ (- q2_x s2_x) 2.0) (^ (- q2_y s2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- p2_x p1_x) 2.0) (^ (- p2_y p1_y) 2.0)) 0.0))
(assert
 (let ((?x656 (+ (^ (- p2_x q1_x) 2.0) (^ (- p2_y q1_y) 2.0))))
 (> ?x656 0.0)))
(assert
 (> (+ (^ (- p2_x r2_x) 2.0) (^ (- p2_y r2_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- p2_x a3_x) 2.0) (^ (- p2_y a3_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- p2_x s3_x) 2.0) (^ (- p2_y s3_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- p2_x s1_x) 2.0) (^ (- p2_y s1_y) 2.0)) 0.0))
(assert
 (> (+ (^ (- p2_x s4_x) 2.0) (^ (- p2_y s4_y) 2.0)) 0.0))
(assert
 (let ((?x692 (+ (^ (- p2_x s2_x) 2.0) (^ (- p2_y s2_y) 2.0))))
 (> ?x692 0.0)))
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
 (let ((?x947 (- (* (- t3_x a1_x) (- t2_y a1_y)) (* (- t3_y a1_y) (- t2_x a1_x)))))
 (< ?x947 0.0)))
(assert
 (let ((?x953 (- (* (- t3_x a1_x) (- t4_y a1_y)) (* (- t3_y a1_y) (- t4_x a1_x)))))
 (< ?x953 0.0)))
(assert
 (let ((?x959 (- (* (- t3_x a1_x) (- t1_y a1_y)) (* (- t3_y a1_y) (- t1_x a1_x)))))
 (< ?x959 0.0)))
(assert
 (let ((?x965 (- (* (- t3_x a1_x) (- a2_y a1_y)) (* (- t3_y a1_y) (- a2_x a1_x)))))
 (< ?x965 0.0)))
(assert
 (let ((?x971 (- (* (- t3_x a1_x) (- r1_y a1_y)) (* (- t3_y a1_y) (- r1_x a1_x)))))
 (< ?x971 0.0)))
(assert
 (let ((?x977 (- (* (- t3_x a1_x) (- q2_y a1_y)) (* (- t3_y a1_y) (- q2_x a1_x)))))
 (< ?x977 0.0)))
(assert
 (let ((?x983 (- (* (- t3_x a1_x) (- p2_y a1_y)) (* (- t3_y a1_y) (- p2_x a1_x)))))
 (< ?x983 0.0)))
(assert
 (let ((?x989 (- (* (- t3_x a1_x) (- p1_y a1_y)) (* (- t3_y a1_y) (- p1_x a1_x)))))
 (< ?x989 0.0)))
(assert
 (let ((?x993 (- (* (- t3_x a1_x) (- q1_y a1_y)) (* (- t3_y a1_y) (- q1_x a1_x)))))
 (< ?x993 0.0)))
(assert
 (let ((?x999 (- (* (- t3_x a1_x) (- r2_y a1_y)) (* (- t3_y a1_y) (- r2_x a1_x)))))
 (< ?x999 0.0)))
(assert
 (let ((?x1005 (- (* (- t3_x a1_x) (- a3_y a1_y)) (* (- t3_y a1_y) (- a3_x a1_x)))))
 (< ?x1005 0.0)))
(assert
 (let ((?x1011 (- (* (- t3_x a1_x) (- s3_y a1_y)) (* (- t3_y a1_y) (- s3_x a1_x)))))
 (< ?x1011 0.0)))
(assert
 (let ((?x1017 (- (* (- t3_x a1_x) (- s1_y a1_y)) (* (- t3_y a1_y) (- s1_x a1_x)))))
 (< ?x1017 0.0)))
(assert
 (let ((?x1023 (- (* (- t3_x a1_x) (- s4_y a1_y)) (* (- t3_y a1_y) (- s4_x a1_x)))))
 (< ?x1023 0.0)))
(assert
 (let ((?x1029 (- (* (- t3_x a1_x) (- s2_y a1_y)) (* (- t3_y a1_y) (- s2_x a1_x)))))
 (< ?x1029 0.0)))
(assert
 (let ((?x1033 (- (* (- t2_x a1_x) (- t4_y a1_y)) (* (- t2_y a1_y) (- t4_x a1_x)))))
 (< ?x1033 0.0)))
(assert
 (let ((?x1037 (- (* (- t2_x a1_x) (- t1_y a1_y)) (* (- t2_y a1_y) (- t1_x a1_x)))))
 (< ?x1037 0.0)))
(assert
 (let ((?x1041 (- (* (- t2_x a1_x) (- a2_y a1_y)) (* (- t2_y a1_y) (- a2_x a1_x)))))
 (< ?x1041 0.0)))
(assert
 (let ((?x1045 (- (* (- t2_x a1_x) (- r1_y a1_y)) (* (- t2_y a1_y) (- r1_x a1_x)))))
 (< ?x1045 0.0)))
(assert
 (let ((?x1049 (- (* (- t2_x a1_x) (- q2_y a1_y)) (* (- t2_y a1_y) (- q2_x a1_x)))))
 (< ?x1049 0.0)))
(assert
 (let ((?x1053 (- (* (- t2_x a1_x) (- p2_y a1_y)) (* (- t2_y a1_y) (- p2_x a1_x)))))
 (< ?x1053 0.0)))
(assert
 (let ((?x1057 (- (* (- t2_x a1_x) (- p1_y a1_y)) (* (- t2_y a1_y) (- p1_x a1_x)))))
 (< ?x1057 0.0)))
(assert
 (let ((?x1061 (- (* (- t2_x a1_x) (- q1_y a1_y)) (* (- t2_y a1_y) (- q1_x a1_x)))))
 (< ?x1061 0.0)))
(assert
 (let ((?x1065 (- (* (- t2_x a1_x) (- r2_y a1_y)) (* (- t2_y a1_y) (- r2_x a1_x)))))
 (< ?x1065 0.0)))
(assert
 (let ((?x1069 (- (* (- t2_x a1_x) (- a3_y a1_y)) (* (- t2_y a1_y) (- a3_x a1_x)))))
 (< ?x1069 0.0)))
(assert
 (let ((?x1073 (- (* (- t2_x a1_x) (- s3_y a1_y)) (* (- t2_y a1_y) (- s3_x a1_x)))))
 (< ?x1073 0.0)))
(assert
 (let ((?x1077 (- (* (- t2_x a1_x) (- s1_y a1_y)) (* (- t2_y a1_y) (- s1_x a1_x)))))
 (< ?x1077 0.0)))
(assert
 (let ((?x1081 (- (* (- t2_x a1_x) (- s4_y a1_y)) (* (- t2_y a1_y) (- s4_x a1_x)))))
 (< ?x1081 0.0)))
(assert
 (let ((?x1085 (- (* (- t2_x a1_x) (- s2_y a1_y)) (* (- t2_y a1_y) (- s2_x a1_x)))))
 (< ?x1085 0.0)))
(assert
 (let ((?x1089 (- (* (- t4_x a1_x) (- t1_y a1_y)) (* (- t4_y a1_y) (- t1_x a1_x)))))
 (< ?x1089 0.0)))
(assert
 (let ((?x1093 (- (* (- t4_x a1_x) (- a2_y a1_y)) (* (- t4_y a1_y) (- a2_x a1_x)))))
 (< ?x1093 0.0)))
(assert
 (let ((?x1097 (- (* (- t4_x a1_x) (- r1_y a1_y)) (* (- t4_y a1_y) (- r1_x a1_x)))))
 (< ?x1097 0.0)))
(assert
 (let ((?x1101 (- (* (- t4_x a1_x) (- q2_y a1_y)) (* (- t4_y a1_y) (- q2_x a1_x)))))
 (< ?x1101 0.0)))
(assert
 (let ((?x1105 (- (* (- t4_x a1_x) (- p2_y a1_y)) (* (- t4_y a1_y) (- p2_x a1_x)))))
 (< ?x1105 0.0)))
(assert
 (let ((?x1109 (- (* (- t4_x a1_x) (- p1_y a1_y)) (* (- t4_y a1_y) (- p1_x a1_x)))))
 (< ?x1109 0.0)))
(assert
 (let ((?x1113 (- (* (- t4_x a1_x) (- q1_y a1_y)) (* (- t4_y a1_y) (- q1_x a1_x)))))
 (< ?x1113 0.0)))
(assert
 (let ((?x1117 (- (* (- t4_x a1_x) (- r2_y a1_y)) (* (- t4_y a1_y) (- r2_x a1_x)))))
 (< ?x1117 0.0)))
(assert
 (let ((?x1121 (- (* (- t4_x a1_x) (- a3_y a1_y)) (* (- t4_y a1_y) (- a3_x a1_x)))))
 (< ?x1121 0.0)))
(assert
 (let ((?x1125 (- (* (- t4_x a1_x) (- s3_y a1_y)) (* (- t4_y a1_y) (- s3_x a1_x)))))
 (< ?x1125 0.0)))
(assert
 (let ((?x1129 (- (* (- t4_x a1_x) (- s1_y a1_y)) (* (- t4_y a1_y) (- s1_x a1_x)))))
 (< ?x1129 0.0)))
(assert
 (let ((?x1133 (- (* (- t4_x a1_x) (- s4_y a1_y)) (* (- t4_y a1_y) (- s4_x a1_x)))))
 (< ?x1133 0.0)))
(assert
 (let ((?x1137 (- (* (- t4_x a1_x) (- s2_y a1_y)) (* (- t4_y a1_y) (- s2_x a1_x)))))
 (< ?x1137 0.0)))
(assert
 (let ((?x1141 (- (* (- t1_x a1_x) (- a2_y a1_y)) (* (- t1_y a1_y) (- a2_x a1_x)))))
 (< ?x1141 0.0)))
(assert
 (let ((?x1145 (- (* (- t1_x a1_x) (- r1_y a1_y)) (* (- t1_y a1_y) (- r1_x a1_x)))))
 (< ?x1145 0.0)))
(assert
 (let ((?x1149 (- (* (- t1_x a1_x) (- q2_y a1_y)) (* (- t1_y a1_y) (- q2_x a1_x)))))
 (< ?x1149 0.0)))
(assert
 (let ((?x1153 (- (* (- t1_x a1_x) (- p2_y a1_y)) (* (- t1_y a1_y) (- p2_x a1_x)))))
 (< ?x1153 0.0)))
(assert
 (let ((?x1157 (- (* (- t1_x a1_x) (- p1_y a1_y)) (* (- t1_y a1_y) (- p1_x a1_x)))))
 (< ?x1157 0.0)))
(assert
 (let ((?x1161 (- (* (- t1_x a1_x) (- q1_y a1_y)) (* (- t1_y a1_y) (- q1_x a1_x)))))
 (< ?x1161 0.0)))
(assert
 (let ((?x1165 (- (* (- t1_x a1_x) (- r2_y a1_y)) (* (- t1_y a1_y) (- r2_x a1_x)))))
 (< ?x1165 0.0)))
(assert
 (let ((?x1169 (- (* (- t1_x a1_x) (- a3_y a1_y)) (* (- t1_y a1_y) (- a3_x a1_x)))))
 (< ?x1169 0.0)))
(assert
 (let ((?x1173 (- (* (- t1_x a1_x) (- s3_y a1_y)) (* (- t1_y a1_y) (- s3_x a1_x)))))
 (< ?x1173 0.0)))
(assert
 (let ((?x1177 (- (* (- t1_x a1_x) (- s1_y a1_y)) (* (- t1_y a1_y) (- s1_x a1_x)))))
 (< ?x1177 0.0)))
(assert
 (let ((?x1181 (- (* (- t1_x a1_x) (- s4_y a1_y)) (* (- t1_y a1_y) (- s4_x a1_x)))))
 (< ?x1181 0.0)))
(assert
 (let ((?x1185 (- (* (- t1_x a1_x) (- s2_y a1_y)) (* (- t1_y a1_y) (- s2_x a1_x)))))
 (< ?x1185 0.0)))
(assert
 (let ((?x1189 (- (* (- a2_x a1_x) (- r1_y a1_y)) (* (- a2_y a1_y) (- r1_x a1_x)))))
 (< ?x1189 0.0)))
(assert
 (let ((?x1193 (- (* (- a2_x a1_x) (- q2_y a1_y)) (* (- a2_y a1_y) (- q2_x a1_x)))))
 (< ?x1193 0.0)))
(assert
 (let ((?x1197 (- (* (- a2_x a1_x) (- p2_y a1_y)) (* (- a2_y a1_y) (- p2_x a1_x)))))
 (< ?x1197 0.0)))
(assert
 (let ((?x1201 (- (* (- a2_x a1_x) (- p1_y a1_y)) (* (- a2_y a1_y) (- p1_x a1_x)))))
 (< ?x1201 0.0)))
(assert
 (let ((?x1205 (- (* (- a2_x a1_x) (- q1_y a1_y)) (* (- a2_y a1_y) (- q1_x a1_x)))))
 (< ?x1205 0.0)))
(assert
 (let ((?x1209 (- (* (- a2_x a1_x) (- r2_y a1_y)) (* (- a2_y a1_y) (- r2_x a1_x)))))
 (< ?x1209 0.0)))
(assert
 (let ((?x1213 (- (* (- a2_x a1_x) (- a3_y a1_y)) (* (- a2_y a1_y) (- a3_x a1_x)))))
 (< ?x1213 0.0)))
(assert
 (let ((?x1217 (- (* (- a2_x a1_x) (- s3_y a1_y)) (* (- a2_y a1_y) (- s3_x a1_x)))))
 (< ?x1217 0.0)))
(assert
 (let ((?x1221 (- (* (- a2_x a1_x) (- s1_y a1_y)) (* (- a2_y a1_y) (- s1_x a1_x)))))
 (< ?x1221 0.0)))
(assert
 (let ((?x1225 (- (* (- a2_x a1_x) (- s4_y a1_y)) (* (- a2_y a1_y) (- s4_x a1_x)))))
 (< ?x1225 0.0)))
(assert
 (let ((?x1229 (- (* (- a2_x a1_x) (- s2_y a1_y)) (* (- a2_y a1_y) (- s2_x a1_x)))))
 (< ?x1229 0.0)))
(assert
 (let ((?x1233 (- (* (- r1_x a1_x) (- q2_y a1_y)) (* (- r1_y a1_y) (- q2_x a1_x)))))
 (< ?x1233 0.0)))
(assert
 (let ((?x1237 (- (* (- r1_x a1_x) (- p2_y a1_y)) (* (- r1_y a1_y) (- p2_x a1_x)))))
 (< ?x1237 0.0)))
(assert
 (let ((?x1241 (- (* (- r1_x a1_x) (- p1_y a1_y)) (* (- r1_y a1_y) (- p1_x a1_x)))))
 (< ?x1241 0.0)))
(assert
 (let ((?x1245 (- (* (- r1_x a1_x) (- q1_y a1_y)) (* (- r1_y a1_y) (- q1_x a1_x)))))
 (< ?x1245 0.0)))
(assert
 (let ((?x1249 (- (* (- r1_x a1_x) (- r2_y a1_y)) (* (- r1_y a1_y) (- r2_x a1_x)))))
 (< ?x1249 0.0)))
(assert
 (let ((?x1253 (- (* (- r1_x a1_x) (- a3_y a1_y)) (* (- r1_y a1_y) (- a3_x a1_x)))))
 (< ?x1253 0.0)))
(assert
 (let ((?x1257 (- (* (- r1_x a1_x) (- s3_y a1_y)) (* (- r1_y a1_y) (- s3_x a1_x)))))
 (< ?x1257 0.0)))
(assert
 (let ((?x1261 (- (* (- r1_x a1_x) (- s1_y a1_y)) (* (- r1_y a1_y) (- s1_x a1_x)))))
 (< ?x1261 0.0)))
(assert
 (let ((?x1265 (- (* (- r1_x a1_x) (- s4_y a1_y)) (* (- r1_y a1_y) (- s4_x a1_x)))))
 (< ?x1265 0.0)))
(assert
 (let ((?x1269 (- (* (- r1_x a1_x) (- s2_y a1_y)) (* (- r1_y a1_y) (- s2_x a1_x)))))
 (< ?x1269 0.0)))
(assert
 (let ((?x1273 (- (* (- q2_x a1_x) (- p2_y a1_y)) (* (- q2_y a1_y) (- p2_x a1_x)))))
 (< ?x1273 0.0)))
(assert
 (let ((?x1277 (- (* (- q2_x a1_x) (- p1_y a1_y)) (* (- q2_y a1_y) (- p1_x a1_x)))))
 (< ?x1277 0.0)))
(assert
 (let ((?x1281 (- (* (- q2_x a1_x) (- q1_y a1_y)) (* (- q2_y a1_y) (- q1_x a1_x)))))
 (< ?x1281 0.0)))
(assert
 (let ((?x1285 (- (* (- q2_x a1_x) (- r2_y a1_y)) (* (- q2_y a1_y) (- r2_x a1_x)))))
 (< ?x1285 0.0)))
(assert
 (let ((?x1289 (- (* (- q2_x a1_x) (- a3_y a1_y)) (* (- q2_y a1_y) (- a3_x a1_x)))))
 (< ?x1289 0.0)))
(assert
 (let ((?x1293 (- (* (- q2_x a1_x) (- s3_y a1_y)) (* (- q2_y a1_y) (- s3_x a1_x)))))
 (< ?x1293 0.0)))
(assert
 (let ((?x1297 (- (* (- q2_x a1_x) (- s1_y a1_y)) (* (- q2_y a1_y) (- s1_x a1_x)))))
 (< ?x1297 0.0)))
(assert
 (let ((?x1301 (- (* (- q2_x a1_x) (- s4_y a1_y)) (* (- q2_y a1_y) (- s4_x a1_x)))))
 (< ?x1301 0.0)))
(assert
 (let ((?x1305 (- (* (- q2_x a1_x) (- s2_y a1_y)) (* (- q2_y a1_y) (- s2_x a1_x)))))
 (< ?x1305 0.0)))
(assert
 (let ((?x1309 (- (* (- p2_x a1_x) (- p1_y a1_y)) (* (- p2_y a1_y) (- p1_x a1_x)))))
 (< ?x1309 0.0)))
(assert
 (let ((?x1313 (- (* (- p2_x a1_x) (- q1_y a1_y)) (* (- p2_y a1_y) (- q1_x a1_x)))))
 (< ?x1313 0.0)))
(assert
 (let ((?x1317 (- (* (- p2_x a1_x) (- r2_y a1_y)) (* (- p2_y a1_y) (- r2_x a1_x)))))
 (< ?x1317 0.0)))
(assert
 (let ((?x1321 (- (* (- p2_x a1_x) (- a3_y a1_y)) (* (- p2_y a1_y) (- a3_x a1_x)))))
 (< ?x1321 0.0)))
(assert
 (let ((?x1325 (- (* (- p2_x a1_x) (- s3_y a1_y)) (* (- p2_y a1_y) (- s3_x a1_x)))))
 (< ?x1325 0.0)))
(assert
 (let ((?x1329 (- (* (- p2_x a1_x) (- s1_y a1_y)) (* (- p2_y a1_y) (- s1_x a1_x)))))
 (< ?x1329 0.0)))
(assert
 (let ((?x1333 (- (* (- p2_x a1_x) (- s4_y a1_y)) (* (- p2_y a1_y) (- s4_x a1_x)))))
 (< ?x1333 0.0)))
(assert
 (let ((?x1337 (- (* (- p2_x a1_x) (- s2_y a1_y)) (* (- p2_y a1_y) (- s2_x a1_x)))))
 (< ?x1337 0.0)))
(assert
 (let ((?x1341 (- (* (- p1_x a1_x) (- q1_y a1_y)) (* (- p1_y a1_y) (- q1_x a1_x)))))
 (< ?x1341 0.0)))
(assert
 (let ((?x1345 (- (* (- p1_x a1_x) (- r2_y a1_y)) (* (- p1_y a1_y) (- r2_x a1_x)))))
 (< ?x1345 0.0)))
(assert
 (let ((?x1349 (- (* (- p1_x a1_x) (- a3_y a1_y)) (* (- p1_y a1_y) (- a3_x a1_x)))))
 (< ?x1349 0.0)))
(assert
 (let ((?x1353 (- (* (- p1_x a1_x) (- s3_y a1_y)) (* (- p1_y a1_y) (- s3_x a1_x)))))
 (< ?x1353 0.0)))
(assert
 (let ((?x1357 (- (* (- p1_x a1_x) (- s1_y a1_y)) (* (- p1_y a1_y) (- s1_x a1_x)))))
 (< ?x1357 0.0)))
(assert
 (let ((?x1361 (- (* (- p1_x a1_x) (- s4_y a1_y)) (* (- p1_y a1_y) (- s4_x a1_x)))))
 (< ?x1361 0.0)))
(assert
 (let ((?x1365 (- (* (- p1_x a1_x) (- s2_y a1_y)) (* (- p1_y a1_y) (- s2_x a1_x)))))
 (< ?x1365 0.0)))
(assert
 (let ((?x1369 (- (* (- q1_x a1_x) (- r2_y a1_y)) (* (- q1_y a1_y) (- r2_x a1_x)))))
 (< ?x1369 0.0)))
(assert
 (let ((?x1373 (- (* (- q1_x a1_x) (- a3_y a1_y)) (* (- q1_y a1_y) (- a3_x a1_x)))))
 (< ?x1373 0.0)))
(assert
 (let ((?x1377 (- (* (- q1_x a1_x) (- s3_y a1_y)) (* (- q1_y a1_y) (- s3_x a1_x)))))
 (< ?x1377 0.0)))
(assert
 (let ((?x1381 (- (* (- q1_x a1_x) (- s1_y a1_y)) (* (- q1_y a1_y) (- s1_x a1_x)))))
 (< ?x1381 0.0)))
(assert
 (let ((?x1385 (- (* (- q1_x a1_x) (- s4_y a1_y)) (* (- q1_y a1_y) (- s4_x a1_x)))))
 (< ?x1385 0.0)))
(assert
 (let ((?x1389 (- (* (- q1_x a1_x) (- s2_y a1_y)) (* (- q1_y a1_y) (- s2_x a1_x)))))
 (< ?x1389 0.0)))
(assert
 (let ((?x1393 (- (* (- r2_x a1_x) (- a3_y a1_y)) (* (- r2_y a1_y) (- a3_x a1_x)))))
 (< ?x1393 0.0)))
(assert
 (let ((?x1397 (- (* (- r2_x a1_x) (- s3_y a1_y)) (* (- r2_y a1_y) (- s3_x a1_x)))))
 (< ?x1397 0.0)))
(assert
 (let ((?x1401 (- (* (- r2_x a1_x) (- s1_y a1_y)) (* (- r2_y a1_y) (- s1_x a1_x)))))
 (< ?x1401 0.0)))
(assert
 (let ((?x1405 (- (* (- r2_x a1_x) (- s4_y a1_y)) (* (- r2_y a1_y) (- s4_x a1_x)))))
 (< ?x1405 0.0)))
(assert
 (let ((?x1409 (- (* (- r2_x a1_x) (- s2_y a1_y)) (* (- r2_y a1_y) (- s2_x a1_x)))))
 (< ?x1409 0.0)))
(assert
 (let ((?x1413 (- (* (- a3_x a1_x) (- s3_y a1_y)) (* (- a3_y a1_y) (- s3_x a1_x)))))
 (< ?x1413 0.0)))
(assert
 (let ((?x1417 (- (* (- a3_x a1_x) (- s1_y a1_y)) (* (- a3_y a1_y) (- s1_x a1_x)))))
 (< ?x1417 0.0)))
(assert
 (let ((?x1421 (- (* (- a3_x a1_x) (- s4_y a1_y)) (* (- a3_y a1_y) (- s4_x a1_x)))))
 (< ?x1421 0.0)))
(assert
 (let ((?x1425 (- (* (- a3_x a1_x) (- s2_y a1_y)) (* (- a3_y a1_y) (- s2_x a1_x)))))
 (< ?x1425 0.0)))
(assert
 (let ((?x1429 (- (* (- s3_x a1_x) (- s1_y a1_y)) (* (- s3_y a1_y) (- s1_x a1_x)))))
 (< ?x1429 0.0)))
(assert
 (let ((?x1433 (- (* (- s3_x a1_x) (- s4_y a1_y)) (* (- s3_y a1_y) (- s4_x a1_x)))))
 (< ?x1433 0.0)))
(assert
 (let ((?x1437 (- (* (- s3_x a1_x) (- s2_y a1_y)) (* (- s3_y a1_y) (- s2_x a1_x)))))
 (< ?x1437 0.0)))
(assert
 (let ((?x1441 (- (* (- s1_x a1_x) (- s4_y a1_y)) (* (- s1_y a1_y) (- s4_x a1_x)))))
 (< ?x1441 0.0)))
(assert
 (let ((?x1445 (- (* (- s1_x a1_x) (- s2_y a1_y)) (* (- s1_y a1_y) (- s2_x a1_x)))))
 (< ?x1445 0.0)))
(assert
 (let ((?x1449 (- (* (- s4_x a1_x) (- s2_y a1_y)) (* (- s4_y a1_y) (- s2_x a1_x)))))
 (< ?x1449 0.0)))
(assert
 (let ((?x1457 (- (* (- t2_x t3_x) (- t4_y t3_y)) (* (- t2_y t3_y) (- t4_x t3_x)))))
 (< ?x1457 0.0)))
(assert
 (let ((?x1463 (- (* (- t2_x t3_x) (- t1_y t3_y)) (* (- t2_y t3_y) (- t1_x t3_x)))))
 (< ?x1463 0.0)))
(assert
 (let ((?x1469 (- (* (- t2_x t3_x) (- a2_y t3_y)) (* (- t2_y t3_y) (- a2_x t3_x)))))
 (< ?x1469 0.0)))
(assert
 (let ((?x1475 (- (* (- t2_x t3_x) (- r1_y t3_y)) (* (- t2_y t3_y) (- r1_x t3_x)))))
 (< ?x1475 0.0)))
(assert
 (let ((?x1481 (- (* (- t2_x t3_x) (- q2_y t3_y)) (* (- t2_y t3_y) (- q2_x t3_x)))))
 (< ?x1481 0.0)))
(assert
 (let ((?x1487 (- (* (- t2_x t3_x) (- p2_y t3_y)) (* (- t2_y t3_y) (- p2_x t3_x)))))
 (< ?x1487 0.0)))
(assert
 (let ((?x1493 (- (* (- t2_x t3_x) (- p1_y t3_y)) (* (- t2_y t3_y) (- p1_x t3_x)))))
 (< ?x1493 0.0)))
(assert
 (let ((?x1499 (- (* (- t2_x t3_x) (- q1_y t3_y)) (* (- t2_y t3_y) (- q1_x t3_x)))))
 (< ?x1499 0.0)))
(assert
 (let ((?x1505 (- (* (- t2_x t3_x) (- r2_y t3_y)) (* (- t2_y t3_y) (- r2_x t3_x)))))
 (< ?x1505 0.0)))
(assert
 (let ((?x1509 (- (* (- t2_x t3_x) (- a3_y t3_y)) (* (- t2_y t3_y) (- a3_x t3_x)))))
 (< ?x1509 0.0)))
(assert
 (let ((?x1515 (- (* (- t2_x t3_x) (- s3_y t3_y)) (* (- t2_y t3_y) (- s3_x t3_x)))))
 (< ?x1515 0.0)))
(assert
 (let ((?x1521 (- (* (- t2_x t3_x) (- s1_y t3_y)) (* (- t2_y t3_y) (- s1_x t3_x)))))
 (< ?x1521 0.0)))
(assert
 (let ((?x1527 (- (* (- t2_x t3_x) (- s4_y t3_y)) (* (- t2_y t3_y) (- s4_x t3_x)))))
 (< ?x1527 0.0)))
(assert
 (let ((?x1533 (- (* (- t2_x t3_x) (- s2_y t3_y)) (* (- t2_y t3_y) (- s2_x t3_x)))))
 (< ?x1533 0.0)))
(assert
 (let ((?x1537 (- (* (- t4_x t3_x) (- t1_y t3_y)) (* (- t4_y t3_y) (- t1_x t3_x)))))
 (< ?x1537 0.0)))
(assert
 (let ((?x1541 (- (* (- t4_x t3_x) (- a2_y t3_y)) (* (- t4_y t3_y) (- a2_x t3_x)))))
 (< ?x1541 0.0)))
(assert
 (let ((?x1545 (- (* (- t4_x t3_x) (- r1_y t3_y)) (* (- t4_y t3_y) (- r1_x t3_x)))))
 (< ?x1545 0.0)))
(assert
 (let ((?x1549 (- (* (- t4_x t3_x) (- q2_y t3_y)) (* (- t4_y t3_y) (- q2_x t3_x)))))
 (< ?x1549 0.0)))
(assert
 (let ((?x1553 (- (* (- t4_x t3_x) (- p2_y t3_y)) (* (- t4_y t3_y) (- p2_x t3_x)))))
 (< ?x1553 0.0)))
(assert
 (let ((?x1557 (- (* (- t4_x t3_x) (- p1_y t3_y)) (* (- t4_y t3_y) (- p1_x t3_x)))))
 (< ?x1557 0.0)))
(assert
 (let ((?x1561 (- (* (- t4_x t3_x) (- q1_y t3_y)) (* (- t4_y t3_y) (- q1_x t3_x)))))
 (< ?x1561 0.0)))
(assert
 (let ((?x1565 (- (* (- t4_x t3_x) (- r2_y t3_y)) (* (- t4_y t3_y) (- r2_x t3_x)))))
 (< ?x1565 0.0)))
(assert
 (let ((?x1569 (- (* (- t4_x t3_x) (- a3_y t3_y)) (* (- t4_y t3_y) (- a3_x t3_x)))))
 (< ?x1569 0.0)))
(assert
 (let ((?x1573 (- (* (- t4_x t3_x) (- s3_y t3_y)) (* (- t4_y t3_y) (- s3_x t3_x)))))
 (< ?x1573 0.0)))
(assert
 (let ((?x1577 (- (* (- t4_x t3_x) (- s1_y t3_y)) (* (- t4_y t3_y) (- s1_x t3_x)))))
 (< ?x1577 0.0)))
(assert
 (let ((?x1581 (- (* (- t4_x t3_x) (- s4_y t3_y)) (* (- t4_y t3_y) (- s4_x t3_x)))))
 (< ?x1581 0.0)))
(assert
 (let ((?x1585 (- (* (- t4_x t3_x) (- s2_y t3_y)) (* (- t4_y t3_y) (- s2_x t3_x)))))
 (< ?x1585 0.0)))
(assert
 (let ((?x1589 (- (* (- t1_x t3_x) (- a2_y t3_y)) (* (- t1_y t3_y) (- a2_x t3_x)))))
 (< ?x1589 0.0)))
(assert
 (let ((?x1593 (- (* (- t1_x t3_x) (- r1_y t3_y)) (* (- t1_y t3_y) (- r1_x t3_x)))))
 (< ?x1593 0.0)))
(assert
 (let ((?x1597 (- (* (- t1_x t3_x) (- q2_y t3_y)) (* (- t1_y t3_y) (- q2_x t3_x)))))
 (< ?x1597 0.0)))
(assert
 (let ((?x1601 (- (* (- t1_x t3_x) (- p2_y t3_y)) (* (- t1_y t3_y) (- p2_x t3_x)))))
 (< ?x1601 0.0)))
(assert
 (let ((?x1605 (- (* (- t1_x t3_x) (- p1_y t3_y)) (* (- t1_y t3_y) (- p1_x t3_x)))))
 (< ?x1605 0.0)))
(assert
 (let ((?x1609 (- (* (- t1_x t3_x) (- q1_y t3_y)) (* (- t1_y t3_y) (- q1_x t3_x)))))
 (< ?x1609 0.0)))
(assert
 (let ((?x1613 (- (* (- t1_x t3_x) (- r2_y t3_y)) (* (- t1_y t3_y) (- r2_x t3_x)))))
 (< ?x1613 0.0)))
(assert
 (let ((?x1617 (- (* (- t1_x t3_x) (- a3_y t3_y)) (* (- t1_y t3_y) (- a3_x t3_x)))))
 (< ?x1617 0.0)))
(assert
 (let ((?x1621 (- (* (- t1_x t3_x) (- s3_y t3_y)) (* (- t1_y t3_y) (- s3_x t3_x)))))
 (< ?x1621 0.0)))
(assert
 (let ((?x1625 (- (* (- t1_x t3_x) (- s1_y t3_y)) (* (- t1_y t3_y) (- s1_x t3_x)))))
 (< ?x1625 0.0)))
(assert
 (let ((?x1629 (- (* (- t1_x t3_x) (- s4_y t3_y)) (* (- t1_y t3_y) (- s4_x t3_x)))))
 (< ?x1629 0.0)))
(assert
 (let ((?x1633 (- (* (- t1_x t3_x) (- s2_y t3_y)) (* (- t1_y t3_y) (- s2_x t3_x)))))
 (< ?x1633 0.0)))
(assert
 (let ((?x1637 (- (* (- a2_x t3_x) (- r1_y t3_y)) (* (- a2_y t3_y) (- r1_x t3_x)))))
 (< ?x1637 0.0)))
(assert
 (let ((?x1641 (- (* (- a2_x t3_x) (- q2_y t3_y)) (* (- a2_y t3_y) (- q2_x t3_x)))))
 (< ?x1641 0.0)))
(assert
 (let ((?x1645 (- (* (- a2_x t3_x) (- p2_y t3_y)) (* (- a2_y t3_y) (- p2_x t3_x)))))
 (< ?x1645 0.0)))
(assert
 (let ((?x1649 (- (* (- a2_x t3_x) (- p1_y t3_y)) (* (- a2_y t3_y) (- p1_x t3_x)))))
 (< ?x1649 0.0)))
(assert
 (let ((?x1653 (- (* (- a2_x t3_x) (- q1_y t3_y)) (* (- a2_y t3_y) (- q1_x t3_x)))))
 (< ?x1653 0.0)))
(assert
 (let ((?x1657 (- (* (- a2_x t3_x) (- r2_y t3_y)) (* (- a2_y t3_y) (- r2_x t3_x)))))
 (< ?x1657 0.0)))
(assert
 (let ((?x1661 (- (* (- a2_x t3_x) (- a3_y t3_y)) (* (- a2_y t3_y) (- a3_x t3_x)))))
 (< ?x1661 0.0)))
(assert
 (let ((?x1665 (- (* (- a2_x t3_x) (- s3_y t3_y)) (* (- a2_y t3_y) (- s3_x t3_x)))))
 (< ?x1665 0.0)))
(assert
 (let ((?x1669 (- (* (- a2_x t3_x) (- s1_y t3_y)) (* (- a2_y t3_y) (- s1_x t3_x)))))
 (< ?x1669 0.0)))
(assert
 (let ((?x1673 (- (* (- a2_x t3_x) (- s4_y t3_y)) (* (- a2_y t3_y) (- s4_x t3_x)))))
 (< ?x1673 0.0)))
(assert
 (let ((?x1677 (- (* (- a2_x t3_x) (- s2_y t3_y)) (* (- a2_y t3_y) (- s2_x t3_x)))))
 (< ?x1677 0.0)))
(assert
 (let ((?x1681 (- (* (- r1_x t3_x) (- q2_y t3_y)) (* (- r1_y t3_y) (- q2_x t3_x)))))
 (< ?x1681 0.0)))
(assert
 (let ((?x1685 (- (* (- r1_x t3_x) (- p2_y t3_y)) (* (- r1_y t3_y) (- p2_x t3_x)))))
 (< ?x1685 0.0)))
(assert
 (let ((?x1689 (- (* (- r1_x t3_x) (- p1_y t3_y)) (* (- r1_y t3_y) (- p1_x t3_x)))))
 (< ?x1689 0.0)))
(assert
 (let ((?x1693 (- (* (- r1_x t3_x) (- q1_y t3_y)) (* (- r1_y t3_y) (- q1_x t3_x)))))
 (< ?x1693 0.0)))
(assert
 (let ((?x1697 (- (* (- r1_x t3_x) (- r2_y t3_y)) (* (- r1_y t3_y) (- r2_x t3_x)))))
 (< ?x1697 0.0)))
(assert
 (let ((?x1701 (- (* (- r1_x t3_x) (- a3_y t3_y)) (* (- r1_y t3_y) (- a3_x t3_x)))))
 (< ?x1701 0.0)))
(assert
 (let ((?x1705 (- (* (- r1_x t3_x) (- s3_y t3_y)) (* (- r1_y t3_y) (- s3_x t3_x)))))
 (< ?x1705 0.0)))
(assert
 (let ((?x1709 (- (* (- r1_x t3_x) (- s1_y t3_y)) (* (- r1_y t3_y) (- s1_x t3_x)))))
 (< ?x1709 0.0)))
(assert
 (let ((?x1713 (- (* (- r1_x t3_x) (- s4_y t3_y)) (* (- r1_y t3_y) (- s4_x t3_x)))))
 (< ?x1713 0.0)))
(assert
 (let ((?x1717 (- (* (- r1_x t3_x) (- s2_y t3_y)) (* (- r1_y t3_y) (- s2_x t3_x)))))
 (< ?x1717 0.0)))
(assert
 (let ((?x1721 (- (* (- q2_x t3_x) (- p2_y t3_y)) (* (- q2_y t3_y) (- p2_x t3_x)))))
 (< ?x1721 0.0)))
(assert
 (let ((?x1725 (- (* (- q2_x t3_x) (- p1_y t3_y)) (* (- q2_y t3_y) (- p1_x t3_x)))))
 (< ?x1725 0.0)))
(assert
 (let ((?x1729 (- (* (- q2_x t3_x) (- q1_y t3_y)) (* (- q2_y t3_y) (- q1_x t3_x)))))
 (< ?x1729 0.0)))
(assert
 (let ((?x1733 (- (* (- q2_x t3_x) (- r2_y t3_y)) (* (- q2_y t3_y) (- r2_x t3_x)))))
 (< ?x1733 0.0)))
(assert
 (let ((?x1737 (- (* (- q2_x t3_x) (- a3_y t3_y)) (* (- q2_y t3_y) (- a3_x t3_x)))))
 (< ?x1737 0.0)))
(assert
 (let ((?x1741 (- (* (- q2_x t3_x) (- s3_y t3_y)) (* (- q2_y t3_y) (- s3_x t3_x)))))
 (< ?x1741 0.0)))
(assert
 (let ((?x1745 (- (* (- q2_x t3_x) (- s1_y t3_y)) (* (- q2_y t3_y) (- s1_x t3_x)))))
 (< ?x1745 0.0)))
(assert
 (let ((?x1749 (- (* (- q2_x t3_x) (- s4_y t3_y)) (* (- q2_y t3_y) (- s4_x t3_x)))))
 (< ?x1749 0.0)))
(assert
 (let ((?x1753 (- (* (- q2_x t3_x) (- s2_y t3_y)) (* (- q2_y t3_y) (- s2_x t3_x)))))
 (< ?x1753 0.0)))
(assert
 (let ((?x1757 (- (* (- p2_x t3_x) (- p1_y t3_y)) (* (- p2_y t3_y) (- p1_x t3_x)))))
 (< ?x1757 0.0)))
(assert
 (let ((?x1761 (- (* (- p2_x t3_x) (- q1_y t3_y)) (* (- p2_y t3_y) (- q1_x t3_x)))))
 (< ?x1761 0.0)))
(assert
 (let ((?x1765 (- (* (- p2_x t3_x) (- r2_y t3_y)) (* (- p2_y t3_y) (- r2_x t3_x)))))
 (< ?x1765 0.0)))
(assert
 (let ((?x1769 (- (* (- p2_x t3_x) (- a3_y t3_y)) (* (- p2_y t3_y) (- a3_x t3_x)))))
 (< ?x1769 0.0)))
(assert
 (let ((?x1773 (- (* (- p2_x t3_x) (- s3_y t3_y)) (* (- p2_y t3_y) (- s3_x t3_x)))))
 (< ?x1773 0.0)))
(assert
 (let ((?x1777 (- (* (- p2_x t3_x) (- s1_y t3_y)) (* (- p2_y t3_y) (- s1_x t3_x)))))
 (< ?x1777 0.0)))
(assert
 (let ((?x1781 (- (* (- p2_x t3_x) (- s4_y t3_y)) (* (- p2_y t3_y) (- s4_x t3_x)))))
 (< ?x1781 0.0)))
(assert
 (let ((?x1785 (- (* (- p2_x t3_x) (- s2_y t3_y)) (* (- p2_y t3_y) (- s2_x t3_x)))))
 (< ?x1785 0.0)))
(assert
 (let ((?x1789 (- (* (- p1_x t3_x) (- q1_y t3_y)) (* (- p1_y t3_y) (- q1_x t3_x)))))
 (< ?x1789 0.0)))
(assert
 (let ((?x1793 (- (* (- p1_x t3_x) (- r2_y t3_y)) (* (- p1_y t3_y) (- r2_x t3_x)))))
 (< ?x1793 0.0)))
(assert
 (let ((?x1797 (- (* (- p1_x t3_x) (- a3_y t3_y)) (* (- p1_y t3_y) (- a3_x t3_x)))))
 (< ?x1797 0.0)))
(assert
 (let ((?x1801 (- (* (- p1_x t3_x) (- s3_y t3_y)) (* (- p1_y t3_y) (- s3_x t3_x)))))
 (< ?x1801 0.0)))
(assert
 (let ((?x1805 (- (* (- p1_x t3_x) (- s1_y t3_y)) (* (- p1_y t3_y) (- s1_x t3_x)))))
 (< ?x1805 0.0)))
(assert
 (let ((?x1809 (- (* (- p1_x t3_x) (- s4_y t3_y)) (* (- p1_y t3_y) (- s4_x t3_x)))))
 (< ?x1809 0.0)))
(assert
 (let ((?x1813 (- (* (- p1_x t3_x) (- s2_y t3_y)) (* (- p1_y t3_y) (- s2_x t3_x)))))
 (< ?x1813 0.0)))
(assert
 (let ((?x1817 (- (* (- q1_x t3_x) (- r2_y t3_y)) (* (- q1_y t3_y) (- r2_x t3_x)))))
 (< ?x1817 0.0)))
(assert
 (let ((?x1821 (- (* (- q1_x t3_x) (- a3_y t3_y)) (* (- q1_y t3_y) (- a3_x t3_x)))))
 (< ?x1821 0.0)))
(assert
 (let ((?x1825 (- (* (- q1_x t3_x) (- s3_y t3_y)) (* (- q1_y t3_y) (- s3_x t3_x)))))
 (< ?x1825 0.0)))
(assert
 (let ((?x1829 (- (* (- q1_x t3_x) (- s1_y t3_y)) (* (- q1_y t3_y) (- s1_x t3_x)))))
 (< ?x1829 0.0)))
(assert
 (let ((?x1833 (- (* (- q1_x t3_x) (- s4_y t3_y)) (* (- q1_y t3_y) (- s4_x t3_x)))))
 (< ?x1833 0.0)))
(assert
 (let ((?x1837 (- (* (- q1_x t3_x) (- s2_y t3_y)) (* (- q1_y t3_y) (- s2_x t3_x)))))
 (< ?x1837 0.0)))
(assert
 (let ((?x1841 (- (* (- r2_x t3_x) (- a3_y t3_y)) (* (- r2_y t3_y) (- a3_x t3_x)))))
 (< ?x1841 0.0)))
(assert
 (let ((?x1845 (- (* (- r2_x t3_x) (- s3_y t3_y)) (* (- r2_y t3_y) (- s3_x t3_x)))))
 (< ?x1845 0.0)))
(assert
 (let ((?x1849 (- (* (- r2_x t3_x) (- s1_y t3_y)) (* (- r2_y t3_y) (- s1_x t3_x)))))
 (< ?x1849 0.0)))
(assert
 (let ((?x1853 (- (* (- r2_x t3_x) (- s4_y t3_y)) (* (- r2_y t3_y) (- s4_x t3_x)))))
 (< ?x1853 0.0)))
(assert
 (let ((?x1857 (- (* (- r2_x t3_x) (- s2_y t3_y)) (* (- r2_y t3_y) (- s2_x t3_x)))))
 (< ?x1857 0.0)))
(assert
 (let ((?x1861 (- (* (- a3_x t3_x) (- s3_y t3_y)) (* (- a3_y t3_y) (- s3_x t3_x)))))
 (< ?x1861 0.0)))
(assert
 (let ((?x1865 (- (* (- a3_x t3_x) (- s1_y t3_y)) (* (- a3_y t3_y) (- s1_x t3_x)))))
 (< ?x1865 0.0)))
(assert
 (let ((?x1869 (- (* (- a3_x t3_x) (- s4_y t3_y)) (* (- a3_y t3_y) (- s4_x t3_x)))))
 (< ?x1869 0.0)))
(assert
 (let ((?x1873 (- (* (- a3_x t3_x) (- s2_y t3_y)) (* (- a3_y t3_y) (- s2_x t3_x)))))
 (< ?x1873 0.0)))
(assert
 (let ((?x1877 (- (* (- s3_x t3_x) (- s1_y t3_y)) (* (- s3_y t3_y) (- s1_x t3_x)))))
 (< ?x1877 0.0)))
(assert
 (let ((?x1881 (- (* (- s3_x t3_x) (- s4_y t3_y)) (* (- s3_y t3_y) (- s4_x t3_x)))))
 (< ?x1881 0.0)))
(assert
 (let ((?x1885 (- (* (- s3_x t3_x) (- s2_y t3_y)) (* (- s3_y t3_y) (- s2_x t3_x)))))
 (< ?x1885 0.0)))
(assert
 (let ((?x1889 (- (* (- s1_x t3_x) (- s4_y t3_y)) (* (- s1_y t3_y) (- s4_x t3_x)))))
 (< ?x1889 0.0)))
(assert
 (let ((?x1893 (- (* (- s1_x t3_x) (- s2_y t3_y)) (* (- s1_y t3_y) (- s2_x t3_x)))))
 (< ?x1893 0.0)))
(assert
 (let ((?x1897 (- (* (- s4_x t3_x) (- s2_y t3_y)) (* (- s4_y t3_y) (- s2_x t3_x)))))
 (< ?x1897 0.0)))
(assert
 (let ((?x1905 (- (* (- t4_x t2_x) (- t1_y t2_y)) (* (- t4_y t2_y) (- t1_x t2_x)))))
 (< ?x1905 0.0)))
(assert
 (let ((?x1911 (- (* (- t4_x t2_x) (- a2_y t2_y)) (* (- t4_y t2_y) (- a2_x t2_x)))))
 (< ?x1911 0.0)))
(assert
 (let ((?x1917 (- (* (- t4_x t2_x) (- r1_y t2_y)) (* (- t4_y t2_y) (- r1_x t2_x)))))
 (< ?x1917 0.0)))
(assert
 (let ((?x1921 (- (* (- t4_x t2_x) (- q2_y t2_y)) (* (- t4_y t2_y) (- q2_x t2_x)))))
 (< ?x1921 0.0)))
(assert
 (let ((?x1927 (- (* (- t4_x t2_x) (- p2_y t2_y)) (* (- t4_y t2_y) (- p2_x t2_x)))))
 (< ?x1927 0.0)))
(assert
 (let ((?x1933 (- (* (- t4_x t2_x) (- p1_y t2_y)) (* (- t4_y t2_y) (- p1_x t2_x)))))
 (< ?x1933 0.0)))
(assert
 (let ((?x1937 (- (* (- t4_x t2_x) (- q1_y t2_y)) (* (- t4_y t2_y) (- q1_x t2_x)))))
 (< ?x1937 0.0)))
(assert
 (let ((?x1943 (- (* (- t4_x t2_x) (- r2_y t2_y)) (* (- t4_y t2_y) (- r2_x t2_x)))))
 (< ?x1943 0.0)))
(assert
 (let ((?x1949 (- (* (- t4_x t2_x) (- a3_y t2_y)) (* (- t4_y t2_y) (- a3_x t2_x)))))
 (< ?x1949 0.0)))
(assert
 (let ((?x1955 (- (* (- t4_x t2_x) (- s3_y t2_y)) (* (- t4_y t2_y) (- s3_x t2_x)))))
 (< ?x1955 0.0)))
(assert
 (let ((?x1961 (- (* (- t4_x t2_x) (- s1_y t2_y)) (* (- t4_y t2_y) (- s1_x t2_x)))))
 (< ?x1961 0.0)))
(assert
 (let ((?x1967 (- (* (- t4_x t2_x) (- s4_y t2_y)) (* (- t4_y t2_y) (- s4_x t2_x)))))
 (< ?x1967 0.0)))
(assert
 (let ((?x1973 (- (* (- t4_x t2_x) (- s2_y t2_y)) (* (- t4_y t2_y) (- s2_x t2_x)))))
 (< ?x1973 0.0)))
(assert
 (let ((?x1977 (- (* (- t1_x t2_x) (- a2_y t2_y)) (* (- t1_y t2_y) (- a2_x t2_x)))))
 (< ?x1977 0.0)))
(assert
 (let ((?x1981 (- (* (- t1_x t2_x) (- r1_y t2_y)) (* (- t1_y t2_y) (- r1_x t2_x)))))
 (< ?x1981 0.0)))
(assert
 (let ((?x1985 (- (* (- t1_x t2_x) (- q2_y t2_y)) (* (- t1_y t2_y) (- q2_x t2_x)))))
 (< ?x1985 0.0)))
(assert
 (let ((?x1989 (- (* (- t1_x t2_x) (- p2_y t2_y)) (* (- t1_y t2_y) (- p2_x t2_x)))))
 (< ?x1989 0.0)))
(assert
 (let ((?x1993 (- (* (- t1_x t2_x) (- p1_y t2_y)) (* (- t1_y t2_y) (- p1_x t2_x)))))
 (< ?x1993 0.0)))
(assert
 (let ((?x1997 (- (* (- t1_x t2_x) (- q1_y t2_y)) (* (- t1_y t2_y) (- q1_x t2_x)))))
 (< ?x1997 0.0)))
(assert
 (let ((?x2001 (- (* (- t1_x t2_x) (- r2_y t2_y)) (* (- t1_y t2_y) (- r2_x t2_x)))))
 (< ?x2001 0.0)))
(assert
 (let ((?x2005 (- (* (- t1_x t2_x) (- a3_y t2_y)) (* (- t1_y t2_y) (- a3_x t2_x)))))
 (< ?x2005 0.0)))
(assert
 (let ((?x2009 (- (* (- t1_x t2_x) (- s3_y t2_y)) (* (- t1_y t2_y) (- s3_x t2_x)))))
 (< ?x2009 0.0)))
(assert
 (let ((?x2013 (- (* (- t1_x t2_x) (- s1_y t2_y)) (* (- t1_y t2_y) (- s1_x t2_x)))))
 (< ?x2013 0.0)))
(assert
 (let ((?x2017 (- (* (- t1_x t2_x) (- s4_y t2_y)) (* (- t1_y t2_y) (- s4_x t2_x)))))
 (< ?x2017 0.0)))
(assert
 (let ((?x2021 (- (* (- t1_x t2_x) (- s2_y t2_y)) (* (- t1_y t2_y) (- s2_x t2_x)))))
 (< ?x2021 0.0)))
(assert
 (let ((?x2025 (- (* (- a2_x t2_x) (- r1_y t2_y)) (* (- a2_y t2_y) (- r1_x t2_x)))))
 (< ?x2025 0.0)))
(assert
 (let ((?x2029 (- (* (- a2_x t2_x) (- q2_y t2_y)) (* (- a2_y t2_y) (- q2_x t2_x)))))
 (< ?x2029 0.0)))
(assert
 (let ((?x2033 (- (* (- a2_x t2_x) (- p2_y t2_y)) (* (- a2_y t2_y) (- p2_x t2_x)))))
 (< ?x2033 0.0)))
(assert
 (let ((?x2037 (- (* (- a2_x t2_x) (- p1_y t2_y)) (* (- a2_y t2_y) (- p1_x t2_x)))))
 (< ?x2037 0.0)))
(assert
 (let ((?x2041 (- (* (- a2_x t2_x) (- q1_y t2_y)) (* (- a2_y t2_y) (- q1_x t2_x)))))
 (< ?x2041 0.0)))
(assert
 (let ((?x2045 (- (* (- a2_x t2_x) (- r2_y t2_y)) (* (- a2_y t2_y) (- r2_x t2_x)))))
 (< ?x2045 0.0)))
(assert
 (let ((?x2049 (- (* (- a2_x t2_x) (- a3_y t2_y)) (* (- a2_y t2_y) (- a3_x t2_x)))))
 (< ?x2049 0.0)))
(assert
 (let ((?x2053 (- (* (- a2_x t2_x) (- s3_y t2_y)) (* (- a2_y t2_y) (- s3_x t2_x)))))
 (< ?x2053 0.0)))
(assert
 (let ((?x2057 (- (* (- a2_x t2_x) (- s1_y t2_y)) (* (- a2_y t2_y) (- s1_x t2_x)))))
 (< ?x2057 0.0)))
(assert
 (let ((?x2061 (- (* (- a2_x t2_x) (- s4_y t2_y)) (* (- a2_y t2_y) (- s4_x t2_x)))))
 (< ?x2061 0.0)))
(assert
 (let ((?x2065 (- (* (- a2_x t2_x) (- s2_y t2_y)) (* (- a2_y t2_y) (- s2_x t2_x)))))
 (< ?x2065 0.0)))
(assert
 (let ((?x2069 (- (* (- r1_x t2_x) (- q2_y t2_y)) (* (- r1_y t2_y) (- q2_x t2_x)))))
 (< ?x2069 0.0)))
(assert
 (let ((?x2073 (- (* (- r1_x t2_x) (- p2_y t2_y)) (* (- r1_y t2_y) (- p2_x t2_x)))))
 (< ?x2073 0.0)))
(assert
 (let ((?x2077 (- (* (- r1_x t2_x) (- p1_y t2_y)) (* (- r1_y t2_y) (- p1_x t2_x)))))
 (< ?x2077 0.0)))
(assert
 (let ((?x2081 (- (* (- r1_x t2_x) (- q1_y t2_y)) (* (- r1_y t2_y) (- q1_x t2_x)))))
 (< ?x2081 0.0)))
(assert
 (let ((?x2085 (- (* (- r1_x t2_x) (- r2_y t2_y)) (* (- r1_y t2_y) (- r2_x t2_x)))))
 (< ?x2085 0.0)))
(assert
 (let ((?x2089 (- (* (- r1_x t2_x) (- a3_y t2_y)) (* (- r1_y t2_y) (- a3_x t2_x)))))
 (< ?x2089 0.0)))
(assert
 (let ((?x2093 (- (* (- r1_x t2_x) (- s3_y t2_y)) (* (- r1_y t2_y) (- s3_x t2_x)))))
 (< ?x2093 0.0)))
(assert
 (let ((?x2097 (- (* (- r1_x t2_x) (- s1_y t2_y)) (* (- r1_y t2_y) (- s1_x t2_x)))))
 (< ?x2097 0.0)))
(assert
 (let ((?x2101 (- (* (- r1_x t2_x) (- s4_y t2_y)) (* (- r1_y t2_y) (- s4_x t2_x)))))
 (< ?x2101 0.0)))
(assert
 (let ((?x2105 (- (* (- r1_x t2_x) (- s2_y t2_y)) (* (- r1_y t2_y) (- s2_x t2_x)))))
 (< ?x2105 0.0)))
(assert
 (let ((?x2109 (- (* (- q2_x t2_x) (- p2_y t2_y)) (* (- q2_y t2_y) (- p2_x t2_x)))))
 (< ?x2109 0.0)))
(assert
 (let ((?x2113 (- (* (- q2_x t2_x) (- p1_y t2_y)) (* (- q2_y t2_y) (- p1_x t2_x)))))
 (< ?x2113 0.0)))
(assert
 (let ((?x2117 (- (* (- q2_x t2_x) (- q1_y t2_y)) (* (- q2_y t2_y) (- q1_x t2_x)))))
 (< ?x2117 0.0)))
(assert
 (let ((?x2121 (- (* (- q2_x t2_x) (- r2_y t2_y)) (* (- q2_y t2_y) (- r2_x t2_x)))))
 (< ?x2121 0.0)))
(assert
 (let ((?x2125 (- (* (- q2_x t2_x) (- a3_y t2_y)) (* (- q2_y t2_y) (- a3_x t2_x)))))
 (< ?x2125 0.0)))
(assert
 (let ((?x2129 (- (* (- q2_x t2_x) (- s3_y t2_y)) (* (- q2_y t2_y) (- s3_x t2_x)))))
 (< ?x2129 0.0)))
(assert
 (let ((?x2133 (- (* (- q2_x t2_x) (- s1_y t2_y)) (* (- q2_y t2_y) (- s1_x t2_x)))))
 (< ?x2133 0.0)))
(assert
 (let ((?x2137 (- (* (- q2_x t2_x) (- s4_y t2_y)) (* (- q2_y t2_y) (- s4_x t2_x)))))
 (< ?x2137 0.0)))
(assert
 (let ((?x2141 (- (* (- q2_x t2_x) (- s2_y t2_y)) (* (- q2_y t2_y) (- s2_x t2_x)))))
 (< ?x2141 0.0)))
(assert
 (let ((?x2145 (- (* (- p2_x t2_x) (- p1_y t2_y)) (* (- p2_y t2_y) (- p1_x t2_x)))))
 (< ?x2145 0.0)))
(assert
 (let ((?x2149 (- (* (- p2_x t2_x) (- q1_y t2_y)) (* (- p2_y t2_y) (- q1_x t2_x)))))
 (< ?x2149 0.0)))
(assert
 (let ((?x2153 (- (* (- p2_x t2_x) (- r2_y t2_y)) (* (- p2_y t2_y) (- r2_x t2_x)))))
 (< ?x2153 0.0)))
(assert
 (let ((?x2157 (- (* (- p2_x t2_x) (- a3_y t2_y)) (* (- p2_y t2_y) (- a3_x t2_x)))))
 (< ?x2157 0.0)))
(assert
 (let ((?x2161 (- (* (- p2_x t2_x) (- s3_y t2_y)) (* (- p2_y t2_y) (- s3_x t2_x)))))
 (< ?x2161 0.0)))
(assert
 (let ((?x2165 (- (* (- p2_x t2_x) (- s1_y t2_y)) (* (- p2_y t2_y) (- s1_x t2_x)))))
 (< ?x2165 0.0)))
(assert
 (let ((?x2169 (- (* (- p2_x t2_x) (- s4_y t2_y)) (* (- p2_y t2_y) (- s4_x t2_x)))))
 (< ?x2169 0.0)))
(assert
 (let ((?x2173 (- (* (- p2_x t2_x) (- s2_y t2_y)) (* (- p2_y t2_y) (- s2_x t2_x)))))
 (< ?x2173 0.0)))
(assert
 (let ((?x2177 (- (* (- p1_x t2_x) (- q1_y t2_y)) (* (- p1_y t2_y) (- q1_x t2_x)))))
 (< ?x2177 0.0)))
(assert
 (let ((?x2181 (- (* (- p1_x t2_x) (- r2_y t2_y)) (* (- p1_y t2_y) (- r2_x t2_x)))))
 (< ?x2181 0.0)))
(assert
 (let ((?x2185 (- (* (- p1_x t2_x) (- a3_y t2_y)) (* (- p1_y t2_y) (- a3_x t2_x)))))
 (< ?x2185 0.0)))
(assert
 (let ((?x2189 (- (* (- p1_x t2_x) (- s3_y t2_y)) (* (- p1_y t2_y) (- s3_x t2_x)))))
 (< ?x2189 0.0)))
(assert
 (let ((?x2193 (- (* (- p1_x t2_x) (- s1_y t2_y)) (* (- p1_y t2_y) (- s1_x t2_x)))))
 (< ?x2193 0.0)))
(assert
 (let ((?x2197 (- (* (- p1_x t2_x) (- s4_y t2_y)) (* (- p1_y t2_y) (- s4_x t2_x)))))
 (< ?x2197 0.0)))
(assert
 (let ((?x2201 (- (* (- p1_x t2_x) (- s2_y t2_y)) (* (- p1_y t2_y) (- s2_x t2_x)))))
 (< ?x2201 0.0)))
(assert
 (let ((?x2205 (- (* (- q1_x t2_x) (- r2_y t2_y)) (* (- q1_y t2_y) (- r2_x t2_x)))))
 (< ?x2205 0.0)))
(assert
 (let ((?x2209 (- (* (- q1_x t2_x) (- a3_y t2_y)) (* (- q1_y t2_y) (- a3_x t2_x)))))
 (< ?x2209 0.0)))
(assert
 (let ((?x2213 (- (* (- q1_x t2_x) (- s3_y t2_y)) (* (- q1_y t2_y) (- s3_x t2_x)))))
 (< ?x2213 0.0)))
(assert
 (let ((?x2217 (- (* (- q1_x t2_x) (- s1_y t2_y)) (* (- q1_y t2_y) (- s1_x t2_x)))))
 (< ?x2217 0.0)))
(assert
 (let ((?x2221 (- (* (- q1_x t2_x) (- s4_y t2_y)) (* (- q1_y t2_y) (- s4_x t2_x)))))
 (< ?x2221 0.0)))
(assert
 (let ((?x2225 (- (* (- q1_x t2_x) (- s2_y t2_y)) (* (- q1_y t2_y) (- s2_x t2_x)))))
 (< ?x2225 0.0)))
(assert
 (let ((?x2229 (- (* (- r2_x t2_x) (- a3_y t2_y)) (* (- r2_y t2_y) (- a3_x t2_x)))))
 (< ?x2229 0.0)))
(assert
 (let ((?x2233 (- (* (- r2_x t2_x) (- s3_y t2_y)) (* (- r2_y t2_y) (- s3_x t2_x)))))
 (< ?x2233 0.0)))
(assert
 (let ((?x2237 (- (* (- r2_x t2_x) (- s1_y t2_y)) (* (- r2_y t2_y) (- s1_x t2_x)))))
 (< ?x2237 0.0)))
(assert
 (let ((?x2241 (- (* (- r2_x t2_x) (- s4_y t2_y)) (* (- r2_y t2_y) (- s4_x t2_x)))))
 (< ?x2241 0.0)))
(assert
 (let ((?x2245 (- (* (- r2_x t2_x) (- s2_y t2_y)) (* (- r2_y t2_y) (- s2_x t2_x)))))
 (< ?x2245 0.0)))
(assert
 (let ((?x2249 (- (* (- a3_x t2_x) (- s3_y t2_y)) (* (- a3_y t2_y) (- s3_x t2_x)))))
 (< ?x2249 0.0)))
(assert
 (let ((?x2253 (- (* (- a3_x t2_x) (- s1_y t2_y)) (* (- a3_y t2_y) (- s1_x t2_x)))))
 (< ?x2253 0.0)))
(assert
 (let ((?x2257 (- (* (- a3_x t2_x) (- s4_y t2_y)) (* (- a3_y t2_y) (- s4_x t2_x)))))
 (< ?x2257 0.0)))
(assert
 (let ((?x2261 (- (* (- a3_x t2_x) (- s2_y t2_y)) (* (- a3_y t2_y) (- s2_x t2_x)))))
 (< ?x2261 0.0)))
(assert
 (let ((?x2265 (- (* (- s3_x t2_x) (- s1_y t2_y)) (* (- s3_y t2_y) (- s1_x t2_x)))))
 (< ?x2265 0.0)))
(assert
 (let ((?x2269 (- (* (- s3_x t2_x) (- s4_y t2_y)) (* (- s3_y t2_y) (- s4_x t2_x)))))
 (< ?x2269 0.0)))
(assert
 (let ((?x2273 (- (* (- s3_x t2_x) (- s2_y t2_y)) (* (- s3_y t2_y) (- s2_x t2_x)))))
 (< ?x2273 0.0)))
(assert
 (let ((?x2277 (- (* (- s1_x t2_x) (- s4_y t2_y)) (* (- s1_y t2_y) (- s4_x t2_x)))))
 (< ?x2277 0.0)))
(assert
 (let ((?x2281 (- (* (- s1_x t2_x) (- s2_y t2_y)) (* (- s1_y t2_y) (- s2_x t2_x)))))
 (< ?x2281 0.0)))
(assert
 (let ((?x2285 (- (* (- s4_x t2_x) (- s2_y t2_y)) (* (- s4_y t2_y) (- s2_x t2_x)))))
 (< ?x2285 0.0)))
(assert
 (let ((?x2293 (- (* (- t1_x t4_x) (- a2_y t4_y)) (* (- t1_y t4_y) (- a2_x t4_x)))))
 (< ?x2293 0.0)))
(assert
 (let ((?x2299 (- (* (- t1_x t4_x) (- r1_y t4_y)) (* (- t1_y t4_y) (- r1_x t4_x)))))
 (< ?x2299 0.0)))
(assert
 (let ((?x2305 (- (* (- t1_x t4_x) (- q2_y t4_y)) (* (- t1_y t4_y) (- q2_x t4_x)))))
 (< ?x2305 0.0)))
(assert
 (let ((?x2311 (- (* (- t1_x t4_x) (- p2_y t4_y)) (* (- t1_y t4_y) (- p2_x t4_x)))))
 (< ?x2311 0.0)))
(assert
 (let ((?x2317 (- (* (- t1_x t4_x) (- p1_y t4_y)) (* (- t1_y t4_y) (- p1_x t4_x)))))
 (< ?x2317 0.0)))
(assert
 (let ((?x2323 (- (* (- t1_x t4_x) (- q1_y t4_y)) (* (- t1_y t4_y) (- q1_x t4_x)))))
 (< ?x2323 0.0)))
(assert
 (let ((?x2329 (- (* (- t1_x t4_x) (- r2_y t4_y)) (* (- t1_y t4_y) (- r2_x t4_x)))))
 (< ?x2329 0.0)))
(assert
 (let ((?x2333 (- (* (- t1_x t4_x) (- a3_y t4_y)) (* (- t1_y t4_y) (- a3_x t4_x)))))
 (< ?x2333 0.0)))
(assert
 (let ((?x2339 (- (* (- t1_x t4_x) (- s3_y t4_y)) (* (- t1_y t4_y) (- s3_x t4_x)))))
 (< ?x2339 0.0)))
(assert
 (let ((?x2345 (- (* (- t1_x t4_x) (- s1_y t4_y)) (* (- t1_y t4_y) (- s1_x t4_x)))))
 (< ?x2345 0.0)))
(assert
 (let ((?x2351 (- (* (- t1_x t4_x) (- s4_y t4_y)) (* (- t1_y t4_y) (- s4_x t4_x)))))
 (< ?x2351 0.0)))
(assert
 (let ((?x2357 (- (* (- t1_x t4_x) (- s2_y t4_y)) (* (- t1_y t4_y) (- s2_x t4_x)))))
 (< ?x2357 0.0)))
(assert
 (let ((?x2361 (- (* (- a2_x t4_x) (- r1_y t4_y)) (* (- a2_y t4_y) (- r1_x t4_x)))))
 (< ?x2361 0.0)))
(assert
 (let ((?x2365 (- (* (- a2_x t4_x) (- q2_y t4_y)) (* (- a2_y t4_y) (- q2_x t4_x)))))
 (< ?x2365 0.0)))
(assert
 (let ((?x2369 (- (* (- a2_x t4_x) (- p2_y t4_y)) (* (- a2_y t4_y) (- p2_x t4_x)))))
 (< ?x2369 0.0)))
(assert
 (let ((?x2373 (- (* (- a2_x t4_x) (- p1_y t4_y)) (* (- a2_y t4_y) (- p1_x t4_x)))))
 (< ?x2373 0.0)))
(assert
 (let ((?x2377 (- (* (- a2_x t4_x) (- q1_y t4_y)) (* (- a2_y t4_y) (- q1_x t4_x)))))
 (< ?x2377 0.0)))
(assert
 (let ((?x2381 (- (* (- a2_x t4_x) (- r2_y t4_y)) (* (- a2_y t4_y) (- r2_x t4_x)))))
 (< ?x2381 0.0)))
(assert
 (let ((?x2385 (- (* (- a2_x t4_x) (- a3_y t4_y)) (* (- a2_y t4_y) (- a3_x t4_x)))))
 (< ?x2385 0.0)))
(assert
 (let ((?x2389 (- (* (- a2_x t4_x) (- s3_y t4_y)) (* (- a2_y t4_y) (- s3_x t4_x)))))
 (< ?x2389 0.0)))
(assert
 (let ((?x2393 (- (* (- a2_x t4_x) (- s1_y t4_y)) (* (- a2_y t4_y) (- s1_x t4_x)))))
 (< ?x2393 0.0)))
(assert
 (let ((?x2397 (- (* (- a2_x t4_x) (- s4_y t4_y)) (* (- a2_y t4_y) (- s4_x t4_x)))))
 (< ?x2397 0.0)))
(assert
 (let ((?x2401 (- (* (- a2_x t4_x) (- s2_y t4_y)) (* (- a2_y t4_y) (- s2_x t4_x)))))
 (< ?x2401 0.0)))
(assert
 (let ((?x2405 (- (* (- r1_x t4_x) (- q2_y t4_y)) (* (- r1_y t4_y) (- q2_x t4_x)))))
 (< ?x2405 0.0)))
(assert
 (let ((?x2409 (- (* (- r1_x t4_x) (- p2_y t4_y)) (* (- r1_y t4_y) (- p2_x t4_x)))))
 (< ?x2409 0.0)))
(assert
 (let ((?x2413 (- (* (- r1_x t4_x) (- p1_y t4_y)) (* (- r1_y t4_y) (- p1_x t4_x)))))
 (< ?x2413 0.0)))
(assert
 (let ((?x2417 (- (* (- r1_x t4_x) (- q1_y t4_y)) (* (- r1_y t4_y) (- q1_x t4_x)))))
 (< ?x2417 0.0)))
(assert
 (let ((?x2421 (- (* (- r1_x t4_x) (- r2_y t4_y)) (* (- r1_y t4_y) (- r2_x t4_x)))))
 (< ?x2421 0.0)))
(assert
 (let ((?x2425 (- (* (- r1_x t4_x) (- a3_y t4_y)) (* (- r1_y t4_y) (- a3_x t4_x)))))
 (< ?x2425 0.0)))
(assert
 (let ((?x2429 (- (* (- r1_x t4_x) (- s3_y t4_y)) (* (- r1_y t4_y) (- s3_x t4_x)))))
 (< ?x2429 0.0)))
(assert
 (let ((?x2433 (- (* (- r1_x t4_x) (- s1_y t4_y)) (* (- r1_y t4_y) (- s1_x t4_x)))))
 (< ?x2433 0.0)))
(assert
 (let ((?x2437 (- (* (- r1_x t4_x) (- s4_y t4_y)) (* (- r1_y t4_y) (- s4_x t4_x)))))
 (< ?x2437 0.0)))
(assert
 (let ((?x2441 (- (* (- r1_x t4_x) (- s2_y t4_y)) (* (- r1_y t4_y) (- s2_x t4_x)))))
 (< ?x2441 0.0)))
(assert
 (let ((?x2445 (- (* (- q2_x t4_x) (- p2_y t4_y)) (* (- q2_y t4_y) (- p2_x t4_x)))))
 (< ?x2445 0.0)))
(assert
 (let ((?x2449 (- (* (- q2_x t4_x) (- p1_y t4_y)) (* (- q2_y t4_y) (- p1_x t4_x)))))
 (< ?x2449 0.0)))
(assert
 (let ((?x2453 (- (* (- q2_x t4_x) (- q1_y t4_y)) (* (- q2_y t4_y) (- q1_x t4_x)))))
 (< ?x2453 0.0)))
(assert
 (let ((?x2457 (- (* (- q2_x t4_x) (- r2_y t4_y)) (* (- q2_y t4_y) (- r2_x t4_x)))))
 (< ?x2457 0.0)))
(assert
 (let ((?x2461 (- (* (- q2_x t4_x) (- a3_y t4_y)) (* (- q2_y t4_y) (- a3_x t4_x)))))
 (< ?x2461 0.0)))
(assert
 (let ((?x2465 (- (* (- q2_x t4_x) (- s3_y t4_y)) (* (- q2_y t4_y) (- s3_x t4_x)))))
 (< ?x2465 0.0)))
(assert
 (let ((?x2469 (- (* (- q2_x t4_x) (- s1_y t4_y)) (* (- q2_y t4_y) (- s1_x t4_x)))))
 (< ?x2469 0.0)))
(assert
 (let ((?x2473 (- (* (- q2_x t4_x) (- s4_y t4_y)) (* (- q2_y t4_y) (- s4_x t4_x)))))
 (< ?x2473 0.0)))
(assert
 (let ((?x2477 (- (* (- q2_x t4_x) (- s2_y t4_y)) (* (- q2_y t4_y) (- s2_x t4_x)))))
 (< ?x2477 0.0)))
(assert
 (let ((?x2481 (- (* (- p2_x t4_x) (- p1_y t4_y)) (* (- p2_y t4_y) (- p1_x t4_x)))))
 (< ?x2481 0.0)))
(assert
 (let ((?x2485 (- (* (- p2_x t4_x) (- q1_y t4_y)) (* (- p2_y t4_y) (- q1_x t4_x)))))
 (< ?x2485 0.0)))
(assert
 (let ((?x2489 (- (* (- p2_x t4_x) (- r2_y t4_y)) (* (- p2_y t4_y) (- r2_x t4_x)))))
 (< ?x2489 0.0)))
(assert
 (let ((?x2493 (- (* (- p2_x t4_x) (- a3_y t4_y)) (* (- p2_y t4_y) (- a3_x t4_x)))))
 (< ?x2493 0.0)))
(assert
 (let ((?x2497 (- (* (- p2_x t4_x) (- s3_y t4_y)) (* (- p2_y t4_y) (- s3_x t4_x)))))
 (< ?x2497 0.0)))
(assert
 (let ((?x2501 (- (* (- p2_x t4_x) (- s1_y t4_y)) (* (- p2_y t4_y) (- s1_x t4_x)))))
 (< ?x2501 0.0)))
(assert
 (let ((?x2505 (- (* (- p2_x t4_x) (- s4_y t4_y)) (* (- p2_y t4_y) (- s4_x t4_x)))))
 (< ?x2505 0.0)))
(assert
 (let ((?x2509 (- (* (- p2_x t4_x) (- s2_y t4_y)) (* (- p2_y t4_y) (- s2_x t4_x)))))
 (< ?x2509 0.0)))
(assert
 (let ((?x2513 (- (* (- p1_x t4_x) (- q1_y t4_y)) (* (- p1_y t4_y) (- q1_x t4_x)))))
 (< ?x2513 0.0)))
(assert
 (let ((?x2517 (- (* (- p1_x t4_x) (- r2_y t4_y)) (* (- p1_y t4_y) (- r2_x t4_x)))))
 (< ?x2517 0.0)))
(assert
 (let ((?x2521 (- (* (- p1_x t4_x) (- a3_y t4_y)) (* (- p1_y t4_y) (- a3_x t4_x)))))
 (< ?x2521 0.0)))
(assert
 (let ((?x2525 (- (* (- p1_x t4_x) (- s3_y t4_y)) (* (- p1_y t4_y) (- s3_x t4_x)))))
 (< ?x2525 0.0)))
(assert
 (let ((?x2529 (- (* (- p1_x t4_x) (- s1_y t4_y)) (* (- p1_y t4_y) (- s1_x t4_x)))))
 (< ?x2529 0.0)))
(assert
 (let ((?x2533 (- (* (- p1_x t4_x) (- s4_y t4_y)) (* (- p1_y t4_y) (- s4_x t4_x)))))
 (< ?x2533 0.0)))
(assert
 (let ((?x2537 (- (* (- p1_x t4_x) (- s2_y t4_y)) (* (- p1_y t4_y) (- s2_x t4_x)))))
 (< ?x2537 0.0)))
(assert
 (let ((?x2541 (- (* (- q1_x t4_x) (- r2_y t4_y)) (* (- q1_y t4_y) (- r2_x t4_x)))))
 (< ?x2541 0.0)))
(assert
 (let ((?x2545 (- (* (- q1_x t4_x) (- a3_y t4_y)) (* (- q1_y t4_y) (- a3_x t4_x)))))
 (< ?x2545 0.0)))
(assert
 (let ((?x2549 (- (* (- q1_x t4_x) (- s3_y t4_y)) (* (- q1_y t4_y) (- s3_x t4_x)))))
 (< ?x2549 0.0)))
(assert
 (let ((?x2553 (- (* (- q1_x t4_x) (- s1_y t4_y)) (* (- q1_y t4_y) (- s1_x t4_x)))))
 (< ?x2553 0.0)))
(assert
 (let ((?x2557 (- (* (- q1_x t4_x) (- s4_y t4_y)) (* (- q1_y t4_y) (- s4_x t4_x)))))
 (< ?x2557 0.0)))
(assert
 (let ((?x2561 (- (* (- q1_x t4_x) (- s2_y t4_y)) (* (- q1_y t4_y) (- s2_x t4_x)))))
 (< ?x2561 0.0)))
(assert
 (let ((?x2565 (- (* (- r2_x t4_x) (- a3_y t4_y)) (* (- r2_y t4_y) (- a3_x t4_x)))))
 (< ?x2565 0.0)))
(assert
 (let ((?x2569 (- (* (- r2_x t4_x) (- s3_y t4_y)) (* (- r2_y t4_y) (- s3_x t4_x)))))
 (< ?x2569 0.0)))
(assert
 (let ((?x2573 (- (* (- r2_x t4_x) (- s1_y t4_y)) (* (- r2_y t4_y) (- s1_x t4_x)))))
 (< ?x2573 0.0)))
(assert
 (let ((?x2577 (- (* (- r2_x t4_x) (- s4_y t4_y)) (* (- r2_y t4_y) (- s4_x t4_x)))))
 (< ?x2577 0.0)))
(assert
 (let ((?x2581 (- (* (- r2_x t4_x) (- s2_y t4_y)) (* (- r2_y t4_y) (- s2_x t4_x)))))
 (< ?x2581 0.0)))
(assert
 (let ((?x2585 (- (* (- a3_x t4_x) (- s3_y t4_y)) (* (- a3_y t4_y) (- s3_x t4_x)))))
 (< ?x2585 0.0)))
(assert
 (let ((?x2589 (- (* (- a3_x t4_x) (- s1_y t4_y)) (* (- a3_y t4_y) (- s1_x t4_x)))))
 (< ?x2589 0.0)))
(assert
 (let ((?x2593 (- (* (- a3_x t4_x) (- s4_y t4_y)) (* (- a3_y t4_y) (- s4_x t4_x)))))
 (< ?x2593 0.0)))
(assert
 (let ((?x2597 (- (* (- a3_x t4_x) (- s2_y t4_y)) (* (- a3_y t4_y) (- s2_x t4_x)))))
 (< ?x2597 0.0)))
(assert
 (let ((?x2601 (- (* (- s3_x t4_x) (- s1_y t4_y)) (* (- s3_y t4_y) (- s1_x t4_x)))))
 (< ?x2601 0.0)))
(assert
 (let ((?x2605 (- (* (- s3_x t4_x) (- s4_y t4_y)) (* (- s3_y t4_y) (- s4_x t4_x)))))
 (< ?x2605 0.0)))
(assert
 (let ((?x2609 (- (* (- s3_x t4_x) (- s2_y t4_y)) (* (- s3_y t4_y) (- s2_x t4_x)))))
 (< ?x2609 0.0)))
(assert
 (let ((?x2613 (- (* (- s1_x t4_x) (- s4_y t4_y)) (* (- s1_y t4_y) (- s4_x t4_x)))))
 (< ?x2613 0.0)))
(assert
 (let ((?x2617 (- (* (- s1_x t4_x) (- s2_y t4_y)) (* (- s1_y t4_y) (- s2_x t4_x)))))
 (< ?x2617 0.0)))
(assert
 (let ((?x2621 (- (* (- s4_x t4_x) (- s2_y t4_y)) (* (- s4_y t4_y) (- s2_x t4_x)))))
 (< ?x2621 0.0)))
(assert
 (let ((?x2629 (- (* (- a2_x t1_x) (- r1_y t1_y)) (* (- a2_y t1_y) (- r1_x t1_x)))))
 (< ?x2629 0.0)))
(assert
 (let ((?x2635 (- (* (- a2_x t1_x) (- q2_y t1_y)) (* (- a2_y t1_y) (- q2_x t1_x)))))
 (< ?x2635 0.0)))
(assert
 (let ((?x2639 (- (* (- a2_x t1_x) (- p2_y t1_y)) (* (- a2_y t1_y) (- p2_x t1_x)))))
 (< ?x2639 0.0)))
(assert
 (let ((?x2645 (- (* (- a2_x t1_x) (- p1_y t1_y)) (* (- a2_y t1_y) (- p1_x t1_x)))))
 (< ?x2645 0.0)))
(assert
 (let ((?x2651 (- (* (- a2_x t1_x) (- q1_y t1_y)) (* (- a2_y t1_y) (- q1_x t1_x)))))
 (< ?x2651 0.0)))
(assert
 (let ((?x2657 (- (* (- a2_x t1_x) (- r2_y t1_y)) (* (- a2_y t1_y) (- r2_x t1_x)))))
 (< ?x2657 0.0)))
(assert
 (let ((?x2663 (- (* (- a2_x t1_x) (- a3_y t1_y)) (* (- a2_y t1_y) (- a3_x t1_x)))))
 (< ?x2663 0.0)))
(assert
 (let ((?x2669 (- (* (- a2_x t1_x) (- s3_y t1_y)) (* (- a2_y t1_y) (- s3_x t1_x)))))
 (< ?x2669 0.0)))
(assert
 (let ((?x2675 (- (* (- a2_x t1_x) (- s1_y t1_y)) (* (- a2_y t1_y) (- s1_x t1_x)))))
 (< ?x2675 0.0)))
(assert
 (let ((?x2681 (- (* (- a2_x t1_x) (- s4_y t1_y)) (* (- a2_y t1_y) (- s4_x t1_x)))))
 (< ?x2681 0.0)))
(assert
 (let ((?x2687 (- (* (- a2_x t1_x) (- s2_y t1_y)) (* (- a2_y t1_y) (- s2_x t1_x)))))
 (< ?x2687 0.0)))
(assert
 (let ((?x2691 (- (* (- r1_x t1_x) (- q2_y t1_y)) (* (- r1_y t1_y) (- q2_x t1_x)))))
 (< ?x2691 0.0)))
(assert
 (let ((?x2695 (- (* (- r1_x t1_x) (- p2_y t1_y)) (* (- r1_y t1_y) (- p2_x t1_x)))))
 (< ?x2695 0.0)))
(assert
 (let ((?x2699 (- (* (- r1_x t1_x) (- p1_y t1_y)) (* (- r1_y t1_y) (- p1_x t1_x)))))
 (< ?x2699 0.0)))
(assert
 (let ((?x2703 (- (* (- r1_x t1_x) (- q1_y t1_y)) (* (- r1_y t1_y) (- q1_x t1_x)))))
 (< ?x2703 0.0)))
(assert
 (let ((?x2707 (- (* (- r1_x t1_x) (- r2_y t1_y)) (* (- r1_y t1_y) (- r2_x t1_x)))))
 (< ?x2707 0.0)))
(assert
 (let ((?x2711 (- (* (- r1_x t1_x) (- a3_y t1_y)) (* (- r1_y t1_y) (- a3_x t1_x)))))
 (< ?x2711 0.0)))
(assert
 (let ((?x2715 (- (* (- r1_x t1_x) (- s3_y t1_y)) (* (- r1_y t1_y) (- s3_x t1_x)))))
 (< ?x2715 0.0)))
(assert
 (let ((?x2719 (- (* (- r1_x t1_x) (- s1_y t1_y)) (* (- r1_y t1_y) (- s1_x t1_x)))))
 (< ?x2719 0.0)))
(assert
 (let ((?x2723 (- (* (- r1_x t1_x) (- s4_y t1_y)) (* (- r1_y t1_y) (- s4_x t1_x)))))
 (< ?x2723 0.0)))
(assert
 (let ((?x2727 (- (* (- r1_x t1_x) (- s2_y t1_y)) (* (- r1_y t1_y) (- s2_x t1_x)))))
 (< ?x2727 0.0)))
(assert
 (let ((?x2731 (- (* (- q2_x t1_x) (- p2_y t1_y)) (* (- q2_y t1_y) (- p2_x t1_x)))))
 (< ?x2731 0.0)))
(assert
 (let ((?x2735 (- (* (- q2_x t1_x) (- p1_y t1_y)) (* (- q2_y t1_y) (- p1_x t1_x)))))
 (< ?x2735 0.0)))
(assert
 (let ((?x2739 (- (* (- q2_x t1_x) (- q1_y t1_y)) (* (- q2_y t1_y) (- q1_x t1_x)))))
 (< ?x2739 0.0)))
(assert
 (let ((?x2743 (- (* (- q2_x t1_x) (- r2_y t1_y)) (* (- q2_y t1_y) (- r2_x t1_x)))))
 (< ?x2743 0.0)))
(assert
 (let ((?x2747 (- (* (- q2_x t1_x) (- a3_y t1_y)) (* (- q2_y t1_y) (- a3_x t1_x)))))
 (< ?x2747 0.0)))
(assert
 (let ((?x2751 (- (* (- q2_x t1_x) (- s3_y t1_y)) (* (- q2_y t1_y) (- s3_x t1_x)))))
 (< ?x2751 0.0)))
(assert
 (let ((?x2755 (- (* (- q2_x t1_x) (- s1_y t1_y)) (* (- q2_y t1_y) (- s1_x t1_x)))))
 (< ?x2755 0.0)))
(assert
 (let ((?x2759 (- (* (- q2_x t1_x) (- s4_y t1_y)) (* (- q2_y t1_y) (- s4_x t1_x)))))
 (< ?x2759 0.0)))
(assert
 (let ((?x2763 (- (* (- q2_x t1_x) (- s2_y t1_y)) (* (- q2_y t1_y) (- s2_x t1_x)))))
 (< ?x2763 0.0)))
(assert
 (let ((?x2767 (- (* (- p2_x t1_x) (- p1_y t1_y)) (* (- p2_y t1_y) (- p1_x t1_x)))))
 (< ?x2767 0.0)))
(assert
 (let ((?x2771 (- (* (- p2_x t1_x) (- q1_y t1_y)) (* (- p2_y t1_y) (- q1_x t1_x)))))
 (< ?x2771 0.0)))
(assert
 (let ((?x2775 (- (* (- p2_x t1_x) (- r2_y t1_y)) (* (- p2_y t1_y) (- r2_x t1_x)))))
 (< ?x2775 0.0)))
(assert
 (let ((?x2779 (- (* (- p2_x t1_x) (- a3_y t1_y)) (* (- p2_y t1_y) (- a3_x t1_x)))))
 (< ?x2779 0.0)))
(assert
 (let ((?x2783 (- (* (- p2_x t1_x) (- s3_y t1_y)) (* (- p2_y t1_y) (- s3_x t1_x)))))
 (< ?x2783 0.0)))
(assert
 (let ((?x2787 (- (* (- p2_x t1_x) (- s1_y t1_y)) (* (- p2_y t1_y) (- s1_x t1_x)))))
 (< ?x2787 0.0)))
(assert
 (let ((?x2791 (- (* (- p2_x t1_x) (- s4_y t1_y)) (* (- p2_y t1_y) (- s4_x t1_x)))))
 (< ?x2791 0.0)))
(assert
 (let ((?x2795 (- (* (- p2_x t1_x) (- s2_y t1_y)) (* (- p2_y t1_y) (- s2_x t1_x)))))
 (< ?x2795 0.0)))
(assert
 (let ((?x2799 (- (* (- p1_x t1_x) (- q1_y t1_y)) (* (- p1_y t1_y) (- q1_x t1_x)))))
 (< ?x2799 0.0)))
(assert
 (let ((?x2803 (- (* (- p1_x t1_x) (- r2_y t1_y)) (* (- p1_y t1_y) (- r2_x t1_x)))))
 (< ?x2803 0.0)))
(assert
 (let ((?x2807 (- (* (- p1_x t1_x) (- a3_y t1_y)) (* (- p1_y t1_y) (- a3_x t1_x)))))
 (< ?x2807 0.0)))
(assert
 (let ((?x2811 (- (* (- p1_x t1_x) (- s3_y t1_y)) (* (- p1_y t1_y) (- s3_x t1_x)))))
 (< ?x2811 0.0)))
(assert
 (let ((?x2815 (- (* (- p1_x t1_x) (- s1_y t1_y)) (* (- p1_y t1_y) (- s1_x t1_x)))))
 (< ?x2815 0.0)))
(assert
 (let ((?x2819 (- (* (- p1_x t1_x) (- s4_y t1_y)) (* (- p1_y t1_y) (- s4_x t1_x)))))
 (< ?x2819 0.0)))
(assert
 (let ((?x2823 (- (* (- p1_x t1_x) (- s2_y t1_y)) (* (- p1_y t1_y) (- s2_x t1_x)))))
 (< ?x2823 0.0)))
(assert
 (let ((?x2827 (- (* (- q1_x t1_x) (- r2_y t1_y)) (* (- q1_y t1_y) (- r2_x t1_x)))))
 (< ?x2827 0.0)))
(assert
 (let ((?x2831 (- (* (- q1_x t1_x) (- a3_y t1_y)) (* (- q1_y t1_y) (- a3_x t1_x)))))
 (< ?x2831 0.0)))
(assert
 (let ((?x2835 (- (* (- q1_x t1_x) (- s3_y t1_y)) (* (- q1_y t1_y) (- s3_x t1_x)))))
 (< ?x2835 0.0)))
(assert
 (let ((?x2839 (- (* (- q1_x t1_x) (- s1_y t1_y)) (* (- q1_y t1_y) (- s1_x t1_x)))))
 (< ?x2839 0.0)))
(assert
 (let ((?x2843 (- (* (- q1_x t1_x) (- s4_y t1_y)) (* (- q1_y t1_y) (- s4_x t1_x)))))
 (< ?x2843 0.0)))
(assert
 (let ((?x2847 (- (* (- q1_x t1_x) (- s2_y t1_y)) (* (- q1_y t1_y) (- s2_x t1_x)))))
 (< ?x2847 0.0)))
(assert
 (let ((?x2851 (- (* (- r2_x t1_x) (- a3_y t1_y)) (* (- r2_y t1_y) (- a3_x t1_x)))))
 (< ?x2851 0.0)))
(assert
 (let ((?x2855 (- (* (- r2_x t1_x) (- s3_y t1_y)) (* (- r2_y t1_y) (- s3_x t1_x)))))
 (< ?x2855 0.0)))
(assert
 (let ((?x2859 (- (* (- r2_x t1_x) (- s1_y t1_y)) (* (- r2_y t1_y) (- s1_x t1_x)))))
 (< ?x2859 0.0)))
(assert
 (let ((?x2863 (- (* (- r2_x t1_x) (- s4_y t1_y)) (* (- r2_y t1_y) (- s4_x t1_x)))))
 (< ?x2863 0.0)))
(assert
 (let ((?x2867 (- (* (- r2_x t1_x) (- s2_y t1_y)) (* (- r2_y t1_y) (- s2_x t1_x)))))
 (< ?x2867 0.0)))
(assert
 (let ((?x2871 (- (* (- a3_x t1_x) (- s3_y t1_y)) (* (- a3_y t1_y) (- s3_x t1_x)))))
 (< ?x2871 0.0)))
(assert
 (let ((?x2875 (- (* (- a3_x t1_x) (- s1_y t1_y)) (* (- a3_y t1_y) (- s1_x t1_x)))))
 (< ?x2875 0.0)))
(assert
 (let ((?x2879 (- (* (- a3_x t1_x) (- s4_y t1_y)) (* (- a3_y t1_y) (- s4_x t1_x)))))
 (< ?x2879 0.0)))
(assert
 (let ((?x2883 (- (* (- a3_x t1_x) (- s2_y t1_y)) (* (- a3_y t1_y) (- s2_x t1_x)))))
 (< ?x2883 0.0)))
(assert
 (let ((?x2887 (- (* (- s3_x t1_x) (- s1_y t1_y)) (* (- s3_y t1_y) (- s1_x t1_x)))))
 (< ?x2887 0.0)))
(assert
 (let ((?x2891 (- (* (- s3_x t1_x) (- s4_y t1_y)) (* (- s3_y t1_y) (- s4_x t1_x)))))
 (< ?x2891 0.0)))
(assert
 (let ((?x2895 (- (* (- s3_x t1_x) (- s2_y t1_y)) (* (- s3_y t1_y) (- s2_x t1_x)))))
 (< ?x2895 0.0)))
(assert
 (let ((?x2899 (- (* (- s1_x t1_x) (- s4_y t1_y)) (* (- s1_y t1_y) (- s4_x t1_x)))))
 (< ?x2899 0.0)))
(assert
 (let ((?x2903 (- (* (- s1_x t1_x) (- s2_y t1_y)) (* (- s1_y t1_y) (- s2_x t1_x)))))
 (< ?x2903 0.0)))
(assert
 (let ((?x2907 (- (* (- s4_x t1_x) (- s2_y t1_y)) (* (- s4_y t1_y) (- s2_x t1_x)))))
 (< ?x2907 0.0)))
(assert
 (let ((?x2915 (- (* (- r1_x a2_x) (- q2_y a2_y)) (* (- r1_y a2_y) (- q2_x a2_x)))))
 (< ?x2915 0.0)))
(assert
 (let ((?x2921 (- (* (- r1_x a2_x) (- p2_y a2_y)) (* (- r1_y a2_y) (- p2_x a2_x)))))
 (< ?x2921 0.0)))
(assert
 (let ((?x2927 (- (* (- r1_x a2_x) (- p1_y a2_y)) (* (- r1_y a2_y) (- p1_x a2_x)))))
 (< ?x2927 0.0)))
(assert
 (let ((?x2933 (- (* (- r1_x a2_x) (- q1_y a2_y)) (* (- r1_y a2_y) (- q1_x a2_x)))))
 (< ?x2933 0.0)))
(assert
 (let ((?x2939 (- (* (- r1_x a2_x) (- r2_y a2_y)) (* (- r1_y a2_y) (- r2_x a2_x)))))
 (< ?x2939 0.0)))
(assert
 (let ((?x2945 (- (* (- r1_x a2_x) (- a3_y a2_y)) (* (- r1_y a2_y) (- a3_x a2_x)))))
 (< ?x2945 0.0)))
(assert
 (let ((?x2951 (- (* (- r1_x a2_x) (- s3_y a2_y)) (* (- r1_y a2_y) (- s3_x a2_x)))))
 (< ?x2951 0.0)))
(assert
 (let ((?x2957 (- (* (- r1_x a2_x) (- s1_y a2_y)) (* (- r1_y a2_y) (- s1_x a2_x)))))
 (< ?x2957 0.0)))
(assert
 (let ((?x2963 (- (* (- r1_x a2_x) (- s4_y a2_y)) (* (- r1_y a2_y) (- s4_x a2_x)))))
 (< ?x2963 0.0)))
(assert
 (let ((?x2969 (- (* (- r1_x a2_x) (- s2_y a2_y)) (* (- r1_y a2_y) (- s2_x a2_x)))))
 (< ?x2969 0.0)))
(assert
 (let ((?x2973 (- (* (- q2_x a2_x) (- p2_y a2_y)) (* (- q2_y a2_y) (- p2_x a2_x)))))
 (< ?x2973 0.0)))
(assert
 (let ((?x2977 (- (* (- q2_x a2_x) (- p1_y a2_y)) (* (- q2_y a2_y) (- p1_x a2_x)))))
 (< ?x2977 0.0)))
(assert
 (let ((?x2981 (- (* (- q2_x a2_x) (- q1_y a2_y)) (* (- q2_y a2_y) (- q1_x a2_x)))))
 (< ?x2981 0.0)))
(assert
 (let ((?x2985 (- (* (- q2_x a2_x) (- r2_y a2_y)) (* (- q2_y a2_y) (- r2_x a2_x)))))
 (< ?x2985 0.0)))
(assert
 (let ((?x2989 (- (* (- q2_x a2_x) (- a3_y a2_y)) (* (- q2_y a2_y) (- a3_x a2_x)))))
 (< ?x2989 0.0)))
(assert
 (let ((?x2993 (- (* (- q2_x a2_x) (- s3_y a2_y)) (* (- q2_y a2_y) (- s3_x a2_x)))))
 (< ?x2993 0.0)))
(assert
 (let ((?x2997 (- (* (- q2_x a2_x) (- s1_y a2_y)) (* (- q2_y a2_y) (- s1_x a2_x)))))
 (< ?x2997 0.0)))
(assert
 (let ((?x3001 (- (* (- q2_x a2_x) (- s4_y a2_y)) (* (- q2_y a2_y) (- s4_x a2_x)))))
 (< ?x3001 0.0)))
(assert
 (let ((?x3005 (- (* (- q2_x a2_x) (- s2_y a2_y)) (* (- q2_y a2_y) (- s2_x a2_x)))))
 (< ?x3005 0.0)))
(assert
 (let ((?x3009 (- (* (- p2_x a2_x) (- p1_y a2_y)) (* (- p2_y a2_y) (- p1_x a2_x)))))
 (< ?x3009 0.0)))
(assert
 (let ((?x3013 (- (* (- p2_x a2_x) (- q1_y a2_y)) (* (- p2_y a2_y) (- q1_x a2_x)))))
 (< ?x3013 0.0)))
(assert
 (let ((?x3017 (- (* (- p2_x a2_x) (- r2_y a2_y)) (* (- p2_y a2_y) (- r2_x a2_x)))))
 (< ?x3017 0.0)))
(assert
 (let ((?x3021 (- (* (- p2_x a2_x) (- a3_y a2_y)) (* (- p2_y a2_y) (- a3_x a2_x)))))
 (< ?x3021 0.0)))
(assert
 (let ((?x3025 (- (* (- p2_x a2_x) (- s3_y a2_y)) (* (- p2_y a2_y) (- s3_x a2_x)))))
 (< ?x3025 0.0)))
(assert
 (let ((?x3029 (- (* (- p2_x a2_x) (- s1_y a2_y)) (* (- p2_y a2_y) (- s1_x a2_x)))))
 (< ?x3029 0.0)))
(assert
 (let ((?x3033 (- (* (- p2_x a2_x) (- s4_y a2_y)) (* (- p2_y a2_y) (- s4_x a2_x)))))
 (< ?x3033 0.0)))
(assert
 (let ((?x3037 (- (* (- p2_x a2_x) (- s2_y a2_y)) (* (- p2_y a2_y) (- s2_x a2_x)))))
 (< ?x3037 0.0)))
(assert
 (let ((?x3041 (- (* (- p1_x a2_x) (- q1_y a2_y)) (* (- p1_y a2_y) (- q1_x a2_x)))))
 (< ?x3041 0.0)))
(assert
 (let ((?x3045 (- (* (- p1_x a2_x) (- r2_y a2_y)) (* (- p1_y a2_y) (- r2_x a2_x)))))
 (< ?x3045 0.0)))
(assert
 (let ((?x3049 (- (* (- p1_x a2_x) (- a3_y a2_y)) (* (- p1_y a2_y) (- a3_x a2_x)))))
 (< ?x3049 0.0)))
(assert
 (let ((?x3053 (- (* (- p1_x a2_x) (- s3_y a2_y)) (* (- p1_y a2_y) (- s3_x a2_x)))))
 (< ?x3053 0.0)))
(assert
 (let ((?x3057 (- (* (- p1_x a2_x) (- s1_y a2_y)) (* (- p1_y a2_y) (- s1_x a2_x)))))
 (< ?x3057 0.0)))
(assert
 (let ((?x3061 (- (* (- p1_x a2_x) (- s4_y a2_y)) (* (- p1_y a2_y) (- s4_x a2_x)))))
 (< ?x3061 0.0)))
(assert
 (let ((?x3065 (- (* (- p1_x a2_x) (- s2_y a2_y)) (* (- p1_y a2_y) (- s2_x a2_x)))))
 (< ?x3065 0.0)))
(assert
 (let ((?x3069 (- (* (- q1_x a2_x) (- r2_y a2_y)) (* (- q1_y a2_y) (- r2_x a2_x)))))
 (< ?x3069 0.0)))
(assert
 (let ((?x3073 (- (* (- q1_x a2_x) (- a3_y a2_y)) (* (- q1_y a2_y) (- a3_x a2_x)))))
 (< ?x3073 0.0)))
(assert
 (let ((?x3077 (- (* (- q1_x a2_x) (- s3_y a2_y)) (* (- q1_y a2_y) (- s3_x a2_x)))))
 (< ?x3077 0.0)))
(assert
 (let ((?x3081 (- (* (- q1_x a2_x) (- s1_y a2_y)) (* (- q1_y a2_y) (- s1_x a2_x)))))
 (< ?x3081 0.0)))
(assert
 (let ((?x3085 (- (* (- q1_x a2_x) (- s4_y a2_y)) (* (- q1_y a2_y) (- s4_x a2_x)))))
 (< ?x3085 0.0)))
(assert
 (let ((?x3089 (- (* (- q1_x a2_x) (- s2_y a2_y)) (* (- q1_y a2_y) (- s2_x a2_x)))))
 (< ?x3089 0.0)))
(assert
 (let ((?x3093 (- (* (- r2_x a2_x) (- a3_y a2_y)) (* (- r2_y a2_y) (- a3_x a2_x)))))
 (< ?x3093 0.0)))
(assert
 (let ((?x3097 (- (* (- r2_x a2_x) (- s3_y a2_y)) (* (- r2_y a2_y) (- s3_x a2_x)))))
 (< ?x3097 0.0)))
(assert
 (let ((?x3101 (- (* (- r2_x a2_x) (- s1_y a2_y)) (* (- r2_y a2_y) (- s1_x a2_x)))))
 (< ?x3101 0.0)))
(assert
 (let ((?x3105 (- (* (- r2_x a2_x) (- s4_y a2_y)) (* (- r2_y a2_y) (- s4_x a2_x)))))
 (< ?x3105 0.0)))
(assert
 (let ((?x3109 (- (* (- r2_x a2_x) (- s2_y a2_y)) (* (- r2_y a2_y) (- s2_x a2_x)))))
 (< ?x3109 0.0)))
(assert
 (let ((?x3113 (- (* (- a3_x a2_x) (- s3_y a2_y)) (* (- a3_y a2_y) (- s3_x a2_x)))))
 (< ?x3113 0.0)))
(assert
 (let ((?x3117 (- (* (- a3_x a2_x) (- s1_y a2_y)) (* (- a3_y a2_y) (- s1_x a2_x)))))
 (< ?x3117 0.0)))
(assert
 (let ((?x3121 (- (* (- a3_x a2_x) (- s4_y a2_y)) (* (- a3_y a2_y) (- s4_x a2_x)))))
 (< ?x3121 0.0)))
(assert
 (let ((?x3125 (- (* (- a3_x a2_x) (- s2_y a2_y)) (* (- a3_y a2_y) (- s2_x a2_x)))))
 (< ?x3125 0.0)))
(assert
 (let ((?x3129 (- (* (- s3_x a2_x) (- s1_y a2_y)) (* (- s3_y a2_y) (- s1_x a2_x)))))
 (< ?x3129 0.0)))
(assert
 (let ((?x3133 (- (* (- s3_x a2_x) (- s4_y a2_y)) (* (- s3_y a2_y) (- s4_x a2_x)))))
 (< ?x3133 0.0)))
(assert
 (let ((?x3137 (- (* (- s3_x a2_x) (- s2_y a2_y)) (* (- s3_y a2_y) (- s2_x a2_x)))))
 (< ?x3137 0.0)))
(assert
 (let ((?x3141 (- (* (- s1_x a2_x) (- s4_y a2_y)) (* (- s1_y a2_y) (- s4_x a2_x)))))
 (< ?x3141 0.0)))
(assert
 (let ((?x3145 (- (* (- s1_x a2_x) (- s2_y a2_y)) (* (- s1_y a2_y) (- s2_x a2_x)))))
 (< ?x3145 0.0)))
(assert
 (let ((?x3149 (- (* (- s4_x a2_x) (- s2_y a2_y)) (* (- s4_y a2_y) (- s2_x a2_x)))))
 (< ?x3149 0.0)))
(assert
 (let ((?x3155 (- (* (- q2_x r1_x) (- p2_y r1_y)) (* (- q2_y r1_y) (- p2_x r1_x)))))
 (< ?x3155 0.0)))
(assert
 (let ((?x3161 (- (* (- q2_x r1_x) (- p1_y r1_y)) (* (- q2_y r1_y) (- p1_x r1_x)))))
 (< ?x3161 0.0)))
(assert
 (let ((?x3167 (- (* (- q2_x r1_x) (- q1_y r1_y)) (* (- q2_y r1_y) (- q1_x r1_x)))))
 (< ?x3167 0.0)))
(assert
 (let ((?x3173 (- (* (- q2_x r1_x) (- r2_y r1_y)) (* (- q2_y r1_y) (- r2_x r1_x)))))
 (< ?x3173 0.0)))
(assert
 (let ((?x3179 (- (* (- q2_x r1_x) (- a3_y r1_y)) (* (- q2_y r1_y) (- a3_x r1_x)))))
 (< ?x3179 0.0)))
(assert
 (let ((?x3185 (- (* (- q2_x r1_x) (- s3_y r1_y)) (* (- q2_y r1_y) (- s3_x r1_x)))))
 (< ?x3185 0.0)))
(assert
 (let ((?x3191 (- (* (- q2_x r1_x) (- s1_y r1_y)) (* (- q2_y r1_y) (- s1_x r1_x)))))
 (< ?x3191 0.0)))
(assert
 (let ((?x3197 (- (* (- q2_x r1_x) (- s4_y r1_y)) (* (- q2_y r1_y) (- s4_x r1_x)))))
 (< ?x3197 0.0)))
(assert
 (let ((?x3203 (- (* (- q2_x r1_x) (- s2_y r1_y)) (* (- q2_y r1_y) (- s2_x r1_x)))))
 (< ?x3203 0.0)))
(assert
 (let ((?x3207 (- (* (- p2_x r1_x) (- p1_y r1_y)) (* (- p2_y r1_y) (- p1_x r1_x)))))
 (< ?x3207 0.0)))
(assert
 (let ((?x3211 (- (* (- p2_x r1_x) (- q1_y r1_y)) (* (- p2_y r1_y) (- q1_x r1_x)))))
 (< ?x3211 0.0)))
(assert
 (let ((?x3215 (- (* (- p2_x r1_x) (- r2_y r1_y)) (* (- p2_y r1_y) (- r2_x r1_x)))))
 (< ?x3215 0.0)))
(assert
 (let ((?x3219 (- (* (- p2_x r1_x) (- a3_y r1_y)) (* (- p2_y r1_y) (- a3_x r1_x)))))
 (< ?x3219 0.0)))
(assert
 (let ((?x3223 (- (* (- p2_x r1_x) (- s3_y r1_y)) (* (- p2_y r1_y) (- s3_x r1_x)))))
 (< ?x3223 0.0)))
(assert
 (let ((?x3227 (- (* (- p2_x r1_x) (- s1_y r1_y)) (* (- p2_y r1_y) (- s1_x r1_x)))))
 (< ?x3227 0.0)))
(assert
 (let ((?x3231 (- (* (- p2_x r1_x) (- s4_y r1_y)) (* (- p2_y r1_y) (- s4_x r1_x)))))
 (< ?x3231 0.0)))
(assert
 (let ((?x3235 (- (* (- p2_x r1_x) (- s2_y r1_y)) (* (- p2_y r1_y) (- s2_x r1_x)))))
 (< ?x3235 0.0)))
(assert
 (let ((?x3239 (- (* (- p1_x r1_x) (- q1_y r1_y)) (* (- p1_y r1_y) (- q1_x r1_x)))))
 (< ?x3239 0.0)))
(assert
 (let ((?x3243 (- (* (- p1_x r1_x) (- r2_y r1_y)) (* (- p1_y r1_y) (- r2_x r1_x)))))
 (< ?x3243 0.0)))
(assert
 (let ((?x3247 (- (* (- p1_x r1_x) (- a3_y r1_y)) (* (- p1_y r1_y) (- a3_x r1_x)))))
 (< ?x3247 0.0)))
(assert
 (let ((?x3251 (- (* (- p1_x r1_x) (- s3_y r1_y)) (* (- p1_y r1_y) (- s3_x r1_x)))))
 (< ?x3251 0.0)))
(assert
 (let ((?x3255 (- (* (- p1_x r1_x) (- s1_y r1_y)) (* (- p1_y r1_y) (- s1_x r1_x)))))
 (< ?x3255 0.0)))
(assert
 (let ((?x3259 (- (* (- p1_x r1_x) (- s4_y r1_y)) (* (- p1_y r1_y) (- s4_x r1_x)))))
 (< ?x3259 0.0)))
(assert
 (let ((?x3263 (- (* (- p1_x r1_x) (- s2_y r1_y)) (* (- p1_y r1_y) (- s2_x r1_x)))))
 (< ?x3263 0.0)))
(assert
 (let ((?x3267 (- (* (- q1_x r1_x) (- r2_y r1_y)) (* (- q1_y r1_y) (- r2_x r1_x)))))
 (< ?x3267 0.0)))
(assert
 (let ((?x3271 (- (* (- q1_x r1_x) (- a3_y r1_y)) (* (- q1_y r1_y) (- a3_x r1_x)))))
 (< ?x3271 0.0)))
(assert
 (let ((?x3275 (- (* (- q1_x r1_x) (- s3_y r1_y)) (* (- q1_y r1_y) (- s3_x r1_x)))))
 (< ?x3275 0.0)))
(assert
 (let ((?x3279 (- (* (- q1_x r1_x) (- s1_y r1_y)) (* (- q1_y r1_y) (- s1_x r1_x)))))
 (< ?x3279 0.0)))
(assert
 (let ((?x3283 (- (* (- q1_x r1_x) (- s4_y r1_y)) (* (- q1_y r1_y) (- s4_x r1_x)))))
 (< ?x3283 0.0)))
(assert
 (let ((?x3287 (- (* (- q1_x r1_x) (- s2_y r1_y)) (* (- q1_y r1_y) (- s2_x r1_x)))))
 (< ?x3287 0.0)))
(assert
 (let ((?x3291 (- (* (- r2_x r1_x) (- a3_y r1_y)) (* (- r2_y r1_y) (- a3_x r1_x)))))
 (< ?x3291 0.0)))
(assert
 (let ((?x3295 (- (* (- r2_x r1_x) (- s3_y r1_y)) (* (- r2_y r1_y) (- s3_x r1_x)))))
 (< ?x3295 0.0)))
(assert
 (let ((?x3299 (- (* (- r2_x r1_x) (- s1_y r1_y)) (* (- r2_y r1_y) (- s1_x r1_x)))))
 (< ?x3299 0.0)))
(assert
 (let ((?x3303 (- (* (- r2_x r1_x) (- s4_y r1_y)) (* (- r2_y r1_y) (- s4_x r1_x)))))
 (< ?x3303 0.0)))
(assert
 (let ((?x3307 (- (* (- r2_x r1_x) (- s2_y r1_y)) (* (- r2_y r1_y) (- s2_x r1_x)))))
 (< ?x3307 0.0)))
(assert
 (let ((?x3311 (- (* (- a3_x r1_x) (- s3_y r1_y)) (* (- a3_y r1_y) (- s3_x r1_x)))))
 (< ?x3311 0.0)))
(assert
 (let ((?x3315 (- (* (- a3_x r1_x) (- s1_y r1_y)) (* (- a3_y r1_y) (- s1_x r1_x)))))
 (< ?x3315 0.0)))
(assert
 (let ((?x3319 (- (* (- a3_x r1_x) (- s4_y r1_y)) (* (- a3_y r1_y) (- s4_x r1_x)))))
 (< ?x3319 0.0)))
(assert
 (let ((?x3323 (- (* (- a3_x r1_x) (- s2_y r1_y)) (* (- a3_y r1_y) (- s2_x r1_x)))))
 (< ?x3323 0.0)))
(assert
 (let ((?x3327 (- (* (- s3_x r1_x) (- s1_y r1_y)) (* (- s3_y r1_y) (- s1_x r1_x)))))
 (< ?x3327 0.0)))
(assert
 (let ((?x3331 (- (* (- s3_x r1_x) (- s4_y r1_y)) (* (- s3_y r1_y) (- s4_x r1_x)))))
 (< ?x3331 0.0)))
(assert
 (let ((?x3335 (- (* (- s3_x r1_x) (- s2_y r1_y)) (* (- s3_y r1_y) (- s2_x r1_x)))))
 (< ?x3335 0.0)))
(assert
 (let ((?x3339 (- (* (- s1_x r1_x) (- s4_y r1_y)) (* (- s1_y r1_y) (- s4_x r1_x)))))
 (< ?x3339 0.0)))
(assert
 (let ((?x3343 (- (* (- s1_x r1_x) (- s2_y r1_y)) (* (- s1_y r1_y) (- s2_x r1_x)))))
 (< ?x3343 0.0)))
(assert
 (let ((?x3347 (- (* (- s4_x r1_x) (- s2_y r1_y)) (* (- s4_y r1_y) (- s2_x r1_x)))))
 (< ?x3347 0.0)))
(assert
 (let ((?x3353 (- (* (- p2_x q2_x) (- p1_y q2_y)) (* (- p2_y q2_y) (- p1_x q2_x)))))
 (< ?x3353 0.0)))
(assert
 (let ((?x3359 (- (* (- p2_x q2_x) (- q1_y q2_y)) (* (- p2_y q2_y) (- q1_x q2_x)))))
 (< ?x3359 0.0)))
(assert
 (let ((?x3365 (- (* (- p2_x q2_x) (- r2_y q2_y)) (* (- p2_y q2_y) (- r2_x q2_x)))))
 (< ?x3365 0.0)))
(assert
 (let ((?x3371 (- (* (- p2_x q2_x) (- a3_y q2_y)) (* (- p2_y q2_y) (- a3_x q2_x)))))
 (< ?x3371 0.0)))
(assert
 (let ((?x3377 (- (* (- p2_x q2_x) (- s3_y q2_y)) (* (- p2_y q2_y) (- s3_x q2_x)))))
 (< ?x3377 0.0)))
(assert
 (let ((?x3383 (- (* (- p2_x q2_x) (- s1_y q2_y)) (* (- p2_y q2_y) (- s1_x q2_x)))))
 (< ?x3383 0.0)))
(assert
 (let ((?x3389 (- (* (- p2_x q2_x) (- s4_y q2_y)) (* (- p2_y q2_y) (- s4_x q2_x)))))
 (< ?x3389 0.0)))
(assert
 (let ((?x3395 (- (* (- p2_x q2_x) (- s2_y q2_y)) (* (- p2_y q2_y) (- s2_x q2_x)))))
 (< ?x3395 0.0)))
(assert
 (let ((?x3399 (- (* (- p1_x q2_x) (- q1_y q2_y)) (* (- p1_y q2_y) (- q1_x q2_x)))))
 (< ?x3399 0.0)))
(assert
 (let ((?x3403 (- (* (- p1_x q2_x) (- r2_y q2_y)) (* (- p1_y q2_y) (- r2_x q2_x)))))
 (< ?x3403 0.0)))
(assert
 (let ((?x3407 (- (* (- p1_x q2_x) (- a3_y q2_y)) (* (- p1_y q2_y) (- a3_x q2_x)))))
 (< ?x3407 0.0)))
(assert
 (let ((?x3411 (- (* (- p1_x q2_x) (- s3_y q2_y)) (* (- p1_y q2_y) (- s3_x q2_x)))))
 (< ?x3411 0.0)))
(assert
 (let ((?x3415 (- (* (- p1_x q2_x) (- s1_y q2_y)) (* (- p1_y q2_y) (- s1_x q2_x)))))
 (< ?x3415 0.0)))
(assert
 (let ((?x3419 (- (* (- p1_x q2_x) (- s4_y q2_y)) (* (- p1_y q2_y) (- s4_x q2_x)))))
 (< ?x3419 0.0)))
(assert
 (let ((?x3423 (- (* (- p1_x q2_x) (- s2_y q2_y)) (* (- p1_y q2_y) (- s2_x q2_x)))))
 (< ?x3423 0.0)))
(assert
 (let ((?x3427 (- (* (- q1_x q2_x) (- r2_y q2_y)) (* (- q1_y q2_y) (- r2_x q2_x)))))
 (< ?x3427 0.0)))
(assert
 (let ((?x3431 (- (* (- q1_x q2_x) (- a3_y q2_y)) (* (- q1_y q2_y) (- a3_x q2_x)))))
 (< ?x3431 0.0)))
(assert
 (let ((?x3435 (- (* (- q1_x q2_x) (- s3_y q2_y)) (* (- q1_y q2_y) (- s3_x q2_x)))))
 (< ?x3435 0.0)))
(assert
 (let ((?x3439 (- (* (- q1_x q2_x) (- s1_y q2_y)) (* (- q1_y q2_y) (- s1_x q2_x)))))
 (< ?x3439 0.0)))
(assert
 (let ((?x3443 (- (* (- q1_x q2_x) (- s4_y q2_y)) (* (- q1_y q2_y) (- s4_x q2_x)))))
 (< ?x3443 0.0)))
(assert
 (let ((?x3447 (- (* (- q1_x q2_x) (- s2_y q2_y)) (* (- q1_y q2_y) (- s2_x q2_x)))))
 (< ?x3447 0.0)))
(assert
 (let ((?x3451 (- (* (- r2_x q2_x) (- a3_y q2_y)) (* (- r2_y q2_y) (- a3_x q2_x)))))
 (< ?x3451 0.0)))
(assert
 (let ((?x3455 (- (* (- r2_x q2_x) (- s3_y q2_y)) (* (- r2_y q2_y) (- s3_x q2_x)))))
 (< ?x3455 0.0)))
(assert
 (let ((?x3459 (- (* (- r2_x q2_x) (- s1_y q2_y)) (* (- r2_y q2_y) (- s1_x q2_x)))))
 (< ?x3459 0.0)))
(assert
 (let ((?x3463 (- (* (- r2_x q2_x) (- s4_y q2_y)) (* (- r2_y q2_y) (- s4_x q2_x)))))
 (< ?x3463 0.0)))
(assert
 (let ((?x3467 (- (* (- r2_x q2_x) (- s2_y q2_y)) (* (- r2_y q2_y) (- s2_x q2_x)))))
 (< ?x3467 0.0)))
(assert
 (let ((?x3471 (- (* (- a3_x q2_x) (- s3_y q2_y)) (* (- a3_y q2_y) (- s3_x q2_x)))))
 (< ?x3471 0.0)))
(assert
 (let ((?x3475 (- (* (- a3_x q2_x) (- s1_y q2_y)) (* (- a3_y q2_y) (- s1_x q2_x)))))
 (< ?x3475 0.0)))
(assert
 (let ((?x3479 (- (* (- a3_x q2_x) (- s4_y q2_y)) (* (- a3_y q2_y) (- s4_x q2_x)))))
 (< ?x3479 0.0)))
(assert
 (let ((?x3483 (- (* (- a3_x q2_x) (- s2_y q2_y)) (* (- a3_y q2_y) (- s2_x q2_x)))))
 (< ?x3483 0.0)))
(assert
 (let ((?x3487 (- (* (- s3_x q2_x) (- s1_y q2_y)) (* (- s3_y q2_y) (- s1_x q2_x)))))
 (< ?x3487 0.0)))
(assert
 (let ((?x3491 (- (* (- s3_x q2_x) (- s4_y q2_y)) (* (- s3_y q2_y) (- s4_x q2_x)))))
 (< ?x3491 0.0)))
(assert
 (let ((?x3495 (- (* (- s3_x q2_x) (- s2_y q2_y)) (* (- s3_y q2_y) (- s2_x q2_x)))))
 (< ?x3495 0.0)))
(assert
 (let ((?x3499 (- (* (- s1_x q2_x) (- s4_y q2_y)) (* (- s1_y q2_y) (- s4_x q2_x)))))
 (< ?x3499 0.0)))
(assert
 (let ((?x3503 (- (* (- s1_x q2_x) (- s2_y q2_y)) (* (- s1_y q2_y) (- s2_x q2_x)))))
 (< ?x3503 0.0)))
(assert
 (let ((?x3507 (- (* (- s4_x q2_x) (- s2_y q2_y)) (* (- s4_y q2_y) (- s2_x q2_x)))))
 (< ?x3507 0.0)))
(assert
 (let ((?x3513 (- (* (- p1_x p2_x) (- q1_y p2_y)) (* (- p1_y p2_y) (- q1_x p2_x)))))
 (< ?x3513 0.0)))
(assert
 (let ((?x3519 (- (* (- p1_x p2_x) (- r2_y p2_y)) (* (- p1_y p2_y) (- r2_x p2_x)))))
 (< ?x3519 0.0)))
(assert
 (let ((?x3523 (- (* (- p1_x p2_x) (- a3_y p2_y)) (* (- p1_y p2_y) (- a3_x p2_x)))))
 (< ?x3523 0.0)))
(assert
 (let ((?x3529 (- (* (- p1_x p2_x) (- s3_y p2_y)) (* (- p1_y p2_y) (- s3_x p2_x)))))
 (< ?x3529 0.0)))
(assert
 (let ((?x3535 (- (* (- p1_x p2_x) (- s1_y p2_y)) (* (- p1_y p2_y) (- s1_x p2_x)))))
 (< ?x3535 0.0)))
(assert
 (let ((?x3541 (- (* (- p1_x p2_x) (- s4_y p2_y)) (* (- p1_y p2_y) (- s4_x p2_x)))))
 (< ?x3541 0.0)))
(assert
 (let ((?x3547 (- (* (- p1_x p2_x) (- s2_y p2_y)) (* (- p1_y p2_y) (- s2_x p2_x)))))
 (< ?x3547 0.0)))
(assert
 (let ((?x3551 (- (* (- q1_x p2_x) (- r2_y p2_y)) (* (- q1_y p2_y) (- r2_x p2_x)))))
 (< ?x3551 0.0)))
(assert
 (let ((?x3555 (- (* (- q1_x p2_x) (- a3_y p2_y)) (* (- q1_y p2_y) (- a3_x p2_x)))))
 (< ?x3555 0.0)))
(assert
 (let ((?x3559 (- (* (- q1_x p2_x) (- s3_y p2_y)) (* (- q1_y p2_y) (- s3_x p2_x)))))
 (< ?x3559 0.0)))
(assert
 (let ((?x3563 (- (* (- q1_x p2_x) (- s1_y p2_y)) (* (- q1_y p2_y) (- s1_x p2_x)))))
 (< ?x3563 0.0)))
(assert
 (let ((?x3567 (- (* (- q1_x p2_x) (- s4_y p2_y)) (* (- q1_y p2_y) (- s4_x p2_x)))))
 (< ?x3567 0.0)))
(assert
 (let ((?x3571 (- (* (- q1_x p2_x) (- s2_y p2_y)) (* (- q1_y p2_y) (- s2_x p2_x)))))
 (< ?x3571 0.0)))
(assert
 (let ((?x3575 (- (* (- r2_x p2_x) (- a3_y p2_y)) (* (- r2_y p2_y) (- a3_x p2_x)))))
 (< ?x3575 0.0)))
(assert
 (let ((?x3579 (- (* (- r2_x p2_x) (- s3_y p2_y)) (* (- r2_y p2_y) (- s3_x p2_x)))))
 (< ?x3579 0.0)))
(assert
 (let ((?x3583 (- (* (- r2_x p2_x) (- s1_y p2_y)) (* (- r2_y p2_y) (- s1_x p2_x)))))
 (< ?x3583 0.0)))
(assert
 (let ((?x3587 (- (* (- r2_x p2_x) (- s4_y p2_y)) (* (- r2_y p2_y) (- s4_x p2_x)))))
 (< ?x3587 0.0)))
(assert
 (let ((?x3591 (- (* (- r2_x p2_x) (- s2_y p2_y)) (* (- r2_y p2_y) (- s2_x p2_x)))))
 (< ?x3591 0.0)))
(assert
 (let ((?x3595 (- (* (- a3_x p2_x) (- s3_y p2_y)) (* (- a3_y p2_y) (- s3_x p2_x)))))
 (< ?x3595 0.0)))
(assert
 (let ((?x3599 (- (* (- a3_x p2_x) (- s1_y p2_y)) (* (- a3_y p2_y) (- s1_x p2_x)))))
 (< ?x3599 0.0)))
(assert
 (let ((?x3603 (- (* (- a3_x p2_x) (- s4_y p2_y)) (* (- a3_y p2_y) (- s4_x p2_x)))))
 (< ?x3603 0.0)))
(assert
 (let ((?x3607 (- (* (- a3_x p2_x) (- s2_y p2_y)) (* (- a3_y p2_y) (- s2_x p2_x)))))
 (< ?x3607 0.0)))
(assert
 (let ((?x3611 (- (* (- s3_x p2_x) (- s1_y p2_y)) (* (- s3_y p2_y) (- s1_x p2_x)))))
 (< ?x3611 0.0)))
(assert
 (let ((?x3615 (- (* (- s3_x p2_x) (- s4_y p2_y)) (* (- s3_y p2_y) (- s4_x p2_x)))))
 (< ?x3615 0.0)))
(assert
 (let ((?x3619 (- (* (- s3_x p2_x) (- s2_y p2_y)) (* (- s3_y p2_y) (- s2_x p2_x)))))
 (< ?x3619 0.0)))
(assert
 (let ((?x3623 (- (* (- s1_x p2_x) (- s4_y p2_y)) (* (- s1_y p2_y) (- s4_x p2_x)))))
 (< ?x3623 0.0)))
(assert
 (let ((?x3627 (- (* (- s1_x p2_x) (- s2_y p2_y)) (* (- s1_y p2_y) (- s2_x p2_x)))))
 (< ?x3627 0.0)))
(assert
 (let ((?x3631 (- (* (- s4_x p2_x) (- s2_y p2_y)) (* (- s4_y p2_y) (- s2_x p2_x)))))
 (< ?x3631 0.0)))
(assert
 (let ((?x3637 (- (* (- q1_x p1_x) (- r2_y p1_y)) (* (- q1_y p1_y) (- r2_x p1_x)))))
 (< ?x3637 0.0)))
(assert
 (let ((?x3643 (- (* (- q1_x p1_x) (- a3_y p1_y)) (* (- q1_y p1_y) (- a3_x p1_x)))))
 (< ?x3643 0.0)))
(assert
 (let ((?x3649 (- (* (- q1_x p1_x) (- s3_y p1_y)) (* (- q1_y p1_y) (- s3_x p1_x)))))
 (< ?x3649 0.0)))
(assert
 (let ((?x3655 (- (* (- q1_x p1_x) (- s1_y p1_y)) (* (- q1_y p1_y) (- s1_x p1_x)))))
 (< ?x3655 0.0)))
(assert
 (let ((?x3661 (- (* (- q1_x p1_x) (- s4_y p1_y)) (* (- q1_y p1_y) (- s4_x p1_x)))))
 (< ?x3661 0.0)))
(assert
 (let ((?x3667 (- (* (- q1_x p1_x) (- s2_y p1_y)) (* (- q1_y p1_y) (- s2_x p1_x)))))
 (< ?x3667 0.0)))
(assert
 (let ((?x3671 (- (* (- r2_x p1_x) (- a3_y p1_y)) (* (- r2_y p1_y) (- a3_x p1_x)))))
 (< ?x3671 0.0)))
(assert
 (let ((?x3675 (- (* (- r2_x p1_x) (- s3_y p1_y)) (* (- r2_y p1_y) (- s3_x p1_x)))))
 (< ?x3675 0.0)))
(assert
 (let ((?x3679 (- (* (- r2_x p1_x) (- s1_y p1_y)) (* (- r2_y p1_y) (- s1_x p1_x)))))
 (< ?x3679 0.0)))
(assert
 (let ((?x3683 (- (* (- r2_x p1_x) (- s4_y p1_y)) (* (- r2_y p1_y) (- s4_x p1_x)))))
 (< ?x3683 0.0)))
(assert
 (let ((?x3687 (- (* (- r2_x p1_x) (- s2_y p1_y)) (* (- r2_y p1_y) (- s2_x p1_x)))))
 (< ?x3687 0.0)))
(assert
 (let ((?x3691 (- (* (- a3_x p1_x) (- s3_y p1_y)) (* (- a3_y p1_y) (- s3_x p1_x)))))
 (< ?x3691 0.0)))
(assert
 (let ((?x3695 (- (* (- a3_x p1_x) (- s1_y p1_y)) (* (- a3_y p1_y) (- s1_x p1_x)))))
 (< ?x3695 0.0)))
(assert
 (let ((?x3699 (- (* (- a3_x p1_x) (- s4_y p1_y)) (* (- a3_y p1_y) (- s4_x p1_x)))))
 (< ?x3699 0.0)))
(assert
 (let ((?x3703 (- (* (- a3_x p1_x) (- s2_y p1_y)) (* (- a3_y p1_y) (- s2_x p1_x)))))
 (< ?x3703 0.0)))
(assert
 (let ((?x3707 (- (* (- s3_x p1_x) (- s1_y p1_y)) (* (- s3_y p1_y) (- s1_x p1_x)))))
 (< ?x3707 0.0)))
(assert
 (let ((?x3711 (- (* (- s3_x p1_x) (- s4_y p1_y)) (* (- s3_y p1_y) (- s4_x p1_x)))))
 (< ?x3711 0.0)))
(assert
 (let ((?x3715 (- (* (- s3_x p1_x) (- s2_y p1_y)) (* (- s3_y p1_y) (- s2_x p1_x)))))
 (< ?x3715 0.0)))
(assert
 (let ((?x3719 (- (* (- s1_x p1_x) (- s4_y p1_y)) (* (- s1_y p1_y) (- s4_x p1_x)))))
 (< ?x3719 0.0)))
(assert
 (let ((?x3723 (- (* (- s1_x p1_x) (- s2_y p1_y)) (* (- s1_y p1_y) (- s2_x p1_x)))))
 (< ?x3723 0.0)))
(assert
 (let ((?x3727 (- (* (- s4_x p1_x) (- s2_y p1_y)) (* (- s4_y p1_y) (- s2_x p1_x)))))
 (< ?x3727 0.0)))
(assert
 (let ((?x3735 (- (* (- r2_x q1_x) (- a3_y q1_y)) (* (- r2_y q1_y) (- a3_x q1_x)))))
 (< ?x3735 0.0)))
(assert
 (let ((?x3741 (- (* (- r2_x q1_x) (- s3_y q1_y)) (* (- r2_y q1_y) (- s3_x q1_x)))))
 (< ?x3741 0.0)))
(assert
 (let ((?x3747 (- (* (- r2_x q1_x) (- s1_y q1_y)) (* (- r2_y q1_y) (- s1_x q1_x)))))
 (< ?x3747 0.0)))
(assert
 (let ((?x3753 (- (* (- r2_x q1_x) (- s4_y q1_y)) (* (- r2_y q1_y) (- s4_x q1_x)))))
 (< ?x3753 0.0)))
(assert
 (let ((?x3759 (- (* (- r2_x q1_x) (- s2_y q1_y)) (* (- r2_y q1_y) (- s2_x q1_x)))))
 (< ?x3759 0.0)))
(assert
 (let ((?x3763 (- (* (- a3_x q1_x) (- s3_y q1_y)) (* (- a3_y q1_y) (- s3_x q1_x)))))
 (< ?x3763 0.0)))
(assert
 (let ((?x3767 (- (* (- a3_x q1_x) (- s1_y q1_y)) (* (- a3_y q1_y) (- s1_x q1_x)))))
 (< ?x3767 0.0)))
(assert
 (let ((?x3771 (- (* (- a3_x q1_x) (- s4_y q1_y)) (* (- a3_y q1_y) (- s4_x q1_x)))))
 (< ?x3771 0.0)))
(assert
 (let ((?x3775 (- (* (- a3_x q1_x) (- s2_y q1_y)) (* (- a3_y q1_y) (- s2_x q1_x)))))
 (< ?x3775 0.0)))
(assert
 (let ((?x3779 (- (* (- s3_x q1_x) (- s1_y q1_y)) (* (- s3_y q1_y) (- s1_x q1_x)))))
 (< ?x3779 0.0)))
(assert
 (let ((?x3783 (- (* (- s3_x q1_x) (- s4_y q1_y)) (* (- s3_y q1_y) (- s4_x q1_x)))))
 (< ?x3783 0.0)))
(assert
 (let ((?x3787 (- (* (- s3_x q1_x) (- s2_y q1_y)) (* (- s3_y q1_y) (- s2_x q1_x)))))
 (< ?x3787 0.0)))
(assert
 (let ((?x3791 (- (* (- s1_x q1_x) (- s4_y q1_y)) (* (- s1_y q1_y) (- s4_x q1_x)))))
 (< ?x3791 0.0)))
(assert
 (let ((?x3795 (- (* (- s1_x q1_x) (- s2_y q1_y)) (* (- s1_y q1_y) (- s2_x q1_x)))))
 (< ?x3795 0.0)))
(assert
 (let ((?x3799 (- (* (- s4_x q1_x) (- s2_y q1_y)) (* (- s4_y q1_y) (- s2_x q1_x)))))
 (< ?x3799 0.0)))
(assert
 (let ((?x3807 (- (* (- a3_x r2_x) (- s3_y r2_y)) (* (- a3_y r2_y) (- s3_x r2_x)))))
 (< ?x3807 0.0)))
(assert
 (let ((?x3813 (- (* (- a3_x r2_x) (- s1_y r2_y)) (* (- a3_y r2_y) (- s1_x r2_x)))))
 (< ?x3813 0.0)))
(assert
 (let ((?x3819 (- (* (- a3_x r2_x) (- s4_y r2_y)) (* (- a3_y r2_y) (- s4_x r2_x)))))
 (< ?x3819 0.0)))
(assert
 (let ((?x3825 (- (* (- a3_x r2_x) (- s2_y r2_y)) (* (- a3_y r2_y) (- s2_x r2_x)))))
 (< ?x3825 0.0)))
(assert
 (let ((?x3829 (- (* (- s3_x r2_x) (- s1_y r2_y)) (* (- s3_y r2_y) (- s1_x r2_x)))))
 (< ?x3829 0.0)))
(assert
 (let ((?x3833 (- (* (- s3_x r2_x) (- s4_y r2_y)) (* (- s3_y r2_y) (- s4_x r2_x)))))
 (< ?x3833 0.0)))
(assert
 (let ((?x3837 (- (* (- s3_x r2_x) (- s2_y r2_y)) (* (- s3_y r2_y) (- s2_x r2_x)))))
 (< ?x3837 0.0)))
(assert
 (let ((?x3841 (- (* (- s1_x r2_x) (- s4_y r2_y)) (* (- s1_y r2_y) (- s4_x r2_x)))))
 (< ?x3841 0.0)))
(assert
 (let ((?x3845 (- (* (- s1_x r2_x) (- s2_y r2_y)) (* (- s1_y r2_y) (- s2_x r2_x)))))
 (< ?x3845 0.0)))
(assert
 (let ((?x3849 (- (* (- s4_x r2_x) (- s2_y r2_y)) (* (- s4_y r2_y) (- s2_x r2_x)))))
 (< ?x3849 0.0)))
(assert
 (let ((?x3857 (- (* (- s3_x a3_x) (- s1_y a3_y)) (* (- s3_y a3_y) (- s1_x a3_x)))))
 (< ?x3857 0.0)))
(assert
 (let ((?x3863 (- (* (- s3_x a3_x) (- s4_y a3_y)) (* (- s3_y a3_y) (- s4_x a3_x)))))
 (< ?x3863 0.0)))
(assert
 (let ((?x3869 (- (* (- s3_x a3_x) (- s2_y a3_y)) (* (- s3_y a3_y) (- s2_x a3_x)))))
 (< ?x3869 0.0)))
(assert
 (let ((?x3873 (- (* (- s1_x a3_x) (- s4_y a3_y)) (* (- s1_y a3_y) (- s4_x a3_x)))))
 (< ?x3873 0.0)))
(assert
 (let ((?x3877 (- (* (- s1_x a3_x) (- s2_y a3_y)) (* (- s1_y a3_y) (- s2_x a3_x)))))
 (< ?x3877 0.0)))
(assert
 (let ((?x3881 (- (* (- s4_x a3_x) (- s2_y a3_y)) (* (- s4_y a3_y) (- s2_x a3_x)))))
 (< ?x3881 0.0)))
(assert
 (let ((?x3889 (- (* (- s1_x s3_x) (- s4_y s3_y)) (* (- s1_y s3_y) (- s4_x s3_x)))))
 (< ?x3889 0.0)))
(assert
 (let ((?x3895 (- (* (- s1_x s3_x) (- s2_y s3_y)) (* (- s1_y s3_y) (- s2_x s3_x)))))
 (< ?x3895 0.0)))
(assert
 (let ((?x3899 (- (* (- s4_x s3_x) (- s2_y s3_y)) (* (- s4_y s3_y) (- s2_x s3_x)))))
 (< ?x3899 0.0)))
(assert
 (let ((?x3907 (- (* (- s4_x s1_x) (- s2_y s1_y)) (* (- s4_y s1_y) (- s2_x s1_x)))))
(< ?x3907 0.0)))
(check-sat)
