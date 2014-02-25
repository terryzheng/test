def up_to(n)
  a,b = 1,1
  while(a<=n)
    a,b = b,a+b
    yield a
  end
end
