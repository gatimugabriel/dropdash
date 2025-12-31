-- ============================================
-- SEED DATA FOR DROPDASH
-- ============================================

-- ============================================
-- 1. CREATE TEST USERS IN AUTH.USERS
-- ============================================
-- The password hash below is for "password123" using bcrypt

-- Customer 1
-- INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_user_meta_data, aud, role)
-- VALUES (
--   'c1111111-1111-1111-1111-111111111111',
--   'customer1@dropdash.test',
--   '$2a$10$PznXfQpY8Q5h6qX2Y5GqeO5YSR8FxKT4Wmi5f9FO5fLkHWBp3NMse',
--   NOW(),
--   NOW(),
--   NOW(),
--   '{"full_name": "Alice Customer", "role": "customer"}',
--   'authenticated',
--   'authenticated'
-- );

-- -- Customer 2
-- INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_user_meta_data, aud, role)
-- VALUES (
--   'c2222222-2222-2222-2222-222222222222',
--   'customer2@dropdash.test',
--   '$2a$10$PznXfQpY8Q5h6qX2Y5GqeO5YSR8FxKT4Wmi5f9FO5fLkHWBp3NMse',
--   NOW(),
--   NOW(),
--   NOW(),
--   '{"full_name": "Bob Customer", "role": "customer"}',
--   'authenticated',
--   'authenticated'
-- );

-- -- Driver 1
-- INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_user_meta_data, aud, role)
-- VALUES (
--   'd1111111-1111-1111-1111-111111111111',
--   'driver1@dropdash.test',
--   '$2a$10$PznXfQpY8Q5h6qX2Y5GqeO5YSR8FxKT4Wmi5f9FO5fLkHWBp3NMse',
--   NOW(),
--   NOW(),
--   NOW(),
--   '{"full_name": "Charlie Driver", "role": "driver"}',
--   'authenticated',
--   'authenticated'
-- );

-- -- Driver 2
-- INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_user_meta_data, aud, role)
-- VALUES (
--   'd2222222-2222-2222-2222-222222222222',
--   'driver2@dropdash.test',
--   '$2a$10$PznXfQpY8Q5h6qX2Y5GqeO5YSR8FxKT4Wmi5f9FO5fLkHWBp3NMse',
--   NOW(),
--   NOW(),
--   NOW(),
--   '{"full_name": "Diana Driver", "role": "driver"}',
--   'authenticated',
--   'authenticated'
-- );

-- -- Admin
-- INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_user_meta_data, aud, role)
-- VALUES (
--   'a1111111-1111-1111-1111-111111111111',
--   'admin@dropdash.test',
--   '$2a$10$PznXfQpY8Q5h6qX2Y5GqeO5YSR8FxKT4Wmi5f9FO5fLkHWBp3NMse',
--   NOW(),
--   NOW(),
--   NOW(),
--   '{"full_name": "Admin User", "role": "admin"}',
--   'authenticated',
--   'authenticated'
-- );

-- -- Dev
-- INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_user_meta_data, aud, role)
-- VALUES (
--   'e1111111-1111-1111-1111-111111111111',
--   'dev@dropdash.test',
--   '$2a$10$PznXfQpY8Q5h6qX2Y5GqeO5YSR8FxKT4Wmi5f9FO5fLkHWBp3NMse',
--   NOW(),
--   NOW(),
--   NOW(),
--   '{"full_name": "Dev User", "role": "dev"}',
--   'authenticated',
--   'authenticated'
-- );

-- -- ============================================
-- -- 2. UPDATE PROFILES WITH ROLES AND PHONE
-- -- ============================================
-- -- The trigger should have created profiles, but we update with phone numbers

-- UPDATE profiles SET phone = '+1234567001', role = 'customer' WHERE id = 'c1111111-1111-1111-1111-111111111111';
-- UPDATE profiles SET phone = '+1234567002', role = 'customer' WHERE id = 'c2222222-2222-2222-2222-222222222222';
-- UPDATE profiles SET phone = '+1234567101', role = 'driver' WHERE id = 'd1111111-1111-1111-1111-111111111111';
-- UPDATE profiles SET phone = '+1234567102', role = 'driver' WHERE id = 'd2222222-2222-2222-2222-222222222222';
-- UPDATE profiles SET phone = '+1234567201', role = 'admin' WHERE id = 'a1111111-1111-1111-1111-111111111111';
-- UPDATE profiles SET phone = '+1234567301', role = 'dev' WHERE id = 'e1111111-1111-1111-1111-111111111111';

