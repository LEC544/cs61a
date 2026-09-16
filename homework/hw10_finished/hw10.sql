CREATE TABLE parents AS
  SELECT "ace" AS parent, "bella" AS child UNION
  SELECT "ace"          , "charlie"        UNION
  SELECT "daisy"        , "hank"           UNION
  SELECT "finn"         , "ace"            UNION
  SELECT "finn"         , "daisy"          UNION
  SELECT "finn"         , "ginger"         UNION
  SELECT "ellie"        , "finn";

CREATE TABLE dogs AS
  SELECT "ace" AS name, "long" AS fur, 26 AS height UNION
  SELECT "bella"      , "short"      , 52           UNION
  SELECT "charlie"    , "long"       , 47           UNION
  SELECT "daisy"      , "long"       , 46           UNION
  SELECT "ellie"      , "short"      , 35           UNION
  SELECT "finn"       , "curly"      , 32           UNION
  SELECT "ginger"     , "short"      , 28           UNION
  SELECT "hank"       , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT child as chil 
    from parents, dogs
      where name = parent
      order by height DESC; -- DESC means ordering decreasingly
  -- "REPLACE THIS LINE WITH YOUR SOLUTION";



-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT dogs.name as name, sizes.size as size
    from dogs, sizes
      where dogs.height <= sizes.max and dogs.height > sizes.min
      order by dogs.name;
  --"REPLACE THIS LINE WITH YOUR SOLUTION";


-- [Optional] Filling out this helper table is recommended
CREATE TABLE siblings AS
  SELECT a.child as firstname, b.child as secondname
    from parents as a, parents as b
    where a.parent = b.parent and a.child < b.child;
  --"REPLACE THIS LINE WITH YOUR SOLUTION";

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT 'The two siblings, '|| firstname || ' and ' || secondname ||', have the same size: ' || a.size
    from siblings, size_of_dogs as a, size_of_dogs as b
    where firstname = a.name and secondname = b.name and a.size = b.size;
  --"REPLACE THIS LINE WITH YOUR SOLUTION";


-- Height range for each fur type where all of the heights differ by no more than 30% from the average height
CREATE TABLE low_variance AS
  SELECT dogs.fur as fur, MAX(height) - MIN(height) as height_range
    FROM dogs
    group by fur
    having MAX(height) < 1.3 * AVG(height) and MIN(height) > 0.7 * AVG(height);
  --"REPLACE THIS LINE WITH YOUR SOLUTION";

