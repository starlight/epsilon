(define-library
  (epsilon tests fixture)
  (import
    scheme
    r7rs
    (epsilon base))
  (export test-compile)
  (begin
    (define (test-compile expr)
      (parameterize
        ((current-input-port (open-input-string expr))
         (current-output-port (open-output-string)))
        (compile)
        (get-output-string
          (current-output-port))))))
