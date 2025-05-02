CREATE TABLE products (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2),
    stock INT
);

CREATE TABLE orders (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    product_id BIGINT,
    quantity INT,
    total_price DECIMAL(10, 2),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(100) NOT NULL,
    lastName VARCHAR(100),
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE pagaments (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT NOT NULL,
    payment_status VARCHAR(50),     -- status pagamento
    payment_method VARCHAR(50),     -- metodo do pagamento
    amount DECIMAL(10, 2),          -- valor pagado
    transaction_id VARCHAR(255),
    payment_date TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE
);

CREATE TABLE notifications (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,            -- id do usuario que recebe a msg
    order_id BIGINT,                    -- id do pedido - se caso precisar
    notification_type VARCHAR(100),     -- tipo de notificacao ("Pedido Confirmado", "Pagamento Aprovado")
    message TEXT,                       -- conteudo msg
    sent_at TIMESTAMP,                  -- data e hora que a msg foi enviada
    status VARCHAR(50),                 -- status da notificacao (enviada, falhada, pendente)
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE
)
