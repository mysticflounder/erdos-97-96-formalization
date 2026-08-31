(set-logic QF_NRA)
(set-option :tactic.default_tactic qfnra-nlsat)
(set-option :nlsat.randomize false)
(set-option :nlsat.seed 0)
(declare-fun blockerv_midpoint_core_forward__O_x () Real)
(declare-fun blockerv_midpoint_core_forward__O_y () Real)
(declare-fun blockerv_midpoint_core_forward__delta_x () Real)
(declare-fun blockerv_midpoint_core_forward__delta_y () Real)
(declare-fun blockerv_midpoint_core_forward__m1_x () Real)
(declare-fun blockerv_midpoint_core_forward__m1_y () Real)
(declare-fun blockerv_midpoint_core_forward__m2_x () Real)
(declare-fun blockerv_midpoint_core_forward__m2_y () Real)
(declare-fun blockerv_midpoint_core_forward__rho2 () Real)
(declare-fun blockerv_midpoint_core_forward__u_x () Real)
(declare-fun blockerv_midpoint_core_forward__u_y () Real)
(declare-fun blockerv_midpoint_core_forward__v_x () Real)
(declare-fun blockerv_midpoint_core_forward__v_y () Real)
(declare-fun blockerv_midpoint_core_forward__xu_x () Real)
(declare-fun blockerv_midpoint_core_forward__xu_y () Real)
(declare-fun blockerv_midpoint_core_forward__xv_x () Real)
(declare-fun blockerv_midpoint_core_forward__xv_y () Real)
(assert (> blockerv_midpoint_core_forward__rho2 0.0))
(assert (= 0.0 blockerv_midpoint_core_forward__O_x))
(assert (= 0.0 blockerv_midpoint_core_forward__O_y))
(assert (= (/ 8.0 5.0) blockerv_midpoint_core_forward__m1_x))
(assert (= (- (/ 4.0 5.0)) blockerv_midpoint_core_forward__m1_y))
(assert (= (/ 8.0 5.0) blockerv_midpoint_core_forward__m2_x))
(assert (= (/ 4.0 5.0) blockerv_midpoint_core_forward__m2_y))
(assert (or (distinct blockerv_midpoint_core_forward__O_x
              blockerv_midpoint_core_forward__m1_x)
    (distinct blockerv_midpoint_core_forward__O_y
              blockerv_midpoint_core_forward__m1_y)))
(assert (or (distinct blockerv_midpoint_core_forward__O_x
              blockerv_midpoint_core_forward__m2_x)
    (distinct blockerv_midpoint_core_forward__O_y
              blockerv_midpoint_core_forward__m2_y)))
(assert (or (distinct blockerv_midpoint_core_forward__O_x
              blockerv_midpoint_core_forward__u_x)
    (distinct blockerv_midpoint_core_forward__O_y
              blockerv_midpoint_core_forward__u_y)))
(assert (or (distinct blockerv_midpoint_core_forward__O_x
              blockerv_midpoint_core_forward__xu_x)
    (distinct blockerv_midpoint_core_forward__O_y
              blockerv_midpoint_core_forward__xu_y)))
(assert (or (distinct blockerv_midpoint_core_forward__O_x
              blockerv_midpoint_core_forward__delta_x)
    (distinct blockerv_midpoint_core_forward__O_y
              blockerv_midpoint_core_forward__delta_y)))
(assert (or (distinct blockerv_midpoint_core_forward__O_x
              blockerv_midpoint_core_forward__v_x)
    (distinct blockerv_midpoint_core_forward__O_y
              blockerv_midpoint_core_forward__v_y)))
(assert (or (distinct blockerv_midpoint_core_forward__O_x
              blockerv_midpoint_core_forward__xv_x)
    (distinct blockerv_midpoint_core_forward__O_y
              blockerv_midpoint_core_forward__xv_y)))
(assert (or (distinct blockerv_midpoint_core_forward__m1_x
              blockerv_midpoint_core_forward__m2_x)
    (distinct blockerv_midpoint_core_forward__m1_y
              blockerv_midpoint_core_forward__m2_y)))
(assert (or (distinct blockerv_midpoint_core_forward__m1_x
              blockerv_midpoint_core_forward__u_x)
    (distinct blockerv_midpoint_core_forward__m1_y
              blockerv_midpoint_core_forward__u_y)))
