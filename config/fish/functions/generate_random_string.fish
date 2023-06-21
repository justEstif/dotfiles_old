function generate_random_string
  node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"
end
