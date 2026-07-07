(set-logic QF_NRA)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun t2y () Real)
(declare-fun t2x () Real)
(declare-fun t3y () Real)
(declare-fun t3x () Real)
(declare-fun t4y () Real)
(declare-fun t4x () Real)
(assert
 (= (+ (+ (- 1.0) (* t2x t2x)) (* t2y t2y)) 0.0))
(assert
 (= (+ (+ (- 1.0) (* t3x t3x)) (* t3y t3y)) 0.0))
(assert
 (= (+ (+ (- 1.0) (* t4x t4x)) (* t4y t4y)) 0.0))
(assert
 (> t2y 0.0))
(assert
 (> t3y 0.0))
(assert
 (> t4y 0.0))
(assert
 (> (+ (* t2x t3y) (* (* (- 1.0) t2y) t3x)) 0.0))
(assert
 (> (+ (* t2x t4y) (* (* (- 1.0) t2y) t4x)) 0.0))
(assert
 (> (+ (* t3x t4y) (* (* (- 1.0) t3y) t4x)) 0.0))
(assert
 (let ((?x32 (* (- 1.0) t2y)))
 (let ((?x33 (* ?x32 t3x)))
 (> (+ (+ (+ t2y (* (- 1.0) t3y)) (* t2x t3y)) ?x33) 0.0))))
(assert
 (let ((?x32 (* (- 1.0) t2y)))
 (let ((?x37 (* ?x32 t4x)))
 (> (+ (+ (+ t2y (* (- 1.0) t4y)) (* t2x t4y)) ?x37) 0.0))))
(assert
 (let ((?x41 (* (- 1.0) t3y)))
 (let ((?x42 (* ?x41 t4x)))
 (> (+ (+ (+ t3y (* (- 1.0) t4y)) (* t3x t4y)) ?x42) 0.0))))
(assert
 (let ((?x41 (* (- 1.0) t3y)))
(let ((?x42 (* ?x41 t4x)))
(let ((?x32 (* (- 1.0) t2y)))
(let ((?x33 (* ?x32 t3x)))
(let ((?x63 (+ (+ (+ (* t2x t3y) (* t2y t4x)) (* t3x t4y)) (* (* (- 1.0) t2x) t4y))))
(> (+ (+ ?x63 ?x33) ?x42) 0.0)))))))
(check-sat)