(assert (or (distinct blockerv_midpoint_core_forward__m1_x
              blockerv_midpoint_core_forward__xu_x)
    (distinct blockerv_midpoint_core_forward__m1_y
              blockerv_midpoint_core_forward__xu_y)))
(assert (or (distinct blockerv_midpoint_core_forward__m1_x
              blockerv_midpoint_core_forward__delta_x)
    (distinct blockerv_midpoint_core_forward__m1_y
              blockerv_midpoint_core_forward__delta_y)))
(assert (or (distinct blockerv_midpoint_core_forward__m1_x
              blockerv_midpoint_core_forward__v_x)
    (distinct blockerv_midpoint_core_forward__m1_y
              blockerv_midpoint_core_forward__v_y)))
(assert (or (distinct blockerv_midpoint_core_forward__m1_x
              blockerv_midpoint_core_forward__xv_x)
    (distinct blockerv_midpoint_core_forward__m1_y
              blockerv_midpoint_core_forward__xv_y)))
(assert (or (distinct blockerv_midpoint_core_forward__m2_x
              blockerv_midpoint_core_forward__u_x)
    (distinct blockerv_midpoint_core_forward__m2_y
              blockerv_midpoint_core_forward__u_y)))
(assert (or (distinct blockerv_midpoint_core_forward__m2_x
              blockerv_midpoint_core_forward__xu_x)
    (distinct blockerv_midpoint_core_forward__m2_y
              blockerv_midpoint_core_forward__xu_y)))
(assert (or (distinct blockerv_midpoint_core_forward__m2_x
              blockerv_midpoint_core_forward__delta_x)
    (distinct blockerv_midpoint_core_forward__m2_y
              blockerv_midpoint_core_forward__delta_y)))
(assert (or (distinct blockerv_midpoint_core_forward__m2_x
              blockerv_midpoint_core_forward__v_x)
    (distinct blockerv_midpoint_core_forward__m2_y
              blockerv_midpoint_core_forward__v_y)))
(assert (or (distinct blockerv_midpoint_core_forward__m2_x
              blockerv_midpoint_core_forward__xv_x)
    (distinct blockerv_midpoint_core_forward__m2_y
              blockerv_midpoint_core_forward__xv_y)))
(assert (or (distinct blockerv_midpoint_core_forward__u_x
              blockerv_midpoint_core_forward__xu_x)
    (distinct blockerv_midpoint_core_forward__u_y
              blockerv_midpoint_core_forward__xu_y)))
(assert (or (distinct blockerv_midpoint_core_forward__u_x
              blockerv_midpoint_core_forward__delta_x)
    (distinct blockerv_midpoint_core_forward__u_y
              blockerv_midpoint_core_forward__delta_y)))
(assert (or (distinct blockerv_midpoint_core_forward__u_x
              blockerv_midpoint_core_forward__v_x)
    (distinct blockerv_midpoint_core_forward__u_y
              blockerv_midpoint_core_forward__v_y)))
(assert (or (distinct blockerv_midpoint_core_forward__u_x
              blockerv_midpoint_core_forward__xv_x)
    (distinct blockerv_midpoint_core_forward__u_y
              blockerv_midpoint_core_forward__xv_y)))
(assert (or (distinct blockerv_midpoint_core_forward__xu_x
              blockerv_midpoint_core_forward__delta_x)
    (distinct blockerv_midpoint_core_forward__xu_y
              blockerv_midpoint_core_forward__delta_y)))
(assert (or (distinct blockerv_midpoint_core_forward__xu_x
              blockerv_midpoint_core_forward__v_x)
    (distinct blockerv_midpoint_core_forward__xu_y
              blockerv_midpoint_core_forward__v_y)))
(assert (or (distinct blockerv_midpoint_core_forward__xu_x
              blockerv_midpoint_core_forward__xv_x)
    (distinct blockerv_midpoint_core_forward__xu_y
              blockerv_midpoint_core_forward__xv_y)))
(assert (or (distinct blockerv_midpoint_core_forward__delta_x
              blockerv_midpoint_core_forward__v_x)
    (distinct blockerv_midpoint_core_forward__delta_y
              blockerv_midpoint_core_forward__v_y)))
