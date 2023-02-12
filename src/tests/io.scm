(define-library
  (tests io)
  (import
    scheme
    r7rs)
  (export
    with-input-from-string
    with-output-to-string
    ->string)

  (begin
    (define (with-input-from-string input thunk)
      (parameterize
        ((current-input-port (open-input-string input)))
        (thunk)))

    (define (with-output-to-string thunk)
      (parameterize
        ((current-output-port (open-output-string)))
        (thunk)
        (get-output-string (current-output-port))))

    (define (->string datum)
      (with-output-to-string
        (lambda ()
          (write datum))))))
