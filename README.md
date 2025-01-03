-- Таблица ингредиентов
CREATE TABLE ingredients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    quantity NUMERIC NOT NULL CHECK (quantity >= 0)
);

-- Таблица рецептов
CREATE TABLE recipes (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Таблица связи рецептов и ингредиентов
CREATE TABLE recipe_ingredients (
    id SERIAL PRIMARY KEY,
    recipe_id INT NOT NULL REFERENCES recipes(id) ON DELETE CASCADE,
    ingredient_id INT NOT NULL REFERENCES ingredients(id) ON DELETE CASCADE,
    amount NUMERIC NOT NULL CHECK (amount > 0)
);

-- Таблица продаж напитков
CREATE TABLE sales (
    id SERIAL PRIMARY KEY,
    recipe_id INT NOT NULL REFERENCES recipes(id) ON DELETE CASCADE,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Вставляем ингредиенты
INSERT INTO ingredients (name, quantity) VALUES
('Кофе', 100),
('Вода', 200),
('Молоко', 150),
('Сахар', 50);

-- Вставляем рецепты
INSERT INTO recipes (name) VALUES
('Эспрессо'),
('Американо'),
('Капучино');

-- Вставляем связи рецептов с ингредиентами
-- Эспрессо
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, amount) VALUES
(1, (SELECT id FROM ingredients WHERE name = 'Кофе'), 50),
(1, (SELECT id FROM ingredients WHERE name = 'Вода'), 50);

-- Американо
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, amount) VALUES
(2, (SELECT id FROM ingredients WHERE name = 'Кофе'), 50),
(2, (SELECT id FROM ingredients WHERE name = 'Вода'), 100);

-- Капучино
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, amount) VALUES
(3, (SELECT id FROM ingredients WHERE name = 'Кофе'), 50),
(3, (SELECT id FROM ingredients WHERE name = 'Вода'), 50),
(3, (SELECT id FROM ingredients WHERE name = 'Молоко'), 100);

-- Вставляем продажи
-- Пример продаж для каждого рецепта
INSERT INTO sales (recipe_id) VALUES
(1), -- Эспрессо
(2), -- Американо
(3); -- Капучино