(assert (or (distinct blockerv_midpoint_core_forward__delta_x
              blockerv_midpoint_core_forward__xv_x)
    (distinct blockerv_midpoint_core_forward__delta_y
              blockerv_midpoint_core_forward__xv_y)))
(assert (or (distinct blockerv_midpoint_core_forward__v_x
              blockerv_midpoint_core_forward__xv_x)
    (distinct blockerv_midpoint_core_forward__v_y
              blockerv_midpoint_core_forward__xv_y)))
(assert (= (+ (* (- blockerv_midpoint_core_forward__O_x
            blockerv_midpoint_core_forward__u_x)
         (- blockerv_midpoint_core_forward__O_x
            blockerv_midpoint_core_forward__u_x))
      (* (- blockerv_midpoint_core_forward__O_y
            blockerv_midpoint_core_forward__u_y)
         (- blockerv_midpoint_core_forward__O_y
            blockerv_midpoint_core_forward__u_y)))
   blockerv_midpoint_core_forward__rho2))
(assert (= (+ (* (- blockerv_midpoint_core_forward__O_x
            blockerv_midpoint_core_forward__xu_x)
         (- blockerv_midpoint_core_forward__O_x
            blockerv_midpoint_core_forward__xu_x))
      (* (- blockerv_midpoint_core_forward__O_y
            blockerv_midpoint_core_forward__xu_y)
         (- blockerv_midpoint_core_forward__O_y
            blockerv_midpoint_core_forward__xu_y)))
   blockerv_midpoint_core_forward__rho2))
(assert (= (+ (* (- blockerv_midpoint_core_forward__O_x
            blockerv_midpoint_core_forward__delta_x)
         (- blockerv_midpoint_core_forward__O_x
            blockerv_midpoint_core_forward__delta_x))
      (* (- blockerv_midpoint_core_forward__O_y
            blockerv_midpoint_core_forward__delta_y)
         (- blockerv_midpoint_core_forward__O_y
            blockerv_midpoint_core_forward__delta_y)))
   blockerv_midpoint_core_forward__rho2))
(assert (= (+ (* (- blockerv_midpoint_core_forward__O_x
            blockerv_midpoint_core_forward__v_x)
         (- blockerv_midpoint_core_forward__O_x
            blockerv_midpoint_core_forward__v_x))
      (* (- blockerv_midpoint_core_forward__O_y
            blockerv_midpoint_core_forward__v_y)
         (- blockerv_midpoint_core_forward__O_y
            blockerv_midpoint_core_forward__v_y)))
   blockerv_midpoint_core_forward__rho2))
(assert (= (+ (* (- blockerv_midpoint_core_forward__O_x
            blockerv_midpoint_core_forward__xv_x)
         (- blockerv_midpoint_core_forward__O_x
            blockerv_midpoint_core_forward__xv_x))
      (* (- blockerv_midpoint_core_forward__O_y
            blockerv_midpoint_core_forward__xv_y)
         (- blockerv_midpoint_core_forward__O_y
            blockerv_midpoint_core_forward__xv_y)))
   blockerv_midpoint_core_forward__rho2))
(assert (>= 1.0
    (+ (* (- 1.0 blockerv_midpoint_core_forward__O_x)
          (- 1.0 blockerv_midpoint_core_forward__O_x))
       (* (- 0.0 blockerv_midpoint_core_forward__O_y)
          (- 0.0 blockerv_midpoint_core_forward__O_y)))))
(assert (>= 1.0
    (+ (* (- 1.0 blockerv_midpoint_core_forward__m1_x)
          (- 1.0 blockerv_midpoint_core_forward__m1_x))
       (* (- 0.0 blockerv_midpoint_core_forward__m1_y)
          (- 0.0 blockerv_midpoint_core_forward__m1_y)))))
(assert (>= 1.0
    (+ (* (- 1.0 blockerv_midpoint_core_forward__m2_x)
          (- 1.0 blockerv_midpoint_core_forward__m2_x))
       (* (- 0.0 blockerv_midpoint_core_forward__m2_y)
          (- 0.0 blockerv_midpoint_core_forward__m2_y)))))
(assert (>= 1.0
    (+ (* (- 1.0 blockerv_midpoint_core_forward__u_x)
          (- 1.0 blockerv_midpoint_core_forward__u_x))
       (* (- 0.0 blockerv_midpoint_core_forward__u_y)
          (- 0.0 blockerv_midpoint_core_forward__u_y)))))
