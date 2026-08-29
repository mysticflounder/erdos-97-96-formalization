mutual
  theorem a : False := by
    exact b

  theorem b : False := by
    exact a
end

#check a