-- ============================================
-- 3. CATEGORIES
-- ============================================
INSERT INTO categories (id, name, description, image_url, display_order) VALUES
  ('00000001-0001-0001-0001-000000000001', 'Burgers', 'Juicy handcrafted burgers', 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400', 1),
  ('00000002-0002-0002-0002-000000000002', 'Pizza', 'Authentic Italian pizzas', 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=400', 2),
  ('00000003-0003-0003-0003-000000000003', 'Sushi', 'Fresh Japanese sushi', 'https://images.unsplash.com/photo-1579584425555-c3ce17fd4351?w=400', 3),
  ('00000004-0004-0004-0004-000000000004', 'Drinks', 'Refreshing beverages', 'https://images.unsplash.com/photo-1544145945-f90425340c7e?w=400', 4),
  ('00000005-0005-0005-0005-000000000005', 'Desserts', 'Sweet treats', 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=400', 5),
  ('00000006-0006-0006-0006-000000000006', 'Salads', 'Fresh healthy salads', 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=400', 6);

-- ============================================
-- 4. PRODUCTS (24 items)
-- ============================================

-- Burgers (5 items)
INSERT INTO products (category_id, name, description, price, image_url, is_available, is_featured, rating) VALUES
  ('00000001-0001-0001-0001-000000000001', 'Classic Cheeseburger', 'Juicy beef patty with melted cheddar, lettuce, tomato, and special sauce', 12.99, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400', true, true, 4.5),
  ('00000001-0001-0001-0001-000000000001', 'Bacon BBQ Burger', 'Crispy bacon, caramelized onions, and smoky BBQ sauce', 14.99, 'https://images.unsplash.com/photo-1594212699903-ec8a3eca50f5?w=400', true, true, 4.7),
  ('00000001-0001-0001-0001-000000000001', 'Mushroom Swiss Burger', 'Sautéed mushrooms and melted Swiss cheese', 13.99, 'https://images.unsplash.com/photo-1572802419224-296b0aeee0d9?w=400', true, false, 4.3),
  ('00000001-0001-0001-0001-000000000001', 'Veggie Burger', 'Plant-based patty with avocado and chipotle mayo', 11.99, 'https://images.unsplash.com/photo-1520072959219-c595dc870360?w=400', true, false, 4.2),
  ('00000001-0001-0001-0001-000000000001', 'Double Stack', 'Two beef patties, double cheese, pickles, and onions', 16.99, 'https://images.unsplash.com/photo-1553979459-d2229ba7433b?w=400', true, false, 4.6);

-- Pizza (4 items)
INSERT INTO products (category_id, name, description, price, image_url, is_available, is_featured, rating) VALUES
  ('00000002-0002-0002-0002-000000000002', 'Margherita Pizza', 'Classic tomato sauce, fresh mozzarella, and basil', 15.99, 'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=400', true, true, 4.8),
  ('00000002-0002-0002-0002-000000000002', 'Pepperoni Supreme', 'Loaded with pepperoni and Italian herbs', 17.99, 'https://images.unsplash.com/photo-1628840042765-356cda07504e?w=400', true, false, 4.6),
  ('00000002-0002-0002-0002-000000000002', 'BBQ Chicken Pizza', 'Grilled chicken, red onions, and smoky BBQ', 18.99, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=400', true, false, 4.4),
  ('00000002-0002-0002-0002-000000000002', 'Four Cheese', 'Mozzarella, parmesan, gorgonzola, ricotta', 16.99, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400', true, false, 4.5);

-- Sushi (4 items)
INSERT INTO products (category_id, name, description, price, image_url, is_available, is_featured, rating) VALUES
  ('00000003-0003-0003-0003-000000000003', 'California Roll', 'Crab, avocado, cucumber (8 pieces)', 9.99, 'https://images.unsplash.com/photo-1579584425555-c3ce17fd4351?w=400', true, true, 4.6),
  ('00000003-0003-0003-0003-000000000003', 'Salmon Nigiri', 'Fresh salmon on seasoned rice (4 pieces)', 12.99, 'https://images.unsplash.com/photo-1617196034796-73dfa7b1fd56?w=400', true, false, 4.7),
  ('00000003-0003-0003-0003-000000000003', 'Dragon Roll', 'Eel, cucumber, avocado, unagi sauce', 14.99, 'https://images.unsplash.com/photo-1611143669185-af224c5e3252?w=400', true, true, 4.8),
  ('00000003-0003-0003-0003-000000000003', 'Rainbow Roll', 'California roll with assorted fish', 16.99, 'https://images.unsplash.com/photo-1559410545-0bdcd187e0a6?w=400', true, false, 4.5);

-- Drinks (4 items)
INSERT INTO products (category_id, name, description, price, image_url, is_available, is_featured, rating) VALUES
  ('00000004-0004-0004-0004-000000000004', 'Fresh Lemonade', 'Freshly squeezed with mint', 4.99, 'https://images.unsplash.com/photo-1621263764928-df1444c5e859?w=400', true, false, 4.4),
  ('00000004-0004-0004-0004-000000000004', 'Iced Coffee', 'Cold brewed coffee over ice', 5.49, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=400', true, true, 4.6),
  ('00000004-0004-0004-0004-000000000004', 'Mango Smoothie', 'Fresh mango with yogurt and honey', 6.99, 'https://images.unsplash.com/photo-1546173159-315724a31696?w=400', true, false, 4.5),
  ('00000004-0004-0004-0004-000000000004', 'Sparkling Water', 'Premium mineral water', 2.99, 'https://images.unsplash.com/photo-1558642452-9d2a7deb7f62?w=400', true, false, 4.0);

-- Desserts (4 items)
INSERT INTO products (category_id, name, description, price, image_url, is_available, is_featured, rating) VALUES
  ('00000005-0005-0005-0005-000000000005', 'Chocolate Lava Cake', 'Warm chocolate cake with molten center', 8.99, 'https://images.unsplash.com/photo-1624353365286-3f8d62daad51?w=400', true, true, 4.9),
  ('00000005-0005-0005-0005-000000000005', 'Tiramisu', 'Classic Italian coffee dessert', 7.99, 'https://images.unsplash.com/photo-1571877227200-a0d98ea607e9?w=400', true, false, 4.7),
  ('00000005-0005-0005-0005-000000000005', 'New York Cheesecake', 'Creamy cheesecake with berry compote', 7.49, 'https://images.unsplash.com/photo-1524351199678-941a58a3df50?w=400', true, true, 4.6),
  ('00000005-0005-0005-0005-000000000005', 'Ice Cream Sundae', 'Three scoops with toppings', 6.99, 'https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=400', true, false, 4.4);

-- Salads (3 items)
INSERT INTO products (category_id, name, description, price, image_url, is_available, is_featured, rating) VALUES
  ('00000006-0006-0006-0006-000000000006', 'Caesar Salad', 'Romaine, parmesan, croutons, Caesar dressing', 10.99, 'https://images.unsplash.com/photo-1546793665-c74683f339c1?w=400', true, false, 4.3),
  ('00000006-0006-0006-0006-000000000006', 'Greek Salad', 'Tomatoes, cucumbers, olives, feta', 11.99, 'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?w=400', true, true, 4.5),
  ('00000006-0006-0006-0006-000000000006', 'Quinoa Power Bowl', 'Quinoa, roasted vegetables, tahini', 12.99, 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=400', true, false, 4.4);

-- ============================================
-- SEED DATA SUMMARY:
-- - 6 users (2 customers, 2 drivers, 1 admin, 1 dev)
-- - 6 categories
-- - 24 products
-- 
-- TEST CREDENTIALS (all use password: password123):
-- customer1@dropdash.test
-- customer2@dropdash.test
-- driver1@dropdash.test
-- driver2@dropdash.test
-- admin@dropdash.test
-- dev@dropdash.test
-- ============================================
