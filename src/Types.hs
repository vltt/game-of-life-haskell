module Types where
    
    type Cell = (Int, Int)

    type Field = [Cell]

    data World = World {field :: Field}