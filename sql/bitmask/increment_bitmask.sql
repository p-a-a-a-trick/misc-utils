-- Create a sequence that allows us to loop through our bit length
CREATE SEQUENCE test_schema.seq_components_mask_int START WITH 63 INCREMENT BY -1 MAXVALUE 64 MINVALUE 1;
-- Create a table that contains our mask and some value associated to the mask
CREATE TABLE test_schema.components (
  -- Create a bit mask of some size (here, 64) and use our sequence for new insertions
  component_mask BIT(64) NOT NULL UNIQUE
  -- when we enter a new component, we will receive a new bit value
  DEFAULT set_bit('0'::BIT(64), nextval('test_schema.seq_components_mask_int')::INTEGER, 1)
  ,component TEXT NOT NULL UNIQUE
);

-- Example insertion statement
INSERT INTO test_schema.components (component) VALUES ('component_1');
INSERT INTO test_schema.components (component) VALUES ('component_2');

/* SELECT * FROM test_schema.components;
 * 
 * [('0000000000000000000000000000000000000000000000000000000000000001', 'component_1'),
 *  ('0000000000000000000000000000000000000000000000000000000000000010', 'component_2')]
 */
