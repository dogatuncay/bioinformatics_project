
function m = build_circle_template(rmin, rmax)
  r_size = rmax - rmin + 1;
  r_range = rmin:rmax;
  m = zeros(2*rmax+1, 2*rmax+1, r_size);
  for r_index = 1:r_size
    r = r_range(r_index);
    m(:, :, r_index) = build_circle(r, rmax);
  end
end
