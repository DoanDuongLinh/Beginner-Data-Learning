-- ============================================
-- BẢNG 1: USERS
-- ============================================
CREATE TABLE users (
    user_id         SERIAL PRIMARY KEY,
    full_name       VARCHAR(150)    NOT NULL,
    email           VARCHAR(150)    NOT NULL UNIQUE,
    phone           VARCHAR(20)     UNIQUE,
    password_hash   VARCHAR(255)    NOT NULL,
    role            VARCHAR(20)     NOT NULL DEFAULT 'customer'
                        CHECK (role IN ('customer', 'admin', 'seller')),
    is_active       BOOLEAN         NOT NULL DEFAULT TRUE,
    created_at      TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- ============================================
-- BẢNG 2: PRODUCTS
-- ============================================
CREATE TABLE products (
    product_id      SERIAL PRIMARY KEY,
    sku             VARCHAR(50)     NOT NULL UNIQUE,
    product_name    VARCHAR(255)    NOT NULL,
    description     TEXT,
    price           NUMERIC(12,2)   NOT NULL CHECK (price >= 0),
    stock_quantity  INT             NOT NULL DEFAULT 0 CHECK (stock_quantity >= 0),
    is_active       BOOLEAN         NOT NULL DEFAULT TRUE,
    created_at      TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- ============================================
-- BẢNG 3: ORDERS
-- ============================================
CREATE TABLE orders (
    order_id        SERIAL PRIMARY KEY,
    user_id         INT             NOT NULL REFERENCES users(user_id)
                        ON DELETE RESTRICT ON UPDATE CASCADE,
    order_status    VARCHAR(20)     NOT NULL DEFAULT 'pending'
                        CHECK (order_status IN ('pending','paid','shipped','completed','cancelled')),
    total_amount    NUMERIC(12,2)   NOT NULL CHECK (total_amount >= 0),
    shipping_address TEXT           NOT NULL,
    created_at      TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP
);
-- ============================================
-- BẢNG: CATEGORIES (Danh mục sản phẩm)
-- ============================================
CREATE TABLE categories (
    category_id     SERIAL PRIMARY KEY,
    category_name   VARCHAR(100)    NOT NULL UNIQUE,
    parent_id       INT             REFERENCES categories(category_id)
                        ON DELETE SET NULL,
    created_at      TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- ============================================
-- BẢNG: ORDER_ITEMS (Bảng trung gian order-product)
-- ============================================
CREATE TABLE order_items (
    order_item_id   SERIAL PRIMARY KEY,
    order_id        INT             NOT NULL REFERENCES orders(order_id)
                        ON DELETE CASCADE,
    product_id      INT             NOT NULL REFERENCES products(product_id)
                        ON DELETE RESTRICT,
    quantity        INT             NOT NULL CHECK (quantity > 0),
    unit_price      NUMERIC(12,2)   NOT NULL CHECK (unit_price >= 0),
    subtotal        NUMERIC(12,2)   GENERATED ALWAYS AS (quantity * unit_price) STORED,

    UNIQUE (order_id, product_id)
);

-- ============================================
-- ALTER: Gắn products vào categories
-- ============================================
ALTER TABLE products
    ADD COLUMN category_id INT REFERENCES categories(category_id)
        ON DELETE SET NULL;