(assert (>= 1.0
    (+ (* (- 1.0 blockerv_midpoint_core_forward__xu_x)
          (- 1.0 blockerv_midpoint_core_forward__xu_x))
       (* (- 0.0 blockerv_midpoint_core_forward__xu_y)
          (- 0.0 blockerv_midpoint_core_forward__xu_y)))))
(assert (>= 1.0
    (+ (* (- 1.0 blockerv_midpoint_core_forward__delta_x)
          (- 1.0 blockerv_midpoint_core_forward__delta_x))
       (* (- 0.0 blockerv_midpoint_core_forward__delta_y)
          (- 0.0 blockerv_midpoint_core_forward__delta_y)))))
(assert (>= 1.0
    (+ (* (- 1.0 blockerv_midpoint_core_forward__v_x)
          (- 1.0 blockerv_midpoint_core_forward__v_x))
       (* (- 0.0 blockerv_midpoint_core_forward__v_y)
          (- 0.0 blockerv_midpoint_core_forward__v_y)))))
(assert (>= 1.0
    (+ (* (- 1.0 blockerv_midpoint_core_forward__xv_x)
          (- 1.0 blockerv_midpoint_core_forward__xv_x))
       (* (- 0.0 blockerv_midpoint_core_forward__xv_y)
          (- 0.0 blockerv_midpoint_core_forward__xv_y)))))
(assert (let ((a!1 (* (- (* (- blockerv_midpoint_core_forward__m1_x
                       blockerv_midpoint_core_forward__u_x)
                    (- blockerv_midpoint_core_forward__m2_y
                       blockerv_midpoint_core_forward__u_y))
                 (* (- blockerv_midpoint_core_forward__m1_y
                       blockerv_midpoint_core_forward__u_y)
                    (- blockerv_midpoint_core_forward__m2_x
                       blockerv_midpoint_core_forward__u_x)))
              (- (* (- blockerv_midpoint_core_forward__m1_x
                       blockerv_midpoint_core_forward__O_x)
                    (- blockerv_midpoint_core_forward__m2_y
                       blockerv_midpoint_core_forward__O_y))
                 (* (- blockerv_midpoint_core_forward__m1_y
                       blockerv_midpoint_core_forward__O_y)
                    (- blockerv_midpoint_core_forward__m2_x
                       blockerv_midpoint_core_forward__O_x))))))
  (<= a!1 0.0)))
(assert (let ((a!1 (* (- (* (- blockerv_midpoint_core_forward__m1_x
                       blockerv_midpoint_core_forward__v_x)
                    (- blockerv_midpoint_core_forward__m2_y
                       blockerv_midpoint_core_forward__v_y))
                 (* (- blockerv_midpoint_core_forward__m1_y
                       blockerv_midpoint_core_forward__v_y)
                    (- blockerv_midpoint_core_forward__m2_x
                       blockerv_midpoint_core_forward__v_x)))
              (- (* (- blockerv_midpoint_core_forward__m1_x
                       blockerv_midpoint_core_forward__O_x)
                    (- blockerv_midpoint_core_forward__m2_y
                       blockerv_midpoint_core_forward__O_y))
                 (* (- blockerv_midpoint_core_forward__m1_y
                       blockerv_midpoint_core_forward__O_y)
                    (- blockerv_midpoint_core_forward__m2_x
                       blockerv_midpoint_core_forward__O_x))))))
  (<= a!1 0.0)))
(assert (let ((a!1 (* (- (* (- blockerv_midpoint_core_forward__m1_x
                       blockerv_midpoint_core_forward__xu_x)
                    (- blockerv_midpoint_core_forward__m2_y
                       blockerv_midpoint_core_forward__xu_y))
                 (* (- blockerv_midpoint_core_forward__m1_y
                       blockerv_midpoint_core_forward__xu_y)
                    (- blockerv_midpoint_core_forward__m2_x
                       blockerv_midpoint_core_forward__xu_x)))
              (- (* (- blockerv_midpoint_core_forward__m1_x
                       blockerv_midpoint_core_forward__O_x)
                    (- blockerv_midpoint_core_forward__m2_y
                       blockerv_midpoint_core_forward__O_y))
                 (* (- blockerv_midpoint_core_forward__m1_y
                       blockerv_midpoint_core_forward__O_y)
                    (- blockerv_midpoint_core_forward__m2_x
                       blockerv_midpoint_core_forward__O_x))))))
  (<= a!1 0.0)))
