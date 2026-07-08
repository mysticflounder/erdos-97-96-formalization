(set-logic QF_NRA)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun xy () Real)
(declare-fun way () Real)
(declare-fun xx () Real)
(declare-fun wax () Real)
(declare-fun rho2 () Real)
(declare-fun wby () Real)
(declare-fun wbx () Real)
(declare-fun oy () Real)
(assert
 (let ((?x18 (* (- 1.0) rho2)))
 (let ((?x16 (* xy xy)))
 (let ((?x27 (+ (+ (+ (+ (* wax wax) (* way way)) (* xx xx)) ?x16) ?x18)))
 (= (+ (+ ?x27 (* (* (- 2.0) wax) xx)) (* (* (- 2.0) way) xy)) 0.0)))))
(assert
 (let ((?x18 (* (- 1.0) rho2)))
 (let ((?x16 (* xy xy)))
 (let ((?x41 (+ (+ (+ (+ (* wbx wbx) (* wby wby)) (* xx xx)) ?x16) ?x18)))
 (= (+ (+ ?x41 (* (* (- 2.0) wbx) xx)) (* (* (- 2.0) wby) xy)) 0.0)))))
(assert
 (>= oy 0.0))
(assert
 (let ((?x53 (+ (+ (+ xx (* (- 1.0) (* xx xx))) (* (- 1.0) (* xy xy))) (* (* 2.0 oy) xy))))
 (>= ?x53 0.0)))
(assert
 (let ((?x60 (+ (+ (+ wax (* (- 1.0) (* wax wax))) (* (- 1.0) (* way way))) (* (* 2.0 oy) way))))
 (>= ?x60 0.0)))
(assert
 (let ((?x67 (+ (+ (+ wbx (* (- 1.0) (* wbx wbx))) (* (- 1.0) (* wby wby))) (* (* 2.0 oy) wby))))
 (>= ?x67 0.0)))
(assert
 (> rho2 0.0))
(assert
 (let ((?x70 (* (- 1.0) xy)))
 (> ?x70 0.0)))
(assert
 (let ((?x72 (* (- 1.0) way)))
 (> ?x72 0.0)))
(assert
 (let ((?x74 (* (- 1.0) wby)))
 (> ?x74 0.0)))
(assert
 (> (+ (* wax wby) (* (* (- 1.0) way) wbx)) 0.0))
(assert
 (> (+ (* wax xy) (* (* (- 1.0) way) xx)) 0.0))
(assert
 (let ((?x72 (* (- 1.0) way)))
 (> ?x72 0.0)))
(assert
 (> (+ (* wbx xy) (* (* (- 1.0) wby) xx)) 0.0))
(assert
 (let ((?x74 (* (- 1.0) wby)))
 (> ?x74 0.0)))
(assert
 (let ((?x70 (* (- 1.0) xy)))
 (> ?x70 0.0)))
(assert
 (let ((?x74 (* (- 1.0) wby)))
 (let ((?x85 (* ?x74 xx)))
 (let ((?x72 (* (- 1.0) way)))
 (let ((?x77 (* ?x72 wbx)))
 (let ((?x93 (+ (+ (+ (* wax wby) (* way xx)) (* wbx xy)) (* (* (- 1.0) wax) xy))))
 (> (+ (+ ?x93 ?x77) ?x85) 0.0)))))))
(assert
 (let ((?x72 (* (- 1.0) way)))
 (let ((?x77 (* ?x72 wbx)))
 (> (+ (+ (+ way (* (- 1.0) wby)) (* wax wby)) ?x77) 0.0))))
(assert
 (let ((?x72 (* (- 1.0) way)))
 (let ((?x81 (* ?x72 xx)))
 (> (+ (+ (+ way (* (- 1.0) xy)) (* wax xy)) ?x81) 0.0))))
(assert
 (let ((?x74 (* (- 1.0) wby)))
(let ((?x85 (* ?x74 xx)))
(> (+ (+ (+ wby (* (- 1.0) xy)) (* wbx xy)) ?x85) 0.0))))
(check-sat)
