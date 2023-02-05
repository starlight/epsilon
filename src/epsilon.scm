; Scheme entrypoint for bootstrap compiler
(define-library
  epsilon
  (import
    scheme
    r7rs
    (epsilon base))
  (begin
    (compile-program '())))
