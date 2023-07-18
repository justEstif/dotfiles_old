function pdf --description "Open pdf file(non-blocking)" --argument file
  nohup sioyek $file &
end
