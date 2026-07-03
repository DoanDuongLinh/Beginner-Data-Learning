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