(assert (let ((a!1 (* (- (* (- blockerv_midpoint_core_forward__m1_x
                       blockerv_midpoint_core_forward__delta_x)
                    (- blockerv_midpoint_core_forward__m2_y
                       blockerv_midpoint_core_forward__delta_y))
                 (* (- blockerv_midpoint_core_forward__m1_y
                       blockerv_midpoint_core_forward__delta_y)
                    (- blockerv_midpoint_core_forward__m2_x
                       blockerv_midpoint_core_forward__delta_x)))
              (- (* (- blockerv_midpoint_core_forward__m1_x
                       blockerv_midpoint_core_forward__O_x)
                    (- blockerv_midpoint_core_forward__m2_y
                       blockerv_midpoint_core_forward__O_y))
                 (* (- blockerv_midpoint_core_forward__m1_y
                       blockerv_midpoint_core_forward__O_y)
                    (- blockerv_midpoint_core_forward__m2_x
                       blockerv_midpoint_core_forward__O_x))))))
  (> a!1 0.0)))
(assert (let ((a!1 (* (- (* (- blockerv_midpoint_core_forward__m1_x
                       blockerv_midpoint_core_forward__xv_x)
                    (- blockerv_midpoint_core_forward__m2_y
                       blockerv_midpoint_core_forward__xv_y))
                 (* (- blockerv_midpoint_core_forward__m1_y
                       blockerv_midpoint_core_forward__xv_y)
                    (- blockerv_midpoint_core_forward__m2_x
                       blockerv_midpoint_core_forward__xv_x)))
              (- (* (- blockerv_midpoint_core_forward__m1_x
                       blockerv_midpoint_core_forward__O_x)
                    (- blockerv_midpoint_core_forward__m2_y
                       blockerv_midpoint_core_forward__O_y))
                 (* (- blockerv_midpoint_core_forward__m1_y
                       blockerv_midpoint_core_forward__O_y)
                    (- blockerv_midpoint_core_forward__m2_x
                       blockerv_midpoint_core_forward__O_x))))))
  (> a!1 0.0)))
(assert (= (+ (* (- blockerv_midpoint_core_forward__v_x
            blockerv_midpoint_core_forward__u_x)
         (- blockerv_midpoint_core_forward__v_x
            blockerv_midpoint_core_forward__u_x))
      (* (- blockerv_midpoint_core_forward__v_y
            blockerv_midpoint_core_forward__u_y)
         (- blockerv_midpoint_core_forward__v_y
            blockerv_midpoint_core_forward__u_y)))
   (+ (* (- blockerv_midpoint_core_forward__v_x
            blockerv_midpoint_core_forward__xu_x)
         (- blockerv_midpoint_core_forward__v_x
            blockerv_midpoint_core_forward__xu_x))
      (* (- blockerv_midpoint_core_forward__v_y
            blockerv_midpoint_core_forward__xu_y)
         (- blockerv_midpoint_core_forward__v_y
            blockerv_midpoint_core_forward__xu_y)))))
(assert (> (- (* (- blockerv_midpoint_core_forward__u_x
            blockerv_midpoint_core_forward__O_x)
         (- blockerv_midpoint_core_forward__v_y
            blockerv_midpoint_core_forward__O_y))
      (* (- blockerv_midpoint_core_forward__u_y
            blockerv_midpoint_core_forward__O_y)
         (- blockerv_midpoint_core_forward__v_x
            blockerv_midpoint_core_forward__O_x)))
   0.0))
(assert (> (- (* (- blockerv_midpoint_core_forward__v_x
            blockerv_midpoint_core_forward__O_x)
         (- blockerv_midpoint_core_forward__xu_y
            blockerv_midpoint_core_forward__O_y))
      (* (- blockerv_midpoint_core_forward__v_y
            blockerv_midpoint_core_forward__O_y)
         (- blockerv_midpoint_core_forward__xu_x
            blockerv_midpoint_core_forward__O_x)))
   0.0))
