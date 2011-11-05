
function m = build_circle(radius, rmax)
  seq_a = [1,-1,-1,1];
  seq_b = [1,1,-1,-1];
  m_size = 2*rmax+1;
  m = zeros(m_size, m_size);
  for x = 0:radius
    a0 = x;
    b0 = sqrt(radius*radius - x*x);
    a = round( a0 * seq_a + rmax + 1);
    b = round(b0 * seq_b + rmax + 1);
    ind = sub2ind([m_size, m_size], b, a);
    m(ind) = 1;
  end
end
