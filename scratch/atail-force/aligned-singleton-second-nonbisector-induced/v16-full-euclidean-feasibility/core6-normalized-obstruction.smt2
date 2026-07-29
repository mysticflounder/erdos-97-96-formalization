; benchmark generated from python API
(set-info :status unknown)
(declare-fun u () Real)
(declare-fun v () Real)
(declare-fun b () Real)
(declare-fun a () Real)
(declare-fun c () Real)
(declare-fun d () Real)
(assert
 (let ((?x18 (* 2.0 u)))
 (let ((?x12 (* v v)))
 (let ((?x11 (* u u)))
 (let ((?x13 (+ ?x11 ?x12)))
 (= ?x13 ?x18))))))
(assert
 (> u 0.0))
(assert
 (< u 1.0))
(assert
 (> v 0.0))
(assert
 (> (- (* (- a) v) (* b u)) 0.0))
(assert
 (> (- (* a v) (* b u)) 0.0))
(assert
 (= (* (+ (* u u) (* v v)) (+ c a)) (* (* 2.0 (+ (* a u) (* b v))) u)))
(assert
 (= (* (+ (* u u) (* v v)) (+ d b)) (* (* 2.0 (+ (* a u) (* b v))) v)))
(assert
 (> (- (* a d) (* b c)) 0.0))
(check-sat)
